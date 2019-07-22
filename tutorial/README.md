
# Rediscovering the Higgs Boson using the Google Cloud Platform

On 4 July 2012, Researchers at European Council for Nuclear Research (CERN)
[announced](https://cms.cern/physics/higgs-boson/observation-new-particle-mass-125-gev)
that they had recorded events in the ATLAS and CMS experiments at the LHC that
had properties consistent with a new particle in this menagerie, the Higgs
Boson.

In this tutorial you will run the same analysis used in that Prize-winning
Discovery of the Higgs Boson!


## The Setup


## The Data


## The Cluster(s)


## The Analysis


## Kicking things off

need to enable services on your account... this can be done with a link
    
    https://console.cloud.google.com/flows/enableapi?apiid=binaryauthorization.googleapis.com,cloudbuild.googleapis.com,cloudkms.googleapis.com,container.googleapis.com,containerregistry.googleapis.com,containeranalysis.googleapis.com,sourcerepo.googleapis.com,cloudresourcemanager.googleapis.com

or with gcloud commands

    gcloud services list --available
    gcloud services enable SERVICE_NAME

From GCS Cloud Shell...

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


