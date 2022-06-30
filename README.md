# Studocu

## StudcoU Solution design

![Alt text](images/studocu.png?raw=true "solution_diagram")

This solution will cover the following main targets.
* Security 
* Scalability 
* High availability.  

### Security

There are three private subnets.

 There is a bastion host to maintain access to environment. A bastion host is a server whose purpose is to provide access to a private network from an external network, such as the Internet. Because of its exposure to potential attack, a bastion host must minimize the chances of penetration.

There are multiple security groups to control access to each component. All security groups are listed in security-group.
Every Security Group works in a similar fashion to a firewall as it carries a set of rules that filter traffic entering and leaving the EC2 instances. As said earlier, security groups are associated with the EC2 instances,RDS and offer protection at the ports and protocol access level.

### Scalability

There is a auto scaling group in this environment which will help scale instances in each availability zone.

### High availability(HA)

High Availability describes systems that are dependable enough to operate continuously without failing

I used three avilability zones to maintain HA in this setup. 




### 1. Setup IAM account to provision environment 

* Use your AWS account ID or account alias, your IAM user name, and your password to sign in to the IAM console.

* In the navigation bar on the upper right, choose your user name, and then choose My Security Credentials.

![Alt text](images/sc.png?raw=true "solution_diagram")

* Expand the Access keys (access key ID and secret access key) section.

* To create an access key, choose Create New Access Key. If this feature is disabled, then you must delete one of the existing keys before you can create a new one. A warning explains that you have only this one opportunity to view or download the secret access key. To copy the key to paste it somewhere else for safekeeping, choose Show Access Key. To save the access key ID and secret access key to a .csv file to a secure location on your computer, choose Download Key File.

### 2. Install AWS CLI

Please use following URL to install AWS CLI
* https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-prereq



### 3. Setup terraform code repo in local machine
 
 Open terminal and enter following command
 
 ```shell
git clone https://github.com/Anushkasandaruwan/studocu-coding-assignment.git && cd studocu-coding-assignment
```

### 4. Install terrafrom

Please use following URL to install terrafrom in your local computer

https://learn.hashicorp.com/tutorials/terraform/install-cli

### 5. Configure AWS CLI

After installing the AWS CLI. Configure it to use your credentials.
 

```shell
$ aws configure
AWS Access Key ID [None]: <YOUR_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_AWS_SECRET_ACCESS_KEY>
Default region name [None]: us-east-2
Default output format [None]: text
```

This enables Terraform access to the configuration file and performs operations on your behalf with these security credentials.

### 6. Terraform initialization

After you've done configure AWS CLI, initialize your Terraform workspace, which will download 
the provider and initialize it with the values provided in the `vars.tf` file.

```shell
$ terraform init 
Initializing modules...

Initializing the backend...

Initializing provider plugins...
- Using previously-installed hashicorp/null v2.1.2
- Using previously-installed hashicorp/random v2.3.1
- Using previously-installed hashicorp/template v2.2.0
- Using previously-installed gavinbunney/kubectl v1.9.1
- Using previously-installed hashicorp/aws v3.15.0
- Using previously-installed hashicorp/kubernetes v1.13.3
- Using previously-installed hashicorp/local v1.4.0


Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```

### 7. Terraform apply

Then, provision your EKS cluster by running `terraform apply`. This will 
take approximately 10 minutes.

```shell
$ terraform apply

# Output truncated...

Plan: 40 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

# Output truncated...

Apply complete! Resources: 40 added, 0 changed, 0 destroyed.

```

### 8. Login to bastion server 

In terraform output you can find bastion public IP in bastion_public_IP section. 
Open new terminal and change aws_eks_cluster_master_key.pem permission.(Key Pair generated in section 3)

```shell
chmod 600 bastion.pem
```
Enter following command inorder to login bastion server. Please make sure to replace <BASTION PUBLIC IP> with public ip extracted from terraform output.

```shell
ssh -i bastion.pem ec2-user@<BASTION PUBLIC IP>
```


## Destroy infrastructure 

Please run following command to destroy infrastructure.

```shell
$ terraform destroy 
}

# Output truncated... 

Destroy complete! Resources: 40 destroyed.

```

_____________________________________________


---------------------------------------------
### TO-DO


* Configure log alerts
* Configure cloudwatch metrics alerts
* Configure CI/CD process using AWS codebuild 
* Setup ECR to store  images
* Perform performance test using jmeter