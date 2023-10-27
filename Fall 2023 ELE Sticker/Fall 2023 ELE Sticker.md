![[Pasted image 20231024134509.png]]
# The Sticker
* `VGhLIGV2aWwgbGVhZ3VLIG9mIGV2alwgaXMgd2F0Y2hpbmcgc28gYmV3YXJL` > `ThK evil leaguK of evj\ is watching so bewarK` > `The evil league of evil is watching so beware`
* first barcode decodes to `https://bit.ly/psu-cyber-2023`
* second barcode decodes to `Not this one`

# Hydra

## \[REDACTED\]

Presented with Nocturne In E wav file and head.png file

### Head.png
had some useful exif data:
* One Prime Two Prime Red Prime Bluen Prime
* 164411914961876576562234613990689169226732454024910165897303176956151983717786529044753682202828176430128652567934529821288565228850402069

## Carrot

### Part 1
morse > base64 > `v3ry_s1mpl3_b45e_583291`
Reverse eng python encryption
```python
import random

f = open('pass.txt', 'r')
password = f.readline().rstrip()
f.close()

random.seed(9321)

encrypted = ''
for i in range(len(password)):
    rand_int = random.randint(0,255) ^ ord(password[i])
    rand_char = '{:02x}'.format(rand_int)
    encrypted += rand_char

f = open('encrypted.txt', 'w')
f.write(encrypted)
f.close()
```
Solution:
```python
import random

# Set the seed to the same value used during encryption
random.seed(9321)

# Read the encrypted data from 'encrypted.txt'
with open('encrypted.txt', 'r') as f:
    encrypted_data = f.read()

# Initialize an empty string to store the decrypted password
decrypted_password = ''

# Iterate through the encrypted data in pairs (two characters at a time)
for i in range(0, len(encrypted_data), 2):
    # Extract a pair of hexadecimal digits
    hex_pair = encrypted_data[i:i+2]
    
    # Convert the hexadecimal string back to an integer
    rand_int = int(hex_pair, 16)
    
    # XOR the integer with the same random number to get the original ASCII code
    original_ascii = rand_int ^ random.randint(0, 255)
    
    # Convert the ASCII code to a character and append it to the decrypted password
    decrypted_password += chr(original_ascii)

# Print the decrypted password
print("Decrypted Password:", decrypted_password)
```
Decrypted Password: badRandomSeed_9523271

### Part 2

