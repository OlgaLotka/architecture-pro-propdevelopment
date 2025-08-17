#!/bin/bash


echo  "Развертывание манифестов с нарушениями"

echo  "включает privileged: true"
kubectl apply -f insecure-manifests/01-privileged-pod.yaml
echo  "монтирует hostPath"
kubectl apply -f insecure-manifests/02-hostpath-pod.yaml
echo  "запускается от root (UID 0)"
kubectl apply -f insecure-manifests/03-root-user-pod.yaml


echo  "Развертывание манифестов без нарушений"

echo  "не включает privileged: true"
kubectl apply -f secure-manifests/01-secure.yaml
echo  "не использует hostPath"
kubectl apply -f secure-manifests/02-hostpath-pod.yaml
echo  "запускается не от root (UID 0)"
kubectl apply -f secure-manifests/03-secure.yaml