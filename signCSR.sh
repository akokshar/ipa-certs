#!/usr/bin/bash

CSR=$1
CRT=$2

if [ -z ${CSR} ] || [ -z ${CRT} ]; then
    echo "usage: $0 <path to csr file> <path to store signed crt file>"
    exit 1
fi

openssl ca \
    -config openssl.cnf -name ca_ipa \
    -out ${CRT} -in ${CSR} \
    -batch \
    -notext

