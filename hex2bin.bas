SCREEN 0
_TITLE "hex2bin by aolvos"
OPEN "splash.hex" FOR INPUT AS #1
OPEN "splash.bin" FOR OUTPUT AS #2
PRINT "Processing..."
DO UNTIL EOF(1)
    INPUT #1, n$
    d% = VAL("&H" + n$)
    PRINT #2, CHR$(d%);
LOOP
CLOSE #1
CLOSE #2
SYSTEM
