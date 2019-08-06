# Rediscovering the Higgs boson using the Google Cloud Platform

On 4 July 2012, Researchers at the European Council for Nuclear Research (CERN)
[announced](https://cms.cern/physics/higgs-boson/observation-new-particle-mass-125-gev)
that they had recorded events in the ATLAS and CMS experiments at the Large
Hadron Collider (LHC) that had properties consistent with a new particle, the
Higgs boson.

On 8 October 2013, the Nobel Prize in Physics was
[awarded](https://www.nobelprize.org/prizes/physics/2013/summary/) to Francois
Englert and Peter W. Higgs based on this discovery.

On 21 May 2019, Researchers at CERN, 
Lukas Heinrich ([`@lukasheinrich_`](https://twitter.com/lukasheinrich_)) and 
Ricardo Rocha ([`@ahcorporto`](https://twitter.com/ahcorporto))
[demonstrated](https://kccnceu19.sched.com/event/MRyv/keynote-reperforming-a-nobel-prize-discovery-on-kubernetes-ricardo-rocha-computing-engineer-lukas-heinrich-physicist-cern)
([video](https://www.youtube.com/watch?v=2PRGUOxL36M),
[slides](https://static.sched.com/hosted_files/kccnceu19/14/Lukas%20Heinrich-Ricardo%20Rocha%20May%2021%20Evening.pdf))
how they (re)-performed the Higgs discovery using Kubernetes running on the
Google Cloud Platform (GCP).

In this tutorial you will use the GCP Cloud Shell to set up and run a small
end-to-end slice of that prize-winning analysis!


## The Analysis (TODO)

Discovery of the Higgs Boson is really
detection of Higgs-related decay events.

    diagram (?)


## The Data (TODO)

Several datasets are investigated in order to determine
if Higgs-related events are occurring in the collider.

    diagram (?)


## The Infrastructure

In this tutorial, you'll use the Google Kubernetes Engine (GKE) to run analysis
jobs against a limited selection of the
[CERN Open Data](http://opendata.cern.ch/)
datafiles made available in Google Cloud Storage (GCS).

![Higgs analysis - full architecture](higgs-analysis-full-architecture.svg.png)

### Google Kubernetes Engine (TODO)


    templates


### Kubernetes Prep (TODO)

Kubernetes Deployments and Pods

Kubernetes Services


    templates

### Kubernetes Jobs (TODO)


    templates


## Kicking things off

Start by opening
[https://console.cloud.google.com/](https://console.cloud.google.com/)
in a browser.

Create a new GCP Project using the
[Cloud Resource Manager](https://console.cloud.google.com/cloud-resource-manager).
This project is just for this tutorial, we'll delete it below when we're done.

You will need to
[enable billing](https://support.google.com/cloud/answer/6293499#enable-billing)
for this project.

You will also need to enable the following services for this account (TODO)

    gke
    gcs
    gcr
    gce (?)

which can be done all at once using this
[link to enable tutorial services](https://console.cloud.google.com/flows/enableapi?apiid=binaryauthorization.googleapis.com,cloudbuild.googleapis.com,cloudkms.googleapis.com,container.googleapis.com,containerregistry.googleapis.com,containeranalysis.googleapis.com,sourcerepo.googleapis.com,cloudresourcemanager.googleapis.com).
(TODO)
    
Next, make sure the project you just created is selected in the top of the
Cloud Console

    screenshot (TODO)

Then open a [Cloud Shell](https://console.cloud.google.com/?cloudshell=true)
that's associated with that project.

    screenshot (TODO)

All commands in this tutorial are run from this Cloud Shell.

Clone the tutorial repository

    git clone https://github.com/mmm/higgs-demo
    git checkout tutorial
    cd higgs-demo/tutorial
    (TODO: change to dedicated repo)

You'll manage cloud infrastructure resources for this tutorial using
[Terraform](https://terraform.io/) which is already installed and configured in
your GCP Cloud Shell. This helps both to keep things initially as simple as
possible, but also to promote best practices when working in the cloud.

Create the cluster

    cd terraform/gke-cluster
    terraform init
    terraform plan
    terraform apply

![Higgs analysis - create GKE cluster](higgs-analysis-create-gke-cluster.svg.png)

This will take a few minutes for the Kubernetes nodes to come up. Once it
completes, you need to get credentials for that new cluster.  This should work

    gcloud container clusters get-credentials higgs-tutorial --region us-central1

but you should check the outputs from the last `terraform apply` command to
make sure the cluster name and region are both correct.

Next you need to lay down the basic framework of tools that are needed before
any job runs are kicked off

    cd ../prep
    terraform init
    terraform plan
    terraform apply

![Higgs analysis - prepare for job runs](higgs-analysis-prepare-for-job-runs.svg.png)

This will spin up a Redis cache, a Jupyter notebook server, and a Kubernetes
Daemonset to pre-pull all the docker images needed for analysis.  When the
`terraform apply` completes, copy the output Jupyter URL and open that in a new
browser window.

Now, back in your Cloud Shell, kick off the actual analysis jobs

    cd ../jobs
    terraform init
    terraform plan
    terraform apply

which essentially loads up a separate kubernetes job for each datafile in the
dataset.

![Higgs analysis - create Kubernetes Jobs](higgs-analysis-full-architecture.svg.png)

You can visualize results in a Jupyter notebook as the jobs run.  From the
browser window opened earlier, click to open the `PlotHiggs.ipynb` notebook.
Click through and execute all cells in the notebook to make sure everything
is running.

Note that the default behavior in this notebook is to render a graph of test
data and _not_ the data coming directly from our jobs. This test data plot is
what we would see if we were to run the 26,000 core cluster against the _full_
74TB dataset used on stage.

![Plot using test data](test-plot.png)

For this tutorial, you've spun up a small cluster and pulled only a bite-sized
slice of the data. This enables you to work through the end-to-end analysis
while still keeping costs down.

Once you've validated your notebook runs, now point it at the Redis cache used
to store the outputs of your actual job runs. Within the Jupyter notebook,
change the cell containing the main plot loop

```python
plotnb.reset_data()
while True:
    data   = plotnb.load_data()
    groups = plotnb.update_plot(figure,data)
```

to `load_data` from the Redis cache instead of the default test dataset

```python
plotnb.reset_data()
while True:
    data   = plotnb.load_data('redis:data')
    groups = plotnb.update_plot(figure,data)
```

When you re-execute that cell you'll see a plot of the data just processed on
your tutorial-sized cluster.

![Plot using tutorial data](tutorial-plot.png)


## Cleaning up

To avoid incurring charges to your Google Cloud Platform account for the
resources used in this tutorial:

### Delete the project

Caution: Deleting a project has the following effects:
- Everything in the project is deleted. If you used an existing project for
  this tutorial, when you delete it, you also delete any other work you've done
  in the project.
- Custom project IDs are lost. When you created this project, you might have
  created a custom project ID that you want to use in the future. To preserve
  the URLs that use the project ID, such as an appspot.com URL, delete selected
  resources inside the project instead of deleting the whole project.

1. In the GCP Console, go to the Projects page.

    GO TO THE PROJECTS PAGE

2. In the project list, select the project you want to delete and click Delete
   delete.
3. In the dialog, type the project ID, and then click Shut down to delete the
   project.


## References

<http://opendata.cern.ch/>

<http://opendata.cern.ch/docs/cms-guide-for-research>

<http://opendata.cern.ch/docs/cms-getting-started-2010>

<http://opendata.cern.ch/docs/cms-physics-objects-2010#cms-data>

<http://opendata.cern.ch/docs/cms-releases-open-data-for-machine-learning>

<http://opendata.cern.ch/docs/terms-of-use>

<https://cms.physicsmasterclasses.org/cms.html>

<https://github.com/clelange/HiggsExample20112012>

<http://opendata.cern.ch/record/5500>

Here is the published [reference plot](https://inspirehep.net/record/1124338/files/H4l_mass_v3.png).

Here's a [guide to building CERN images](http://ccl.cse.nd.edu/software/manuals/install.html).

<https://cernvm.cern.ch/portal/downloads>

<http://cylindricalonion.web.cern.ch/blog/201712/future-particle-physics-open>

