#!/bin/bash

higgsdemo submit \
  --dataset-mapping config/demo-high-mem-minimal.json \
  --cluster kubecon-demo-0 \
  --access-key $GS_ACCESS_KEY \
  --secret-key $GS_SECRET_KEY \
  --redis-host higgs-redis-svc.default.svc.cluster.local
