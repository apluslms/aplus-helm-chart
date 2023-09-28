#!/bin/bash

cd /tmp

if ! kubectl get secret aplus-pem; then
  openssl genrsa -out aplus-private.pem 2048
  openssl rsa -in aplus-private.pem -out aplus-public.pem -pubout
  kubectl create secret generic --from-file aplus-private.pem --from-file aplus-public.pem aplus-pem
fi

if ! kubectl get secret grader-pem; then
  openssl genrsa -out grader-private.pem 2048
  openssl rsa -in grader-private.pem -out grader-public.pem -pubout
  kubectl create secret generic --from-file grader-private.pem --from-file grader-public.pem grader-pem
fi

if ! kubectl get secret gitmanager-pem; then
  openssl genrsa -out gitmanager-private.pem 2048
  openssl rsa -in gitmanager-private.pem -out gitmanager-public.pem -pubout
  kubectl create secret generic --from-file gitmanager-private.pem --from-file gitmanager-public.pem gitmanager-pem
fi

