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

module moveSubscription './modules/move-subscription.bicep' = {
  name: 'moveSubscription'
  params: {
    targetMgId: managementGroupId
    subscriptionId: createSubscription.outputs.subscriptionId
  }
}

module createBudget './modules/create-budget.bicep' = {
  name: 'createBudget'
  scope: subscription(subscriptionAliasName)
  params: {
    amount: 100
    timeGrain: 'Monthly' 
    budgetName: 'Budget'
    endDate: '2025-12-31' 
    startDate: '2024-01-01' 
    contactEmails: ['sunny.bharne@gmail.com']
    firstThreshold: 50
    secondThreshold: 90
  }
}

