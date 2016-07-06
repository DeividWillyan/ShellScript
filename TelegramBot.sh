#!/bin/bash
# Deivid Willyan
# V0.1 06/07/2016
# Telegram bot gambiarra level 69
# https://www.facebook.com/DeividWillyan
# Use ./script.sh MENSAGEM


#ID do LHC no telegram "-110056247"

TEXT="$1"
TIME="10"
CHATID="-110056247"
URL="https://api.telegram.org/bot$KEY/sendMessage"
KEY="232843304:AAEjFXFe9Y0RiugELwwE2455Vom45XVlJmg"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL &> /dev/null
