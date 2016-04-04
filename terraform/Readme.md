# Pre-Requisites
* Vagrant
* VM Provider, like VirtualBox
* Generate AWS credentials
* Generate terraform AWS key pair

NOTE: Put the terraform.pem that gets downloaded when generating the terraform AWS key pair, put it in 
      the terraform/aws/ directory, and make sure it has 400 permissions.

# Install

    vagrant up

Bring up a terminal window within the VM

    cd terraform/aws
    export ACCESS_KEY=MY_ACCESS_KEY
    export SECRET_KEY=MY_SECRET_KEY
    export TEAM=MY_TEAM_NAME
    terraform get

### Step 1 - Plan

    terraform plan -var "access_key=${ACCESS_KEY}" -var "secret_key=${SECRET_KEY}" -var "team=${TEAM}" -out terraform.plan
    
Note the following files:

* terraform.plan - A binary file that has the execution
* terraform.tfstate - A text file of the current state

### Step 2 - Apply Plan

    terraform apply terraform.plan

* terraform.tfstate - A text file of the current state
* terraform.tfstate.backup - A backup of the previous state (from step 1)

### Step 3 - Modify Plan

    # Uncomment out the two lines in terraform.tf

    terraform plan -var "access_key=${ACCESS_KEY}" -var "secret_key=${SECRET_KEY}" -var "team=${TEAM}" -out terraform.plan
    
### Step 4 - Apply Modified Plan

    terraform apply terraform.plan

#### Step 5 - Destroy Infrastructure

    terraform destroy -var "access_key=${ACCESS_KEY}" -var "secret_key=${SECRET_KEY}" 