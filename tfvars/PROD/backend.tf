
   
bucket = "roboshop-remote-state-prod11"
key = "tfvars-prod"
region = "us-east-1"
dynamodb_table = "roboshop-state-lock-prod"
  

  #this is the prod backend i.e., to store the state files in aws s3 lock with dynamodb