# Terratest with AWS 

## Prerequisite for terraform

### Update terraform.tfvars accordingly

1. Run the Following in main directory just to verify the terraform code

    ```bash
    terraform init
    terraform plan
    
2. To configure Terratest dependencies:

    ```bash
    cd test
    go mod init github.com/ahmadqayyum/terraform-terratest-aws
    go mod tidy
    ```

2. To run the tests:

    ```bash
    go test -v -timeout 30m
    ```
