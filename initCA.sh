#!/usr/bin/bash

openssl req \
-config openssl.cnf -new -x509 \
-keyout ca/ca.key -out ca/ca.crt \
-extensions ca_v3_ext \
-batch -nodes \
-days 365 \
-subj /CN="Certificate Authority"
