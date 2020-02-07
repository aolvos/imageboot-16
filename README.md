# imageboot-16
ANY 320x200 16 color PNG image bootloader.

This project includes :
1) Bootloader source code written in assembly
2) Image decoding programs written in qb64 and c++

Compilation scripts are not included.

Converting PNG to BIN :
1) Put your PNG picture in the project directory
2) Run png2rgb (wait until program exits)
3) Run rgb2hex
4) Run hex2bin

splash.png - input file

splash.bin - output file

*Also check if qb64 outputs compiled executable in the project directory.*

aolvos, 2020
