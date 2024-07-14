targetScope = 'managementGroup'

@description('Provide a name for the alias. This name will also be the display name of the subscription.')
param subscriptionAliasName string

@description('Provide the full resource ID of billing scope to use for subscription creation.')
param billingScope string

@description('Provide the workload type for the subscription. Valid values are Production, Nonproduction.')
param workload string

@description('Provide the tags to be assigned to the subscription.')
param tags object

resource subscriptionAlias 'Microsoft.Subscription/aliases@2021-10-01' = {
  scope: tenant()
  name: subscriptionAliasName
  properties: {
    workload: workload
    displayName: subscriptionAliasName
    billingScope: billingScope
    additionalProperties: {
      tags: tags
    }
  }
}

output id string = subscriptionAlias.id
output name string = subscriptionAlias.name
