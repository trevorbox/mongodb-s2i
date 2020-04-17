# mongodb-s2i



```
[tbox@localhost ssl]$ ./gen-self-signed-certificate.sh

Create root CA key...

Generating RSA private key, 2048 bit long modulus (2 primes)
..............................+++++
...............................+++++
e is 65537 (0x010001)
Enter pass phrase for out/rootCA.key:
Verifying - Enter pass phrase for out/rootCA.key:

Create root SSL certificate...

Enter pass phrase for out/rootCA.key:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:US
State or Province Name (full name) []:Foo
Locality Name (eg, city) [Default City]:Foo
Organization Name (eg, company) [Default Company Ltd]:Foo
Organizational Unit Name (eg, section) []:Foo
Common Name (eg, your name or your server's hostname) []:mongodb.mongo-test.svc
Email Address []:email@example.com

Create server certificate key and csr...

Generating a RSA private key
.+++++
.....+++++
writing new private key to 'out/server.key'
-----

Create server certificate...

Signature ok
subject=C = US, ST = RandomState, L = RandomCity, O = RandomOrganization, OU = RandomOrganizationUnit, emailAddress = hello@example.com, CN = mongodb.mongo-test.svc
Getting CA Private Key
Enter pass phrase for out/rootCA.key:

Put them in the right place...


Done!


```
