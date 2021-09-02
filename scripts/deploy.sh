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
    -var "aws_access_key=$AWS_ACCESS_KEY" \ 
    -var "aws_secret_access_key=$AWS_ACCESS_SECRET"       
