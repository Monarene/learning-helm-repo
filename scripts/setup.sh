eksctl utils associate-iam-oidc-provider --cluster article-helm --approve # to create  IAM OIDC
eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster article-helm \
  --attach-policy-arn arn:aws-us-gov:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRoler # attach service account

eksctl create addon --name aws-ebs-csi-driver --cluster article-helm --service-account-role-arn arn:aws:iam::796834059009:role/AmazonEKS_EBS_CSI_DriverRoler --force

kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

helm install mysite bitnami/drupal --values values.yaml

aws eks update-kubeconfig --name sandbox --region AWS_REGION 