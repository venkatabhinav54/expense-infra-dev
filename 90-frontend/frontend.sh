#!bin/bash

component=$1
environment=$2
echo "Component: $component, Environment: $environment"
dnf install ansible -y
ansible-pull -i localhost, -U https://github.com/venkatabhinav54/-ansible-roles-expense-tf.git main.yml -e component=$component -e environment=$environment
