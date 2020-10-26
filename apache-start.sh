#! /bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
echo "<h1>Deployed via Terraform From CP4MCM</h1>" | sudo tee /var/www/html/index.html
