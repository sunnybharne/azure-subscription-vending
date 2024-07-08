using './main.bicep'

param subscriptionAliasName = 'TestSubscription'

param billingScope = '/providers/Microsoft.Billing/billingAccounts/6ff54af4-895a-56a2-a1e9-cf6c8a981030:74cd2a1a-33b5-4401-be25-17d42a1bc32c_2019-05-31/billingProfiles/878fce5f-b3d1-4347-9571-8a09102130e0/invoiceSections/YE2A-5SKL-PJA-PGB'

param workload = 'Production'

param tags = {
  environment: 'Production'
}
