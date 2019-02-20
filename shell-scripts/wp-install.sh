#!/bin/bash

if [ ! -d "${SERVER_WEBROOT}/wp-content" ]; then
    echo "Directory ${SERVER_WEBROOT}/wp-content not exist, please check nfs mount."
    exit 1
fi

if [ -z "$(ls -A ${SERVER_WEBROOT}/wp-content)" ]; then 
    wget -qO- 'https://wordpress.org/latest.tar.gz' | tar xz -C /tmp
    chown -R litespeed:litespeed /tmp/wordpress
    mv /tmp/wordpress/wp-content /tmp/
    mv /tmp/wordpress/* ${SERVER_WEBROOT}
    mv /tmp/wp-content/* ${SERVER_WEBROOT}/wp-content/
else
    wget -qO- 'https://wordpress.org/latest.tar.gz' | tar xz -C /tmp 
    rm -rf /tmp/wordpress/wp-content 
    chown -R litespeed:litespeed /tmp/wordpress
    mv /tmp/wordpress/* ${SERVER_WEBROOT}
fi
