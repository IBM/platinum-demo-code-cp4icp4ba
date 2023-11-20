#!/bin/bash

oc delete builds restapi-1
oc delete buildconfig restapi
oc delete imagestream restapi
oc delete deployment restapi
oc delete service restapi
oc delete route restapi
