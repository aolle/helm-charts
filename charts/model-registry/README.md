# Model Registry Helm Chart

This Helm chart deploys a ModelRegistry (CRD `modelregistry.opendatahub.io/v1beta1`) plus the supporting MySQL database and related Kubernetes objects.

**Note on Namespaces:** Due to OpenDataHub/RHOAI Operator constraints, the ModelRegistry CR often requires to be deployed in a specific namespace (e.g., `rhoai-model-registries`). This chart allows configuring namespaces explicitly in the values.

## Values

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| **Global / Namespaces** | | | |
| `registryNamespace` | string | Namespace where the ModelRegistry CR is created (Required by Operator) | `"rhoai-model-registries"` |
| `dbNamespace` | string | Namespace where the Database, Service, and Secrets will be created | `"rhoai-model-registries"` |
| `fullnameOverride` | string | Overrides the release name for naming resources | `""` |
| **Database (MySQL)** | | | |
| `database.name` | string | Name of the database to create/connect | `"metadb"` |
| `database.user` | string | Database username | `"db"` |
| `database.password` | string | Database user password (recommended to set via CLI/Secret) | `"db"` |
| `database.rootPassword` | string | MySQL root password | `"db"` |
| `database.host` | string | External DB host. If empty, the chart deploys a local MySQL pod | `""` |
| `database.port` | int | Database port | `3306` |
| `database.image` | string | Docker image for the local MySQL deployment | `"mysql:8.0.3"` |
| `database.imagePullPolicy` | string | Pull policy for the DB image | `"IfNotPresent"` |
| `database.volumeSize` | string | Size of the PersistentVolumeClaim for local DB | `"10Gi"` |
| `database.allowEmptyPassword` | string | Allow empty password (NOT recommended for production) | `"true"` |
| `database.resources` | object | CPU/Memory requests and limits for the DB pod | `{}` |
| **Model Registry** | | | |
| `modelregistry.grpc.port` | int | Port for the gRPC service | `9090` |
| `modelregistry.rest.port` | int | Port for the REST service | `8080` |
| `modelregistry.rest.serviceRoute` | string | Enable OpenShift Route for REST ("enabled"/"disabled") | `"disabled"` |
| `modelregistry.rest.resources` | object | Resources for the Registry container | `{ limits: {cpu: 100m, memory: 256Mi}, ... }` |
| `modelregistry.oauthProxy.*` | various | Configuration for the OAuth Proxy sidecar | See `values.yaml` |

## Install example

Create a `values.yaml` or pass parameters via CLI.

**Standard Installation (RHOAI context):**

```bash
helm install my-registry olleb/model-registry \
  --namespace rhoai-model-registries --create-namespace \
  --set registryNamespace=rhoai-model-registries \
  --set dbNamespace=rhoai-model-registries
```

**Custom Installation with specific passwords:**
```bash
helm install my-registry olleb/model-registry \
  --namespace rhoai-model-registries \
  --set database.password="MySecurePass123!" \
  --set database.rootPassword="MyRootPass123!" \
  --set database.volumeSize="20Gi"
```
