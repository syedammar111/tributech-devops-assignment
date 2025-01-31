# DevOps Engineer Technical Assignment: Helm Chart with Keycloak, PostgreSQL, and Website Deployment

## Objective

This assignment is designed to evaluate your ability to:
1. Design and write a Helm chart for a multi-component system.
2. Set up a local Kubernetes environment for testing and deployment.
3. Document your process, decisions, and provide clear instructions for testing.

---

## Tasks

### 1. Write a Helm Chart

Create a Umbrella Helm chart to deploy the following components in a Kubernetes cluster:

- **Keycloak**:
  - Set up Keycloak as the authentication provider.
  - Expose it via an HTTP/HTTPS service using an Ingress.
  - Check if you can reuse the [Bitnami Keycloak Project](https://artifacthub.io/packages/helm/bitnami/keycloak)

- **PostgreSQL**:
  - Deploy a PostgreSQL database to be used by Keycloak.
  - Use environment variables to configure Keycloak to connect to the database.

- **PGAdmin**:
  - Deploy PGAdmin to allow management of the PostgreSQL database.
  - Expose it via an HTTP service using an Ingress.

- **Website**:
  - A simple website that **will be provided by Tributech**. This website will support authentication via Keycloak.
  - **Tributech** will provide a Github Repository where you can find a complete Website with a Docker instructions.
  - Clone the repository and check the configuration and build the Docker Image locally.
  - The Helm chart should configure the website to authenticate using the Keycloak instance.

**Helm Chart Requirements**:
- Use the Umbrella approach for this Helm chart and provide a chart for each component (Keycloak, PostgreSQL, PGAdmin, and the website).
- Provide configurable options in `values.yaml` for:
  - Database credentials.
  - Hostnames for Keycloak, PGAdmin, and the website.
  - Check the configuration of website and if there should be overrides for the `values.yaml`
- The chart must be customizable using `helm install` overrides.

---

### 2. Set Up Local Development Environment

Set up a local Kubernetes cluster and prepare the environment for testing the Helm chart.

#### Prerequisites:
- Any Kubernetes distribution (e.g., Minikube, Kind, or K3s) version >= 1.29.0
- [NGNIX](https://github.com/kubernetes/ingress-nginx)
- Docker runtime.
- Helm CLI installed and configured.

#### Steps:
1. Set up a local Kubernetes cluster.
2. Install and configure Helm CLI.
3. Deploy the Helm chart to the local cluster.
4. Validate the deployment:
   - Ensure all components are running.
   - Verify that the configmaps, services, secrets are valid
   - Verify that Ingress (NGNIX) is up and running
   - Verify that:
     - Keycloak is accessible via Ingress (Admin Website should be visitable)
     - PostgreSQL is functional and connected to Keycloak.
     - PGAdmin is accessible and connects to PostgreSQL.
     - The provided website uses Keycloak for authentication and displays `Success` after login

---

### 3. Documentation

Write a `README.md` file that includes:

1. **Concept and Design**:
   - Explain your architecture and approach to designing the Helm chart.
   - Describe how the components interact and are configured.

2. **Testing Instructions**:
   - Step-by-step instructions for:
     - Setting up the local Kubernetes environment.
     - Deploying the Helm chart.
     - Validating each component (Keycloak, PostgreSQL, PGAdmin, and the website).
   - Include example `helm install` commands with parameter overrides.

3. **Testing in Our Infrastructure**:
   - Provide instructions for deploying the Helm chart to our Kubernetes infrastructure.
   - Mention any prerequisites or assumptions (e.g., an existing Ingress controller or namespace setup).

---

## Deliverables

Once you complete the tasks, provide the following:

1. A fork of this repository with:
   - The Helm chart in a directory called `helm-chart/`.
   - A `values.yaml` file for the default configuration.
   - A corrected and working `README.md` file with detailed instructions.
2. Screenshots or evidence of the deployed application running in your local Kubernetes environment.
3. A link to your forked repository, shared with us.

---

## Example `values.yaml`

Below is an example configuration file to guide your implementation:

```yaml
keycloak:
  ingress:
    enabled: true
    hostname: keycloak.local

postgresql:
  username: keycloak
  password: keycloakpassword
  database: keycloakdb

pgadmin:
  ingress:
    enabled: true
    hostname: pgadmin.local
  admin:
    email: admin@example.com
    password: adminpassword

website:
  ingress:
    enabled: true
  hostname: website.local
```

---

## Setup Instructions

1. **Fork This Repository**:
   - Fork this repository to your GitHub account to begin working on the assignment.

2. **Install Prerequisites**:
   - Install Docker, Kubernetes (e.g., Minikube or Kind), and Helm CLI.
   - Set up a local Kubernetes cluster.

3. **Deploy the Helm Chart**:
   - Clone your forked repository to your local machine.
   - Navigate to the `helm-chart/` directory.
   - Deploy the chart using Helm:
     ```bash
     helm install my-app ./helm-chart -f values.yaml
     ```

4. **Validate the Deployment**:
   - Add entries to your local `/etc/hosts` file for the Ingress hostnames (e.g., `keycloak.local`, `pgadmin.local`, `website.local`).
   - Verify the following:
     - Keycloak is accessible via `http://keycloak.local`.
     - PGAdmin is accessible via `http://pgadmin.local`.
     - The website is accessible via `http://website.local` and authentication works with Keycloak.

---

## Evaluation Criteria

1. **Helm Chart Quality**:
   - Correct use of Helm templates and values.
   - Logical organization and reusability of templates.
   - Proper handling of configuration via `values.yaml`.

2. **Deployment**:
   - Successful deployment of all components using the Helm chart.
   - Integration between Keycloak, PostgreSQL, and the website.

3. **Documentation**:
   - Clarity, detail, and accuracy of the `README.md` file.
   - Correct explanation of the deployment process.

4. **Problem-Solving Skills**:
   - Your approach to configuring and deploying the components.
   - Handling challenges such as Ingress setup and inter-service communication.

---

## Bonus Points

- Add health checks for all services in the Helm chart.
- Include automated tests for validating the deployment.
- Use environment variables or Kubernetes secrets for sensitive information (e.g., database credentials).
- Provide additional customization options in the Helm chart.

---

This assignment is designed to assess your ability to work with Kubernetes, Helm, and Docker while demonstrating clear communication through documentation. Once you have completed the tasks, please share the link to your forked repository with us.

--- 

You can directly copy this into the **README.md** of your GitHub repository. Let me know if you need further adjustments!
