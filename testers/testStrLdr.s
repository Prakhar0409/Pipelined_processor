mov r0,#9
mov r1,#1
str r0,[r1]
mov r3,#7
mov r3,#8
mov r3,#7
sub r5,r0,r1
ldr r2,[r1]
sub r4,r2,r3
rsb r5,r3,r2


;E3A00009,
;E3A01001,
;E5810000,
;E3A03007,
;E3A03008,
;E3A03007,
;E0405001,
;E5912000,
;E0424003,
;E0635002;