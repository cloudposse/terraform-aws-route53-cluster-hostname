## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| aws | ~> 2.0 |
| local | ~> 1.2 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | `string` | n/a | yes |
| records | DNS records to create | `list(string)` | n/a | yes |
| ttl | The TTL of the record to add to the DNS zone to complete certificate validation | `string` | `"300"` | no |
| type | Type of DNS records to create | `string` | `"CNAME"` | no |
| zone\_id | Route53 DNS Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| hostname | DNS hostname |

