set -u                                            
: "$VERSION"
: "$AWS_ACCESS_KEY"
: "$AWS_ACCESS_SECRET"
: "$ARM_TENANT_ID"
cd ./scripts                                      
export KUBERNETES_SERVICE_HOST=""                 
terraform init                                    
terraform apply -auto-approve \                   
    -var "app_version=$VERSION" \                 
    -var "client_id=$AWS_ACCESS_KEY" \ 
    -var "client_secret=$AWS_ACCESS_SECRET"       
