# Rediscovering the Higgs boson using the Google Cloud Platform

Anyone can (re-)discover the Higgs boson!

On 4 July 2012, Researchers at European Council for Nuclear Research (CERN)
[announced](https://cms.cern/physics/higgs-boson/observation-new-particle-mass-125-gev)
that they had recorded events in the ATLAS and CMS experiments at the Large
Hadron Collider (LHC) that had properties consistent with a new particle, the
Higgs boson.

On 8 October 2013, the Nobel Prize in Physics was awarded to Francois Englert
and Peter W. Higgs based on this discovery.

On 21 May 2019, Researchers at CERN, 
[Lukas Heinrich](https://twitter.com/lukasheinrich_) and 
[Ricardo Rocha](https://twitter.com/ahcorporto)
[demonstrated](https://www.youtube.com/watch?v=2PRGUOxL36M)
([slides](https://static.sched.com/hosted_files/kccnceu19/14/Lukas%20Heinrich-Ricardo%20Rocha%20May%2021%20Evening.pdf), and the
[event](https://kccnceu19.sched.com/event/MRyv/keynote-reperforming-a-nobel-prize-discovery-on-kubernetes-ricardo-rocha-computing-engineer-lukas-heinrich-physicist-cern))
how they reperformed the Higgs discovery using Kubernetes running on the Google
Cloud Platform.

In this tutorial you will use the GCP Cloud Shell to set up and run a small
end-to-end slice of that prize-winning analysis.


## The Overall Setup


## The Data


## The Analysis


## The Cluster(s)


## Kicking things off

Create a new GCP Project for this tutorial

    https://console.cloud.google.com/cloud-resource-manager

Enable billing for this project

    https://support.google.com/cloud/answer/6293499#enable-billing

Enable services on your account... this can be done with a link
    
    https://console.cloud.google.com/flows/enableapi?apiid=binaryauthorization.googleapis.com,cloudbuild.googleapis.com,cloudkms.googleapis.com,container.googleapis.com,containerregistry.googleapis.com,containeranalysis.googleapis.com,sourcerepo.googleapis.com,cloudresourcemanager.googleapis.com

    add in:
    gce (?)
    gcs (?)
    gke
    gcr

or with gcloud commands

    gcloud services list --available
    gcloud services enable SERVICE_NAME

In the GCP Console, go to [Cloud
Shell](https://console.cloud.google.com/?cloudshell=true).

All commands in this tutorial are run in Cloud Shell.

Clone the tutorial repository

    git clone https://github.com/mmm/higgs-demo
    git checkout tutorial
    cd higgs-demo/tutorial

We'll manage cloud infrastructure resources for this tutorial using
[Terraform](https://terraform.io/) which is already installed in your GCP Cloud
Shell. This helps both to keep things initially as simple as possible, but also
to promote best practices when working in the cloud.

Create the cluster

    cd terraform/gke-cluster
    terraform init
    terraform plan
    terraform apply

This will take a few minutes for the Kubernetes nodes to come up. Once it
completes, you need to get credentials for that new cluster

    gcloud container clusters get-credentials kubecon-demo-0 --region us-central1

Next you lay down the basic framework that's needed before any job runs are
kicked off

    cd ../prep
    terraform init
    terraform plan
    terraform apply

This will spin up a Redis cache, a Jupyter notebook server, and a Kubernetes
Daemonset to pre-pull the docker images we'll need for analysis.  When the
`terraform apply` completes, copy the output jupyter URL and open that in a new
browser window.

Now we will kick off the actual analysis jobs

    cd ../jobs
    terraform init
    terraform plan
    terraform apply

which essentially loads up a separate kubernetes job for each datafile in the
dataset.

We can visualize results in a Jupyter notebook as the jobs run.  From the
browser window we opened earlier, click to open the `higgs.ipynb` notebook.
Click through and execute all cells in the notebook to make sure everything's
running.

Note that the default behavior in this notebook is to render a graph of test
data and _not_ the data coming directly from our jobs. This test data is what
we would see if we were to run the 26,000 core cluster against the _full_ 74TB
dataset used on stage.

We've pulled a bite-sized slice of the data for this tutorial.  Once you've
validated your notebook runs, let's point it at the Redis cache we're using to
keep the outputs of our job runs.

Block subst `'redis:data'` in the display loop.

Clean up after yourself.  To avoid unwanted charges to your account, it's
important to clean up the infrastructure resources we created here.  The
easiest way to completely clean up after this tutorial is to simply delete the
project we created when we started.



