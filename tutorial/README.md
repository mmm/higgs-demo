
# Rediscovering the Higgs boson using the Google Cloud Platform

# Anyone can (re-)discover the Higgs boson

On 4 July 2012, Researchers at European Council for Nuclear Research (CERN)
[announced](https://cms.cern/physics/higgs-boson/observation-new-particle-mass-125-gev)
that they had recorded events in the ATLAS and CMS experiments at the Large
Hadron Collider (LHC) that had properties consistent with a new particle, the
Higgs boson.

On 8 October 2013, the Nobel Prize in Physics was awarded to Francois Englert
and Peter W. Higgs based on this discovery.

On 21 May 2019, Researchers at CERN, Lukas Heinrich and Ricardo Rocha
[demonstrated](https://www.youtube.com/watch?v=2PRGUOxL36M)
([slides](https://static.sched.com/hosted_files/kccnceu19/14/Lukas%20Heinrich-Ricardo%20Rocha%20May%2021%20Evening.pdf), and
[event link](https://kccnceu19.sched.com/event/MRyv/keynote-reperforming-a-nobel-prize-discovery-on-kubernetes-ricardo-rocha-computing-engineer-lukas-heinrich-physicist-cern))
how they reperformed the Higgs discovery using Kubernetes running on the Google
Cloud Platform.

In this tutorial you will use the GCP Cloud Shell to set up and run a small
end-to-end slice of that analysis.


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

Create the cluster

    cd terraform/gke-cluster
    terraform init
    terraform plan
    terraform apply

Get cluster credentials

    gcloud container clusters get-credentials kubecon-demo-0 --region us-central1

Prep for job runs

    cd ../prep
    terraform init
    terraform plan
    terraform apply

Run jobs

    cd ../jobs
    terraform init
    terraform plan
    terraform apply

Visualize results

    kubectl port-forward service/higgs-nb-svc 8888
    kubectl port-forward -n higgs-tutorial service/higgs-nb-svc 8888


Clean up after yourself... easiest to just delete the project you created for
this tutorial.


