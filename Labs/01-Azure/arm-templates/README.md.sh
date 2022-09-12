# Create Azure Resources using ARM templates

git clone https://github.com/atingupta2005/devops-sep-22
cd devops-sep-22/Labs/01-Azure/arm-templates
cat storage1.arm.json

az deployment group create   --resource-group rgarm  --template-file storage1.arm.json

az deployment sub create --location northeurope --template-file storage1.arm.json

az deployment group create --resource-group new-grp --template-uri https://raw.githubusercontent.com/atingupta2005/devops-sep-22/main/Labs/01-Azure/arm-templates/storage-arm-template-3-copies.json
