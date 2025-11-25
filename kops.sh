#! /bin/bash
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops
echo "export PATH=$PATH:/usr/local/bin/" >> source .bashrc

export KOPS_STATE_STORE=s3://kops-for-cluster.k8s.local
kops create cluster --name yogesh1.k8s.local --zones us-east-1d --control-plane-image ami-0f00d706c4a80fd93 --control-plane-count=1 --control-plane-size c7i-flex.large --image ami-0f00d706c4a80fd93 --node-count=2 --node-size c7i-flex.large
kops update cluster --name yogesh1.k8s.local --yes 
------------------------------------------------------------------
# After script 
 11  export KOPS_STATE_STORE=s3://kops-for-cluster.k8s.local
   12  kops validate cluster --name yogesh.k8s.local --state s3://kops-for-cluster.k8s.local
   13  kops validate cluster --wait 10m
   14  kops get cluster
