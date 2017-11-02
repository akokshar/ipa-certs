#!/usr/bin/bash

PASSP12=12345678

openssl req \
    -config openssl.cnf \
    -new -keyout http.key -out http.csr \
    -reqexts v3_req_ext \
    -nodes \
    -subj /CN=http

openssl ca \
    -config openssl.cnf -name ca_ipa \
    -out http.crt -in http.csr \
    -extensions http_v3_ext \
    -batch \
    -notext

openssl pkcs12 \
    -inkey http.key \
    -in http.crt \
    -certfile ca/ca.crt \
    -password pass:${PASSP12} \
    -export -out http.p12


openssl req \
    -config openssl.cnf \
    -new -keyout dirsrv.key -out dirsrv.csr \
    -reqexts v3_req_ext \
    -nodes \
    -subj /CN=dirsrv

openssl ca \
    -config openssl.cnf -name ca_ipa \
    -out dirsrv.crt -in dirsrv.csr \
    -extensions dirsrv_v3_ext \
    -batch \
    -notext

openssl pkcs12 \
    -inkey dirsrv.key \
    -in dirsrv.crt \
    -certfile ca/ca.crt \
    -password pass:${PASSP12} \
    -export -out dirsrv.p12


openssl req \
    -config openssl.cnf \
    -new -keyout kdc.key -out kdc.csr \
    -reqexts v3_req_ext \
    -nodes \
    -subj /CN=kdc

openssl ca \
    -config openssl.cnf -name ca_ipa \
    -out kdc.crt -in kdc.csr \
    -extensions kdc_v3_ext \
    -batch \
    -notext

openssl pkcs12 \
    -inkey kdc.key \
    -in kdc.crt \
    -certfile ca/ca.crt \
    -password pass:${PASSP12} \
    -export -out kdc.p12


