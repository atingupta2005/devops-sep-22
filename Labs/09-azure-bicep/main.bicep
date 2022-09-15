resource myStorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'ataag61222diskstorage'
  location: 'uksouth'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'

  }
}
