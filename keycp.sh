#!/bin/bash
for i in `seq 1 110`; do
	scp -q .ssh/id_rsa.pub "osl-$i":.ssh/authorized_keys
done
