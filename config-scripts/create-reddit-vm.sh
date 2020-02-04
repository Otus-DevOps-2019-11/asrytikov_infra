#!/bin/bash

sudo gcloud compute instances create reddit-app \
  --image-family reddit-full \
  --create-disk size=10GB \
  --machine-type=n1-standard-1 \
  --tags puma-server \
  --restart-on-failure
