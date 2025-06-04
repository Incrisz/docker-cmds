mkdir -p /data/mysql /data/vmail /data/log


# marooou/postfix-roundcube on docker hub
docker run -d \
  --name mailserver \
  -e "ADMIN_USERNAME=root" \
  -e "ADMIN_PASSWD=password12" \
  -e "DOMAIN_NAME=mail.bmp.com.ng" \
  -e "USERS=user1:pass1234,user2:pass5678" \
  -v /data/mysql:/var/lib/mysql \
  -v /data/vmail/:/var/vmail \
  -v /data/log:/var/log \
  -p 25:25 \
  -p 81:80 \
  -p 110:110 \
  -p 143:143 \
  -p 465:465 \
  -p 993:993 \
  -p 995:995 \
  marooou/postfix-roundcube



# PostfixAdmin - http://yourhost:81/postfixadmin⁠ - use login and password defined within docker start, with variables ADMIN_USERNAME and ADMIN_PASSWD.
# Roundcube - http://yourhost:81/roundcubemail⁠ - use accounts created with either with the admin panel or with USERS env variable - -


HOSTNAME=mail
DOMAINNAME=mail.bmp.com.ng
MYHOSTNAME=
USERS=noreply:password1,info:password2
DATABASE_USER_PASSWORD=password_mysql
ADMIN_USERNAME=postfix_admin
ADMIN_PASSWD=postfix_admin
ROUNDCUBE_PORT=8080
NETWORK=172.20.0.0/24
# RELAY=mx.yandex.ru
