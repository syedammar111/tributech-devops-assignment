# Tributech DevOps Chart

A comprehensive Helm chart for deploying Keycloak authentication, PostgreSQL database, PGAdmin, and a sample OAuth website.

## 🚀 Quick Start

```bash
# Start Minikube
minikube start --kubernetes-version=v1.29.0
minikube addons enable ingress

# Add local DNS entries
sudo echo "127.0.0.1 keycloak.local pgadmin.local website.local" | sudo tee -a /etc/hosts

# Add Helm repositories
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add runix https://helm.runix.net
helm repo update

# Install the chart
helm install tributech-devops .
```

## 📋 Prerequisites

- Kubernetes 1.29.0+
- Helm v3.0.0+
- Docker
- Minikube
- NGINX Ingress Controller

## 🏗️ Components

| Component | Description | Default URL |
|-----------|-------------|-------------|
| Keycloak | Authentication server | http://keycloak.local |
| PostgreSQL | Database for Keycloak | N/A |
| PGAdmin | Database management | http://pgadmin.local |
| Website | OAuth sample application | http://website.local |

## ⚙️ Configuration

### PostgreSQL

```yaml
postgresql:
  auth:
    username: keycloak
    password: keycloakpassword
    database: keycloakdb
  primary:
    persistence:
      size: 1Gi
```

### Keycloak

```yaml
keycloak:
  auth:
    adminUser: admin
    adminPassword: admin123
  ingress:
    enabled: true
    hostname: keycloak.local
```

### PGAdmin

```yaml
pgadmin:
  env:
    email: admin@example.com
    password: admin123
  ingress:
    enabled: true
    hosts:
      - host: pgadmin.local
```

### Website

```yaml
website:
  enabled: true
  image:
    repository: tributech-ui-oauth-sample
    tag: latest
  keycloak:
    url: "http://keycloak.local"
    realm: "master"
    clientId: "website"
```

## 🔍 Validation

```bash
# Check pod status
kubectl get pods

# Check ingress
kubectl get ingress

# View logs
kubectl logs -l app=keycloak
kubectl logs -l app=website
```

## 🔧 Troubleshooting

### Common Issues

1. **Pods not starting**
   ```bash
   kubectl describe pod <pod-name>
   ```

2. **Database connection issues**
   ```bash
   kubectl exec -it <postgresql-pod> -- psql -U keycloak -d keycloakdb
   ```

3. **Ingress not working**
   ```bash
   kubectl describe ingress
   minikube ip  # Check Minikube IP
   ```

## 🧹 Cleanup

```bash
# Uninstall chart
helm uninstall tributech-devops

# Delete PVCs (optional)
kubectl delete pvc --selector=app.kubernetes.io/instance=tributech-devops
```

## 📁 Project Structure

```
tributech-devops-chart/
├── Chart.yaml          # Main chart definition
├── values.yaml         # Default configuration
└── charts/
    ├── keycloak/      # Keycloak subchart
    ├── postgresql/    # PostgreSQL subchart
    ├── pgadmin/       # PGAdmin subchart
    └── website/       # Website subchart
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 📫 Support

For support, please open an issue in the GitHub repository.