# Install openssl
    - Install the system-specific openssl from link bellow:
        https://slproweb.com/products/Win32OpenSSL.html

    - Set environment varible
        OPENSSL_CONF={LOCATION_OF_SSL_INSTALL}\bin\openssl.cfg
        
    - Update the path
        Path=...,{LOCATION_OF_SSL_INSTALL}\bin

# Create cert

    openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=192.168.99.100" -addext "subjectAltName=DNS:192.168.99.100" -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt

Where:

    req — to specify we want to use -x509

    -x509 — to specify we want to create a self-signed certificate instead of generating a certificate signing request.

    -nodes — makes it so that we skip the option to secure our certificate with a passphrase, so that nginx can read it.

    -days 365 — specifies how long the certificate would be valid for, which is 365 days.

    -subj “/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" — this allows us to specify subject without filling in prompts. /C for country, /ST for state, /O for organization, and /CN for common name.

    -addext “subjectAltName=DNS:mydomain.com" — which adds additional attributes to our certificate which is needed to make it a valid certificate seen by both our browser and local machine.

    -newrsa rsa:2048 — specifies that we want to generate both a new certificate and a new key with an RSA key of 2048 bits.

    -keyout /etc/.../yourfile.key — specifies the location of the output .key file.

    -out /etc/.../yourfile.crt — specifies the location of the output .crt file.