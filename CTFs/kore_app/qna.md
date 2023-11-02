# Kore Logic Internship Questions

## Q1

What can you tell us about these

{SSHA}+gJp9MAJOMc4mkSBY+dHXJLoMCxOSUEyakhERg==

{SSHA}IPSeqtxuWFxgqXBlYZxlvlUgkIpBa0pHOENXUg==

### A1

These are LDAP SSHA hashes, I threw them in hashcat:

`.\hashcat.exe -a 0 -m 111 .\kore.hash .\10-million-password-list-top-100000.txt` cracked `{SSHA}IPSeqtxuWFxgqXBlYZxlvlUgkIpBa0pHOENXUg==:password3`

## Q2

What is wrong with this picture?

Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyIjoibWFsbG9yeSIsImFkbWluIjpmYWxzZX0

### A2

Although I'm not familiar with this format, it looks like a JWT bearer token used for authentication. It looks like this is missing some information needed in order to decode it, JWT Bearer tokens are supposed to follow header.payload.signature > base64, but this token decodes to `{"typ":"JWT","alg":"none"}`.
