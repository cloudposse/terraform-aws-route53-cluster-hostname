output "hostname" {
  value = "${join("", aws_route53_record.default.*.fqdn)}"
}
