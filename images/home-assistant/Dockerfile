ARG VERSION
FROM docker.io/homeassistant/home-assistant:$VERSION

RUN <<EOF
apk add --no-cache openldap-clients
curl -o /usr/local/bin/ldap-auth.sh https://raw.githubusercontent.com/bob1de/ldap-auth-sh/master/ldap-auth.sh
chmod +x /usr/local/bin/ldap-auth.sh
EOF
