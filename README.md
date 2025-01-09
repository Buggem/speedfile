# speedfile
Stupidly Simple File Transfer written in bash. Powered by OpenSSL, XZ and Netcat.


### Using it

To start with you are going to have two machines... they can be the same one if you just want to test it but it really doesnt matter lol    

- Machine A: the sender
- Machine B: the reciever

Firstly, on Machine B run `recieve.sh` with the argument of the **output filename** like so.

```./recieve.sh [output filename]```

It should output "Waiting for checksum sender..." and hang there.

Secondly, on Machine A run `send.sh` with the argument of the **input filename** and the **IP address** like so.

```./send.sh [input filename] [IP address]```

Check Machine B for your file.

If it says "SHA MISMATCH!" on Machine B that means something has interrupted/intercepted your connection, corrupting your file. Just try again lol
