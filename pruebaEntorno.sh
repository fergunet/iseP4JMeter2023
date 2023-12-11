#!/bin/bash
SERVER=localhost
TOKEN=$(curl -s \
-u batman:joker \
-d "login=mariweiss@tropoli.com&password=anim" \
-H "Content-Type: application/x-www-form-urlencoded" \
-X POST http://$SERVER:3000/api/v1/auth/login)

resultado=$?
if test "$resultado" != "0"; then
   echo "ERROR: Curl fallo con resultado: $resultado"
fi

curl \
-H "Authorization: Bearer $TOKEN" \
http://$SERVER:3000/api/v1/students/student/mariweiss%40tropoli.com 
