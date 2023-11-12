# Terraform AWS DNS

Deal with all AWS Route53 (DNS) related issues in order to run an Enterprise Knowledge Graph (EKG) (or a
semantic Digital Twin (DT), in AWS.

The main production DNS zone (called `main-domain` in the code) would be something
like `<your-EKG>.<your-org>` (e.g. `ekg.ekgf.org` or `digital-twin.ekgf.org`).

For each other environment, not being `prod`, such as `dev`, `staging`, `test` etc., a subdomain is created such
as `dev.ekg.ekgf.org` or `staging.digital-twin.ekgf.org`.



