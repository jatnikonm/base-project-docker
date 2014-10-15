#!/bin/bash
if [ $PAGESPEED ]; then
  if [ $BROWSERCACHE ]; then
    cp /etc/nginx/nginx-pagespeed-cache.conf /etc/nginx/nginx.conf
  else
    cp /etc/nginx/nginx-pagespeed.conf /etc/nginx/nginx.conf
  fi
else
  cp /etc/nginx/nginx-no-pagespeed.conf /etc/nginx/nginx.conf
fi
/usr/bin/sed -i "s/DOMAIN/${DOMAIN}/" /etc/nginx/nginx.conf
supervisord -c /etc/supervisor/supervisord.conf --nodaemon
