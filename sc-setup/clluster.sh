eksctl utils associate-iam-oidc-provider --cluster test-helm --approve # to create  IAM OIDC
eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster test-helm \
  --attach-policy-arn arn:aws-us-gov:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole # attach service account

eksctl create addon --name aws-ebs-csi-driver --cluster test-helm --service-account-role-arn arn:aws:iam::796834059009:role/AmazonEKS_EBS_CSI_DriverRole --force
