docker run -d --restart unless-stopped \
    -e SAMBA_DC_REALM='corp.example.net' \
    -e SAMBA_DC_DOMAIN='EXAMPLE' \
    -e SAMBA_DC_ADMIN_PASSWD='P@ssw0rd!' \
    -e SAMBA_DC_DNS_BACKEND='SAMBA_INTERNAL' \
    -v ${PWD}/data:/samba \
     'samba-dc:latest'
