source ~/python_venv/bin/activate

az acr login --name rushi1.azurecr.io

docker image build -t rushi1.azurecr.io/customnginx$USER .

docker push rushi1.azurecr.io/customnginx$USER
