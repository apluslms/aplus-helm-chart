#!/bin/bash

envsubst < /a-plus/aplus/local_settings.py.template > /a-plus/aplus/local_settings.py
python3 /fix_local_settings.py

python3 manage.py collectstatic --no-input
exec /usr/bin/uwsgi-core --plugin=python3 --single-interpreter --master --master-fifo=/run/aplus/web-uwsgi.master --stats=/run/aplus/web-uwsgi.stats --socket=/run/aplus/web-uwsgi.socket --chmod=666 --ini /uwsgi-aplus-web.ini
