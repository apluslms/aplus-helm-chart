#!/bin/bash

envsubst < /mooc-grader/grader/local_settings.py.template > /mooc-grader/grader/local_settings.py

# These are not used on gitmanager but need to be pregenerated to avoid errors on cron.sh.
AJAX_KEY=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 16)
SECRET_KEY=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 16)
echo "AJAX_KEY = '$AJAX_KEY'" > /mooc-grader/grader/ajax_key.py
echo "SECRET_KEY = '$SECRET_KEY'" > /mooc-grader/grader/secret_key.py

/mooc-grader/gitmanager/cron.sh

exit 0
