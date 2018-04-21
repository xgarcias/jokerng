#!/bin/sh

IP=$(cat packer/shared/aws/ssh/private_address);
cat packer/shared/aws/ssh/ssh_config.tpl | sed "s%IP_ADDRESS%$IP%" > packer/shared/aws/ssh/ssh_config
