#!/bin/sh

export USER=opengist
UID=${UID:-1000}
GID=${GID:-1000}
groupmod -o -g "$GID" $USER
usermod -o -u "$UID" $USER

chown -R "$USER:$USER" /opengist
chown -R "$USER:$USER" /config.yml

exec su $USER -c "OG_OIDC_CLIENT_KEY=0oa16fpecokgXm9fA0x8 OG_OPENGIST_HOME=/opengist /app/opengist/opengist --config /config.yml"
