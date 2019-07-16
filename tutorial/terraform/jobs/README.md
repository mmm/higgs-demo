# heater on k8s


    cat tmp/sm12-jobs.yml | yq '.spec.template.spec.containers[]|.env[]|select(.name=="CMS_INPUT_FILES").value'
