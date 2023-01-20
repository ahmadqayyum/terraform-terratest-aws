# Run Terratest with few steps...

1. To configure dependencies:

    ```bash
    cd test
    go mod init github.com/ahmadqayyum/terraform-terratest-aws
    go mod tidy
    ```

2. To run the tests:

    ```bash
    go test -v -timeout 30m
    ```
