# Code Server Role

This role deploys code-server to an existing Kubernetes cluster. It will:

1. Create a dedicated namespace for code-server
2. Add the code-server Helm repository
3. Deploy code-server using Helm with the following configuration:
   - Service type: NodePort
   - Port: 8443
   - Persistent storage: 10Gi

## Requirements

- A running Kubernetes cluster
- Helm installed on the target machine
- Internet connection

## Dependencies

- kubernetes.core Ansible collection

## Access

After deployment, code-server will be accessible at:
```
https://localhost:8443
```

Note: The first time you access it, you'll need to accept the self-signed certificate warning in your browser. 