# SRE-Exercise

Deployment of a functioning VPC with a public subnet and a EC2 instance.
Nginx gets installed through user data, and the `index.html` file located on `src/modules/ec2` gets uploaded and used as the Nginx default landing page.

A workflow should then be manually created on Github to automatically replace the `index.html` file every time code gets committed to the main branch.
This project uses [this repository](https://github.com/easingthemes/ssh-deploy) as a helper to the workflow action that copies the necessary files to the EC2 instance.

## prerequisites

  * AWS CLI environment configured and initialized with necessary credentials
  * Terraform CLI installed and configured.
  * `npm init` the root of the repository, and add the below 3 dependencies to the `package.json` file. This file gets used by the GitHub Workflow to copy the file to EC2.
  `"dependencies": {
    "command-exists": "1.2.9",
    "node-cmd": "4.0.0",
    "rsyncwrapper": "3.0.1"
    },`

## Deployment

    Clone this repo

    Navigate to `src/modules/ec2` and create a private and public key that will be used for the instance. The following command can be used on Unix environments: `ssh-keygen -f mykey.pem`.
    If a different name is used for the key, update the `main.tf` file to reflect that.
