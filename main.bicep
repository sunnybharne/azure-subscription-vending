targetScope = 'managementGroup'

param billingScope string

param subscriptionAliasName string

module somemodule './modules/create-subscription.bicep' = {
  name: 'create-subscription'
  scope: tenant()
  params: {
    billingScope: billingScope
    subscriptionAliasName: subscriptionAliasName
  }
}
