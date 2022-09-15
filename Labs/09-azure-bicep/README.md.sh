## Install Azure Bicep
# - Bicep utilizes the Azure CLI. Enter the following command at the command prompt of the environment where CLI is installed.

az bicep install

## Deploying a Bicep Template with the Azure CLI
az group create -l uksouth  -n ATA
az deployment group create --resource-group ATA --template-file main.bicep

## Cleanup
az resource delete -g ATA -n ataag61222diskstorage --resource-type "Microsoft.Storage/storageAccounts"
