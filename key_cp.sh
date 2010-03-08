#/bin/bash
compnum=1

ssh prateeks@host "echo `cat ~/.ssh/id_dsa.pub` >> ~/.ssh/authorized_keys"
