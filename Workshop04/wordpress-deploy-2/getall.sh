#!/usr/local/bin/bash

kubectl get all,ing,svc,pv,pvc -n $@ 
