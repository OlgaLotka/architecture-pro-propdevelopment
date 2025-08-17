#!/bin/bash

echo  "Шаблон ограничений privileged: true"
kubectl apply -f gatekeeper/constraint-templates/privileged.yaml
echo  "Ограничение privileged: true"
kubectl apply -f gatekeeper/constraints/privileged.yaml

echo  "Шаблон ограничений hostPath"
kubectl apply -f gatekeeper/constraint-templates/hostpath.yaml
echo  "Ограничение hostPath"
kubectl apply -f gatekeeper/constraints/hostpath.yaml

echo  "Шаблон ограничений runAsNonRoot: true"
kubectl apply -f gatekeeper/constraint-templates/runasnonroot.yaml
echo  "Ограничение runAsNonRoot: true"
kubectl apply -f gatekeeper/constraints/runasnonroot.yaml


