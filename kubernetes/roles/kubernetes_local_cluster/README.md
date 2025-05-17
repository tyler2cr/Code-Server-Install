# Kubernetes Cluster Role

This role ensures that a Kubernetes cluster is running on the target machine. If no cluster is detected, it will:

1. Install required packages:
   - kubeadm
   - kubectl
   - kubelet

2. Initialize a new Kubernetes cluster using kubeadm

3. Configure the cluster:
   - Set up kubeconfig
   - Install Calico networking plugin
   - Wait for the cluster to be ready

## Requirements

- Ubuntu/Debian-based system
- At least 2GB of RAM and 2 CPU cores
- Internet connection

## Dependencies

- kubernetes.core Ansible collection 