# Terraform-HelloWorld
An example to get going with Terraform, this uses version 12 syntax so ensure you executables are up to date else you will get errors. This guide was created to go along with a blog created on https://magnetarconsulting.co.uk/blog

The example will create an EC2 instance and a Security group.

## Required Environment Variables

The below two environment variables are used by Terraform to connect to your AWS account. The account must have IAM permissions to create, read, update and destroy resources. See this guide for creating a IAM user in your AWS Account https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html 

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

# Instructions
1) Download and install Terraform - https://www.terraform.io/downloads.html (ensure you add it to a resolvable path).

2) Initialise Terraform which will download any required providers.
``` 
terraform init
```

3) Plan Terraform which will highlight any syntax issues, ask for any variables and let you know what will happen when you apply the code.
``` 
terraform plan
```

4) Apply the Terraform code which will execute the steps, there are two variations below, one will display what will happen and ask for approval the other will execute without prompting.
``` 
terraform apply
```
``` 
terraform apply -auto-approve
```

5) When you are finished you can destroy all the resources created by the Terraform code, again there are two versions one will ask for approval one will not.
``` 
terraform destroy
```
``` 
terraform destroy -auto-approve
```
