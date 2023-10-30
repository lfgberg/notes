![[Pasted image 20231024134509.png]]
<<<<<<< HEAD
# Base64 Starting String
`VGhLIGV2aWwgbGVhZ3VLIG9mIGV2alwgaXMgd2F0Y2hpbmcgc28gYmV3YXJL` > `ThK evil leaguK of evj\ is watching so bewarK` > `The evil league of evil is watching so beware`

# Barcode

decodes to https://bit.ly/psu-cyber-2023
=======
# The Sticker
* `VGhLIGV2aWwgbGVhZ3VLIG9mIGV2alwgaXMgd2F0Y2hpbmcgc28gYmV3YXJL` > `ThK evil leaguK of evj\ is watching so bewarK` > `The evil league of evil is watching so beware`
* first barcode decodes to `https://bit.ly/psu-cyber-2023`
* second barcode decodes to `Not this one`

>>>>>>> 337d18dc09d90d475f333c7e5f2b7ccb3d69bef4
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
exe file decoded with ghidra
```C
FUN_140001591(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4) { int iVar1; undefined1 (*pauVar2) [10]; char local_48 [28]; uint local_2c; uint local_28; uint local_24; FILE *local_20; undefined4 local_14; FILE *local_10; FUN_140001780(); pauVar2 = (undefined1 (*) [10])&DAT_140009000; local_10 = fopen("pass.txt","r"); if (local_10 == (FILE *)0x0) { FUN_140001540((byte *)"Error: File does not exist.",pauVar2,param_3,param_4); /* WARNING: Subroutine does not return */ exit(1); } fgets(local_48,0x10,local_10); fclose(local_10); local_14 = 0xeed; srand(0xeed); local_20 = fopen("encrypted.txt","w"); iVar1 = rand(); local_24 = iVar1 % 0xff + 1; local_10 = fopen("pass.txt","r"); while( true ) { local_28 = fgetc(local_10); if (local_28 == 0xffffffff) break; local_2c = local_28 ^ local_24; fputc(local_2c,local_20); } fclose(local_10); fclose(local_20); return 0; }
```

```
1. `FUN_140001591` is a function that takes four parameters: `param_1`, `param_2`, `param_3`, and `param_4`.
    
2. It calls another function `FUN_140001780` at the beginning.
    
3. It declares some local variables:
    
    - `iVar1` is an integer.
    - `pauVar2` is a pointer to an array of 10 `undefined1` elements.
    - `local_48` is a character array of size 28.
    - `local_2c`, `local_28`, and `local_24` are unsigned integers.
    - `local_20` and `local_10` are pointers to `FILE` objects.
    - `local_14` is an unsigned integer.
4. It attempts to open a file named "pass.txt" in read mode using `fopen`. If the file does not exist (i.e., `local_10` is null), it calls another function `FUN_140001540` to display an error message and then exits the program with an error code of 1.
    
5. It reads the first 16 characters from the "pass.txt" file into the `local_48` character array using `fgets`.
    
6. It closes the "pass.txt" file.
    
7. It sets `local_14` to 0xeed and seeds the random number generator using `srand`.
    
8. It attempts to open a file named "encrypted.txt" in write mode using `fopen`.
    
9. It generates a random number and stores it in `iVar1`. Then, it calculates `local_24` as the result of taking the modulo of `iVar1` with 0xff and adding 1.
    
10. It reopens the "pass.txt" file in read mode.
    
11. It enters a loop where it reads one character at a time from the "pass.txt" file, XORs it with `local_24`, and writes the result to the "encrypted.txt" file using `fgetc` and `fputc`.
    
12. It repeats this process until the end of the "pass.txt" file is reached.
    
13. It closes both the "pass.txt" and "encrypted.txt" files.
    
14. Finally, it returns 0.
    

This script seems to be reading data from "pass.txt," performing some encryption using a random key (`local_24`), and writing the encrypted data to "encrypted.txt." It also handles errors if "pass.txt" does not exist. The specific details of the encryption and usage of these functions may require additional context or information about related code to fully understand its purpose.
```
Solution.py:
```python
import binascii

# Define the key within the range [0, 255]
key = 22

# Open the encrypted file for reading
with open("encrypted.txt", "rb") as encrypted_file:
    # Read the content of the encrypted file
    encrypted_data = encrypted_file.read()

# XOR each byte with the key to decrypt the data
decrypted_data = bytes([byte ^ key for byte in encrypted_data])

# Convert the bytes to a hexadecimal string
hex_string = binascii.hexlify(decrypted_data).decode('utf-8')

# Convert the hexadecimal string back to bytes
decrypted_bytes = bytes.fromhex(hex_string)

# Decode the bytes using UTF-8 encoding to get the cleartext
plaintext = decrypted_bytes.decode('utf-8')

print("Decrypted plaintext:", plaintext)

```
password: `mu1ti1ingua1_c0d3r5_09372`

### Part 3


