#!/bin/bash

packer build \
-var-file=vars.json \
ami.json