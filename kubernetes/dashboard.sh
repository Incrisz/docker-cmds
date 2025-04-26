kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

sudo tee dashboard-adminuser.yaml <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF




kubectl apply -f dashboard-adminuser.yaml


kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

kubectl -n kubernetes-dashboard patch service kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}'

# kubectl -n kubernetes-dashboard get service kubernetes-dashboard -o yaml


kubectl -n kubernetes-dashboard get services


https://34.205.18.137:31469/






# create token
kubectl create serviceaccount dashboard-admin -n kubernetes-dashboard
kubectl create clusterrolebinding dashboard-admin-binding \
  --clusterrole=cluster-admin \
  --serviceaccount=kubernetes-dashboard:dashboard-admin

# this is what creates the token
kubectl -n kubernetes-dashboard create token dashboard-admin




kubectl -n kubernetes-dashboard create secret generic dashboard-admin-token \
  --from-literal=token=$(openssl rand -base64 32)


kubectl -n kubernetes-dashboard get secret dashboard-admin-token -o jsonpath="{.data.token}" | base64 --decode




 kubectl get pods -n kubernetes-dashboard



# to get port number
kubectl get svc -n kubernetes-dashboard




eyJhbGciOiJSUzI1NiIsImtpZCI6Ikh3RWdDS0F5ZjRueV8zZndIY2xSdVpSbTZYWDBoTkhHWWtpaDBtUVZpZ2MifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNzI5MDQ3MjkzLCJpYXQiOjE3MjkwNDM2OTMsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwianRpIjoiYzViOTkxNmUtZTI4OC00YTBiLWEyZTItYWNhNWZlMjhhNDU0Iiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkYXNoYm9hcmQtYWRtaW4iLCJ1aWQiOiJhNmUyN2I0Mi0zNmFmLTQ3MTYtYmVjNy05ZTBjYjBkMTAwNDYifX0sIm5iZiI6MTcyOTA0MzY5Mywic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmVybmV0ZXMtZGFzaGJvYXJkOmRhc2hib2FyZC1hZG1pbiJ9.lwsG9TAirMQG7sw5X9_iFlinZh1ZDvMXglX5idiRuQ-DsFttPR9JJrCgrp9juA5rxJBJq3Wrd3pWZETk8lOi-6F1I5W-3nZLDlP-WQhnx3D5sL-piI5YAy19RgtcgFIGyHPFdjLxnnL_7ZGdVjpw8SJnYnXau595shKKFqjgo75Ocm1TAfiR9xOGskc7L5HWtX_rc0jsq6JEWlI0xeID9vW79ipjwhoqB63z5j6Xzych2YexjyzpGXuiYHQH-4VyMs1A_CYf6KTlKvsBd_wBa0zjSmfx-Lzoxlocw6kUhH4gUQjWHCs5U4YJnu51UTT5mB1rJcnRd5nVNI9piMBbfw