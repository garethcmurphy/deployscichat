#!/usr/bin/env bash

if  [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout scichat.key -out scichat.crt -subj "/CN=scicat01.esss.lu.se" -days 3650
    kubectl create secret -ndev tls scichatservice --key scichat.key --cert scichat.crt
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout synapse.key -out synapse.crt -subj "/CN=scicat01.esss.lu.se" -days 3650
    kubectl create secret -ndev tls synapseservice --key synapse.key --cert synapse.crt
    elif  [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout scichat.key -out scichat.crt  -subj "/CN=catanieservice.esss.dk" -days 3650
    kubectl create secret -ndev tls scichatservice --key scichat.key --cert scichat.crt
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout synapse.key -out synapse.crt  -subj "/CN=catanieservice.esss.dk" -days 3650
    kubectl create secret -ndev tls synapseservice --key synapse.key --cert synapse.crt
fi