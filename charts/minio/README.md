# MinIO helm chart

| Key                 | Type   | Default               | Description            |
| ------------------- | ------ | --------------------- | ---------------------- |
| `image.repository`  | string | `quay.io/minio/minio` | MinIO image repository |
| `image.tag`         | string | `<latest-release>`    | MinIO image tag        |
| `auth.rootUser`     | string | `"minioadmin"`        | Root user              |
| `auth.rootPassword` | string | `"minioadmin123"`     | Root password          |
| `persistence.size`  | string | `"20Gi"`              | PVC size               |
| `service.type`      | string | `"ClusterIP"`         | Service type           |
| `openshift.enabled` | bool   | `true`                | Enable Routes          |
