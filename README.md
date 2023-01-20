# Terratest with AWS 

This Code will create an ec2 instnace behind the application loadbalancer in existing VPC and will run Terratest.

## Do the follwing to Run the Terratest on AWS

1. Run and configure AWS CLI
```
aws configure

2. Update terraform.tfvars accordingly

3. Run the Following in main directory just to verify the terraform code

    ```bash
    terraform init
    terraform plan
    
4. To configure Terratest dependencies:

    ```bash
    cd test
    go mod init github.com/ahmadqayyum/terraform-terratest-aws
    go mod tidy
    ```

5. To run the tests:

    ```bash
    go test -v -timeout 30m
    ```
