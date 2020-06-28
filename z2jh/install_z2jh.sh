Z2JH_NAMESPACE=z2jh
kubectl create namespace $Z2JH_NAMESPACE

kubectl create secret generic azure-stg-secret \
    --from-literal=azurestorageaccountname=$STORAGE_ACCOUNT_NAME \
    --from-literal=azurestorageaccountkey=$STORAGE_ACCOUNT_KEY \
    -n z2jh

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm upgrade --install $Z2JH_NAMESPACE jupyterhub/jupyterhub --namespace $Z2JH_NAMESPACE --version=0.9.0 --values config.local.yaml
# helm upgrade --install $Z2JH_NAMESPACE jupyterhub/jupyterhub --namespace $Z2JH_NAMESPACE --version=0.9.0 --values config.local.base.yaml
POD_NAME=$(kubectl get pods --namespace $Z2JH_NAMESPACE -l "component=hub,release=$Z2JH_NAMESPACE" -o jsonpath="{.items[0].metadata.name}"); kubectl -n $Z2JH_NAMESPACE logs $POD_NAME -f

