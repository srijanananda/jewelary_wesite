#!/usr/bin/env bash
set -o errexit  # Exit on error

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --no-input

# Create default superuser if it doesn't exist
echo "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('srija', 'srijan1ga21is164@gmail.com', '7795260651jas')
" | python manage.py shell
