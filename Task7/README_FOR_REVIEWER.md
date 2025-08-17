Создание namespace audit-zone с уровнем PodSecurity restricted

```bash
kubectl apply -f 01-create-namespace.yaml
```

Запуск политики безопастности

```bash
bash verify/validate-security.sh
```


Настройка OPA Gatekeeper с набором правил:

Установка Gatekeeper
```bash
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
```

Запуск OPA Gatekeeper
```bash
bash verify/verify-admission.sh
```
