# ipa-certs

touch certs/index.txt

touch certs/index.txt.attr

echo -n 01 > certs/serial

./initCA.sh
./createCerts.sh
