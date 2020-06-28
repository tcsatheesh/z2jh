INGRESS_NAMESPACE=ingress-nginx
kubectl create namespace $INGRESS_NAMESPACE
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx -n $INGRESS_NAMESPACE
POD_NAME=$(kubectl -n $INGRESS_NAMESPACE get pods -l app.kubernetes.io/name=ingress-nginx -o jsonpath='{.items[0].metadata.name}')
kubectl -n $INGRESS_NAMESPACE exec -it $POD_NAME -- /nginx-ingress-controller --version

