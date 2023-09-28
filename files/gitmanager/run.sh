#!/bin/bash

envsubst < /gitmanager/gitmanager/local_settings.py.template > /gitmanager/gitmanager/local_settings.py
envsubst < /kubernetes-build.py.template > /gitmanager/scripts/kubernetes-build.py

exec /usr/bin/uwsgi-core --plugin=python3 --single-interpreter --master --master-fifo=/run/gitmanager/uwsgi.master --stats=/run/gitmanager/uwsgi.stats --socket=/run/gitmanager/uwsgi.socket --chmod=666 --ini /uwsgi.ini
