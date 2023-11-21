#!/bin/sh
echo "*************************************Installing Updates*************************************"
sleep 5
sudo apt update && sudo apt upgrade -y

echo "*************************************disabling the Swap Temporarily*************************************"
sleep 5
sudo swapoff -a

echo "*************************************disabling the Swap Permanantly*************************************"
sleep 5
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

echo "*************************************Installing apt-transport-https && curl*************************************"
sleep 5
sudo apt install -y apt-transport-https curl

echo "*************************************Adding apt-key.gpg*************************************"
echo "*************************************Status Should come OK*************************************"
sleep 5
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "*************************************Adding the Repositories*************************************"
sleep 5
sudo cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

echo "*************************************Installing kubelet, kubeadm && kubectl*************************************"
sleep 5
sudo apt update && sudo apt install kubelet kubeadm kubectl -y

echo "*************************************Checking kubectl version*************************************"
sleep 5
sudo kubectl version --client

echo "*************************************Installing the Docker*************************************"
sleep 5
sudo apt update && apt install docker.io -y

echo "*************************************Adding buntu user to the docker Group*************************************"
sleep 5
sudo usermod -aG docker ubuntu && sudo chmod 777 /var/run/docker.sock

echo "*************************************Holding the updates of kubelet kubeadm kubectl*************************************"
sleep 5
sudo apt-mark hold kubelet kubeadm kubectl

echo "*************************************taking backup and copying ---changing the /lib/systemd/system/docker.service data adding "--exec-opt native.cgroupdriver=systemd"*************************************"
sleep 5
cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service1
sudo cp docker.service /lib/systemd/system/docker.service

echo "*************************************Reloding the Daemon to update the above changes*************************************"
sleep 5
sudo systemctl daemon-reload

echo "*************************************Reloding the Docker to update the above changes*************************************"
sleep 5
sudo systemctl restart docker

echo "*************************************Checking the docker Info*************************************"
sleep 10
sudo docker info

echo "*************************************Initialising the kubeadm Now*************************************"
echo "*************************************Moving output into kubeadm init >> init.sh*************************************"
sleep 5
sudo kubeadm init >> init.sh


echo "*************************************Downloading the manifest calico file*************************************"
sleep 5
sudo curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml -O


echo "*************************************Applying Calico and creating Calico Network*************************************"
sleep 5
sudo kubectl apply -f calico.yaml

echo "*************************************Applied Calico and created Calico Network*************************************"
sleep 10
sudo ls -lrth /etc/kubernetes

echo "*************************************Root user RULES adding*************************************"
sleep 10
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "*************************************Getting Nodes*************************************"
sleep 5
sudo kubectl get nodes

echo "*************************************Getting Name spaces*************************************"
sleep 5
kubectl get ns

echo "*************************************Getting All pods, namespaces in default*************************************"
sleep 5
kubectl get all -A
