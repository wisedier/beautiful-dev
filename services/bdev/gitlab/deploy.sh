#!/bin/bash
BASEDIR=$(dirname $(realpath "$0"))

cat << EOF > secrets.yml
production:
    secret_key_base: $(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 128)
    otp_key_base: $(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 128)
    db_key_base: $(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 128)
    openid_connect_signinig_key: |
$(openssl genrsa 2048 | awk '{print "    " $0}')
EOF

kubectl create secret generic gitlab-rails-secret \
    --from-file=$(BASEDIR)/secrets.yml -o yaml --dry-run \
    | kubectl apply -f -

helm delete --purge gitlab
helm install --name gitlab --namespace bdev -f $(BASEDIR)/values.yaml $(BASEDIR)/helm
