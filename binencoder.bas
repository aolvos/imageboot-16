_TITLE "bin encoder by aolvos"
SCREEN _NEWIMAGE(320, 200, 32)
DIM ctable(768)
DIM datarray(320, 200)
rest:
LINE INPUT ; "Enter Source Filename: ", f$
PRINT " "
IF _FILEEXISTS(f$) THEN _PUTIMAGE (0, 0), _LOADIMAGE(f$) ELSE PRINT "File not found!": GOTO rest

x = 0
y = 0
n = 0
s = 0
asw = 0
DO
    pointcolor& = POINT(x, y)
    r = _RED32(pointcolor&)
    g = _GREEN32(pointcolor&)
    b = _BLUE32(pointcolor&)
    IF (s = 0) THEN
        s = 1
        ctable(asw) = r
        ctable(asw + 1) = g
        ctable(asw + 2) = b
    END IF
    ctablemaker:
    FOR i = 0 TO 765 STEP 3
        IF ctable(i) = r AND ctable(i + 1) = g AND ctable(i + 2) = b THEN
            asw = i
            GOTO outp
        END IF
    NEXT i
    n = n + 3
    ctable(n) = r
    ctable(n + 1) = g
    ctable(n + 2) = b
    GOTO ctablemaker
    outp:
    datarray(x, y) = asw / 3

    x = x + 1
    IF x = 320 THEN
        x = 0
        y = y + 1
    END IF
LOOP UNTIL y = 200

OPEN "out.bin" FOR OUTPUT AS #1

FOR i = 0 TO 765 STEP 3
    PRINT #1, CHR$(ctable(i) / 4);
    PRINT #1, CHR$(ctable(i + 1) / 4);
    PRINT #1, CHR$(ctable(i + 2) / 4);
NEXT i

x = 0
y = 0
n = 1
DO
    a% = datarray(x, y)
    x = x + 1
    IF x = 320 THEN
        x = 0
        y = y + 1
    END IF
    b% = datarray(x, y)
    PRINT #1, CHR$(a%);
    PRINT #1, CHR$(b%);
    x = x + 1
    IF x = 320 THEN
        x = 0
        y = y + 1
    END IF
LOOP UNTIL y = 200
ext:
CLOSE #1

SYSTEM
