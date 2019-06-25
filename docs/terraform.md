## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | - | yes |
| records | DNS records to create | list(string) | - | yes |
| ttl | The TTL of the record to add to the DNS zone to complete certificate validation | string | `300` | no |
| type | Type of DNS records to create | string | `CNAME` | no |
| zone_id | Route53 DNS Zone ID | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| hostname | DNS hostname |

