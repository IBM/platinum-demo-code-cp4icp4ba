#!/bin/bash

apic_namespace=${1:-"cp4i"}
namespace=${2:-"cp4i"}
apic_release=${3:-"ademo"}

echo "Deploying to $namespace"

oc new-project $namespace
oc project $namespace
oc new-build --name restapi --binary --strategy docker
oc start-build restapi --from-dir . --follow

cat deployment.yaml_template |
  sed "s#{{NAMESPACE}}#$namespace#g;" > deployment.yaml
  
oc apply -f deployment.yaml -n $namespace
oc apply -f service.yaml -n $namespace
