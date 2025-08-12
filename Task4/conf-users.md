```bash
kubectl config set-credentials cluster-admin --username=cluster-admin --password=cluster-admin
```

```bash
kubectl config set-credentials node-admin --username=node-admin --password=node-admin
```

```bash
kubectl config set-credentials developer --username=developer --password=developer
```

```bash
kubectl config set-credentials tester --username=tester --password=tester
```

```bash
kubectl config get-users
```

```bash
kubectl apply -f roles.yaml
```

```bash
kubectl apply -f roleBinding.yaml
```


