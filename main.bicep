targetScope = 'managementGroup'

param billingScope string

param subscriptionAliasName string

module subscriptionCreation './modules/subscriptions-creation.bicep' = {
  scope: tenant()
  name: 'subscriptionCreation'
  params: {
    billingScope: billingScope
    subscriptionAliasName: subscriptionAliasName
  }
} 
