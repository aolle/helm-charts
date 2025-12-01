# Gitea Helm Chart

A generic Helm chart to deploy a Gitea instance using the `Gitea` Custom Resource (`pfe.rhpds.com/v1`).  
All configuration values are fully parameterized in `values.yaml`, including admin credentials, user generation and repositories.

---

## Values

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| gitea.imageTag | string | Gitea image tag | `"1.24.0"` |
| gitea.volumeSize | string | Size of the Gitea PVC | `"4Gi"` |
| gitea.ssl | bool | Enable SSL for Gitea | `true` |
| gitea.postgresqlVolumeSize | string | Size of the PostgreSQL PVC | `"20Gi"` |
| admin.user | string | Admin username | `"admin"` |
| admin.email | string | Admin email address | `"admin@example.com"` |
| admin.password | string | Admin password (used if `existingSecret` is not set) | `""` |
| admin.existingSecret | string | Name of an existing secret containing admin password | `""` |
| users.enabled | bool | Enable auto-generated users | `true` |
| users.number | int | Number of generated users | `1` |
| users.format | string | Format string for usernames (e.g. `"user%d"`) | `"user%d"` |
| users.password | string | Password for generated users | `""` |
| users.existingSecret | string | Secret name for user password | `""` |
| repositories.migrate | bool | Enable repository migration | `true` |
| repositories.list | list | List of repositories to migrate | `[]` |
