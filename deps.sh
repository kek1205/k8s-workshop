#! /usr/bin/env bash
#
# adds dependencies to cloud9 instance for 
# completing the ReactiveOps EKS 101 training
#

#- VARIABLES -#
ARCH="amd64"
KUBECTL_VERSION="1.10.3/2018-07-26"


#- PROCEDURAL -#

# install kubectl
mkdir -p ~/.kube
sudo curl --silent --location \
    -o /usr/local/bin/kubectl \
    "https://amazon-eks.s3-us-west-2.amazonaws.com/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl"
sudo chmod +x /usr/local/bin/kubectl

# install aws-iam-authenticator
go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator
sudo mv ~/go/bin/aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# amazon-linux deps
yum install -y jq

# verify binaries
printf "Kubectl Version:\t%s\n" % $(kubectl version --short --client)
printf "AWS IAM Authticator:\t%s\n" % $(aws-iam-authenticator --help)