#!/bin/bash

envsubst < /gitmanager/gitmanager/local_settings.py.template > /gitmanager/gitmanager/local_settings.py
envsubst < /kubernetes-build.py.template > /gitmanager/scripts/kubernetes-build.py

exec python3 manage.py run_huey
