targetScope = 'managementGroup'

@description('Create a subscription with a given alias name')
param billingScope string

@description('The alias name for the subscription')
param subscriptionAliasName string

@description('The workload for the subscription')
param workload string

@description('The tags for the subscription')
param tags object

@description('The management group to move the subscription to')
param managementGroupId string

module createSubscription './modules/create-subscription.bicep' = {
  name: subscriptionAliasName
  params: {
    billingScope: billingScope
    subscriptionAliasName: subscriptionAliasName
    workload: workload
    tags: tags
  }
}

var subscriptionId = createSubscription.outputs.id

module moveSubscription './modules/move-subscription.bicep' = {
  name: '${subscriptionAliasName}/${managementGroupId}'
  params: {
    targetMgId: managementGroupId
    subscriptionId: subscriptionId
  }
  dependsOn: [
    createSubscription
  ]
}
