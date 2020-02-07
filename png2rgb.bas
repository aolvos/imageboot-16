_TITLE "png2rgb by aolvos"
SCREEN _NEWIMAGE(320, 200, 32)
_PUTIMAGE (0, 0), _LOADIMAGE("splash.png")
_DISPLAY
OPEN "data.rgb" FOR OUTPUT AS #1
x = 0
y = 0
DO
    pointcolor& = POINT(x, y)
    r = _RED32(pointcolor&)
    g = _GREEN32(pointcolor&)
    b = _BLUE32(pointcolor&)
    PRINT #1, r
    PRINT #1, g
    PRINT #1, b
    x = x + 1
    IF x = 320 THEN
        x = 0
        y = y + 1
    END IF
LOOP UNTIL y = 200
CLOSE #1
SYSTEM
