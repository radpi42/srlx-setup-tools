#!/bin/sh
hs_apikey=$(docker exec headscale headscale apikeys create) #command to create the headscale api key 
ntfy_url="https://ntfy.srlrd.com/headscale" #ntfy url to receive the notification
email="headscale@srlxmail.xyz" #email address to receive the notification

curl \
    -H "Email: $email" \
    -H "Priority: high" \
    -d "$hs_apikey" \
    "$ntfy_url"

echo "the created headscale api key is"
echo "$hs_apikey"