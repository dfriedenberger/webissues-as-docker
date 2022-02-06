#!/bin/bash

ln -s /var/lib/webissues/data /var/www/html/
mkdir -p /var/www/html/data/sites/default
chown -R www-data /var/www/html/data
chgrp -R www-data /var/www/html/data
chown -R www-data /var/lib/webissues/data
chgrp -R www-data /var/lib/webissues/data
exec "$@"