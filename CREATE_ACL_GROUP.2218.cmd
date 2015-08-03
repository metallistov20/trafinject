echo "1. Creating ACL group"
./inject.sh 192.168.0.1 acl 2218 99 >./_acl.log
echo "1. ACL group creation command issued"

echo "2. Saving created ACL in the switch. (Supressing STDOUT output is obvious.)"
./inject.sh 192.168.0.1 save 2218 >./_save.log
echo "2. Saved"

