#!/bin/bash

envsubst < /mooc-grader/grader/local_settings.py.template > /mooc-grader/grader/local_settings.py
envsubst < /kubernetes-run.py.template > /kubernetes-run.py
chmod +x /kubernetes-run.py

exec /usr/bin/uwsgi-core --plugin=python3 --single-interpreter --master --master-fifo=/run/grader/uwsgi.master --stats=/run/grader/uwsgi.stats --socket=/run/grader/uwsgi.socket --chmod=666 --ini /uwsgi.ini
