FROM alpine:3.15.0

RUN apk add --no-cache curl bash

ENV REFRESH=1 \
    AUTH_EMAIL="admin@example.com" \
    AUTH_METHOD="global" \
    AUTH_KEY="1234567890asdfghjkl" \
    TTL="3600" \
    PROXY=true \
    ZONE_ID_1="1234567890asdfghjkl" \
    RECORD_NAME_1="example.com" \
    ZONE_ID_2="1234567890asdfghjkl" \
    RECORD_NAME_2="example.com" \
    ZONE_ID_3="1234567890asdfghjkl" \
    RECORD_NAME_3="example.com" \
    ZONE_ID_4="1234567890asdfghjkl" \
    RECORD_NAME_4="example.com" \
    ZONE_ID_5="1234567890asdfghjkl" \
    RECORD_NAME_5="example.com" \
    ZONE_ID_6="1234567890asdfghjkl" \
    RECORD_NAME_6="example.com" \
    ZONE_ID_7="1234567890asdfghjkl" \
    RECORD_NAME_7="example.com" \
    ZONE_ID_8="1234567890asdfghjkl" \
    RECORD_NAME_8="example.com" \
    ZONE_ID_9="1234567890asdfghjkl" \
    RECORD_NAME_9="example.com" \
    ZONE_ID_10="1234567890asdfghjkl" \
    RECORD_NAME_10="example.com"

COPY cloudflare /bin/cloudflare
COPY root /var/spool/cron/crontabs/root

RUN chmod +x /bin/cloudflare

CMD crond -l 2 -f
