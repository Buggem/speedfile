# speedfile
Stupidly Simple File Transfer written in bash. Powered by OpenSSL, XZ and Netcat.


### Using it

To start with you are going to have two machines... they can be the same one if you just want to test it but it really doesnt matter lol

- Machine A: the sender
- Machine B: the reciever

Firstly, on Machine B run `recieve.sh` with the arguments of the **output filename** and a **password** of your choice like so.

```./recieve.sh [output filename] [encryption password]```

It should output "Waiting for checksum sender..." and hang there.

Secondly, on Machine A run `send.sh` with the argument of the **input filename** and Machine B's **IP address** like so. And of course, **the password**... which must be equal to the one used on machine B or you will get a `bad decrypt` error followed by a bunch of yap from `xz` and `rm`.
```./send.sh [input filename] [IP address] [encryption password]```

Check Machine B for your file.

If it says "SHA MISMATCH!" on Machine B that means something has interrupted/intercepted your connection, corrupting your file. Just try again lol
