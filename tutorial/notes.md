# Notes

The data and images are now in a separate project I've created (with
enough quota) just to work through downsizing that demo into a tutorial.

Note that this is going to take some work:

- The first plan of attack that I'm working through now is to take the "scaled
  down" `config/demo-high-mem-minimal.json`, filter the full dataset to match,
  then run and reproduce the notebook showing the higgs "bump."  Then iterate
  on that process reducing workers/data each time until the bump's just
  identifiable.  Then, work up the costs to run that and move forward from
  there. Stop when it's cheap enough for a tutorial or we can't recognize a
  bump

- If we can't recognize a bump in a reasonable time/scale then the second plan
  of attack is to start to work with Ricardo or Lukas to see if we can decimate
  the monte-carlo runs while still keeping luminosity data at its current
  fidelity.  No real clue if that'll work, but I'm hoping we won't have to go
  that far and we can get something tutorial-sized earlier on

- We need to decide if it makes sense to keep the python wrappers or if it
  makes more sense to extract most of it to simply run from cloudshell


# timing

crud... this is taking too long for the `M` t-shirt size in the cloud-shell

    time terraform plan -out=jobsplan

with output:

    Plan: 118 to add, 0 to change, 0 to destroy.

    ------------------------------------------------------------------------

    This plan was saved to: jobsplan

    To perform exactly these actions, run the following command to apply:
        terraform apply "jobsplan"


    real    9m35.152s
    user    7m4.457s
    sys     0m6.084s


and

    time terraform apply -refresh=false -auto-approve jobsplan

with output:

    Apply complete! Resources: 118 added, 0 changed, 0 destroyed.

    The state of your infrastructure has been saved to the path
    below. This state is required to modify and destroy your
    infrastructure, so keep it safe. To inspect the complete state
    use the `terraform show` command.

    State path: terraform.tfstate

    real    12m43.869s
    user    9m47.281s
    sys     0m6.675s


and

    time terraform destroy -refresh=false -auto-approve

with output:

    Destroy complete! Resources: 118 destroyed.

    real    4m46.655s
    user    3m44.135s
    sys     0m3.545s


---
# development

Then, running stuff

    cd src/github.com/mmm/higgs-demo/tutorial/

then if images aren't there `docker images` you'll need to build

    make build

or load it with

    bzcat latest-tutorial-image.tar.bz2 | docker image load
    cat latest-tutorial-image.tar | time docker image load

and then run

    docker run -it --rm -u $(id -u):$(id -g) -v $HOME:$HOME -v `pwd`/..:/workspace tutorial bash

then within the container,

    export PYTHONPATH=/home/markmims/lib/python3.6/site-packages/
    python3 setup.py install --prefix $HOME

make sure `gcloud config list` shows a project set and then

    export GOOGLE_CLOUD_PROJECT=mmm-0b85

    higgsdemo clusters-create --gcs-project-id mmm-0b85 --gcs-region us-central1 --dataset-mapping config/demo-high-mem-minimal.json

then get creds...

    gcloud container clusters get-credentials kubecon-demo-0 --region us-central1

then initial image pulls

    #higgsdemo prepare --gcs-project-id mmm-0b85 --gcs-region us-central1 --dataset-mapping config/demo-high-mem-minimal.json
    higgsdemo prepare --dataset-mapping config/demo-high-mem-minimal.json --cluster kubecon-demo-0

although it doesn't seem to actually _do_ anything... there's a warning

    markmims@a5024517842e:/workspace$ higgsdemo prepare --dataset-mapping config/demo-high-mem-minimal.json --cluster kubecon-demo-0
    /home/markmims/.local/lib/python3.6/site-packages/kubernetes/utils/create_from_yaml.py:42: YAMLLoadWarning: calling yaml.load() without Loader=... is deprecated, as the default Loader is unsafe. Please read https://msg.pyyaml.org/load for full details.
    yml_object = yaml.load(f)

Kicking off a run

#    higgsdemo submit --dataset-mapping config/demo-high-mem-minimal.json --cluster kubecon-demo-0

works now that the yaml files are split.
Then you can watch the cluster status

    higgsdemo watch --cluster kubecon-demo-0

which gives lots of output like

    49.897623 2019-06-19 17:47:24.467440 {'Pulling': 0, 'Running': 0, 'Pending': 1016, 'Succeeded': 0, 'Failed': 0, 'Unknown': 0} 


### Cleanup

You can just do a 

    higgsdemo cleanup --dataset-mapping config/demo-high-mem-minimal.json --cluster kubecon-demo-0

or

    higgsdemo clusters-delete --gcs-project-id mmm-0b85 --gcs-region us-central1 --dataset-mapping config/demo-high-mem-minimal.json


---

    gcloud projects add-iam-policy-binding mmm-0b85 --member=serviceAccount:2308762522-compute@developer.gserviceaccount.com --role=roles/editor



---

ok, went to the storage console... settings... interop... create new storage key, then passed these into `submit`

#    higgsdemo submit --dataset-mapping config/demo-high-mem-minimal.json --cluster kubecon-demo-0 --access-key "$GS_ACCESS_KEY" --secret-key "$GS_SECRET_KEY"
    
now it's failing becuase we're missing redis 10.0.0.4:6379


this is useful for debugging

    kubectl run shell --generator=run-pod/v1 --tty -i --rm --image=ubuntu:bionic  --env=foo=bar -- bash


---

    kubectl apply -f redis-deployment.yaml

then tested from shell pod... worked fine by cluster ip addr

now submit with redis

    higgsdemo submit \
      --dataset-mapping config/demo-high-mem-minimal.json \
      --cluster kubecon-demo-0 \
      --access-key $GS_ACCESS_KEY \
      --secret-key $GS_SECRET_KEY \
      --redis-host higgs-redis-svc.default.svc.cluster.local

need to use `higgs-redis-svc.default.svc.cluster.local`

whoohoo!

    higgsdemo watch --cluster kubecon-demo-0

    55.631311 2019-06-19 23:33:48.837161 {'Pulling': 0, 'Running': 1, 'Pending': 0, 'Succeeded': 115, 'Failed': 0, 'Unknown': 0}

and redis shows shit in it... next up, notebooks!

and then

    kubectl apply -f nb-deployment.yaml

    kubectl port-forward nb 8080:8888




---

some useful tools


    kubectl exec -it higgs-nb-deployment-7bc99dff4b-fj4gd -- bash

    kubectl run nb --generator=run-pod/v1 --tty -i --rm --image=gcr.io/mmm-0b85/notebook --env=REDIS_HOST=higgs-redis-svc.default.svc.cluster.local -- bash
    jupyter notebook --no-browser --port 8888 --ip 0.0.0.0 --allow-root

    kubectl port-forward nb 8080:8888

or

    kubectl port-forward higgs-redis-deployment-845ff9f975-m9b4b 6379:6379

    docker run --rm -p 8080:1234 verb/socat TCP-LISTEN:1234,fork TCP-CONNECT:172.18.0.2:8888


---

from desktop

    kubectl port-forward service/higgs-nb-svc 8888

and then hit the kernels from here.  (There were cross-site scripting problems with running
via the cloud shell port exposure)



---

jobs

    kubectl wait --for=condition=complete job/myjob

or

    kubectl wait --for=condition=complete --timeout=30s job/myjob

    kubectl get jobs myjob -w

    until kubectl get jobs myjob -o jsonpath='{.status.conditions[? 
        (@.type=="Complete")].status}' | grep True ; do sleep 1 ; done

or even

### kubernetes python lib

Create new Python virtualenv:

		virtualenv -p python3 kubernetes_venv activate it with

    source kubernetes_venv/bin/activate

and install kubernetes client with:

		pip install kubernetes

Create new Python script and run:

		from kubernetes import client, config

		config.load_kube_config()

		v1 = client.BatchV1Api()
		ret = v1.list_namespaced_job(namespace='<YOUR-JOB-NAMESPACE>', watch=False)
		for i in ret.items:
				print(i.status.succeeded)

Remember to set up your specific kubeconfig in ~/.kube/config and valid value for your job namespace -> '<YOUR-JOB-NAMESPACE>'


---

cluster-name
region
project
k8s version

