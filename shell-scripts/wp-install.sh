#!/bin/bash

if [ -z "$(ls -A ${SERVER_WEBROOT}/wp-content)" ]; then 
    wget -qO- 'https://wordpress.org/latest.tar.gz' | tar xz -C /tmp
    mv /tmp/wordpress/* ${SERVER_WEBROOT}
else
    wget -qO- 'https://wordpress.org/latest.tar.gz' | tar xz -C /tmp 
    rm -rf /tmp/wordpress/wp-content 
    mv /tmp/wordpress/* ${SERVER_WEBROOT}
fi
chown -R litespeed:litespeed ${SERVER_WEBROOT}
