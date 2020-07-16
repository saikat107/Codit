#!/usr/bin/env bash

# https://drive.google.com/file/d/1wSl_SN17tbATqlhNMO0O7sEkH9gqJ9Vr/
echo "Downloading dataset"
FILE=codit-data.zip
if [[ -f "$FILE" ]]; then
    echo "$FILE exists, skipping download"
else
    fileid="1wSl_SN17tbATqlhNMO0O7sEkH9gqJ9Vr"
    curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${FILE}
    rm ./cookie
    unzip ${FILE} && rm ${FILE}
fi

