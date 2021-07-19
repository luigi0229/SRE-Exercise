# SRE-Exercise

Deployment of a functioning VPC with a public subnet and a EC2 instance running Nginx. The `index.html` file located on `src/modules/ec2` gets uploaded and used as the Nginx default landing page.

A workflow Action gets created to automatically replace the `index.html` file every time code gets committed to the main branch. (See CI/CD section for this implementation)
This project uses [this repository](https://github.com/easingthemes/ssh-deploy) as a helper to the workflow action that copies the necessary files to the EC2 instance.

## Prerequisites

  * AWS CLI environment configured and initialized with necessary credentials.
  * Terraform CLI installed and configured.


## Deployment

  * Clone the repo.

  * Navigate to `src/modules/ec2` and create a private and public key that will be used for the instance. The following command can be used on Unix environments: `ssh-keygen -f mykey.pem`. If a different name is used for the key, update the `main.tf` file to reflect that.

  * Navigate to `/src` and run the following commands:
  ```
  terraform init
  terraform apply
  ```

  After following these steps, you should be able to navigate to the public IP of your instance (which gets displayed as an output on your terminal) and see the Nginx landing page with the contents of `src/modules/ec2/index.html`.

## CI/CD

  To automate the deployment of `index.html`, follow these steps **in your own forked/cloned version** of this repo:

  * Navigate to the **settings** of the repository, then **Secrets** and add two secrets:

      `EC2_SSH_KEY` : `Paste your instance's Private Key Here`

      `PUBLIC_IP`   : `Paste your instance's public ip here`

  * Test it by making changes to your `index.html` on your local repo, and push the changes to the *main* branch.

## Rollback

  To restore the html file to a previous revision, use the github restore command, with the number of revisions back you need. Example below:

  `restore --source BRANCH~Number of Revisions src/modules/ec2/index.html`

  `restore --source main~2 src/modules/ec2/index.html`

## Troubleshooting

  * Going to the public IP address of the instance doesn't load anything:
    Confirm that the EC2 instance has a public IP address. Manually log in to the EC2 dashboard to check if necessary.

  * Can't SSH
    Make sure you created the public and private keys, and that the name matches the terraform resource arguments in `/src/modules/ec2/main.tf`
