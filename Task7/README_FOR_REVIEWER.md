Создание namespace audit-zone с уровнем PodSecurity restricted

```bash
kubectl apply -f 01-create-namespace.yaml
```

Развертывание манифестов с нарушениями
```bash
kubectl apply -f insecure-manifests/01-privileged-pod.yaml
```
```bash
kubectl apply -f insecure-manifests/02-hostpath-pod.yaml 
```
```bash
kubectl apply -f insecure-manifests/03-root-user-pod.yaml
```

Развертывание манифестов без нарушений
```bash
kubectl apply -f secure-manifests/01-secure.yaml
```
```bash
kubectl apply -f secure-manifests/02-hostpath-pod.yaml 
```
```bash
kubectl apply -f secure-manifests/03-secure.yaml
```

Настройка OPA Gatekeeper с набором правил:
```bash
kubectl apply -f gatekeeper/constraint-templates/privileged.yaml
```
```bash
kubectl apply -f gatekeeper/constraints/privileged.yaml
```

```bash
kubectl apply -f gatekeeper/constraint-templates/hostpath.yaml
```
```bash
kubectl apply -f gatekeeper/constraints/hostpath.yaml
```

```bash
kubectl apply -f gatekeeper/constraint-templates/runasnonroot.yaml
```
```bash
kubectl apply -f gatekeeper/constraints/runasnonroot.yaml
```

```bash
kubectl apply -f gatekeeper/constraint-templates/hostpath.yaml
```
```bash
kubectl apply -f gatekeeper/constraints/hostpath.yaml
```