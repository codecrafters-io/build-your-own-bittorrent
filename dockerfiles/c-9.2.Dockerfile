FROM n0madic/alpine-gcc:9.2.0

# For making HTTP requests
RUN apk add --no-cache --upgrade 'curl>=7.66'
RUN apk add --no-cache --upgrade 'curl-dev>=7.66'

# For computing SHA1
RUN apk add --no-cache --upgrade 'openssl>=1.1.1'
RUN apk add --no-cache --upgrade 'openssl-dev>=1.1.1'

