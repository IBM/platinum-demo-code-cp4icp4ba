#! /bin/bash

export TARGET_NAMESPACE=cp4i

oc delete queuemanager basicmq -n $TARGET_NAMESPACE
oc delete configmap basicmq -n $TARGET_NAMESPACE
