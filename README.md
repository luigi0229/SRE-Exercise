# SRE-Exercise

Deployment of a functioning VPC with a public subnet and a EC2 instance.
Nginx gets installed through user data, and the `index.html` file located on `src/modules/ec2` gets uploaded and used as the Nginx default landing page.
A workflow should the manually be created on Github to automatically replace the `index.html` file everytime code gets commited to the main branch.

## prerequisites

  * AWS CLI environment configured and initialized with necessary credentials
  * Terraform CLI installed and configured.

## Deployment

    Clone this repo

    Navigate to `src/modules/ec2` and create a private and public key that will be used for the instance. The following command can be used on Unix environments: `ssh-keygen -f mykey.pem`.
    If a different name is used for the key, update the `main.tf` file to reflect that.
