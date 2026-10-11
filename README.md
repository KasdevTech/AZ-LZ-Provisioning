# AZ-LZ-Provisioning

## Create a storage account

The `azure-storage-account.yml` workflow creates a storage account in a
**pre-existing** resource group and subscription. It first validates the inputs
and target, checks that the requested account does not already exist in the
resource group, previews the deployment, and then deploys
[`infra/storage-account.bicep`](./infra/storage-account.bicep). It does not
create a subscription or resource group.

Configure these GitHub Actions repository secrets:

- `AZURE_CLIENT_ID`: client ID of the Entra application with a GitHub OIDC
  federated credential for this repository's `main` branch.
- `AZURE_TENANT_ID`: tenant containing the application and target subscription.

The service principal must have permission to inspect and deploy resources in
the target resource group (for example, **Contributor** scoped to that resource
group). Storage accounts use Standard_LRS and StorageV2, require HTTPS and
TLS 1.2, disable anonymous blob access and shared-key authentication, and use
Microsoft-managed encryption keys.