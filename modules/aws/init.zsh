#
# Defines yum aliases.
#
# Authors:
#   Simon <contact@saimon.org>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[aws] )); then
  return 1
fi
#
# Aliases
#

alias aws-get-p2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=p2.xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $AWS_INSTANCE_ID'

alias aws-get-t2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=t2.micro" --query "Reservations[0].Instances[0].InstanceId"` && echo $AWS_INSTANCE_ID'
alias aws-start='aws ec2 start-instances --instance-ids $AWS_INSTANCE_ID && aws ec2 wait instance-running --instance-ids $AWS_INSTANCE_ID && export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$AWS_INSTANCE_ID" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ip='export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$AWS_INSTANCE_ID" --query "Reservations[0].Instances[0].PublicIpAddress" --output text` && echo $instanceIp'
alias aws-ssh='ssh -i $PRIVATE_KEY ubuntu@$instanceIp'
alias aws-stop='aws ec2 stop-instances --instance-ids $AWS_INSTANCE_ID'

