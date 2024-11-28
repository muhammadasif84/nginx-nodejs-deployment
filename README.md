# nodejs-ec2-deployment

<h2>Node.Js deployment on ec2 using terraform, pm2.</h2>
<br/>
1- Create instance infra using terraform 
<br/>
2- Add user_data for configuration setup => node.js, npm and pm2
<br/>
<h3>Please follow these following step to deploy Node.Js server on Aws EC2</h3>
<br/>
<p>
i- Replace these creds in providers.tf 
<br/>
provider "aws" {
    <br/>
  region     = "AWS_REGION"
  <br/>
  access_key = "AWS_ACCESS_KEY"
  <br/>
  secret_key = "AWS_SECRET_KEY"
  <br/>
}</p>
<h4>Commands</h4>
terraform init
<br/>
terraform fmt
<br/>
terraform validate
<br/>
terraform plan
<br/>
terraform apply --auto-approve
<br/>
<h5>run public_ip address of ec2 in browser, it should show "Node.js server is running on Ubuntu EC2" </h5>
<h4>Destroy all Resources created for this deployment</h4>
terraform destroy --auto-approve