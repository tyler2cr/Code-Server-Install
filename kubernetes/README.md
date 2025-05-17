# Code-Server Kubernetes Deployment

This repository contains Ansible playbooks to set up a local Kubernetes cluster and deploy code-server using Helm.

## Prerequisites

- Ansible 2.9 or later
- Python 3.6 or later
- Ubuntu/Debian-based system (for kubeadm installation)
- Internet connection
- At least 2GB of RAM and 2 CPU cores

## Installation

1. Install the required Ansible collections:
   ```bash
   ansible-galaxy collection install -r requirements.yml
   ```

2. Run the playbook:
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

## What the Playbook Does

1. Checks if Kubernetes is already running
2. If not, installs and configures a pure Kubernetes cluster using kubeadm:
   - Installs kubeadm, kubectl, and kubelet
   - Initializes the Kubernetes cluster
   - Sets up Calico networking
3. Creates a `code-server` namespace
4. Adds the code-server Helm repository
5. Deploys code-server using Helm with the following configuration:
   - Service type: NodePort
   - Port: 8443
   - Persistent storage: 10Gi

## Accessing code-server

After deployment, you can access code-server at:
```
https://localhost:8443
```

Note: The first time you access it, you'll need to accept the self-signed certificate warning in your browser.

## Troubleshooting

If you encounter any issues with the Kubernetes cluster:

1. Check cluster status:
   ```bash
   kubectl get nodes
   kubectl get pods --all-namespaces
   ```

2. Check system requirements:
   ```bash
   free -h  # Check memory
   nproc    # Check CPU cores
   ```

3. Check kubelet status:
   ```bash
   systemctl status kubelet
   ``` 