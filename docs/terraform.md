
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | `dns` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| records | Records | list | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| ttl | The TTL of the record to add to the DNS zone to complete certificate validation | string | `300` | no |
| type | Type | string | `CNAME` | no |
| zone_id | Route53 DNS Zone id | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| hostname | DNS hostname |

