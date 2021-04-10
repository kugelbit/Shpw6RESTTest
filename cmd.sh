
#!/bin/bash

kind=$1 
urlpath=$2 
data=$3 

token=$(cat token)


if [ "$kind" == "GET" ] 
then
    out=$(curl -k --silent -H "Content-Type: application/json" -H "Authorization: Bearer $token" --request GET  $urlpath)
fi

if [ "$kind" == "DELETE" ] 
then
    out=$(curl -k --silent -H "Content-Type: application/json" -H "Authorization: Bearer $token" --request DELETE  $urlpath)
fi

if [ "$kind" == "POST" ] 
then
    content=$(cat $data) 
    echo "$content"
    out=$(curl -k --silent -H "Content-Type: application/json" -H "Authorization: Bearer $token" --request POST --data "$content" $urlpath)
fi

if [ "$kind" == "PATCH" ] 
then
    content=$(cat $data|tr -d '\n') 
    echo "$content"
    out=$(curl -k --silent  -H "Content-Type: application/json" -H "Authorization: Bearer $token" --request PATCH --data "$content"   $urlpath)
fi

#write new Token file
if [ "$kind" == "TOKEN" ] 
then
    urlpath="${urlpath}/api/oauth/token"
    curl -k --silent -H "Content-Type: application/json"  --request POST --data @$data $urlpath | jq -r '.access_token' > token
    out="new token generated"
fi


if [ "$kind" == "IMG" ] 
then
    out=$(curl --silent -H "Content-Type: image/jpeg" -H "Authorization: Bearer $token"  -request POST --data-binary "@$data" $urlpath)
fi


#--compressed
echo $out 

echo $out | xclip -selection clipboard
