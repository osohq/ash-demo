# Agent Guidelines

This document provides guidance for AI agents working with this codebase.

## GitHub Actions

### Deployment Region Configuration

When modifying or creating GitHub Actions workflows that deploy services to AWS regions:

1. **Read the contract**: See [contracts/INFRASTRUCTURE_REPOSITORY.md](contracts/INFRASTRUCTURE_REPOSITORY.md) for the expected Pulumi configuration structure in the [infrastructure repository](https://github.com/osohq/infrastructure).

2. **Use the appropriate workflow**:
   - For services needing VPC metadata (like `shortId`): Use `aws-peered-vpcs.yml`
   - For services needing only region names: Use `aws-regions.yml`

3. **Don't hardcode region exclusions**: Region filtering should be driven by the infrastructure repository's Pulumi configuration, not hardcoded in workflow files.

4. **Consistent interfaces**: Both `aws-peered-vpcs.yml` and `aws-regions.yml` use a path + query pattern to reference configuration in the infrastructure repository. Keep their interfaces as consistent as possible.