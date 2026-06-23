# Operations Runbook

## Local Validation

```bash
cd game
npm install
npm test
npm run lint

docker build -t game-2048 .
docker run --rm -p 8080:8080 game-2048
```

Open: `http://localhost:8080`

## Kubernetes Deployment

```bash
kubectl apply -k k8s/
kubectl rollout status deployment/game-2048 -n game-2048
kubectl get pods,svc,ingress -n game-2048
```

## ArgoCD Validation

```bash
kubectl get applications -n argocd
argocd app get game-2048
argocd app sync game-2048
```

## Common Issues

### Pods are not ready

```bash
kubectl describe pod -n game-2048 -l app.kubernetes.io/name=game-2048
kubectl logs -n game-2048 -l app.kubernetes.io/name=game-2048
```

Check that the container listens on port `8080` and `/healthz` returns HTTP 200.

### Ingress is not reachable

```bash
kubectl get ingress -n game-2048
kubectl get svc -n ingress-nginx
```

For local testing with `game-2048.local`, add the ingress/load balancer address to your hosts file.

### Terraform plan shows unexpected changes

Avoid using dynamic values such as `timestamp()` in Terraform tags. This project uses stable tags to reduce drift.
