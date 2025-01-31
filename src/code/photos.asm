;
; Photo pictures code
;

PhotosEntryPoint::
    ld   a, [wGameplayType]                     ; $4000: $FA $95 $DB
    sub  $0E                                    ; $4003: $D6 $0E
    JP_TABLE                                    ; $4005: $C7
._0E dw LinkPictureHandler
._0F dw LinkPictureHandler
._10 dw MarineCliffPictureHandler
._11 dw $0000 ; Marin Well picture handler (disabled)
._12 dw MabePictureHandler
._13 dw UlriraPictureHandler
._14 dw BowWowPictureHandler
._15 dw $0000 ; Thief picture handler (disabled)
._16 dw FishermanPictureHandler
._17 dw ZoraPictureHandler
._18 dw KanaletPictureHandler
._19 dw GhostPictureHandler
._1A dw BridgePictureHandler

; Handler for Link's Picture
; (both nice and dizzy)
LinkPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $4020: $FA $96 $DB
    JP_TABLE                                    ; $4023: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_462F
    dw JumpTable_037_5393

MarineCliffPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $4032: $FA $96 $DB
    JP_TABLE                                    ; $4035: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4659
    dw JumpTable_037_5393

MabePictureHandler::
    ld   a, [wGameplaySubtype]                  ; $4046: $FA $96 $DB
    JP_TABLE                                    ; $4049: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4781
    dw JumpTable_037_5393

UlriraPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $405A: $FA $96 $DB
    JP_TABLE                                    ; $405D: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4AE8
    dw JumpTable_037_5393

BowWowPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $406E: $FA $96 $DB
    JP_TABLE                                    ; $4071: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4B05
    dw JumpTable_037_5393

FishermanPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $4080: $FA $96 $DB
    JP_TABLE                                    ; $4083: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4F5B
    dw JumpTable_037_5393

ZoraPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $4094: $FA $96 $DB
    JP_TABLE                                    ; $4097: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4F9B
    dw JumpTable_037_5393

KanaletPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $40A6: $FA $96 $DB
    JP_TABLE                                    ; $40A9: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4FB7
    dw JumpTable_037_5393

GhostPictureHandler::
    ld   a, [wGameplaySubtype]                  ; $40BA: $FA $96 $DB
    JP_TABLE                                    ; $40BD: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_51F4
    dw JumpTable_037_5393

BridgePictureHandler::
    ld   a, [wGameplaySubtype]                  ; $40CE: $FA $96 $DB
    JP_TABLE                                    ; $40D1: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw Func_03D_4029_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_535E
    dw JumpTable_037_5393

    db   $A2, $22, $FF, $46, $3F, $14, $FF, $46 ; $40E0 |.".F?..F|
    db   $03, $7E, $FF, $46                     ; $40E8 |.~.F|

JumpTable_037_40EC::
    ldh  a, [hFrameCounter]                     ; $40EC: $F0 $E7
    and  %00000001                              ; $40EE: $E6 $01
    jr   nz, .else_4108_37                      ; $40F0: $20 $16

    ld   hl, hWindowYUnused                     ; $40F2: $21 $A9 $FF
    dec  [hl]                                   ; $40F5: $35
    ld   a, [hl]                                ; $40F6: $7E
    bit  7, a                                   ; $40F7: $CB $7F
    jr   z, .else_40FC_37                       ; $40F9: $28 $01

    xor  a                                      ; $40FB: $AF
.else_40FC_37:
    ld   [hl], a                                ; $40FC: $77
    ldh  a, [hWindowXUnused]                    ; $40FD: $F0 $AA
    sub  $10                                    ; $40FF: $D6 $10
    bit  7, a                                   ; $4101: $CB $7F
    jr   z, .else_4106_37                       ; $4103: $28 $01

    xor  a                                      ; $4105: $AF
.else_4106_37:
    ldh  [hWindowXUnused], a                    ; $4106: $E0 $AA
.else_4108_37:
    call label_1A22                             ; $4108: $CD $22 $1A
    ld   a, [$C16B]                             ; $410B: $FA $6B $C1
    cp   $04                                    ; $410E: $FE $04
    ret  nz                                     ; $4110: $C0

    ld   a, $90                                 ; $4111: $3E $90
    ld   [$DB9A], a                             ; $4113: $EA $9A $DB
    ld   a, [$FFFE]                             ; $4116: $F0 $FE
    and  a                                      ; $4118: $A7
    jr   z, .else_4174_37                       ; $4119: $28 $59

    ld   hl, Data_037_570D                      ; $411B: $21 $0D $57
    ld   a, [wGameplayType]                     ; $411E: $FA $95 $DB
    sub  $0E                                    ; $4121: $D6 $0E
    sla  a                                      ; $4123: $CB $27
    ld   e, a                                   ; $4125: $5F
    ld   d, $00                                 ; $4126: $16 $00
    add  hl, de                                 ; $4128: $19
    ldi  a, [hl]                                ; $4129: $2A
    ld   h, [hl]                                ; $412A: $66
    ld   l, a                                   ; $412B: $6F
    ld   de, $DC10                              ; $412C: $11 $10 $DC
    ld   bc, $0080                              ; $412F: $01 $80 $00
    ld   a, $02                                 ; $4132: $3E $02
    ld   [rSVBK], a                             ; $4134: $E0 $70
    call CopyData                               ; $4136: $CD $14 $29
    xor  a                                      ; $4139: $AF
    ld   [rSVBK], a                             ; $413A: $E0 $70

    ld   a, [$DC0F]                             ; $413C: $FA $0F $DC
    sla  a                                      ; $413F: $CB $27
    sla  a                                      ; $4141: $CB $27
    ld   e, a                                   ; $4143: $5F
    ld   d, $00                                 ; $4144: $16 $00
    ld   hl, $40E0                              ; $4146: $21 $E0 $40
    add  hl, de                                 ; $4149: $19
    push hl                                     ; $414A: $E5
    ld   de, $DC54                              ; $414B: $11 $54 $DC
    ld   a, $02                                 ; $414E: $3E $02
    ld   [rSVBK], a                             ; $4150: $E0 $70
.loop_4152_37:
    ldi  a, [hl]                                ; $4152: $2A
    ld   [de], a                                ; $4153: $12
    inc  de                                     ; $4154: $13
    ld   a, e                                   ; $4155: $7B
    and  %00000111                              ; $4156: $E6 $07
    jr   nz, .loop_4152_37                      ; $4158: $20 $F8

    xor  a                                      ; $415A: $AF
    ld   [rSVBK], a                             ; $415B: $E0 $70
    pop  hl                                     ; $415D: $E1
    ld   a, [wGameplayType]                     ; $415E: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_MARIN_CLIFF             ; $4161: $FE $10
    jr   nz, .else_4174_37                      ; $4163: $20 $0F

    ld   de, $DC34                              ; $4165: $11 $34 $DC
    ld   a, $02                                 ; $4168: $3E $02
    ld   [rSVBK], a                             ; $416A: $E0 $70
    ldi  a, [hl]                                ; $416C: $2A
    ld   [de], a                                ; $416D: $12
    inc  de                                     ; $416E: $13
    ld   a, [hl]                                ; $416F: $7E
    ld   [de], a                                ; $4170: $12
    xor  a                                      ; $4171: $AF
    ld   [rSVBK], a                             ; $4172: $E0 $70
.else_4174_37:
    xor  a                                      ; $4174: $AF
    ldh  [hBaseScrollX], a                      ; $4175: $E0 $96
    ldh  [hBaseScrollY], a                      ; $4177: $E0 $97
    ld   [wRoomTransitionState], a              ; $4179: $EA $24 $C1
    jp   Func_037_53FE                          ; $417C: $C3 $FE $53

JumpTable_037_417F::
    call label_27F2                             ; $417F: $CD $F2 $27
    jp   Func_037_53FE                          ; $4182: $C3 $FE $53

JumpTable_037_4185::
    call ClearLowerWRAM                         ; $4185: $CD $C6 $29
    jp   Func_037_53FE                          ; $4188: $C3 $FE $53

Func_037_418B::
    ld   h, $37                                 ; $418B: $26 $37
    ld   de, $0008                              ; $418D: $11 $08 $00
.Func_037_4190::
    push af                                     ; $4190: $F5
.loop_4191_37:
    pop  af                                     ; $4191: $F1
    push af                                     ; $4192: $F5
    push bc                                     ; $4193: $C5
    push de                                     ; $4194: $D5
    push hl                                     ; $4195: $E5
    call Copy100BytesFromBankAtA                ; $4196: $CD $13 $0A
    pop  hl                                     ; $4199: $E1
    pop  de                                     ; $419A: $D1
    pop  bc                                     ; $419B: $C1
    pop  af                                     ; $419C: $F1
    push af                                     ; $419D: $F5
    inc  b                                      ; $419E: $04
    inc  c                                      ; $419F: $0C
    dec  de                                     ; $41A0: $1B
    ld   a, e                                   ; $41A1: $7B
    and  a                                      ; $41A2: $A7
    jr   nz, .loop_4191_37                      ; $41A3: $20 $EC

    pop  af                                     ; $41A5: $F1
    ret                                         ; $41A6: $C9


    db   $00, $00, $00, $00, $60, $3B, $00, $00 ; $41A7 |....`       ;..|
    db   $40, $39, $00, $00, $70, $39, $00, $00 ; $41AF |@9..p9..|
    db   $00, $00, $40, $2B, $60, $39, $68, $3A ; $41B7 |..@+`9h:|
    db   $00, $00, $70, $3B, $40, $29, $68, $3B ; $41BF |..p         ;@)h ;|
    db   $00, $00, $48, $39, $40, $2A, $78, $39 ; $41C7 |..H9@*x9|
    db   $00, $00, $70, $2A, $40, $2B, $68, $39 ; $41CF |..p*@+h9|
    db   $60, $3A, $70, $2B, $00, $00, $00, $00 ; $41D7 |`:p+....|
    db   $50, $3A, $00, $00, $40, $3A, $00, $00 ; $41DF |P:..@:..|
    db   $70, $3A, $00, $00, $00, $00, $40, $2B ; $41E7 |p:....@+|
    db   $50, $3B, $48, $3B, $00, $00, $70, $3B ; $41EF |P           ;H   ;..p ;|
    db   $40, $29, $58, $3A, $00, $00, $48, $3A ; $41F7 |@)X:..H:|
    db   $40, $2A, $78, $3A, $00, $00, $70, $2A ; $41FF |@*x:..p*|
    db   $40, $2B, $58, $3B, $40, $3B, $70, $2B ; $4207 |@+X         ;@   ;p+|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $420F |........|
    db   $00, $00, $01, $01, $00, $00, $00, $00 ; $4217 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $08 ; $421F |........|
    db   $00, $00                               ; $4227 |..|

JumpTable_037_4229::
    call LCDOff                                 ; $4229: $CD $CF $28
    ld   c, $00                                 ; $422C: $0E $00
    ld   a, [wGameplayType]                     ; $422E: $FA $95 $DB
    sub  $0E                                    ; $4231: $D6 $0E
    sla  a                                      ; $4233: $CB $27
    ld   e, a                                   ; $4235: $5F
    ld   d, $00                                 ; $4236: $16 $00
    push de                                     ; $4238: $D5
    push de                                     ; $4239: $D5
    ld   hl, $41A7                              ; $423A: $21 $A7 $41
    ld   a, [$FFFE]                             ; $423D: $F0 $FE
    and  a                                      ; $423F: $A7
    jr   z, .else_4245_37                       ; $4240: $28 $03

    ld   hl, $41DB                              ; $4242: $21 $DB $41
.else_4245_37:
    add  hl, de                                 ; $4245: $19
    ld   b, [hl]                                ; $4246: $46
    inc  hl                                     ; $4247: $23
    ld   a, [hl]                                ; $4248: $7E
    and  a                                      ; $4249: $A7
    jr   z, .else_424F_37                       ; $424A: $28 $03

    call Func_037_418B                          ; $424C: $CD $8B $41
.else_424F_37:
    pop  de                                     ; $424F: $D1
    ld   c, $10                                 ; $4250: $0E $10
    ld   hl, $41C1                              ; $4252: $21 $C1 $41
    ld   a, [$FFFE]                             ; $4255: $F0 $FE
    and  a                                      ; $4257: $A7
    jr   z, .else_425D_37                       ; $4258: $28 $03

    ld   hl, $41F5                              ; $425A: $21 $F5 $41
.else_425D_37:
    add  hl, de                                 ; $425D: $19
    ld   b, [hl]                                ; $425E: $46
    inc  hl                                     ; $425F: $23
    ld   a, [hl]                                ; $4260: $7E
    and  a                                      ; $4261: $A7
    jr   z, .else_4267_37                       ; $4262: $28 $03

    call Func_037_418B                          ; $4264: $CD $8B $41
.else_4267_37:
    pop  de                                     ; $4267: $D1
    ld   a, [wGameplayType]                     ; $4268: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_GHOST                   ; $426B: $FE $19
    jr   nz, .else_4288_37                      ; $426D: $20 $19

    ld   a, [$FFFE]                             ; $426F: $F0 $FE
    and  a                                      ; $4271: $A7
    jr   nz, .else_427A_37                      ; $4272: $20 $06

    ld   a, $3A                                 ; $4274: $3E $3A
    ld   b, $68                                 ; $4276: $06 $68
    jr   .Func_037_427E                         ; $4278: $18 $04

.else_427A_37:
    ld   a, $3B                                 ; $427A: $3E $3B
    ld   b, $48                                 ; $427C: $06 $48
.Func_037_427E::
    ld   c, $08                                 ; $427E: $0E $08
    ld   h, $37                                 ; $4280: $26 $37
    ld   de, $0004                              ; $4282: $11 $04 $00
    call Func_037_418B.Func_037_4190            ; $4285: $CD $90 $41
.else_4288_37:
    ld   a, [wGameplayType]                     ; $4288: $FA $95 $DB
    sub  $0E                                    ; $428B: $D6 $0E
    ld   e, a                                   ; $428D: $5F
    ld   d, $00                                 ; $428E: $16 $00
    ld   hl, $420F                              ; $4290: $21 $0F $42
    add  hl, de                                 ; $4293: $19
    ld   a, [hl]                                ; $4294: $7E
    and  a                                      ; $4295: $A7
    jr   z, .else_42AB_37                       ; $4296: $28 $13

    ld   hl, $421C                              ; $4298: $21 $1C $42
    add  hl, de                                 ; $429B: $19
    ld   c, [hl]                                ; $429C: $4E
    ld   h, $37                                 ; $429D: $26 $37
    ld   a, $38                                 ; $429F: $3E $38
    ld   b, $40                                 ; $42A1: $06 $40
    ld   de, $0002                              ; $42A3: $11 $02 $00
    call Func_037_418B.Func_037_4190            ; $42A6: $CD $90 $41
    jr   .else_42F4_37                          ; $42A9: $18 $49

.else_42AB_37:
    ld   c, $08                                 ; $42AB: $0E $08
    ld   de, $0008                              ; $42AD: $11 $08 $00
    ld   a, [wGameplayType]                     ; $42B0: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ZORA                    ; $42B3: $FE $17
    jr   nz, .else_42BD_37                      ; $42B5: $20 $06

    ld   a, $2B                                 ; $42B7: $3E $2B
    ld   b, $48                                 ; $42B9: $06 $48
    jr   .Func_037_42ED                         ; $42BB: $18 $30

.else_42BD_37:
    cp   $16                                    ; $42BD: $FE $16
    jr   nz, .else_42C7_37                      ; $42BF: $20 $06

    ld   a, $2A                                 ; $42C1: $3E $2A
    ld   b, $78                                 ; $42C3: $06 $78
    jr   .Func_037_42ED                         ; $42C5: $18 $26

.else_42C7_37:
    cp   $13                                    ; $42C7: $FE $13
    jr   nz, .else_42D1_37                      ; $42C9: $20 $06

    ld   a, $2A                                 ; $42CB: $3E $2A
    ld   b, $48                                 ; $42CD: $06 $48
    jr   .Func_037_42ED                         ; $42CF: $18 $1C

.else_42D1_37:
    cp   $1A                                    ; $42D1: $FE $1A
    jr   nz, .else_42DB_37                      ; $42D3: $20 $06

    ld   a, $2B                                 ; $42D5: $3E $2B
    ld   b, $78                                 ; $42D7: $06 $78
    jr   .Func_037_42ED                         ; $42D9: $18 $12

.else_42DB_37:
    cp   $0F                                    ; $42DB: $FE $0F
    jr   nz, .else_42E5_37                      ; $42DD: $20 $06

    ld   a, $29                                 ; $42DF: $3E $29
    ld   b, $48                                 ; $42E1: $06 $48
    jr   .Func_037_42ED                         ; $42E3: $18 $08

.else_42E5_37:
    cp   $0E                                    ; $42E5: $FE $0E
    jr   nz, .else_42F4_37                      ; $42E7: $20 $0B

    ld   a, $3B                                 ; $42E9: $3E $3B
    ld   b, $78                                 ; $42EB: $06 $78
.Func_037_42ED::
    ld   h, $37                                 ; $42ED: $26 $37
    call Func_037_418B.Func_037_4190            ; $42EF: $CD $90 $41
    jr   .else_42F4_37                          ; $42F2: $18 $00

.else_42F4_37:
                                                ; $42F4: $3E $C7
    ld   a, $C7
    ld   [wLCDControl], a                       ; $42F6: $EA $FD $D6
    ld   [rLCDC], a                             ; $42F9: $E0 $40
    jp   Func_037_53FE                          ; $42FB: $C3 $FE $53

JumpTable_037_42FE::
    ldh  a, [hFrameCounter]                     ; $42FE: $F0 $E7
    and  %00000001                              ; $4300: $E6 $01
    jr   nz, .else_431B_37                      ; $4302: $20 $17

    ldh  a, [hWindowYUnused]                    ; $4304: $F0 $A9
    inc  a                                      ; $4306: $3C
    cp   $07                                    ; $4307: $FE $07
    jr   c, .else_430D_37                       ; $4309: $38 $02

    ld   a, $07                                 ; $430B: $3E $07
.else_430D_37:
    ldh  [hWindowYUnused], a                    ; $430D: $E0 $A9
    ldh  a, [hWindowXUnused]                    ; $430F: $F0 $AA
    add  $10                                    ; $4311: $C6 $10
    cp   $70                                    ; $4313: $FE $70
    jr   c, .else_4319_37                       ; $4315: $38 $02

    ld   a, $70                                 ; $4317: $3E $70
.else_4319_37:
    ldh  [hWindowXUnused], a                    ; $4319: $E0 $AA
.else_431B_37:
    xor  a                                      ; $431B: $AF
    ld   [$C200], a                             ; $431C: $EA $00 $C2
    call Func_037_4351                          ; $431F: $CD $51 $43
    call Func_037_4331                          ; $4322: $CD $31 $43
    call label_1A39                             ; $4325: $CD $39 $1A
    ld   a, [$C16B]                             ; $4328: $FA $6B $C1
    cp   $04                                    ; $432B: $FE $04
    ret  nz                                     ; $432D: $C0

    jp   Func_037_53FE                          ; $432E: $C3 $FE $53

Func_037_4331::
    ld   a, [wGameplayType]                     ; $4331: $FA $95 $DB
    sub  $0E                                    ; $4334: $D6 $0E
    JP_TABLE                                    ; $4336: $C7
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_46A4
    dw $0000
    dw JumpTable_037_47C3
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_4B1E
    dw $0000
    dw JumpTable_037_4F6F
    dw JumpTable_037_4FB6
    dw JumpTable_037_4FD0
    dw JumpTable_037_532E
    dw JumpTable_037_4B1E.JumpTable_037_4B30

Func_037_4351::
    ld   a, [wGameplayType]                     ; $4351: $FA $95 $DB
    sub  $0E                                    ; $4354: $D6 $0E
    JP_TABLE                                    ; $4356: $C7
    dw JumpTable_037_4440
    dw JumpTable_037_4440
    dw JumpTable_037_4371
    dw $0000
    dw JumpTable_037_43A6
    dw JumpTable_037_4440
    dw JumpTable_037_440A
    dw $0000
    dw JumpTable_037_4440
    dw JumpTable_037_4440
    dw JumpTable_037_4441
    dw JumpTable_037_446C
    dw JumpTable_037_4440

JumpTable_037_4371::
    ld   a, $68                                 ; $4371: $3E $68
    ld   [$C202], a                             ; $4373: $EA $02 $C2
    ld   a, 56                                  ; $4376: $3E $38
    ld   [$C203], a                             ; $4378: $EA $03 $C2
    ldh  [hLinkPositionY], a                    ; $437B: $E0 $99
    ld   a, $58                                 ; $437D: $3E $58
    ld   [$C208], a                             ; $437F: $EA $08 $C2
    ld   a, $40                                 ; $4382: $3E $40
    ld   [$C209], a                             ; $4384: $EA $09 $C2
    ld   hl, $C22D                              ; $4387: $21 $2D $C2
    ld   [hl], $10                              ; $438A: $36 $10
    ld   hl, $C240                              ; $438C: $21 $40 $C2
    ld   bc, $92C0                              ; $438F: $01 $C0 $92
    ld   [hl], c                                ; $4392: $71
    inc  hl                                     ; $4393: $23
    ld   [hl], b                                ; $4394: $70
    ld   hl, $C238                              ; $4395: $21 $38 $C2
    ld   [hl], $70                              ; $4398: $36 $70
    inc  hl                                     ; $439A: $23
    ld   a, [$FFFE]                             ; $439B: $F0 $FE
    and  a                                      ; $439D: $A7
    jr   nz, .else_43A3_37                      ; $439E: $20 $03

    ld   [hl], $75                              ; $43A0: $36 $75
    ret                                         ; $43A2: $C9


.else_43A3_37:
    ld   [hl], $71                              ; $43A3: $36 $71
    ret                                         ; $43A5: $C9


JumpTable_037_43A6::
    call Func_037_4A8E                          ; $43A6: $CD $8E $4A
    ld   a, $E0                                 ; $43A9: $3E $E0
    ld   [$C202], a                             ; $43AB: $EA $02 $C2
    ld   a, $68                                 ; $43AE: $3E $68
    ld   [$C203], a                             ; $43B0: $EA $03 $C2
    ld   a, $58                                 ; $43B3: $3E $58
    ld   [$C206], a                             ; $43B5: $EA $06 $C2
    ld   a, $C8                                 ; $43B8: $3E $C8
    ld   [$C208], a                             ; $43BA: $EA $08 $C2
    ld   a, $B0                                 ; $43BD: $3E $B0
    ld   [$C211], a                             ; $43BF: $EA $11 $C2
    ld   hl, $C22A                              ; $43C2: $21 $2A $C2
    ld   [hl], $40                              ; $43C5: $36 $40
    inc  hl                                     ; $43C7: $23
    ld   [hl], $30                              ; $43C8: $36 $30
    inc  hl                                     ; $43CA: $23
    ld   [hl], $20                              ; $43CB: $36 $20
    ld   hl, $C23A                              ; $43CD: $21 $3A $C2
    ld   bc, $9000                              ; $43D0: $01 $00 $90
    ld   [hl], c                                ; $43D3: $71
    inc  hl                                     ; $43D4: $23
    ld   [hl], b                                ; $43D5: $70
    inc  hl                                     ; $43D6: $23
    ld   bc, $9500                              ; $43D7: $01 $00 $95
    ld   [hl], c                                ; $43DA: $71
    inc  hl                                     ; $43DB: $23
    ld   [hl], b                                ; $43DC: $70
    inc  hl                                     ; $43DD: $23
    ld   bc, $9530                              ; $43DE: $01 $30 $95
    ld   [hl], c                                ; $43E1: $71
    inc  hl                                     ; $43E2: $23
    ld   [hl], b                                ; $43E3: $70
    ld   hl, $C232                              ; $43E4: $21 $32 $C2
    ld   a, [$FFFE]                             ; $43E7: $F0 $FE
    and  a                                      ; $43E9: $A7
    jr   nz, .else_43FB_37                      ; $43EA: $20 $0F

    xor  a                                      ; $43EC: $AF
    ldi  [hl], a                                ; $43ED: $22
    ld   [hl], $74                              ; $43EE: $36 $74
    inc  hl                                     ; $43F0: $23
    ldi  [hl], a                                ; $43F1: $22
    ld   [hl], $75                              ; $43F2: $36 $75
    inc  hl                                     ; $43F4: $23
    ld   [hl], $30                              ; $43F5: $36 $30
    inc  hl                                     ; $43F7: $23
    ld   [hl], $75                              ; $43F8: $36 $75
    ret                                         ; $43FA: $C9


.else_43FB_37:
    xor  a                                      ; $43FB: $AF
    ldi  [hl], a                                ; $43FC: $22
    ld   [hl], $70                              ; $43FD: $36 $70
    inc  hl                                     ; $43FF: $23
    ldi  [hl], a                                ; $4400: $22
    ld   [hl], $71                              ; $4401: $36 $71
    inc  hl                                     ; $4403: $23
    ld   [hl], $30                              ; $4404: $36 $30
    inc  hl                                     ; $4406: $23
    ld   [hl], $71                              ; $4407: $36 $71
    ret                                         ; $4409: $C9


JumpTable_037_440A::
    ld   a, $80                                 ; $440A: $3E $80
    ld   [$C202], a                             ; $440C: $EA $02 $C2
    ld   a, $58                                 ; $440F: $3E $58
    ld   [$C203], a                             ; $4411: $EA $03 $C2
    ld   a, $66                                 ; $4414: $3E $66
    ld   [$C223], a                             ; $4416: $EA $23 $C2
    ld   e, $10                                 ; $4419: $1E $10
    ld   hl, $C251                              ; $441B: $21 $51 $C2
.loop_441E_37:
    ldi  [hl], a                                ; $441E: $22
    dec  e                                      ; $441F: $1D
    jr   nz, .loop_441E_37                      ; $4420: $20 $FC

    ld   a, $70                                 ; $4422: $3E $70
    ld   [$C222], a                             ; $4424: $EA $22 $C2
    ld   e, $10                                 ; $4427: $1E $10
    ld   hl, $C261                              ; $4429: $21 $61 $C2
.loop_442C_37:
    ldi  [hl], a                                ; $442C: $22
    dec  e                                      ; $442D: $1D
    jr   nz, .loop_442C_37                      ; $442E: $20 $FC

    xor  a                                      ; $4430: $AF
    ld   [$C221], a                             ; $4431: $EA $21 $C2
    ld   a, $20                                 ; $4434: $3E $20
    ld   [$C213], a                             ; $4436: $EA $13 $C2
    call Func_037_4B31                          ; $4439: $CD $31 $4B
    call Func_037_4F37                          ; $443C: $CD $37 $4F
    ret                                         ; $443F: $C9


JumpTable_037_4440::
    ret                                         ; $4440: $C9


JumpTable_037_4441::
    ld   a, $D6                                 ; $4441: $3E $D6
    ld   [$C202], a                             ; $4443: $EA $02 $C2
    ld   a, 138                                 ; $4446: $3E $8A
    ld   [$C203], a                             ; $4448: $EA $03 $C2
    ldh  [hLinkPositionY], a                    ; $444B: $E0 $99
    ld   a, $20                                 ; $444D: $3E $20
    ld   [$C206], a                             ; $444F: $EA $06 $C2
    ld   a, $88                                 ; $4452: $3E $88
    ld   [$C216], a                             ; $4454: $EA $16 $C2
    ld   a, $B6                                 ; $4457: $3E $B6
    ld   [$C217], a                             ; $4459: $EA $17 $C2
    ld   a, $88                                 ; $445C: $3E $88
    ld   [$C218], a                             ; $445E: $EA $18 $C2
    ld   a, $5A                                 ; $4461: $3E $5A
    ld   [$C21C], a                             ; $4463: $EA $1C $C2
    ld   a, $77                                 ; $4466: $3E $77
    ld   [$C21D], a                             ; $4468: $EA $1D $C2
    ret                                         ; $446B: $C9


JumpTable_037_446C::
    ld   a, $4C                                 ; $446C: $3E $4C
    ld   [$C202], a                             ; $446E: $EA $02 $C2
    ld   a, 90                                  ; $4471: $3E $5A
    ld   [$C203], a                             ; $4473: $EA $03 $C2
    ldh  [hLinkPositionY], a                    ; $4476: $E0 $99
    ld   a, $B0                                 ; $4478: $3E $B0
    ld   [$C250], a                             ; $447A: $EA $50 $C2
    ld   a, $66                                 ; $447D: $3E $66
    ld   [$C24F], a                             ; $447F: $EA $4F $C2
    ret                                         ; $4482: $C9


    db   $00, $70, $40, $70, $80, $70, $00, $70 ; $4483 |.p@p.p.p|
    db   $40, $70, $80, $70, $00, $70, $40, $70 ; $448B |@p.p.p@p|
    db   $80, $70, $00, $70, $40, $70, $80, $70 ; $4493 |.p.p@p.p|
    db   $00, $71, $00, $72, $00, $73, $00, $71 ; $449B |.q.r.s.q|
    db   $00, $72, $00, $73, $00, $71, $00, $72 ; $44A3 |.r.s.q.r|
    db   $00, $73, $00, $71, $00, $72, $00, $73 ; $44AB |.s.q.r.s|
    db   $30, $71, $30, $72, $30, $73, $30, $71 ; $44B3 |0q0r0s0q|
    db   $30, $72, $30, $73, $30, $71, $30, $72 ; $44BB |0r0s0q0r|
    db   $30, $73, $30, $71, $30, $72, $30, $73 ; $44C3 |0s0q0r0s|
    db   $70, $71, $80, $71, $90, $71, $A0, $71 ; $44CB |pq.q.q.q|
    db   $70, $71, $80, $71, $90, $71, $A0, $71 ; $44D3 |pq.q.q.q|
    db   $70, $71, $80, $71, $90, $71, $A0, $71 ; $44DB |pq.q.q.q|
    db   $83, $44, $9B, $44, $B3, $44, $CB, $44 ; $44E3 |.D.D.D.D|
    db   $20, $18, $10, $08                     ; $44EB | ...|

Func_037_44EF::
    ld   bc, $0000                              ; $44EF: $01 $00 $00
.loop_44F2_37:
    ld   hl, $C242                              ; $44F2: $21 $42 $C2
    add  hl, bc                                 ; $44F5: $09
    ld   e, l                                   ; $44F6: $5D
    ld   d, h                                   ; $44F7: $54
    xor  a                                      ; $44F8: $AF
    ld   [de], a                                ; $44F9: $12
    ld   hl, $44EB                              ; $44FA: $21 $EB $44
    add  hl, bc                                 ; $44FD: $09
    ld   a, [hl]                                ; $44FE: $7E
    ld   hl, $C246                              ; $44FF: $21 $46 $C2
    add  hl, bc                                 ; $4502: $09
    inc  [hl]                                   ; $4503: $34
    cp   [hl]                                   ; $4504: $BE
    jr   nc, .else_4543_37                      ; $4505: $30 $3C

    ld   a, [de]                                ; $4507: $1A
    and  a                                      ; $4508: $A7
    jr   nz, .else_4543_37                      ; $4509: $20 $38

    ld   a, $39                                 ; $450B: $3E $39
    ld   [de], a                                ; $450D: $12
    xor  a                                      ; $450E: $AF
    ld   [hl], a                                ; $450F: $77
    ld   hl, $C24A                              ; $4510: $21 $4A $C2
    add  hl, bc                                 ; $4513: $09
    inc  [hl]                                   ; $4514: $34
    ld   a, [hl]                                ; $4515: $7E
    cp   $0C                                    ; $4516: $FE $0C
    jr   nz, .else_451C_37                      ; $4518: $20 $02

    xor  a                                      ; $451A: $AF
    ld   [hl], a                                ; $451B: $77
.else_451C_37:
    sla  a                                      ; $451C: $CB $27
    ld   e, a                                   ; $451E: $5F
    ld   d, $00                                 ; $451F: $16 $00
    push bc                                     ; $4521: $C5
    sla  c                                      ; $4522: $CB $21
    ld   hl, $44E3                              ; $4524: $21 $E3 $44
    add  hl, bc                                 ; $4527: $09
    ldi  a, [hl]                                ; $4528: $2A
    ld   h, [hl]                                ; $4529: $66
    ld   l, a                                   ; $452A: $6F
    add  hl, de                                 ; $452B: $19
    push hl                                     ; $452C: $E5
    ld   hl, $C232                              ; $452D: $21 $32 $C2
    add  hl, bc                                 ; $4530: $09
    push hl                                     ; $4531: $E5
    pop  de                                     ; $4532: $D1
    pop  hl                                     ; $4533: $E1
    pop  bc                                     ; $4534: $C1
    ldi  a, [hl]                                ; $4535: $2A
    ld   [de], a                                ; $4536: $12
    inc  de                                     ; $4537: $13
    ld   a, [hl]                                ; $4538: $7E
    ld   [de], a                                ; $4539: $12
    ld   a, [$FFFE]                             ; $453A: $F0 $FE
    and  a                                      ; $453C: $A7
    jr   nz, .else_4543_37                      ; $453D: $20 $04

    ld   a, [de]                                ; $453F: $1A
    add  $04                                    ; $4540: $C6 $04
    ld   [de], a                                ; $4542: $12
.else_4543_37:
    inc  bc                                     ; $4543: $03
    ld   a, c                                   ; $4544: $79
    and  %00000011                              ; $4545: $E6 $03
    jr   nz, .loop_44F2_37                      ; $4547: $20 $A9

    ret                                         ; $4549: $C9


    db   $7F, $5B, $14, $2E, $4E, $19, $A9, $08 ; $454A |.[..N...|

Func_037_4552::
    ld   a, [$C214]                             ; $4552: $FA $14 $C2
    and  a                                      ; $4555: $A7
    ret  z                                      ; $4556: $C8

    cp   $01                                    ; $4557: $FE $01
    jr   nz, .else_458A_37                      ; $4559: $20 $2F

    inc  a                                      ; $455B: $3C
    ld   [$C214], a                             ; $455C: $EA $14 $C2
    ld   a, $40                                 ; $455F: $3E $40
    ldh  [hNoiseSfx], a                         ; $4561: $E0 $F4
    ld   a, [$FFFE]                             ; $4563: $F0 $FE
    and  a                                      ; $4565: $A7
    jr   nz, .else_4570_37                      ; $4566: $20 $08

    ld   hl, $DB97                              ; $4568: $21 $97 $DB
    xor  a                                      ; $456B: $AF
    ldi  [hl], a                                ; $456C: $22
    ldi  [hl], a                                ; $456D: $22
    ld   [hl], a                                ; $456E: $77
    ret                                         ; $456F: $C9


.else_4570_37:
    ld   hl, rSVBK                              ; $4570: $21 $70 $FF
    ld   de, $DC10                              ; $4573: $11 $10 $DC
.loop_4576_37:
    ld   a, [de]                                ; $4576: $1A
    ld   [hl], $03                              ; $4577: $36 $03
    ld   [de], a                                ; $4579: $12
    xor  a                                      ; $457A: $AF
    ld   [hl], a                                ; $457B: $77
    dec  a                                      ; $457C: $3D
    ld   [de], a                                ; $457D: $12
    inc  de                                     ; $457E: $13
    ld   a, e                                   ; $457F: $7B
    cp   $90                                    ; $4580: $FE $90
    jr   nz, .loop_4576_37                      ; $4582: $20 $F2

    ld   a, $01                                 ; $4584: $3E $01
    ld   [$DDD1], a                             ; $4586: $EA $D1 $DD
    ret                                         ; $4589: $C9


.else_458A_37:
    cp   $0F                                    ; $458A: $FE $0F
    jr   z, .else_4592_37                       ; $458C: $28 $04

    cp   $02                                    ; $458E: $FE $02
    jr   nz, .else_45B5_37                      ; $4590: $20 $23

.else_4592_37:
    inc  a                                      ; $4592: $3C
    and  %00001111                              ; $4593: $E6 $0F
    ld   [$C214], a                             ; $4595: $EA $14 $C2
    ld   a, [$FFFE]                             ; $4598: $F0 $FE
    and  a                                      ; $459A: $A7
    jr   nz, .else_45AF_37                      ; $459B: $20 $12

    ld   a, [$C214]                             ; $459D: $FA $14 $C2
    and  a                                      ; $45A0: $A7
    ret  nz                                     ; $45A1: $C0

    ld   hl, $DB97                              ; $45A2: $21 $97 $DB
    ld   a, $E4                                 ; $45A5: $3E $E4
    ldi  [hl], a                                ; $45A7: $22
    ld   a, $1C                                 ; $45A8: $3E $1C
    ldi  [hl], a                                ; $45AA: $22
    ld   a, $E4                                 ; $45AB: $3E $E4
    ld   [hl], a                                ; $45AD: $77
    ret                                         ; $45AE: $C9


.else_45AF_37:
    ld   a, $02                                 ; $45AF: $3E $02
    ld   [$DDD1], a                             ; $45B1: $EA $D1 $DD
    ret                                         ; $45B4: $C9


.else_45B5_37:
    cp   $0E                                    ; $45B5: $FE $0E
    jr   nz, .else_45D3_37                      ; $45B7: $20 $1A

    ld   hl, rSVBK                              ; $45B9: $21 $70 $FF
    ld   de, $DC10                              ; $45BC: $11 $10 $DC
.loop_45BF_37:
    ld   [hl], $03                              ; $45BF: $36 $03
    ld   a, [de]                                ; $45C1: $1A
    ld   [hl], $00                              ; $45C2: $36 $00
    ld   [de], a                                ; $45C4: $12
    inc  de                                     ; $45C5: $13
    ld   a, e                                   ; $45C6: $7B
    cp   $90                                    ; $45C7: $FE $90
    jr   nz, .loop_45BF_37                      ; $45C9: $20 $F4

    ld   a, $01                                 ; $45CB: $3E $01
    ld   [$DDD1], a                             ; $45CD: $EA $D1 $DD
    ld   a, [$C214]                             ; $45D0: $FA $14 $C2
.else_45D3_37:
    inc  a                                      ; $45D3: $3C
    ld   [$C214], a                             ; $45D4: $EA $14 $C2
    cp   $04                                    ; $45D7: $FE $04
    ret  nz                                     ; $45D9: $C0

    ld   a, [wGameplayType]                     ; $45DA: $FA $95 $DB
    sub  $0E                                    ; $45DD: $D6 $0E
    sla  a                                      ; $45DF: $CB $27
    sla  a                                      ; $45E1: $CB $27
    ld   e, a                                   ; $45E3: $5F
    ld   d, $00                                 ; $45E4: $16 $00
    ld   hl, $5727                              ; $45E6: $21 $27 $57
    add  hl, de                                 ; $45E9: $19
    ld   a, [hl]                                ; $45EA: $7E
    and  a                                      ; $45EB: $A7
    ret  z                                      ; $45EC: $C8

    push hl                                     ; $45ED: $E5
    push hl                                     ; $45EE: $E5
    call LCDOff                                 ; $45EF: $CD $CF $28
    pop  hl                                     ; $45F2: $E1
    ld   c, [hl]                                ; $45F3: $4E
    inc  hl                                     ; $45F4: $23
    ld   b, [hl]                                ; $45F5: $46
    inc  hl                                     ; $45F6: $23
    ld   a, [hl]                                ; $45F7: $7E
    call Func_037_418B                          ; $45F8: $CD $8B $41
    pop  hl                                     ; $45FB: $E1
    ldi  a, [hl]                                ; $45FC: $2A
    add  $08                                    ; $45FD: $C6 $08
    ld   c, a                                   ; $45FF: $4F
    ldi  a, [hl]                                ; $4600: $2A
    sub  $08                                    ; $4601: $D6 $08
    ld   b, a                                   ; $4603: $47
    ld   a, [hl]                                ; $4604: $7E
    call Func_037_418B                          ; $4605: $CD $8B $41
                                                ; $4608: $3E $E5
    ld   a, $E5
    ld   [wLCDControl], a                       ; $460A: $EA $FD $D6
    ld   [rLCDC], a                             ; $460D: $E0 $40
    xor  a                                      ; $460F: $AF
    ld   [$DB9A], a                             ; $4610: $EA $9A $DB
    ld   a, [$FFFE]                             ; $4613: $F0 $FE
    and  a                                      ; $4615: $A7
    ret  z                                      ; $4616: $C8

    di                                          ; $4617: $F3
    ld   a, $03                                 ; $4618: $3E $03
    ld   [rSVBK], a                             ; $461A: $E0 $70
    ld   de, $DC10                              ; $461C: $11 $10 $DC
    ld   hl, $454A                              ; $461F: $21 $4A $45
.loop_4622_37:
    ldi  a, [hl]                                ; $4622: $2A
    ld   [de], a                                ; $4623: $12
    inc  de                                     ; $4624: $13
    ld   a, e                                   ; $4625: $7B
    and  GAMEPLAY_MINI_MAP                      ; $4626: $E6 $07
    jr   nz, .loop_4622_37                      ; $4628: $20 $F8

    xor  a                                      ; $462A: $AF
    ld   [rSVBK], a                             ; $462B: $E0 $70
    ei                                          ; $462D: $FB
    ret                                         ; $462E: $C9


JumpTable_037_462F::
    ld   hl, $C213                              ; $462F: $21 $13 $C2
    inc  [hl]                                   ; $4632: $34
    ld   a, [hl]                                ; $4633: $7E
    cp   $50                                    ; $4634: $FE $50
    ret  nz                                     ; $4636: $C0

    xor  a                                      ; $4637: $AF
    ld   [$C16C], a                             ; $4638: $EA $6C $C1
    ld   [$C16B], a                             ; $463B: $EA $6B $C1
    ld   a, [$DC0C]                             ; $463E: $FA $0C $DC
    or   $01                                    ; $4641: $F6 $01
    ld   [$DC0C], a                             ; $4643: $EA $0C $DC
    ld   a, [wGameplayType]                     ; $4646: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_DIZZY_LINK              ; $4649: $FE $0E
    jr   nz, .else_4655_37                      ; $464B: $20 $08

    ld   a, [$DC0D]                             ; $464D: $FA $0D $DC
    or   $80                                    ; $4650: $F6 $80
    ld   [$DC0D], a                             ; $4652: $EA $0D $DC
.else_4655_37:
    call Func_037_53FE                          ; $4655: $CD $FE $53
    ret                                         ; $4658: $C9


JumpTable_037_4659::
    call Func_037_44EF                          ; $4659: $CD $EF $44
    ld   hl, $C242                              ; $465C: $21 $42 $C2
    xor  a                                      ; $465F: $AF
    ldi  [hl], a                                ; $4660: $22
    ldi  [hl], a                                ; $4661: $22
    ld   [hl], a                                ; $4662: $77
    ld   a, $1C                                 ; $4663: $3E $1C
    ld   [$C200], a                             ; $4665: $EA $00 $C2
    call JumpTable_037_46A4                     ; $4668: $CD $A4 $46
    call Func_037_46AF                          ; $466B: $CD $AF $46
    call Func_037_4552                          ; $466E: $CD $52 $45
    ld   a, [wNoiseSfxSeaWavesCounter]          ; $4671: $FA $14 $C1
    inc  a                                      ; $4674: $3C
    cp   $A0                                    ; $4675: $FE $A0
    jr   nz, .else_467E_37                      ; $4677: $20 $05

    ld   a, NOISE_SFX_SEA_WAVES                 ; $4679: $3E $0F
    ldh  [hNoiseSfx], a                         ; $467B: $E0 $F4
    xor  a                                      ; $467D: $AF
.else_467E_37:
    ld   [wNoiseSfxSeaWavesCounter], a          ; $467E: $EA $14 $C1
    ld   a, [$D466]                             ; $4681: $FA $66 $D4
    and  a                                      ; $4684: $A7
    jr   nz, .else_4695_37                      ; $4685: $20 $0E

    ld   a, JINGLE_SEAGULL                      ; $4687: $3E $21
    ldh  [hJingle], a                           ; $4689: $E0 $F2
    call GetRandomByte                          ; $468B: $CD $0D $28
    and  %01111111                              ; $468E: $E6 $7F
    add  $60                                    ; $4690: $C6 $60
    ld   [$D466], a                             ; $4692: $EA $66 $D4
.else_4695_37:
    dec  a                                      ; $4695: $3D
    ld   [$D466], a                             ; $4696: $EA $66 $D4
    ld   a, $37                                 ; $4699: $3E $37
    call label_A9B                              ; $469B: $CD $9B $0A
    ld   a, $37                                 ; $469E: $3E $37
    call SwitchBank                             ; $46A0: $CD $0C $08
    ret                                         ; $46A3: $C9


JumpTable_037_46A4::
    call Func_037_4779                          ; $46A4: $CD $79 $47
    call Func_037_4771                          ; $46A7: $CD $71 $47
    ret                                         ; $46AA: $C9


    db   $08, $12, $08, $12                     ; $46AB |....|

Func_037_46AF::
    ld   hl, $C20A                              ; $46AF: $21 $0A $C2
    dec  [hl]                                   ; $46B2: $35
    ld   a, [hl]                                ; $46B3: $7E
    and  a                                      ; $46B4: $A7
    jr   nz, .else_46D7_37                      ; $46B5: $20 $20

    push hl                                     ; $46B7: $E5
    call GetRandomByte                          ; $46B8: $CD $0D $28
    and  %00000011                              ; $46BB: $E6 $03
    ld   e, a                                   ; $46BD: $5F
    ld   d, $00                                 ; $46BE: $16 $00
    ld   hl, $46AB                              ; $46C0: $21 $AB $46
    add  hl, de                                 ; $46C3: $19
    ld   a, [hl]                                ; $46C4: $7E
    pop  hl                                     ; $46C5: $E1
    ld   [hl], a                                ; $46C6: $77
    ld   a, [$C207]                             ; $46C7: $FA $07 $C2
    xor  $01                                    ; $46CA: $EE $01
    ld   [$C207], a                             ; $46CC: $EA $07 $C2
    ld   a, [$C201]                             ; $46CF: $FA $01 $C2
    xor  $01                                    ; $46D2: $EE $01
    ld   [$C201], a                             ; $46D4: $EA $01 $C2
.else_46D7_37:
    ld   a, [$C19F]                             ; $46D7: $FA $9F $C1
    and  a                                      ; $46DA: $A7
    ret  nz                                     ; $46DB: $C0

    ld   a, [$C20B]                             ; $46DC: $FA $0B $C2
    JP_TABLE                                    ; $46DF: $C7
    dw JumpTable_037_46F6
    dw JumpTable_037_470A
    dw JumpTable_037_470E
    dw JumpTable_037_470A
    dw JumpTable_037_4712
    dw JumpTable_037_470A
    dw JumpTable_037_4716
    dw JumpTable_037_4724
    dw JumpTable_037_473B
    dw JumpTable_037_4753
    dw JumpTable_037_49CD

JumpTable_037_46F6::
    ld   hl, $C213                              ; $46F6: $21 $13 $C2
    inc  [hl]                                   ; $46F9: $34
    ld   a, [hl]                                ; $46FA: $7E
    cp   $20                                    ; $46FB: $FE $20
    ret  nz                                     ; $46FD: $C0

    xor  a                                      ; $46FE: $AF
    ld   [hl], a                                ; $46FF: $77
    ld   a, $55                                 ; $4700: $3E $55
.Func_037_4702::
    call OpenDialogInTable2                     ; $4702: $CD $7C $23
.Func_037_4705::
    ld   hl, $C20B                              ; $4705: $21 $0B $C2
    inc  [hl]                                   ; $4708: $34
    ret                                         ; $4709: $C9


JumpTable_037_470A::
    ld   a, $56                                 ; $470A: $3E $56
    jr   JumpTable_037_46F6.Func_037_4702       ; $470C: $18 $F4

JumpTable_037_470E::
    ld   a, $57                                 ; $470E: $3E $57
    jr   JumpTable_037_46F6.Func_037_4702       ; $4710: $18 $F0

JumpTable_037_4712::
    ld   a, $58                                 ; $4712: $3E $58
    jr   JumpTable_037_46F6.Func_037_4702       ; $4714: $18 $EC

JumpTable_037_4716::
    ld   hl, $C213                              ; $4716: $21 $13 $C2
    inc  [hl]                                   ; $4719: $34
    ld   a, [hl]                                ; $471A: $7E
    cp   $50                                    ; $471B: $FE $50
    ret  nz                                     ; $471D: $C0

    xor  a                                      ; $471E: $AF
    ld   [hl], a                                ; $471F: $77
    ld   a, $59                                 ; $4720: $3E $59
    jr   JumpTable_037_46F6.Func_037_4702       ; $4722: $18 $DE

JumpTable_037_4724::
    ld   hl, $C213                              ; $4724: $21 $13 $C2
    inc  [hl]                                   ; $4727: $34
    ld   a, [hl]                                ; $4728: $7E
    cp   $20                                    ; $4729: $FE $20
    ret  nz                                     ; $472B: $C0

    xor  a                                      ; $472C: $AF
    ld   [hl], a                                ; $472D: $77
    ld   hl, $C214                              ; $472E: $21 $14 $C2
    inc  [hl]                                   ; $4731: $34
    ld   a, $60                                 ; $4732: $3E $60
    ld   [$C213], a                             ; $4734: $EA $13 $C2
    call JumpTable_037_46F6.Func_037_4705       ; $4737: $CD $05 $47
    ret                                         ; $473A: $C9


JumpTable_037_473B::
    ld   a, [$C214]                             ; $473B: $FA $14 $C2
    and  a                                      ; $473E: $A7
    ret  nz                                     ; $473F: $C0

    ld   hl, $C213                              ; $4740: $21 $13 $C2
    dec  [hl]                                   ; $4743: $35
    ld   a, [hl]                                ; $4744: $7E
    bit  7, a                                   ; $4745: $CB $7F
    ret  z                                      ; $4747: $C8

    xor  a                                      ; $4748: $AF
    ld   [hl], a                                ; $4749: $77
    ld   a, $0B                                 ; $474A: $3E $0B
    call OpenDialogInTable1                     ; $474C: $CD $73 $23
    call JumpTable_037_46F6.Func_037_4705       ; $474F: $CD $05 $47
    ret                                         ; $4752: $C9


JumpTable_037_4753::
    ld   hl, $C213                              ; $4753: $21 $13 $C2
    inc  [hl]                                   ; $4756: $34
    ld   a, [hl]                                ; $4757: $7E
    cp   $30                                    ; $4758: $FE $30
    ret  nz                                     ; $475A: $C0

    ld   a, [$DC0C]                             ; $475B: $FA $0C $DC
    or   $02                                    ; $475E: $F6 $02
    ld   [$DC0C], a                             ; $4760: $EA $0C $DC
    call JumpTable_037_46F6.Func_037_4705       ; $4763: $CD $05 $47
    xor  a                                      ; $4766: $AF
    ld   [$C16C], a                             ; $4767: $EA $6C $C1
    ld   [$C16B], a                             ; $476A: $EA $6B $C1
    call Func_037_53FE                          ; $476D: $CD $FE $53
    ret                                         ; $4770: $C9


Func_037_4771::
    ld   c, $18                                 ; $4771: $0E $18
    ld   hl, $5A8B                              ; $4773: $21 $8B $5A
    jp   Func_037_4A37.Func_037_4A45            ; $4776: $C3 $45 $4A

Func_037_4779::
    ld   hl, $57E2                              ; $4779: $21 $E2 $57
    ld   c, $10                                 ; $477C: $0E $10
    jp   Func_037_49D3.Func_037_49E1            ; $477E: $C3 $E1 $49

JumpTable_037_4781::
    call Func_037_44EF                          ; $4781: $CD $EF $44
    ld   hl, $C245                              ; $4784: $21 $45 $C2
    ld   [hl], $00                              ; $4787: $36 $00
    ld   a, $1C                                 ; $4789: $3E $1C
    ld   [$C200], a                             ; $478B: $EA $00 $C2
    ld   a, [$C20E]                             ; $478E: $FA $0E $C2
    cp   $04                                    ; $4791: $FE $04
    jr   nc, .else_47A3_37                      ; $4793: $30 $0E

    call Func_037_4A37                          ; $4795: $CD $37 $4A
    call Func_037_49D3                          ; $4798: $CD $D3 $49
    call Func_037_4972                          ; $479B: $CD $72 $49
    call Func_037_4A8E                          ; $479E: $CD $8E $4A
    jr   .Func_037_47A6                         ; $47A1: $18 $03

.else_47A3_37:
    call JumpTable_037_47C3                     ; $47A3: $CD $C3 $47
.Func_037_47A6::
    call Func_037_47D0                          ; $47A6: $CD $D0 $47
    call Func_037_4994                          ; $47A9: $CD $94 $49
    call Func_037_49FB                          ; $47AC: $CD $FB $49
    call Func_037_4552                          ; $47AF: $CD $52 $45
    ld   a, [$C200]                             ; $47B2: $FA $00 $C2
    call label_3DA0                             ; $47B5: $CD $A0 $3D
    ld   a, $37                                 ; $47B8: $3E $37
    call label_A9B                              ; $47BA: $CD $9B $0A
    ld   a, $37                                 ; $47BD: $3E $37
    call SwitchBank                             ; $47BF: $CD $0C $08
    ret                                         ; $47C2: $C9


JumpTable_037_47C3::
    call Func_037_4972                          ; $47C3: $CD $72 $49
    call Func_037_4A37                          ; $47C6: $CD $37 $4A
    call Func_037_49D3                          ; $47C9: $CD $D3 $49
    call Func_037_4A8E                          ; $47CC: $CD $8E $4A
    ret                                         ; $47CF: $C9


Func_037_47D0::
    ld   a, [$C20E]                             ; $47D0: $FA $0E $C2
    JP_TABLE                                    ; $47D3: $C7
    dw JumpTable_037_47E9
    dw JumpTable_037_4829
    dw JumpTable_037_4834
    dw JumpTable_037_485E
    dw JumpTable_037_4884
    dw JumpTable_037_48A0
    dw JumpTable_037_48B8
    dw JumpTable_037_48CB

Func_037_47E4::
    ld   hl, $C20E                              ; $47E4: $21 $0E $C2
    inc  [hl]                                   ; $47E7: $34
    ret                                         ; $47E8: $C9


JumpTable_037_47E9::
    ld   a, $68                                 ; $47E9: $3E $68
    ld   [$C212], a                             ; $47EB: $EA $12 $C2
    ld   a, [$C202]                             ; $47EE: $FA $02 $C2
    bit  7, a                                   ; $47F1: $CB $7F
    ret  nz                                     ; $47F3: $C0

    cp   $58                                    ; $47F4: $FE $58
    ret  c                                      ; $47F6: $D8

    ld   hl, $C20F                              ; $47F7: $21 $0F $C2
    inc  [hl]                                   ; $47FA: $34
    ld   a, [hl]                                ; $47FB: $7E
    cp   $0A                                    ; $47FC: $FE $0A
    ret  c                                      ; $47FE: $D8

    xor  a                                      ; $47FF: $AF
    ld   [hl], a                                ; $4800: $77
    ld   a, [$C210]                             ; $4801: $FA $10 $C2
    inc  a                                      ; $4804: $3C
    and  %00000011                              ; $4805: $E6 $03
    ld   [$C210], a                             ; $4807: $EA $10 $C2
    ld   a, [$C211]                             ; $480A: $FA $11 $C2
    sub  $04                                    ; $480D: $D6 $04
    bit  7, a                                   ; $480F: $CB $7F
    jr   nz, .else_4825_37                      ; $4811: $20 $12

    cp   $88                                    ; $4813: $FE $88
    jr   nc, .else_4825_37                      ; $4815: $30 $0E

    xor  a                                      ; $4817: $AF
    ld   [$C210], a                             ; $4818: $EA $10 $C2
    ld   a, $3D                                 ; $481B: $3E $3D
    call OpenDialogInTable2                     ; $481D: $CD $7C $23
    call Func_037_47E4                          ; $4820: $CD $E4 $47
    ld   a, $80                                 ; $4823: $3E $80
.else_4825_37:
    ld   [$C211], a                             ; $4825: $EA $11 $C2
    ret                                         ; $4828: $C9


JumpTable_037_4829::
    ld   a, [$C19F]                             ; $4829: $FA $9F $C1
    and  a                                      ; $482C: $A7
    ret  nz                                     ; $482D: $C0

    xor  a                                      ; $482E: $AF
    ld   [$C210], a                             ; $482F: $EA $10 $C2
    jr   Func_037_47E4                          ; $4832: $18 $B0

JumpTable_037_4834::
    ld   hl, $C20F                              ; $4834: $21 $0F $C2
    inc  [hl]                                   ; $4837: $34
    ld   a, [hl]                                ; $4838: $7E
    cp   $05                                    ; $4839: $FE $05
    ret  c                                      ; $483B: $D8

    xor  a                                      ; $483C: $AF
    ld   [hl], a                                ; $483D: $77
    ld   a, [$C210]                             ; $483E: $FA $10 $C2
    inc  a                                      ; $4841: $3C
    and  %00000011                              ; $4842: $E6 $03
    ld   [$C210], a                             ; $4844: $EA $10 $C2
    ld   a, [$C211]                             ; $4847: $FA $11 $C2
    sub  $04                                    ; $484A: $D6 $04
    cp   $54                                    ; $484C: $FE $54
    jr   nc, .else_485A_37                      ; $484E: $30 $0A

    call Func_037_47E4                          ; $4850: $CD $E4 $47
    ld   a, $04                                 ; $4853: $3E $04
    ld   [$C210], a                             ; $4855: $EA $10 $C2
    ld   a, $51                                 ; $4858: $3E $51
.else_485A_37:
    ld   [$C211], a                             ; $485A: $EA $11 $C2
    ret                                         ; $485D: $C9


JumpTable_037_485E::
    ld   a, [$C202]                             ; $485E: $FA $02 $C2
    cp   $60                                    ; $4861: $FE $60
    jr   nc, .else_486A_37                      ; $4863: $30 $05

    inc  a                                      ; $4865: $3C
    ld   [$C202], a                             ; $4866: $EA $02 $C2
    ret                                         ; $4869: $C9


.else_486A_37:
    ld   a, [$C208]                             ; $486A: $FA $08 $C2
    cp   $3F                                    ; $486D: $FE $3F
    jr   c, .else_4876_37                       ; $486F: $38 $05

    dec  a                                      ; $4871: $3D
    ld   [$C208], a                             ; $4872: $EA $08 $C2
    ret                                         ; $4875: $C9


.else_4876_37:
    ld   a, $3E                                 ; $4876: $3E $3E
    call OpenDialogInTable2                     ; $4878: $CD $7C $23
    ld   a, $10                                 ; $487B: $3E $10
    ld   [$C213], a                             ; $487D: $EA $13 $C2
    call Func_037_47E4                          ; $4880: $CD $E4 $47
    ret                                         ; $4883: $C9


JumpTable_037_4884::
    ld   a, [$C19F]                             ; $4884: $FA $9F $C1
    and  a                                      ; $4887: $A7
    ret  nz                                     ; $4888: $C0

    ld   hl, $C213                              ; $4889: $21 $13 $C2
    dec  [hl]                                   ; $488C: $35
    ld   a, [hl]                                ; $488D: $7E
    bit  7, a                                   ; $488E: $CB $7F
    ret  z                                      ; $4890: $C8

    xor  a                                      ; $4891: $AF
    ld   [hl], a                                ; $4892: $77
    ld   hl, $C214                              ; $4893: $21 $14 $C2
    inc  [hl]                                   ; $4896: $34
    ld   a, $20                                 ; $4897: $3E $20
    ld   [$C213], a                             ; $4899: $EA $13 $C2
    call Func_037_47E4                          ; $489C: $CD $E4 $47
    ret                                         ; $489F: $C9


JumpTable_037_48A0::
    ld   a, [$C214]                             ; $48A0: $FA $14 $C2
    and  a                                      ; $48A3: $A7
    ret  nz                                     ; $48A4: $C0

    ld   hl, $C213                              ; $48A5: $21 $13 $C2
    dec  [hl]                                   ; $48A8: $35
    ld   a, [hl]                                ; $48A9: $7E
    bit  7, a                                   ; $48AA: $CB $7F
    ret  z                                      ; $48AC: $C8

    xor  a                                      ; $48AD: $AF
    ld   [hl], a                                ; $48AE: $77
    ld   a, $3F                                 ; $48AF: $3E $3F
    call OpenDialogInTable2                     ; $48B1: $CD $7C $23
    call Func_037_47E4                          ; $48B4: $CD $E4 $47
    ret                                         ; $48B7: $C9


JumpTable_037_48B8::
    ld   a, [$C19F]                             ; $48B8: $FA $9F $C1
    and  a                                      ; $48BB: $A7
    ret  nz                                     ; $48BC: $C0

    xor  a                                      ; $48BD: $AF
    ld   [$C210], a                             ; $48BE: $EA $10 $C2
    ld   [$C16C], a                             ; $48C1: $EA $6C $C1
    ld   [$C16B], a                             ; $48C4: $EA $6B $C1
    call Func_037_47E4                          ; $48C7: $CD $E4 $47
    ret                                         ; $48CA: $C9


JumpTable_037_48CB::
    ld   a, [$C211]                             ; $48CB: $FA $11 $C2
    cp   $28                                    ; $48CE: $FE $28
    jr   nc, .else_48E7_37                      ; $48D0: $30 $15

    call label_1A22                             ; $48D2: $CD $22 $1A
    ld   a, [$C16B]                             ; $48D5: $FA $6B $C1
    cp   $04                                    ; $48D8: $FE $04
    jr   nz, .else_48E7_37                      ; $48DA: $20 $0B

    call Func_037_53FE                          ; $48DC: $CD $FE $53
    ld   a, [$DC0C]                             ; $48DF: $FA $0C $DC
    or   $08                                    ; $48E2: $F6 $08
    ld   [$DC0C], a                             ; $48E4: $EA $0C $DC
.else_48E7_37:
    ld   hl, $C20F                              ; $48E7: $21 $0F $C2
    inc  [hl]                                   ; $48EA: $34
    ld   a, [hl]                                ; $48EB: $7E
    cp   $0A                                    ; $48EC: $FE $0A
    ret  c                                      ; $48EE: $D8

    xor  a                                      ; $48EF: $AF
    ld   [hl], a                                ; $48F0: $77
    ld   a, [$C210]                             ; $48F1: $FA $10 $C2
    inc  a                                      ; $48F4: $3C
    and  %00000011                              ; $48F5: $E6 $03
    ld   [$C210], a                             ; $48F7: $EA $10 $C2
    ld   a, [$C211]                             ; $48FA: $FA $11 $C2
    sub  $04                                    ; $48FD: $D6 $04
    ld   [$C211], a                             ; $48FF: $EA $11 $C2
    ret                                         ; $4902: $C9


    db   $00, $00, $6C, $06, $00, $08, $6E, $06 ; $4903 |..l...n.|
    db   $00, $10, $76, $06, $10, $00, $78, $06 ; $490B |..v...x.|
    db   $10, $08, $7A, $06, $10, $10, $7C, $06 ; $4913 |..z...|.|
    db   $F8, $00, $4C, $06, $F8, $08, $4E, $06 ; $491B |..L...N.|
    db   $F8, $10, $50, $06, $08, $00, $52, $06 ; $4923 |..P...R.|
    db   $08, $08, $54, $06, $08, $10, $56, $06 ; $492B |..T...V.|
    db   $F8, $00, $4C, $06, $F8, $08, $4E, $06 ; $4933 |..L...N.|
    db   $F8, $10, $50, $06, $08, $00, $58, $06 ; $493B |..P...X.|
    db   $08, $08, $5A, $06, $08, $10, $6A, $06 ; $4943 |..Z...j.|
    db   $00, $00, $40, $06, $00, $08, $42, $06 ; $494B |..@...B.|
    db   $00, $10, $44, $06, $10, $00, $46, $06 ; $4953 |..D...F.|
    db   $10, $08, $48, $06, $10, $10, $4A, $06 ; $495B |..H...J.|
    db   $03, $49, $1B, $49, $03, $49, $33, $49 ; $4963 |.I.I.I3I|
    db   $4B, $49, $18, $18, $18, $18, $18      ; $496B |KI.....|

Func_037_4972::
    ld   hl, $496D                              ; $4972: $21 $6D $49
    ld   a, [$C210]                             ; $4975: $FA $10 $C2
    ld   e, a                                   ; $4978: $5F
    ld   d, $00                                 ; $4979: $16 $00
    add  hl, de                                 ; $497B: $19
    ld   c, [hl]                                ; $497C: $4E
    sla  e                                      ; $497D: $CB $23
    ld   hl, $4963                              ; $497F: $21 $63 $49
    add  hl, de                                 ; $4982: $19
    ldi  a, [hl]                                ; $4983: $2A
    ld   h, [hl]                                ; $4984: $66
    ld   l, a                                   ; $4985: $6F
    ld   a, [$C212]                             ; $4986: $FA $12 $C2
    ldh  [hScratchA], a                         ; $4989: $E0 $D7
    ld   a, [$C211]                             ; $498B: $FA $11 $C2
    ldh  [hScratchB], a                         ; $498E: $E0 $D8
    call Func_037_4AB8                          ; $4990: $CD $B8 $4A
    ret                                         ; $4993: $C9


Func_037_4994::
    ld   a, [$C205]                             ; $4994: $FA $05 $C2
    JP_TABLE                                    ; $4997: $C7
    dw JumpTable_037_499C
    dw JumpTable_037_49CD

JumpTable_037_499C::
    ld   hl, $C204                              ; $499C: $21 $04 $C2
    inc  [hl]                                   ; $499F: $34
    ld   a, [hl]                                ; $49A0: $7E
    cp   $0A                                    ; $49A1: $FE $0A
    ret  c                                      ; $49A3: $D8

    xor  a                                      ; $49A4: $AF
    ld   [hl], a                                ; $49A5: $77
    ld   a, [$C201]                             ; $49A6: $FA $01 $C2
    inc  a                                      ; $49A9: $3C
    and  %00000011                              ; $49AA: $E6 $03
    ld   [$C201], a                             ; $49AC: $EA $01 $C2
    ld   hl, $C206                              ; $49AF: $21 $06 $C2
    ld   a, [$C202]                             ; $49B2: $FA $02 $C2
    add  $04                                    ; $49B5: $C6 $04
    bit  7, a                                   ; $49B7: $CB $7F
    jr   nz, .else_49C9_37                      ; $49B9: $20 $0E

    cp   [hl]                                   ; $49BB: $BE
    jr   c, .else_49C9_37                       ; $49BC: $38 $0B

    call Func_037_49CE                          ; $49BE: $CD $CE $49
    ld   a, $04                                 ; $49C1: $3E $04
    ld   [$C201], a                             ; $49C3: $EA $01 $C2
    ld   a, [$C206]                             ; $49C6: $FA $06 $C2
.else_49C9_37:
    ld   [$C202], a                             ; $49C9: $EA $02 $C2
    ret                                         ; $49CC: $C9


JumpTable_037_49CD::
    ret                                         ; $49CD: $C9


Func_037_49CE::
    ld   hl, $C205                              ; $49CE: $21 $05 $C2
    inc  [hl]                                   ; $49D1: $34
    ret                                         ; $49D2: $C9


Func_037_49D3::
    ld   hl, $57BD                              ; $49D3: $21 $BD $57
    ld   a, [$C201]                             ; $49D6: $FA $01 $C2
    ld   e, a                                   ; $49D9: $5F
    ld   d, $00                                 ; $49DA: $16 $00
    add  hl, de                                 ; $49DC: $19
    ld   c, [hl]                                ; $49DD: $4E
    ld   hl, $57B3                              ; $49DE: $21 $B3 $57
.Func_037_49E1::
    ld   a, [$C201]                             ; $49E1: $FA $01 $C2
    sla  a                                      ; $49E4: $CB $27
    ld   e, a                                   ; $49E6: $5F
    ld   d, $00                                 ; $49E7: $16 $00
    add  hl, de                                 ; $49E9: $19
    ldi  a, [hl]                                ; $49EA: $2A
    ld   h, [hl]                                ; $49EB: $66
    ld   l, a                                   ; $49EC: $6F
    ld   a, [$C203]                             ; $49ED: $FA $03 $C2
    ldh  [hScratchA], a                         ; $49F0: $E0 $D7
    ld   a, [$C202]                             ; $49F2: $FA $02 $C2
    ldh  [hScratchB], a                         ; $49F5: $E0 $D8
    call Func_037_4AB8                          ; $49F7: $CD $B8 $4A
    ret                                         ; $49FA: $C9


Func_037_49FB::
    ld   a, [$C20B]                             ; $49FB: $FA $0B $C2
    JP_TABLE                                    ; $49FE: $C7
    dw JumpTable_037_4A03
    dw JumpTable_037_49CD

JumpTable_037_4A03::
    ld   a, $68                                 ; $4A03: $3E $68
    ld   [$C209], a                             ; $4A05: $EA $09 $C2
    ld   hl, $C20A                              ; $4A08: $21 $0A $C2
    inc  [hl]                                   ; $4A0B: $34
    ld   a, [hl]                                ; $4A0C: $7E
    cp   $0A                                    ; $4A0D: $FE $0A
    ret  c                                      ; $4A0F: $D8

    xor  a                                      ; $4A10: $AF
    ld   [hl], a                                ; $4A11: $77
    ld   a, [$C207]                             ; $4A12: $FA $07 $C2
    inc  a                                      ; $4A15: $3C
    and  %00000011                              ; $4A16: $E6 $03
    ld   [$C207], a                             ; $4A18: $EA $07 $C2
    ld   a, [$C208]                             ; $4A1B: $FA $08 $C2
    add  $04                                    ; $4A1E: $C6 $04
    bit  7, a                                   ; $4A20: $CB $7F
    jr   nz, .else_4A33_37                      ; $4A22: $20 $0F

    cp   $40                                    ; $4A24: $FE $40
    jr   c, .else_4A33_37                       ; $4A26: $38 $0B

    ld   hl, $C20B                              ; $4A28: $21 $0B $C2
    inc  [hl]                                   ; $4A2B: $34
    ld   a, $04                                 ; $4A2C: $3E $04
    ld   [$C207], a                             ; $4A2E: $EA $07 $C2
    ld   a, $40                                 ; $4A31: $3E $40
.else_4A33_37:
    ld   [$C208], a                             ; $4A33: $EA $08 $C2
    ret                                         ; $4A36: $C9


Func_037_4A37::
    ld   hl, $5A56                              ; $4A37: $21 $56 $5A
    ld   a, [$C207]                             ; $4A3A: $FA $07 $C2
    ld   e, a                                   ; $4A3D: $5F
    ld   d, $00                                 ; $4A3E: $16 $00
    add  hl, de                                 ; $4A40: $19
    ld   c, [hl]                                ; $4A41: $4E
    ld   hl, $5A4C                              ; $4A42: $21 $4C $5A
.Func_037_4A45::
    ld   a, [$C207]                             ; $4A45: $FA $07 $C2
    sla  a                                      ; $4A48: $CB $27
    ld   e, a                                   ; $4A4A: $5F
    ld   d, $00                                 ; $4A4B: $16 $00
    add  hl, de                                 ; $4A4D: $19
    ldi  a, [hl]                                ; $4A4E: $2A
    ld   h, [hl]                                ; $4A4F: $66
    ld   l, a                                   ; $4A50: $6F
    ld   a, [$C209]                             ; $4A51: $FA $09 $C2
    ldh  [hScratchA], a                         ; $4A54: $E0 $D7
    ld   a, [$C208]                             ; $4A56: $FA $08 $C2
    ldh  [hScratchB], a                         ; $4A59: $E0 $D8
    call Func_037_4AB8                          ; $4A5B: $CD $B8 $4A
    ret                                         ; $4A5E: $C9


    db   $0E, $08, $21, $A7, $5A                ; $4A5F |..!.Z|

Func_037_4A64::
    ld   a, [$C21B]                             ; $4A64: $FA $1B $C2
    sla  a                                      ; $4A67: $CB $27
    ld   e, a                                   ; $4A69: $5F
    ld   d, $00                                 ; $4A6A: $16 $00
    add  hl, de                                 ; $4A6C: $19
    ldi  a, [hl]                                ; $4A6D: $2A
    ld   h, [hl]                                ; $4A6E: $66
    ld   l, a                                   ; $4A6F: $6F
    ld   a, [$C21D]                             ; $4A70: $FA $1D $C2
    ldh  [hScratchA], a                         ; $4A73: $E0 $D7
    ld   a, [$C21C]                             ; $4A75: $FA $1C $C2
    ldh  [hScratchB], a                         ; $4A78: $E0 $D8
    call Func_037_4AB8                          ; $4A7A: $CD $B8 $4A
    ret                                         ; $4A7D: $C9


    db   $48, $68, $5C, $03, $58, $68, $5E, $03 ; $4A7E |Hh\.Xh^.|
    db   $48, $68, $60, $03, $58, $68, $62, $03 ; $4A86 |Hh`.Xhb.|

Func_037_4A8E::
    ld   hl, $C20C                              ; $4A8E: $21 $0C $C2
    inc  [hl]                                   ; $4A91: $34
    ld   a, [hl]                                ; $4A92: $7E
    cp   $0A                                    ; $4A93: $FE $0A
    jr   c, .else_4AA1_37                       ; $4A95: $38 $0A

    xor  a                                      ; $4A97: $AF
    ld   [hl], a                                ; $4A98: $77
    ld   a, [$C20D]                             ; $4A99: $FA $0D $C2
    xor  $01                                    ; $4A9C: $EE $01
    ld   [$C20D], a                             ; $4A9E: $EA $0D $C2
.else_4AA1_37:
    ld   hl, $4A7E                              ; $4AA1: $21 $7E $4A
    ld   a, [$C20D]                             ; $4AA4: $FA $0D $C2
    and  a                                      ; $4AA7: $A7
    jr   z, .else_4AAD_37                       ; $4AA8: $28 $03

    ld   hl, $4A86                              ; $4AAA: $21 $86 $4A
.else_4AAD_37:
    xor  a                                      ; $4AAD: $AF
    ldh  [hScratchA], a                         ; $4AAE: $E0 $D7
    ldh  [hScratchB], a                         ; $4AB0: $E0 $D8
    ld   c, $08                                 ; $4AB2: $0E $08
    call Func_037_4AB8                          ; $4AB4: $CD $B8 $4A
    ret                                         ; $4AB7: $C9


Func_037_4AB8::
    push hl                                     ; $4AB8: $E5
    ld   a, [$C200]                             ; $4AB9: $FA $00 $C2
    ld   e, a                                   ; $4ABC: $5F
    add  c                                      ; $4ABD: $81
    ld   [$C200], a                             ; $4ABE: $EA $00 $C2
    ld   d, $00                                 ; $4AC1: $16 $00
    ld   hl, wOAMBuffer                         ; $4AC3: $21 $00 $C0
    add  hl, de                                 ; $4AC6: $19
    push hl                                     ; $4AC7: $E5
    pop  de                                     ; $4AC8: $D1
    pop  hl                                     ; $4AC9: $E1
    srl  c                                      ; $4ACA: $CB $39
    srl  c                                      ; $4ACC: $CB $39
.loop_4ACE_37:
    ldh  a, [hScratchA]                         ; $4ACE: $F0 $D7
    add  [hl]                                   ; $4AD0: $86
    ld   [de], a                                ; $4AD1: $12
    inc  de                                     ; $4AD2: $13
    inc  hl                                     ; $4AD3: $23
    ldh  a, [hScratchB]                         ; $4AD4: $F0 $D8
    add  [hl]                                   ; $4AD6: $86
    ld   [de], a                                ; $4AD7: $12
    inc  de                                     ; $4AD8: $13
    inc  hl                                     ; $4AD9: $23
    ld   a, [hl]                                ; $4ADA: $7E
    ld   [de], a                                ; $4ADB: $12
    inc  de                                     ; $4ADC: $13
    inc  hl                                     ; $4ADD: $23
    ld   a, [hl]                                ; $4ADE: $7E
    ld   [de], a                                ; $4ADF: $12
    inc  de                                     ; $4AE0: $13
    inc  hl                                     ; $4AE1: $23
    dec  c                                      ; $4AE2: $0D
    ld   a, c                                   ; $4AE3: $79
    and  a                                      ; $4AE4: $A7
    jr   nz, .loop_4ACE_37                      ; $4AE5: $20 $E7

    ret                                         ; $4AE7: $C9


JumpTable_037_4AE8::
    ld   hl, $C213                              ; $4AE8: $21 $13 $C2
    inc  [hl]                                   ; $4AEB: $34
    ld   a, [hl]                                ; $4AEC: $7E
    cp   $50                                    ; $4AED: $FE $50
    ret  nz                                     ; $4AEF: $C0

    ld   a, [$DC0C]                             ; $4AF0: $FA $0C $DC
    or   $10                                    ; $4AF3: $F6 $10
    ld   [$DC0C], a                             ; $4AF5: $EA $0C $DC
    xor  a                                      ; $4AF8: $AF
    ld   [hl], a                                ; $4AF9: $77
    xor  a                                      ; $4AFA: $AF
    ld   [$C16C], a                             ; $4AFB: $EA $6C $C1
    ld   [$C16B], a                             ; $4AFE: $EA $6B $C1
    call Func_037_53FE                          ; $4B01: $CD $FE $53
    ret                                         ; $4B04: $C9


JumpTable_037_4B05::
    ld   a, $1C                                 ; $4B05: $3E $1C
    ld   [$C200], a                             ; $4B07: $EA $00 $C2
    call JumpTable_037_4B1E                     ; $4B0A: $CD $1E $4B
    call Func_037_4B55                          ; $4B0D: $CD $55 $4B
    call Func_037_4552                          ; $4B10: $CD $52 $45
    ld   a, $37                                 ; $4B13: $3E $37
    call label_A9B                              ; $4B15: $CD $9B $0A
    ld   a, $37                                 ; $4B18: $3E $37
    call SwitchBank                             ; $4B1A: $CD $0C $08
    ret                                         ; $4B1D: $C9


JumpTable_037_4B1E::
    call Func_037_4F1B                          ; $4B1E: $CD $1B $4F
    call Func_037_4B31                          ; $4B21: $CD $31 $4B
    call Func_037_4F37                          ; $4B24: $CD $37 $4F
    ld   a, [$C275]                             ; $4B27: $FA $75 $C2
    and  %00000010                              ; $4B2A: $E6 $02
    ret  nz                                     ; $4B2C: $C0

    call Func_037_4E7F                          ; $4B2D: $CD $7F $4E
.JumpTable_037_4B30::
    ret                                         ; $4B30: $C9


Func_037_4B31::
    ld   hl, $5870                              ; $4B31: $21 $70 $58
    ld   a, [$C201]                             ; $4B34: $FA $01 $C2
    ld   e, a                                   ; $4B37: $5F
    ld   d, $00                                 ; $4B38: $16 $00
    add  hl, de                                 ; $4B3A: $19
    ld   c, [hl]                                ; $4B3B: $4E
    ld   hl, $5866                              ; $4B3C: $21 $66 $58
    sla  e                                      ; $4B3F: $CB $23
    ld   d, $00                                 ; $4B41: $16 $00
    add  hl, de                                 ; $4B43: $19
    ldi  a, [hl]                                ; $4B44: $2A
    ld   h, [hl]                                ; $4B45: $66
    ld   l, a                                   ; $4B46: $6F
    ld   a, [$C203]                             ; $4B47: $FA $03 $C2
    ldh  [hScratchA], a                         ; $4B4A: $E0 $D7
    ld   a, [$C202]                             ; $4B4C: $FA $02 $C2
    ldh  [hScratchB], a                         ; $4B4F: $E0 $D8
    call Func_037_4AB8                          ; $4B51: $CD $B8 $4A
    ret                                         ; $4B54: $C9


Func_037_4B55::
    ld   a, [$C19F]                             ; $4B55: $FA $9F $C1
    and  a                                      ; $4B58: $A7
    ret  nz                                     ; $4B59: $C0

    ld   a, [$C214]                             ; $4B5A: $FA $14 $C2
    and  a                                      ; $4B5D: $A7
    ret  nz                                     ; $4B5E: $C0

    ld   a, [$C275]                             ; $4B5F: $FA $75 $C2
    and  %00000010                              ; $4B62: $E6 $02
    call z, Func_037_4BAC                       ; $4B64: $CC $AC $4B
    ld   a, [$C224]                             ; $4B67: $FA $24 $C2
    JP_TABLE                                    ; $4B6A: $C7
    dw JumpTable_037_4C36
    dw JumpTable_037_4C75
    dw JumpTable_037_4CF9
    dw JumpTable_037_4D2E
    dw JumpTable_037_4C75
    dw JumpTable_037_4D43
    dw JumpTable_037_4C75
    dw JumpTable_037_4D7B
    dw JumpTable_037_4DB5
    dw JumpTable_037_4DC2
    dw JumpTable_037_4DD8
    dw JumpTable_037_4DEC
    dw JumpTable_037_4E41
    dw JumpTable_037_4E5F

Func_037_4B87::
    ld   a, [$C276]                             ; $4B87: $FA $76 $C2
    push af                                     ; $4B8A: $F5
    swap a                                      ; $4B8B: $CB $37
    and  %11110000                              ; $4B8D: $E6 $F0
    ld   hl, $C277                              ; $4B8F: $21 $77 $C2
    add  [hl]                                   ; $4B92: $86
    ld   [hl], a                                ; $4B93: $77
    rl   d                                      ; $4B94: $CB $12
    ld   hl, $C202                              ; $4B96: $21 $02 $C2
    pop  af                                     ; $4B99: $F1
    ld   e, $00                                 ; $4B9A: $1E $00
    bit  7, a                                   ; $4B9C: $CB $7F
    jr   z, .else_4BA2_37                       ; $4B9E: $28 $02

    ld   e, $F0                                 ; $4BA0: $1E $F0
.else_4BA2_37:
    swap a                                      ; $4BA2: $CB $37
    and  %00001111                              ; $4BA4: $E6 $0F
    or   e                                      ; $4BA6: $B3
    rr   d                                      ; $4BA7: $CB $1A
    adc  [hl]                                   ; $4BA9: $8E
    ld   [hl], a                                ; $4BAA: $77
    ret                                         ; $4BAB: $C9


Func_037_4BAC::
    ld   a, [$C271]                             ; $4BAC: $FA $71 $C2
    push af                                     ; $4BAF: $F5
    swap a                                      ; $4BB0: $CB $37
    and  %11110000                              ; $4BB2: $E6 $F0
    ld   hl, $C272                              ; $4BB4: $21 $72 $C2
    add  [hl]                                   ; $4BB7: $86
    ld   [hl], a                                ; $4BB8: $77
    rl   d                                      ; $4BB9: $CB $12
    ld   hl, $C222                              ; $4BBB: $21 $22 $C2
    pop  af                                     ; $4BBE: $F1
    ld   e, $00                                 ; $4BBF: $1E $00
    bit  7, a                                   ; $4BC1: $CB $7F
    jr   z, .else_4BC7_37                       ; $4BC3: $28 $02

    ld   e, $F0                                 ; $4BC5: $1E $F0
.else_4BC7_37:
    swap a                                      ; $4BC7: $CB $37
    and  %00001111                              ; $4BC9: $E6 $0F
    or   e                                      ; $4BCB: $B3
    rr   d                                      ; $4BCC: $CB $1A
    adc  [hl]                                   ; $4BCE: $8E
    cp   $70                                    ; $4BCF: $FE $70
    jr   c, .else_4BD5_37                       ; $4BD1: $38 $02

    ld   a, $70                                 ; $4BD3: $3E $70
.else_4BD5_37:
    ld   [hl], a                                ; $4BD5: $77
    ld   hl, $C271                              ; $4BD6: $21 $71 $C2
    ld   a, [hl]                                ; $4BD9: $7E
    add  $04                                    ; $4BDA: $C6 $04
    ld   [hl], a                                ; $4BDC: $77
    ld   a, [$C275]                             ; $4BDD: $FA $75 $C2
    and  a                                      ; $4BE0: $A7
    jr   z, .else_4BF0_37                       ; $4BE1: $28 $0D

    ld   a, [$C222]                             ; $4BE3: $FA $22 $C2
    cp   $70                                    ; $4BE6: $FE $70
    jr   c, .else_4C05_37                       ; $4BE8: $38 $1B

    xor  a                                      ; $4BEA: $AF
    ld   [$C271], a                             ; $4BEB: $EA $71 $C2
    jr   .else_4C31_37                          ; $4BEE: $18 $41

.else_4BF0_37:
    ld   a, [$C222]                             ; $4BF0: $FA $22 $C2
    cp   $70                                    ; $4BF3: $FE $70
    jr   c, .else_4C05_37                       ; $4BF5: $38 $0E

    call GetRandomByte                          ; $4BF7: $CD $0D $28
    and  %00001100                              ; $4BFA: $E6 $0C
    sla  a                                      ; $4BFC: $CB $27
    sla  a                                      ; $4BFE: $CB $27
    cpl                                         ; $4C00: $2F
    inc  a                                      ; $4C01: $3C
    ld   [$C271], a                             ; $4C02: $EA $71 $C2
.else_4C05_37:
    ld   hl, $C223                              ; $4C05: $21 $23 $C2
    ld   a, [$C273]                             ; $4C08: $FA $73 $C2
    and  a                                      ; $4C0B: $A7
    jr   nz, .else_4C18_37                      ; $4C0C: $20 $0A

    dec  [hl]                                   ; $4C0E: $35
    ld   a, [hl]                                ; $4C0F: $7E
    cp   $40                                    ; $4C10: $FE $40
    jr   nc, .else_4C31_37                      ; $4C12: $30 $1D

    ld   a, $40                                 ; $4C14: $3E $40
    jr   .Func_037_4C20                         ; $4C16: $18 $08

.else_4C18_37:
    inc  [hl]                                   ; $4C18: $34
    ld   a, [hl]                                ; $4C19: $7E
    cp   $70                                    ; $4C1A: $FE $70
    jr   c, .else_4C31_37                       ; $4C1C: $38 $13

    ld   a, $70                                 ; $4C1E: $3E $70
.Func_037_4C20::
    ld   [hl], a                                ; $4C20: $77
    ld   a, [$C273]                             ; $4C21: $FA $73 $C2
    xor  $01                                    ; $4C24: $EE $01
    ld   [$C273], a                             ; $4C26: $EA $73 $C2
    ld   a, [$C221]                             ; $4C29: $FA $21 $C2
    xor  $02                                    ; $4C2C: $EE $02
    ld   [$C221], a                             ; $4C2E: $EA $21 $C2
.else_4C31_37:
    xor  a                                      ; $4C31: $AF
    ld   [$C275], a                             ; $4C32: $EA $75 $C2
    ret                                         ; $4C35: $C9


JumpTable_037_4C36::
    ld   hl, $C213                              ; $4C36: $21 $13 $C2
    inc  [hl]                                   ; $4C39: $34
    ld   a, [hl]                                ; $4C3A: $7E
    cp   $50                                    ; $4C3B: $FE $50
    ret  c                                      ; $4C3D: $D8

    xor  a                                      ; $4C3E: $AF
    ld   [hl], a                                ; $4C3F: $77
    ld   [$C204], a                             ; $4C40: $EA $04 $C2
    ld   a, $70                                 ; $4C43: $3E $70
    call OpenDialogInTable2                     ; $4C45: $CD $7C $23
.Func_037_4C48::
    ld   hl, $C224                              ; $4C48: $21 $24 $C2
    inc  [hl]                                   ; $4C4B: $34
    ret                                         ; $4C4C: $C9


    db   $01, $02, $01, $03, $01, $02, $01, $03 ; $4C4D |........|
    db   $01, $02, $01, $03, $01, $02, $01, $03 ; $4C55 |........|
    db   $01, $02, $01, $03, $01, $02, $01, $03 ; $4C5D |........|
    db   $01, $02, $01, $03, $01, $02, $01, $03 ; $4C65 |........|
    db   $01, $02, $01, $03, $01, $02, $01, $03 ; $4C6D |........|

JumpTable_037_4C75::
    ld   hl, $C213                              ; $4C75: $21 $13 $C2
    inc  [hl]                                   ; $4C78: $34
    ld   a, [hl]                                ; $4C79: $7E
    cp   $08                                    ; $4C7A: $FE $08
    ret  c                                      ; $4C7C: $D8

    xor  a                                      ; $4C7D: $AF
    ld   [hl], a                                ; $4C7E: $77
    ld   hl, $C204                              ; $4C7F: $21 $04 $C2
    inc  [hl]                                   ; $4C82: $34
    ld   e, [hl]                                ; $4C83: $5E
    ld   d, $00                                 ; $4C84: $16 $00
    ld   hl, $4C4D                              ; $4C86: $21 $4D $4C
    add  hl, de                                 ; $4C89: $19
    ld   a, [hl]                                ; $4C8A: $7E
    ld   [$C201], a                             ; $4C8B: $EA $01 $C2
    ld   a, [$C202]                             ; $4C8E: $FA $02 $C2
    sub  $03                                    ; $4C91: $D6 $03
    ld   [$C202], a                             ; $4C93: $EA $02 $C2
    ld   a, [$C202]                             ; $4C96: $FA $02 $C2
    ld   hl, $C223                              ; $4C99: $21 $23 $C2
    sub  [hl]                                   ; $4C9C: $96
    bit  7, a                                   ; $4C9D: $CB $7F
    jr   nz, .else_4CA4_37                      ; $4C9F: $20 $03

    cp   $08                                    ; $4CA1: $FE $08
    ret  nc                                     ; $4CA3: $D0

.else_4CA4_37:
    xor  a                                      ; $4CA4: $AF
    ld   [$C213], a                             ; $4CA5: $EA $13 $C2
    ld   a, $02                                 ; $4CA8: $3E $02
    ld   [$C201], a                             ; $4CAA: $EA $01 $C2
    ld   a, [$C202]                             ; $4CAD: $FA $02 $C2
    sub  $04                                    ; $4CB0: $D6 $04
    ld   [$C202], a                             ; $4CB2: $EA $02 $C2
    ld   a, $10                                 ; $4CB5: $3E $10
    ld   [$C225], a                             ; $4CB7: $EA $25 $C2
    ld   a, JINGLE_SWORD_POKING                 ; $4CBA: $3E $07
    ldh  [hJingle], a                           ; $4CBC: $E0 $F2
    ld   a, $28                                 ; $4CBE: $3E $28
    ld   [$C276], a                             ; $4CC0: $EA $76 $C2
    ld   a, [$C203]                             ; $4CC3: $FA $03 $C2
    add  $03                                    ; $4CC6: $C6 $03
    ld   [$C279], a                             ; $4CC8: $EA $79 $C2
    ld   a, [$C202]                             ; $4CCB: $FA $02 $C2
    sub  $0C                                    ; $4CCE: $D6 $0C
    ld   [$C278], a                             ; $4CD0: $EA $78 $C2
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4CD3: $C3 $48 $4C

Func_037_4CD6::
    call Func_037_4B87                          ; $4CD6: $CD $87 $4B
    ld   a, [$C276]                             ; $4CD9: $FA $76 $C2
    and  a                                      ; $4CDC: $A7
    ret  z                                      ; $4CDD: $C8

    sub  $03                                    ; $4CDE: $D6 $03
    bit  7, a                                   ; $4CE0: $CB $7F
    jr   z, .else_4CE5_37                       ; $4CE2: $28 $01

    xor  a                                      ; $4CE4: $AF
.else_4CE5_37:
    ld   [$C276], a                             ; $4CE5: $EA $76 $C2
    ret                                         ; $4CE8: $C9


    db   $00, $01, $00, $01, $00, $01, $01, $00 ; $4CE9 |........|
    db   $00, $01, $00, $01, $00, $01, $01, $00 ; $4CF1 |........|

JumpTable_037_4CF9::
    ld   a, $01                                 ; $4CF9: $3E $01
    ld   [$C275], a                             ; $4CFB: $EA $75 $C2
    call Func_037_4CD6                          ; $4CFE: $CD $D6 $4C
    ld   a, [$C225]                             ; $4D01: $FA $25 $C2
    and  a                                      ; $4D04: $A7
    ret  nz                                     ; $4D05: $C0

    ld   hl, $C213                              ; $4D06: $21 $13 $C2
    inc  [hl]                                   ; $4D09: $34
    ld   a, [hl]                                ; $4D0A: $7E
    and  %00110000                              ; $4D0B: $E6 $30
    cp   $30                                    ; $4D0D: $FE $30
    jr   nz, .else_4D1B_37                      ; $4D0F: $20 $0A

    xor  a                                      ; $4D11: $AF
    ld   [hl], a                                ; $4D12: $77
    ld   a, $71                                 ; $4D13: $3E $71
    call OpenDialogInTable2                     ; $4D15: $CD $7C $23
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4D18: $C3 $48 $4C

.else_4D1B_37:
    swap a                                      ; $4D1B: $CB $37
    ld   e, a                                   ; $4D1D: $5F
    ld   d, $00                                 ; $4D1E: $16 $00
    ld   hl, $4CE9                              ; $4D20: $21 $E9 $4C
    add  hl, de                                 ; $4D23: $19
    ld   a, [$C221]                             ; $4D24: $FA $21 $C2
    and  %11111110                              ; $4D27: $E6 $FE
    or   [hl]                                   ; $4D29: $B6
    ld   [$C221], a                             ; $4D2A: $EA $21 $C2
    ret                                         ; $4D2D: $C9


JumpTable_037_4D2E::
    ld   hl, $C213                              ; $4D2E: $21 $13 $C2
    inc  [hl]                                   ; $4D31: $34
    ld   a, [hl]                                ; $4D32: $7E
    cp   $20                                    ; $4D33: $FE $20
    ret  nz                                     ; $4D35: $C0

    xor  a                                      ; $4D36: $AF
    ld   [hl], a                                ; $4D37: $77
    ld   [$C204], a                             ; $4D38: $EA $04 $C2
    ld   a, $72                                 ; $4D3B: $3E $72
    call OpenDialogInTable2                     ; $4D3D: $CD $7C $23
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4D40: $C3 $48 $4C

JumpTable_037_4D43::
    ld   a, $01                                 ; $4D43: $3E $01
    ld   [$C275], a                             ; $4D45: $EA $75 $C2
    call Func_037_4CD6                          ; $4D48: $CD $D6 $4C
    ld   a, [$C225]                             ; $4D4B: $FA $25 $C2
    and  a                                      ; $4D4E: $A7
    ret  nz                                     ; $4D4F: $C0

    ld   hl, $C213                              ; $4D50: $21 $13 $C2
    inc  [hl]                                   ; $4D53: $34
    ld   a, [hl]                                ; $4D54: $7E
    cp   $4F                                    ; $4D55: $FE $4F
    jr   nz, .else_4D66_37                      ; $4D57: $20 $0D

    xor  a                                      ; $4D59: $AF
    ld   [hl], a                                ; $4D5A: $77
    ld   [$C204], a                             ; $4D5B: $EA $04 $C2
    ld   a, $73                                 ; $4D5E: $3E $73
    call OpenDialogInTable2                     ; $4D60: $CD $7C $23
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4D63: $C3 $48 $4C

.else_4D66_37:
    and  %01110000                              ; $4D66: $E6 $70
    swap a                                      ; $4D68: $CB $37
    ld   e, a                                   ; $4D6A: $5F
    ld   d, $00                                 ; $4D6B: $16 $00
    ld   hl, $4CE9                              ; $4D6D: $21 $E9 $4C
    add  hl, de                                 ; $4D70: $19
    ld   a, [$C221]                             ; $4D71: $FA $21 $C2
    and  %11111110                              ; $4D74: $E6 $FE
    or   [hl]                                   ; $4D76: $B6
    ld   [$C221], a                             ; $4D77: $EA $21 $C2
    ret                                         ; $4D7A: $C9


JumpTable_037_4D7B::
    ld   a, $01                                 ; $4D7B: $3E $01
    ld   [$C275], a                             ; $4D7D: $EA $75 $C2
    call Func_037_4CD6                          ; $4D80: $CD $D6 $4C
    ld   a, [$C225]                             ; $4D83: $FA $25 $C2
    and  a                                      ; $4D86: $A7
    ret  nz                                     ; $4D87: $C0

    ld   hl, $C213                              ; $4D88: $21 $13 $C2
    inc  [hl]                                   ; $4D8B: $34
    ld   a, [hl]                                ; $4D8C: $7E
    cp   $68                                    ; $4D8D: $FE $68
    jr   nz, .else_4DA0_37                      ; $4D8F: $20 $0F

    ld   a, $02                                 ; $4D91: $3E $02
    ld   [$C275], a                             ; $4D93: $EA $75 $C2
    xor  a                                      ; $4D96: $AF
    ld   [hl], a                                ; $4D97: $77
    ld   a, $75                                 ; $4D98: $3E $75
    call OpenDialogInTable2                     ; $4D9A: $CD $7C $23
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4D9D: $C3 $48 $4C

.else_4DA0_37:
    and  %01110000                              ; $4DA0: $E6 $70
    swap a                                      ; $4DA2: $CB $37
    ld   e, a                                   ; $4DA4: $5F
    ld   d, $00                                 ; $4DA5: $16 $00
    ld   hl, $4CE9                              ; $4DA7: $21 $E9 $4C
    add  hl, de                                 ; $4DAA: $19
    ld   a, [$C221]                             ; $4DAB: $FA $21 $C2
    and  %11111110                              ; $4DAE: $E6 $FE
    or   [hl]                                   ; $4DB0: $B6
    ld   [$C221], a                             ; $4DB1: $EA $21 $C2
    ret                                         ; $4DB4: $C9


JumpTable_037_4DB5::
    ld   a, $02                                 ; $4DB5: $3E $02
    ld   [$C275], a                             ; $4DB7: $EA $75 $C2
    ld   a, $74                                 ; $4DBA: $3E $74
    call OpenDialogInTable2                     ; $4DBC: $CD $7C $23
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4DBF: $C3 $48 $4C

JumpTable_037_4DC2::
    xor  a                                      ; $4DC2: $AF
    ld   [$C201], a                             ; $4DC3: $EA $01 $C2
    ld   hl, $C213                              ; $4DC6: $21 $13 $C2
    inc  [hl]                                   ; $4DC9: $34
    ld   a, [hl]                                ; $4DCA: $7E
    cp   $40                                    ; $4DCB: $FE $40
    ret  nz                                     ; $4DCD: $C0

    xor  a                                      ; $4DCE: $AF
    ld   [hl], a                                ; $4DCF: $77
    ld   a, $04                                 ; $4DD0: $3E $04
    ld   [$C201], a                             ; $4DD2: $EA $01 $C2
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4DD5: $C3 $48 $4C

JumpTable_037_4DD8::
    ld   hl, $C213                              ; $4DD8: $21 $13 $C2
    inc  [hl]                                   ; $4DDB: $34
    ld   a, [hl]                                ; $4DDC: $7E
    cp   $30                                    ; $4DDD: $FE $30
    ret  nz                                     ; $4DDF: $C0

    xor  a                                      ; $4DE0: $AF
    ld   [hl], a                                ; $4DE1: $77
    ld   a, $04                                 ; $4DE2: $3E $04
    ld   [$C221], a                             ; $4DE4: $EA $21 $C2
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4DE7: $C3 $48 $4C

    db   $02, $FE                               ; $4DEA |..|

JumpTable_037_4DEC::
    ld   hl, $C213                              ; $4DEC: $21 $13 $C2
    inc  [hl]                                   ; $4DEF: $34
    ld   a, [hl]                                ; $4DF0: $7E
    and  %00000111                              ; $4DF1: $E6 $07
    jr   nz, .else_4DFD_37                      ; $4DF3: $20 $08

    ld   a, [$C221]                             ; $4DF5: $FA $21 $C2
    xor  $01                                    ; $4DF8: $EE $01
    ld   [$C221], a                             ; $4DFA: $EA $21 $C2
.else_4DFD_37:
    ld   a, $02                                 ; $4DFD: $3E $02
    ld   [$C275], a                             ; $4DFF: $EA $75 $C2
    ld   a, [hl]                                ; $4E02: $7E
    and  %00000011                              ; $4E03: $E6 $03
    jr   nz, .else_4E23_37                      ; $4E05: $20 $1C

    ld   a, [hl]                                ; $4E07: $7E
    srl  a                                      ; $4E08: $CB $3F
    srl  a                                      ; $4E0A: $CB $3F
    and  %00000001                              ; $4E0C: $E6 $01
    ld   e, a                                   ; $4E0E: $5F
    ld   d, $00                                 ; $4E0F: $16 $00
    push hl                                     ; $4E11: $E5
    ld   hl, $4DEA                              ; $4E12: $21 $EA $4D
    add  hl, de                                 ; $4E15: $19
    ld   a, [hl]                                ; $4E16: $7E
    ld   hl, $C223                              ; $4E17: $21 $23 $C2
    add  [hl]                                   ; $4E1A: $86
    ld   [$C223], a                             ; $4E1B: $EA $23 $C2
    ld   hl, $C222                              ; $4E1E: $21 $22 $C2
    dec  [hl]                                   ; $4E21: $35
    pop  hl                                     ; $4E22: $E1
.else_4E23_37:
    ld   a, [hl]                                ; $4E23: $7E
    cp   $30                                    ; $4E24: $FE $30
    ret  nz                                     ; $4E26: $C0

    xor  a                                      ; $4E27: $AF
    ld   [hl], a                                ; $4E28: $77
    ld   a, $06                                 ; $4E29: $3E $06
    ld   [$C221], a                             ; $4E2B: $EA $21 $C2
    ld   a, [$C223]                             ; $4E2E: $FA $23 $C2
    add  $03                                    ; $4E31: $C6 $03
    ld   [$C223], a                             ; $4E33: $EA $23 $C2
    ld   a, [$C222]                             ; $4E36: $FA $22 $C2
    sub  $03                                    ; $4E39: $D6 $03
    ld   [$C222], a                             ; $4E3B: $EA $22 $C2
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4E3E: $C3 $48 $4C

JumpTable_037_4E41::
    ld   a, $02                                 ; $4E41: $3E $02
    ld   [$C275], a                             ; $4E43: $EA $75 $C2
    ld   hl, $C213                              ; $4E46: $21 $13 $C2
    inc  [hl]                                   ; $4E49: $34
    ld   a, [hl]                                ; $4E4A: $7E
    cp   $10                                    ; $4E4B: $FE $10
    ret  c                                      ; $4E4D: $D8

    ld   a, $07                                 ; $4E4E: $3E $07
    ld   [$C221], a                             ; $4E50: $EA $21 $C2
    ld   a, [hl]                                ; $4E53: $7E
    cp   $20                                    ; $4E54: $FE $20
    ret  nz                                     ; $4E56: $C0

    ld   a, $01                                 ; $4E57: $3E $01
    ld   [$C214], a                             ; $4E59: $EA $14 $C2
    jp   JumpTable_037_4C36.Func_037_4C48       ; $4E5C: $C3 $48 $4C

JumpTable_037_4E5F::
    ld   a, [$C214]                             ; $4E5F: $FA $14 $C2
    and  a                                      ; $4E62: $A7
    ret  nz                                     ; $4E63: $C0

    ld   hl, $C213                              ; $4E64: $21 $13 $C2
    inc  [hl]                                   ; $4E67: $34
    ld   a, [hl]                                ; $4E68: $7E
    cp   $50                                    ; $4E69: $FE $50
    ret  nz                                     ; $4E6B: $C0

    ld   a, [$DC0C]                             ; $4E6C: $FA $0C $DC
    or   $20                                    ; $4E6F: $F6 $20
    ld   [$DC0C], a                             ; $4E71: $EA $0C $DC
    xor  a                                      ; $4E74: $AF
    ld   [$C16C], a                             ; $4E75: $EA $6C $C1
    ld   [$C16B], a                             ; $4E78: $EA $6B $C1
    call Func_037_53FE                          ; $4E7B: $CD $FE $53
    ret                                         ; $4E7E: $C9


Func_037_4E7F::
    ld   a, [$C223]                             ; $4E7F: $FA $23 $C2
    ld   [$C251], a                             ; $4E82: $EA $51 $C2
    ld   a, [$C222]                             ; $4E85: $FA $22 $C2
    ld   [$C261], a                             ; $4E88: $EA $61 $C2
    ld   de, $C251                              ; $4E8B: $11 $51 $C2
    ld   hl, $C252                              ; $4E8E: $21 $52 $C2
    ld   c, $05                                 ; $4E91: $0E $05
.loop_4E93_37:
    ld   a, [de]                                ; $4E93: $1A
    sub  [hl]                                   ; $4E94: $96
    add  $07                                    ; $4E95: $C6 $07
    cp   $0E                                    ; $4E97: $FE $0E
    jr   c, .else_4EA5_37                       ; $4E99: $38 $0A

    bit  7, a                                   ; $4E9B: $CB $7F
    jr   nz, .else_4EA3_37                      ; $4E9D: $20 $04

    inc  [hl]                                   ; $4E9F: $34
    inc  [hl]                                   ; $4EA0: $34
    inc  [hl]                                   ; $4EA1: $34
    inc  [hl]                                   ; $4EA2: $34
.else_4EA3_37:
    dec  [hl]                                   ; $4EA3: $35
    dec  [hl]                                   ; $4EA4: $35
.else_4EA5_37:
    inc  hl                                     ; $4EA5: $23
    inc  de                                     ; $4EA6: $13
    dec  c                                      ; $4EA7: $0D
    jr   nz, .loop_4E93_37                      ; $4EA8: $20 $E9

    ld   de, $C261                              ; $4EAA: $11 $61 $C2
    ld   hl, $C262                              ; $4EAD: $21 $62 $C2
    ld   c, $05                                 ; $4EB0: $0E $05
.loop_4EB2_37:
    ld   a, [de]                                ; $4EB2: $1A
    sub  [hl]                                   ; $4EB3: $96
    add  $07                                    ; $4EB4: $C6 $07
    cp   $0E                                    ; $4EB6: $FE $0E
    jr   c, .else_4EC4_37                       ; $4EB8: $38 $0A

    bit  7, a                                   ; $4EBA: $CB $7F
    jr   nz, .else_4EC2_37                      ; $4EBC: $20 $04

    inc  [hl]                                   ; $4EBE: $34
    inc  [hl]                                   ; $4EBF: $34
    inc  [hl]                                   ; $4EC0: $34
    inc  [hl]                                   ; $4EC1: $34
.else_4EC2_37:
    dec  [hl]                                   ; $4EC2: $35
    dec  [hl]                                   ; $4EC3: $35
.else_4EC4_37:
    inc  hl                                     ; $4EC4: $23
    inc  de                                     ; $4EC5: $13
    dec  c                                      ; $4EC6: $0D
    jr   nz, .loop_4EB2_37                      ; $4EC7: $20 $E9

    ldh  a, [hFrameCounter]                     ; $4EC9: $F0 $E7
    and  %00000001                              ; $4ECB: $E6 $01
    jr   z, .else_4EDE_37                       ; $4ECD: $28 $0F

    ld   hl, $C261                              ; $4ECF: $21 $61 $C2
.loop_4ED2_37:
    ld   a, [hl]                                ; $4ED2: $7E
    cp   $70                                    ; $4ED3: $FE $70
    jr   z, .else_4ED8_37                       ; $4ED5: $28 $01

    inc  [hl]                                   ; $4ED7: $34
.else_4ED8_37:
    inc  hl                                     ; $4ED8: $23
    ld   a, l                                   ; $4ED9: $7D
    and  %00001111                              ; $4EDA: $E6 $0F
    jr   nz, .loop_4ED2_37                      ; $4EDC: $20 $F4

.else_4EDE_37:
    ld   a, [$C200]                             ; $4EDE: $FA $00 $C2
    ld   e, a                                   ; $4EE1: $5F
    add  $0C                                    ; $4EE2: $C6 $0C
    ld   [$C200], a                             ; $4EE4: $EA $00 $C2
    ld   d, $00                                 ; $4EE7: $16 $00
    ld   hl, wOAMBuffer                         ; $4EE9: $21 $00 $C0
    add  hl, de                                 ; $4EEC: $19
    push hl                                     ; $4EED: $E5
    pop  de                                     ; $4EEE: $D1
    ld   c, $05                                 ; $4EEF: $0E $05
.loop_4EF1_37:
    ldh  a, [hFrameCounter]                     ; $4EF1: $F0 $E7
    xor  c                                      ; $4EF3: $A9
    rra                                         ; $4EF4: $1F
    jr   c, .else_4F0F_37                       ; $4EF5: $38 $18

    ld   hl, $C261                              ; $4EF7: $21 $61 $C2
    add  hl, bc                                 ; $4EFA: $09
    ld   a, [hl]                                ; $4EFB: $7E
    ld   [de], a                                ; $4EFC: $12
    inc  de                                     ; $4EFD: $13
    ld   hl, $C251                              ; $4EFE: $21 $51 $C2
    add  hl, bc                                 ; $4F01: $09
    ld   a, [hl]                                ; $4F02: $7E
    add  $04                                    ; $4F03: $C6 $04
    ld   [de], a                                ; $4F05: $12
    inc  de                                     ; $4F06: $13
    ld   a, $7E                                 ; $4F07: $3E $7E
    ld   [de], a                                ; $4F09: $12
    inc  de                                     ; $4F0A: $13
    ld   a, $00                                 ; $4F0B: $3E $00
    ld   [de], a                                ; $4F0D: $12
    inc  de                                     ; $4F0E: $13
.else_4F0F_37:
    dec  c                                      ; $4F0F: $0D
    jr   nz, .loop_4EF1_37                      ; $4F10: $20 $DF

    ret                                         ; $4F12: $C9


    db   $00, $00, $5E, $20, $00, $08, $5E, $00 ; $4F13 |..^ ..^.|

Func_037_4F1B::
    ld   a, [$C225]                             ; $4F1B: $FA $25 $C2
    and  a                                      ; $4F1E: $A7
    ret  z                                      ; $4F1F: $C8

    dec  a                                      ; $4F20: $3D
    ld   [$C225], a                             ; $4F21: $EA $25 $C2
    ld   hl, $4F13                              ; $4F24: $21 $13 $4F
    ld   a, [$C279]                             ; $4F27: $FA $79 $C2
    ldh  [hScratchA], a                         ; $4F2A: $E0 $D7
    ld   a, [$C278]                             ; $4F2C: $FA $78 $C2
    ldh  [hScratchB], a                         ; $4F2F: $E0 $D8
    ld   c, $08                                 ; $4F31: $0E $08
    call Func_037_4AB8                          ; $4F33: $CD $B8 $4A
    ret                                         ; $4F36: $C9


Func_037_4F37::
    ld   hl, $5C7F                              ; $4F37: $21 $7F $5C
    ld   a, [$C221]                             ; $4F3A: $FA $21 $C2
    ld   e, a                                   ; $4F3D: $5F
    ld   d, $00                                 ; $4F3E: $16 $00
    add  hl, de                                 ; $4F40: $19
    ld   c, [hl]                                ; $4F41: $4E
    ld   hl, $5C6F                              ; $4F42: $21 $6F $5C
    sla  e                                      ; $4F45: $CB $23
    ld   d, $00                                 ; $4F47: $16 $00
    add  hl, de                                 ; $4F49: $19
    ldi  a, [hl]                                ; $4F4A: $2A
    ld   h, [hl]                                ; $4F4B: $66
    ld   l, a                                   ; $4F4C: $6F
    ld   a, [$C222]                             ; $4F4D: $FA $22 $C2
    ldh  [hScratchA], a                         ; $4F50: $E0 $D7
    ld   a, [$C223]                             ; $4F52: $FA $23 $C2
    ldh  [hScratchB], a                         ; $4F55: $E0 $D8
    call Func_037_4AB8                          ; $4F57: $CD $B8 $4A
    ret                                         ; $4F5A: $C9


JumpTable_037_4F5B::
    ldh  a, [hJoypadState]                      ; $4F5B: $F0 $CC
    and  J_START                                ; $4F5D: $E6 $80
    jr   z, .else_4F6B_37                       ; $4F5F: $28 $0A

    xor  a                                      ; $4F61: $AF
    ld   [$C16C], a                             ; $4F62: $EA $6C $C1
    ld   [$C16B], a                             ; $4F65: $EA $6B $C1
    call Func_037_53FE                          ; $4F68: $CD $FE $53
.else_4F6B_37:
    call Func_037_4F70                          ; $4F6B: $CD $70 $4F
    ret                                         ; $4F6E: $C9


JumpTable_037_4F6F::
    ret                                         ; $4F6F: $C9


Func_037_4F70::
    ld   a, [$C19F]                             ; $4F70: $FA $9F $C1
    and  a                                      ; $4F73: $A7
    ret  nz                                     ; $4F74: $C0

    ld   a, [$C205]                             ; $4F75: $FA $05 $C2
    JP_TABLE                                    ; $4F78: $C7
    dw JumpTable_037_4F7D
    dw JumpTable_037_49CD

JumpTable_037_4F7D::
    ld   hl, $C213                              ; $4F7D: $21 $13 $C2
    inc  [hl]                                   ; $4F80: $34
    ld   a, [hl]                                ; $4F81: $7E
    cp   $70                                    ; $4F82: $FE $70
    ret  nz                                     ; $4F84: $C0

    xor  a                                      ; $4F85: $AF
    ld   [$C16C], a                             ; $4F86: $EA $6C $C1
    ld   [$C16B], a                             ; $4F89: $EA $6B $C1
    ld   a, [$DC0C]                             ; $4F8C: $FA $0C $DC
    or   $80                                    ; $4F8F: $F6 $80
    ld   [$DC0C], a                             ; $4F91: $EA $0C $DC
    call Func_037_53FE                          ; $4F94: $CD $FE $53
    call Func_037_49CE                          ; $4F97: $CD $CE $49
    ret                                         ; $4F9A: $C9


JumpTable_037_4F9B::
    ld   hl, $C213                              ; $4F9B: $21 $13 $C2
    inc  [hl]                                   ; $4F9E: $34
    ld   a, [hl]                                ; $4F9F: $7E
    cp   $50                                    ; $4FA0: $FE $50
    ret  nz                                     ; $4FA2: $C0

    xor  a                                      ; $4FA3: $AF
    ld   [$C16C], a                             ; $4FA4: $EA $6C $C1
    ld   [$C16B], a                             ; $4FA7: $EA $6B $C1
    ld   a, [$DC0D]                             ; $4FAA: $FA $0D $DC
    or   $01                                    ; $4FAD: $F6 $01
    ld   [$DC0D], a                             ; $4FAF: $EA $0D $DC
    call Func_037_53FE                          ; $4FB2: $CD $FE $53
    ret                                         ; $4FB5: $C9


JumpTable_037_4FB6::
    ret                                         ; $4FB6: $C9


JumpTable_037_4FB7::
    ld   a, $1C                                 ; $4FB7: $3E $1C
    ld   [$C200], a                             ; $4FB9: $EA $00 $C2
    call JumpTable_037_4FD0                     ; $4FBC: $CD $D0 $4F
    call Func_037_500B                          ; $4FBF: $CD $0B $50
    call Func_037_4552                          ; $4FC2: $CD $52 $45
    ld   a, $37                                 ; $4FC5: $3E $37
    call label_A9B                              ; $4FC7: $CD $9B $0A
    ld   a, $37                                 ; $4FCA: $3E $37
    call SwitchBank                             ; $4FCC: $CD $0C $08
    ret                                         ; $4FCF: $C9


JumpTable_037_4FD0::
    ld   hl, $5B69                              ; $4FD0: $21 $69 $5B
    ld   a, [$C219]                             ; $4FD3: $FA $19 $C2
    ld   e, a                                   ; $4FD6: $5F
    ld   d, $00                                 ; $4FD7: $16 $00
    add  hl, de                                 ; $4FD9: $19
    ld   c, [hl]                                ; $4FDA: $4E
    ld   hl, $5B5D                              ; $4FDB: $21 $5D $5B
    sla  e                                      ; $4FDE: $CB $23
    add  hl, de                                 ; $4FE0: $19
    ldi  a, [hl]                                ; $4FE1: $2A
    ld   h, [hl]                                ; $4FE2: $66
    ld   l, a                                   ; $4FE3: $6F
    ld   a, [$C216]                             ; $4FE4: $FA $16 $C2
    ldh  [hScratchA], a                         ; $4FE7: $E0 $D7
    ld   a, [$C217]                             ; $4FE9: $FA $17 $C2
    ldh  [hScratchB], a                         ; $4FEC: $E0 $D8
    call Func_037_4AB8                          ; $4FEE: $CD $B8 $4A
    ld   hl, $5941                              ; $4FF1: $21 $41 $59
    ld   a, [$C201]                             ; $4FF4: $FA $01 $C2
    ld   e, a                                   ; $4FF7: $5F
    ld   d, $00                                 ; $4FF8: $16 $00
    add  hl, de                                 ; $4FFA: $19
    ld   c, [hl]                                ; $4FFB: $4E
    ld   hl, $5935                              ; $4FFC: $21 $35 $59
    call Func_037_49D3.Func_037_49E1            ; $4FFF: $CD $E1 $49
    ld   c, $08                                 ; $5002: $0E $08
    ld   hl, $5ADD                              ; $5004: $21 $DD $5A
    call Func_037_4A64                          ; $5007: $CD $64 $4A
    ret                                         ; $500A: $C9


Func_037_500B::
    ld   a, [$C19F]                             ; $500B: $FA $9F $C1
    and  a                                      ; $500E: $A7
    ret  nz                                     ; $500F: $C0

    ld   a, [$C215]                             ; $5010: $FA $15 $C2
    JP_TABLE                                    ; $5013: $C7
    dw JumpTable_037_506F
    dw JumpTable_037_5081
    dw JumpTable_037_506F
    dw JumpTable_037_50AA
    dw JumpTable_037_50D5
    dw JumpTable_037_510A
    dw JumpTable_037_5165
    dw JumpTable_037_5177
    dw JumpTable_037_5192
    dw JumpTable_037_51AB

Func_037_5028::
    ld   a, [$C202]                             ; $5028: $FA $02 $C2
    cp   $3E                                    ; $502B: $FE $3E
    jr   nz, .else_5040_37                      ; $502D: $20 $11

    ld   a, [$C21C]                             ; $502F: $FA $1C $C2
    cp   $52                                    ; $5032: $FE $52
    ret  nz                                     ; $5034: $C0

    ld   a, $2E                                 ; $5035: $3E $2E
    call OpenDialogInTable2                     ; $5037: $CD $7C $23
    call JumpTable_037_506F.Func_037_507C       ; $503A: $CD $7C $50
    ld   [hl], $04                              ; $503D: $36 $04
    ret                                         ; $503F: $C9


.else_5040_37:
    ld   hl, $C204                              ; $5040: $21 $04 $C2
    inc  [hl]                                   ; $5043: $34
    ld   a, [hl]                                ; $5044: $7E
    cp   $0A                                    ; $5045: $FE $0A
    ret  c                                      ; $5047: $D8

    xor  a                                      ; $5048: $AF
    ld   [hl], a                                ; $5049: $77
    ld   a, [$C201]                             ; $504A: $FA $01 $C2
    xor  $01                                    ; $504D: $EE $01
    ld   [$C201], a                             ; $504F: $EA $01 $C2
    ld   hl, $C203                              ; $5052: $21 $03 $C2
    dec  [hl]                                   ; $5055: $35
    ld   a, [$C202]                             ; $5056: $FA $02 $C2
    add  $04                                    ; $5059: $C6 $04
    ld   [$C202], a                             ; $505B: $EA $02 $C2
    bit  7, a                                   ; $505E: $CB $7F
    ret  nz                                     ; $5060: $C0

    cp   $3E                                    ; $5061: $FE $3E
    ret  c                                      ; $5063: $D8

    ld   a, $02                                 ; $5064: $3E $02
    ld   [$C201], a                             ; $5066: $EA $01 $C2
    ld   a, $3E                                 ; $5069: $3E $3E
    ld   [$C202], a                             ; $506B: $EA $02 $C2
    ret                                         ; $506E: $C9


JumpTable_037_506F::
    call Func_037_5028                          ; $506F: $CD $28 $50
    ld   hl, $C213                              ; $5072: $21 $13 $C2
    inc  [hl]                                   ; $5075: $34
    ld   a, [hl]                                ; $5076: $7E
    cp   $30                                    ; $5077: $FE $30
    ret  nz                                     ; $5079: $C0

    xor  a                                      ; $507A: $AF
    ld   [hl], a                                ; $507B: $77
.Func_037_507C::
    ld   hl, $C215                              ; $507C: $21 $15 $C2
    inc  [hl]                                   ; $507F: $34
    ret                                         ; $5080: $C9


JumpTable_037_5081::
    call Func_037_5028                          ; $5081: $CD $28 $50
    ld   hl, $C21F                              ; $5084: $21 $1F $C2
    inc  [hl]                                   ; $5087: $34
    ld   a, [hl]                                ; $5088: $7E
    cp   $0A                                    ; $5089: $FE $0A
    ret  c                                      ; $508B: $D8

    xor  a                                      ; $508C: $AF
    ld   [hl], a                                ; $508D: $77
    ld   a, [$C21B]                             ; $508E: $FA $1B $C2
    and  %00000001                              ; $5091: $E6 $01
    xor  $01                                    ; $5093: $EE $01
    ld   [$C21B], a                             ; $5095: $EA $1B $C2
    ld   a, [$C21C]                             ; $5098: $FA $1C $C2
    add  $04                                    ; $509B: $C6 $04
    cp   $70                                    ; $509D: $FE $70
    jr   c, .else_50A6_37                       ; $509F: $38 $05

    call JumpTable_037_506F.Func_037_507C       ; $50A1: $CD $7C $50
    ld   a, $70                                 ; $50A4: $3E $70
.else_50A6_37:
    ld   [$C21C], a                             ; $50A6: $EA $1C $C2
    ret                                         ; $50A9: $C9


JumpTable_037_50AA::
    call Func_037_5028                          ; $50AA: $CD $28 $50
    ld   hl, $C21F                              ; $50AD: $21 $1F $C2
    inc  [hl]                                   ; $50B0: $34
    ld   a, [hl]                                ; $50B1: $7E
    cp   $0A                                    ; $50B2: $FE $0A
    ret  c                                      ; $50B4: $D8

    xor  a                                      ; $50B5: $AF
    ld   [hl], a                                ; $50B6: $77
    ld   a, [$C21B]                             ; $50B7: $FA $1B $C2
    or   $02                                    ; $50BA: $F6 $02
    xor  $01                                    ; $50BC: $EE $01
    ld   [$C21B], a                             ; $50BE: $EA $1B $C2
    ld   a, [$C21C]                             ; $50C1: $FA $1C $C2
    sub  $04                                    ; $50C4: $D6 $04
    cp   $54                                    ; $50C6: $FE $54
    jr   nc, .else_50D1_37                      ; $50C8: $30 $07

    call JumpTable_037_506F.Func_037_507C       ; $50CA: $CD $7C $50
    ld   [hl], $00                              ; $50CD: $36 $00
    ld   a, $52                                 ; $50CF: $3E $52
.else_50D1_37:
    ld   [$C21C], a                             ; $50D1: $EA $1C $C2
    ret                                         ; $50D4: $C9


JumpTable_037_50D5::
    ld   hl, $C21A                              ; $50D5: $21 $1A $C2
    inc  [hl]                                   ; $50D8: $34
    ld   a, [hl]                                ; $50D9: $7E
    cp   $0A                                    ; $50DA: $FE $0A
    ret  c                                      ; $50DC: $D8

    xor  a                                      ; $50DD: $AF
    ld   [hl], a                                ; $50DE: $77
    ld   a, [$C219]                             ; $50DF: $FA $19 $C2
    xor  $01                                    ; $50E2: $EE $01
    ld   [$C219], a                             ; $50E4: $EA $19 $C2
    ld   a, [$C217]                             ; $50E7: $FA $17 $C2
    sub  $04                                    ; $50EA: $D6 $04
    ld   [$C217], a                             ; $50EC: $EA $17 $C2
    cp   $80                                    ; $50EF: $FE $80
    jr   c, .else_50F8_37                       ; $50F1: $38 $05

    ld   hl, $C216                              ; $50F3: $21 $16 $C2
    dec  [hl]                                   ; $50F6: $35
    ret                                         ; $50F7: $C9


.else_50F8_37:
    ld   a, $80                                 ; $50F8: $3E $80
    ld   [$C217], a                             ; $50FA: $EA $17 $C2
    xor  a                                      ; $50FD: $AF
    ld   [$C219], a                             ; $50FE: $EA $19 $C2
    ld   a, $3C                                 ; $5101: $3E $3C
    call OpenDialogInTable2                     ; $5103: $CD $7C $23
    call JumpTable_037_506F.Func_037_507C       ; $5106: $CD $7C $50
    ret                                         ; $5109: $C9


JumpTable_037_510A::
    ld   a, $04                                 ; $510A: $3E $04
    ld   [$C201], a                             ; $510C: $EA $01 $C2
    ld   a, [$C21B]                             ; $510F: $FA $1B $C2
    and  %00000001                              ; $5112: $E6 $01
    or   $04                                    ; $5114: $F6 $04
    ld   [$C21B], a                             ; $5116: $EA $1B $C2
    ldh  a, [hFrameCounter]                     ; $5119: $F0 $E7
    and  %00000111                              ; $511B: $E6 $07
    jr   nz, .else_5127_37                      ; $511D: $20 $08

    ld   a, [$C21B]                             ; $511F: $FA $1B $C2
    xor  $01                                    ; $5122: $EE $01
    ld   [$C21B], a                             ; $5124: $EA $1B $C2
.else_5127_37:
    ldh  a, [hFrameCounter]                     ; $5127: $F0 $E7
    and  %00000001                              ; $5129: $E6 $01
    jr   nz, .else_5131_37                      ; $512B: $20 $04

    ld   hl, $C21D                              ; $512D: $21 $1D $C2
    inc  [hl]                                   ; $5130: $34
.else_5131_37:
    ld   hl, $C21A                              ; $5131: $21 $1A $C2
    inc  [hl]                                   ; $5134: $34
    ld   a, [hl]                                ; $5135: $7E
    cp   $0A                                    ; $5136: $FE $0A
    ret  c                                      ; $5138: $D8

    xor  a                                      ; $5139: $AF
    ld   [hl], a                                ; $513A: $77
    ld   a, [$C219]                             ; $513B: $FA $19 $C2
    xor  $01                                    ; $513E: $EE $01
    ld   [$C219], a                             ; $5140: $EA $19 $C2
    ld   hl, $C216                              ; $5143: $21 $16 $C2
    dec  [hl]                                   ; $5146: $35
    ld   a, [$C217]                             ; $5147: $FA $17 $C2
    sub  $04                                    ; $514A: $D6 $04
    ld   [$C217], a                             ; $514C: $EA $17 $C2
    cp   $58                                    ; $514F: $FE $58
    ret  nc                                     ; $5151: $D0

    ld   a, $56                                 ; $5152: $3E $56
    ld   [$C217], a                             ; $5154: $EA $17 $C2
    ld   a, $04                                 ; $5157: $3E $04
    ld   [$C219], a                             ; $5159: $EA $19 $C2
    ld   a, $49                                 ; $515C: $3E $49
    call OpenDialogInTable2                     ; $515E: $CD $7C $23
    call JumpTable_037_506F.Func_037_507C       ; $5161: $CD $7C $50
    ret                                         ; $5164: $C9


JumpTable_037_5165::
    ld   a, $04                                 ; $5165: $3E $04
    ld   [$C201], a                             ; $5167: $EA $01 $C2
    ld   hl, $C213                              ; $516A: $21 $13 $C2
    inc  [hl]                                   ; $516D: $34
    ld   a, [hl]                                ; $516E: $7E
    cp   $40                                    ; $516F: $FE $40
    ret  nz                                     ; $5171: $C0

    xor  a                                      ; $5172: $AF
    ld   [hl], a                                ; $5173: $77
    jp   JumpTable_037_506F.Func_037_507C       ; $5174: $C3 $7C $50

JumpTable_037_5177::
    ld   a, $05                                 ; $5177: $3E $05
    ld   [$C201], a                             ; $5179: $EA $01 $C2
    ld   a, $05                                 ; $517C: $3E $05
    ld   [$C219], a                             ; $517E: $EA $19 $C2
    ld   hl, $C213                              ; $5181: $21 $13 $C2
    inc  [hl]                                   ; $5184: $34
    ld   a, [hl]                                ; $5185: $7E
    cp   $40                                    ; $5186: $FE $40
    ret  nz                                     ; $5188: $C0

    xor  a                                      ; $5189: $AF
    ld   [hl], a                                ; $518A: $77
    ld   hl, $C214                              ; $518B: $21 $14 $C2
    inc  [hl]                                   ; $518E: $34
    jp   JumpTable_037_506F.Func_037_507C       ; $518F: $C3 $7C $50

JumpTable_037_5192::
    ld   a, [$C214]                             ; $5192: $FA $14 $C2
    and  a                                      ; $5195: $A7
    ret  nz                                     ; $5196: $C0

    ld   hl, $C213                              ; $5197: $21 $13 $C2
    inc  [hl]                                   ; $519A: $34
    ld   a, [hl]                                ; $519B: $7E
    cp   $20                                    ; $519C: $FE $20
    ret  nz                                     ; $519E: $C0

    xor  a                                      ; $519F: $AF
    ld   [$C219], a                             ; $51A0: $EA $19 $C2
    ld   a, $54                                 ; $51A3: $3E $54
    call OpenDialogInTable2                     ; $51A5: $CD $7C $23
    jp   JumpTable_037_506F.Func_037_507C       ; $51A8: $C3 $7C $50

JumpTable_037_51AB::
    ld   a, $04                                 ; $51AB: $3E $04
    ld   [$C201], a                             ; $51AD: $EA $01 $C2
    ld   a, [$C217]                             ; $51B0: $FA $17 $C2
    cp   $28                                    ; $51B3: $FE $28
    jr   nc, .else_51CE_37                      ; $51B5: $30 $17

    call label_1A22                             ; $51B7: $CD $22 $1A
    ld   a, [$C16B]                             ; $51BA: $FA $6B $C1
    cp   $04                                    ; $51BD: $FE $04
    jr   nz, .else_51D5_37                      ; $51BF: $20 $14

    call Func_037_53FE                          ; $51C1: $CD $FE $53
    ld   a, [$DC0D]                             ; $51C4: $FA $0D $DC
    or   $02                                    ; $51C7: $F6 $02
    ld   [$DC0D], a                             ; $51C9: $EA $0D $DC
    jr   .else_51D5_37                          ; $51CC: $18 $07

.else_51CE_37:
    xor  a                                      ; $51CE: $AF
    ld   [$C16C], a                             ; $51CF: $EA $6C $C1
    ld   [$C16B], a                             ; $51D2: $EA $6B $C1
.else_51D5_37:
    ld   hl, $C21A                              ; $51D5: $21 $1A $C2
    inc  [hl]                                   ; $51D8: $34
    ld   a, [hl]                                ; $51D9: $7E
    cp   $06                                    ; $51DA: $FE $06
    ret  c                                      ; $51DC: $D8

    xor  a                                      ; $51DD: $AF
    ld   [hl], a                                ; $51DE: $77
    ld   a, [$C219]                             ; $51DF: $FA $19 $C2
    xor  $01                                    ; $51E2: $EE $01
    ld   [$C219], a                             ; $51E4: $EA $19 $C2
    ld   a, [$C217]                             ; $51E7: $FA $17 $C2
    sub  $04                                    ; $51EA: $D6 $04
    ld   [$C217], a                             ; $51EC: $EA $17 $C2
    ld   hl, $C216                              ; $51EF: $21 $16 $C2
    inc  [hl]                                   ; $51F2: $34
    ret                                         ; $51F3: $C9


JumpTable_037_51F4::
    ld   a, $1C                                 ; $51F4: $3E $1C
    ld   [$C200], a                             ; $51F6: $EA $00 $C2
    ldh  a, [hJoypadState]                      ; $51F9: $F0 $CC
    and  J_START                                ; $51FB: $E6 $80
    jr   z, .else_51FF_37                       ; $51FD: $28 $00

.else_51FF_37:
    call JumpTable_037_532E                     ; $51FF: $CD $2E $53
    call Func_037_533F                          ; $5202: $CD $3F $53
    call Func_037_5216                          ; $5205: $CD $16 $52
    call Func_037_4552                          ; $5208: $CD $52 $45
    ld   a, $37                                 ; $520B: $3E $37
    call label_A9B                              ; $520D: $CD $9B $0A
    ld   a, $37                                 ; $5210: $3E $37
    call SwitchBank                             ; $5212: $CD $0C $08
    ret                                         ; $5215: $C9


Func_037_5216::
    ld   a, [$C205]                             ; $5216: $FA $05 $C2
    JP_TABLE                                    ; $5219: $C7
    dw JumpTable_037_5228
    dw JumpTable_037_5257
    dw JumpTable_037_526F
    dw JumpTable_037_527D
    dw JumpTable_037_52EE
    dw JumpTable_037_52FB
    dw JumpTable_037_530D

JumpTable_037_5228::
    ld   hl, $C213                              ; $5228: $21 $13 $C2
    inc  [hl]                                   ; $522B: $34
    ld   a, [hl]                                ; $522C: $7E
    cp   $08                                    ; $522D: $FE $08
    ret  nz                                     ; $522F: $C0

    xor  a                                      ; $5230: $AF
    ld   [hl], a                                ; $5231: $77
    ld   a, [$C24E]                             ; $5232: $FA $4E $C2
    xor  $01                                    ; $5235: $EE $01
    ld   [$C24E], a                             ; $5237: $EA $4E $C2
    ld   a, [$C250]                             ; $523A: $FA $50 $C2
    sub  $03                                    ; $523D: $D6 $03
    ld   [$C250], a                             ; $523F: $EA $50 $C2
    cp   $6C                                    ; $5242: $FE $6C
    ret  nc                                     ; $5244: $D0

    ld   a, $6E                                 ; $5245: $3E $6E
    ld   [$C250], a                             ; $5247: $EA $50 $C2
    xor  a                                      ; $524A: $AF
    ld   [$C24E], a                             ; $524B: $EA $4E $C2
    call Func_037_49CE                          ; $524E: $CD $CE $49
    ld   a, $AF                                 ; $5251: $3E $AF
    call OpenDialogInTable2                     ; $5253: $CD $7C $23
    ret                                         ; $5256: $C9


JumpTable_037_5257::
    ld   a, [$C19F]                             ; $5257: $FA $9F $C1
    and  a                                      ; $525A: $A7
    ret  nz                                     ; $525B: $C0

    ld   a, $2E                                 ; $525C: $3E $2E
    call OpenDialogInTable1                     ; $525E: $CD $73 $23
    ld   a, $01                                 ; $5261: $3E $01
    ld   [$C201], a                             ; $5263: $EA $01 $C2
    ld   hl, $C202                              ; $5266: $21 $02 $C2
    dec  [hl]                                   ; $5269: $35
    dec  [hl]                                   ; $526A: $35
    call Func_037_49CE                          ; $526B: $CD $CE $49
    ret                                         ; $526E: $C9


JumpTable_037_526F::
    ld   a, [$C19F]                             ; $526F: $FA $9F $C1
    and  a                                      ; $5272: $A7
    ret  nz                                     ; $5273: $C0

    ld   a, $01                                 ; $5274: $3E $01
    ld   [$C24E], a                             ; $5276: $EA $4E $C2
    call Func_037_49CE                          ; $5279: $CD $CE $49
    ret                                         ; $527C: $C9


JumpTable_037_527D::
    call Func_037_52B0                          ; $527D: $CD $B0 $52
    ld   hl, $C213                              ; $5280: $21 $13 $C2
    inc  [hl]                                   ; $5283: $34
    ld   a, [hl]                                ; $5284: $7E
    cp   $08                                    ; $5285: $FE $08
    ret  nz                                     ; $5287: $C0

    xor  a                                      ; $5288: $AF
    ld   [hl], a                                ; $5289: $77
    ld   a, [$C24E]                             ; $528A: $FA $4E $C2
    xor  $01                                    ; $528D: $EE $01
    ld   [$C24E], a                             ; $528F: $EA $4E $C2
    ld   a, [$C24F]                             ; $5292: $FA $4F $C2
    add  $02                                    ; $5295: $C6 $02
    ld   [$C24F], a                             ; $5297: $EA $4F $C2
    push af                                     ; $529A: $F5
    and  %00000011                              ; $529B: $E6 $03
    jr   nz, .else_52A3_37                      ; $529D: $20 $04

    ld   hl, $C250                              ; $529F: $21 $50 $C2
    dec  [hl]                                   ; $52A2: $35
.else_52A3_37:
    pop  af                                     ; $52A3: $F1
    cp   $B0                                    ; $52A4: $FE $B0
    ret  c                                      ; $52A6: $D8

    call Func_037_49CE                          ; $52A7: $CD $CE $49
    ld   a, $F6                                 ; $52AA: $3E $F6
    call OpenDialogInTable1                     ; $52AC: $CD $73 $23
    ret                                         ; $52AF: $C9


Func_037_52B0::
    ld   a, [$C201]                             ; $52B0: $FA $01 $C2
    cp   $05                                    ; $52B3: $FE $05
    ret  z                                      ; $52B5: $C8

    ld   hl, $C204                              ; $52B6: $21 $04 $C2
    inc  [hl]                                   ; $52B9: $34
    ld   a, [hl]                                ; $52BA: $7E
    cp   $0A                                    ; $52BB: $FE $0A
    ret  nz                                     ; $52BD: $C0

    xor  a                                      ; $52BE: $AF
    ld   [hl], a                                ; $52BF: $77
    ld   hl, $C201                              ; $52C0: $21 $01 $C2
    inc  [hl]                                   ; $52C3: $34
    ld   a, [hl]                                ; $52C4: $7E
    cp   $05                                    ; $52C5: $FE $05
    jr   nz, .else_52CC_37                      ; $52C7: $20 $03

    ld   a, $01                                 ; $52C9: $3E $01
    ld   [hl], a                                ; $52CB: $77
.else_52CC_37:
    ld   a, [$C202]                             ; $52CC: $FA $02 $C2
    add  $04                                    ; $52CF: $C6 $04
    cp   $61                                    ; $52D1: $FE $61
    jr   c, .else_52D7_37                       ; $52D3: $38 $02

    ld   a, $61                                 ; $52D5: $3E $61
.else_52D7_37:
    ld   [$C202], a                             ; $52D7: $EA $02 $C2
    ld   a, [$C203]                             ; $52DA: $FA $03 $C2
    sub  $01                                    ; $52DD: $D6 $01
    cp   $55                                    ; $52DF: $FE $55
    jr   nc, .else_52EA_37                      ; $52E1: $30 $07

    ld   a, $05                                 ; $52E3: $3E $05
    ld   [$C201], a                             ; $52E5: $EA $01 $C2
    ld   a, $55                                 ; $52E8: $3E $55
.else_52EA_37:
    ld   [$C203], a                             ; $52EA: $EA $03 $C2
    ret                                         ; $52ED: $C9


JumpTable_037_52EE::
    ld   a, [$C19F]                             ; $52EE: $FA $9F $C1
    and  a                                      ; $52F1: $A7
    ret  nz                                     ; $52F2: $C0

    ld   a, $06                                 ; $52F3: $3E $06
    ld   [$C201], a                             ; $52F5: $EA $01 $C2
    jp   Func_037_49CE                          ; $52F8: $C3 $CE $49

JumpTable_037_52FB::
    ld   hl, $C213                              ; $52FB: $21 $13 $C2
    inc  [hl]                                   ; $52FE: $34
    ld   a, [hl]                                ; $52FF: $7E
    cp   $30                                    ; $5300: $FE $30
    ret  nz                                     ; $5302: $C0

    xor  a                                      ; $5303: $AF
    ld   [hl], a                                ; $5304: $77
    inc  a                                      ; $5305: $3C
    ld   [$C214], a                             ; $5306: $EA $14 $C2
    call Func_037_49CE                          ; $5309: $CD $CE $49
    ret                                         ; $530C: $C9


JumpTable_037_530D::
    ld   a, [$C214]                             ; $530D: $FA $14 $C2
    and  a                                      ; $5310: $A7
    ret  nz                                     ; $5311: $C0

    ld   hl, $C213                              ; $5312: $21 $13 $C2
    inc  [hl]                                   ; $5315: $34
    ld   a, [hl]                                ; $5316: $7E
    cp   $50                                    ; $5317: $FE $50
    ret  nz                                     ; $5319: $C0

    xor  a                                      ; $531A: $AF
    ld   [hl], a                                ; $531B: $77
    ld   [$C16C], a                             ; $531C: $EA $6C $C1
    ld   [$C16B], a                             ; $531F: $EA $6B $C1
    call Func_037_53FE                          ; $5322: $CD $FE $53
    ld   a, [$DC0D]                             ; $5325: $FA $0D $DC
    or   $04                                    ; $5328: $F6 $04
    ld   [$DC0D], a                             ; $532A: $EA $0D $DC
    ret                                         ; $532D: $C9


JumpTable_037_532E::
    ld   hl, $59DD                              ; $532E: $21 $DD $59
    ld   a, [$C201]                             ; $5331: $FA $01 $C2
    ld   e, a                                   ; $5334: $5F
    ld   d, $00                                 ; $5335: $16 $00
    add  hl, de                                 ; $5337: $19
    ld   c, [hl]                                ; $5338: $4E
    ld   hl, $59CF                              ; $5339: $21 $CF $59
    jp   Func_037_49D3.Func_037_49E1            ; $533C: $C3 $E1 $49

Func_037_533F::
    ld   c, $08                                 ; $533F: $0E $08
    ld   hl, $5CDB                              ; $5341: $21 $DB $5C
    ld   a, [$C24E]                             ; $5344: $FA $4E $C2
    sla  a                                      ; $5347: $CB $27
    ld   e, a                                   ; $5349: $5F
    ld   d, $00                                 ; $534A: $16 $00
    add  hl, de                                 ; $534C: $19
    ldi  a, [hl]                                ; $534D: $2A
    ld   h, [hl]                                ; $534E: $66
    ld   l, a                                   ; $534F: $6F
    ld   a, [$C24F]                             ; $5350: $FA $4F $C2
    ldh  [hScratchA], a                         ; $5353: $E0 $D7
    ld   a, [$C250]                             ; $5355: $FA $50 $C2
    ldh  [hScratchB], a                         ; $5358: $E0 $D8
    call Func_037_4AB8                          ; $535A: $CD $B8 $4A
    ret                                         ; $535D: $C9


JumpTable_037_535E::
    ld   hl, $C213                              ; $535E: $21 $13 $C2
    inc  [hl]                                   ; $5361: $34
    ld   a, [hl]                                ; $5362: $7E
    cp   $40                                    ; $5363: $FE $40
    ret  nz                                     ; $5365: $C0

    ld   a, [$DC0D]                             ; $5366: $FA $0D $DC
    or   $08                                    ; $5369: $F6 $08
    ld   [$DC0D], a                             ; $536B: $EA $0D $DC
    xor  a                                      ; $536E: $AF
    ld   [$C16C], a                             ; $536F: $EA $6C $C1
    ld   [$C16B], a                             ; $5372: $EA $6B $C1
    call Func_037_53FE                          ; $5375: $CD $FE $53
    ret                                         ; $5378: $C9


    db   $50, $50, $28, $00, $58, $59, $50, $00 ; $5379 |PP(.XYP.|
    db   $60, $78, $58, $28, $43, $24, $24, $50 ; $5381 |`xX(C$$P|
    db   $00, $70, $70, $70, $00, $3C, $40, $40 ; $5389 |.ppp.<@@|
    db   $72, $50                               ; $5391 |rP|

JumpTable_037_5393::
    ld   a, [wGameplayType]                     ; $5393: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_MARIN_CLIFF             ; $5396: $FE $10
    jr   nz, .else_539D_37                      ; $5398: $20 $03

    call Func_037_4331                          ; $539A: $CD $31 $43
.else_539D_37:
    call label_1A22                             ; $539D: $CD $22 $1A
    ld   a, [$C16B]                             ; $53A0: $FA $6B $C1
    cp   $04                                    ; $53A3: $FE $04
    ret  nz                                     ; $53A5: $C0

    call LCDOff                                 ; $53A6: $CD $CF $28
    ld   a, $37                                 ; $53A9: $3E $37
    call label_BBE                              ; $53AB: $CD $BE $0B
    ld   a, [wGameplayType]                     ; $53AE: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_GHOST                   ; $53B1: $FE $19
    jr   nz, .else_53C9_37                      ; $53B3: $20 $14

    ld   a, [$FFFE]                             ; $53B5: $F0 $FE
    and  a                                      ; $53B7: $A7
    jr   nz, .else_53BE_37                      ; $53B8: $20 $04

    ld   a, $0E                                 ; $53BA: $3E $0E
    jr   .Func_037_53C0                         ; $53BC: $18 $02

.else_53BE_37:
    ld   a, $2E                                 ; $53BE: $3E $2E
.Func_037_53C0::
    ld   b, $42                                 ; $53C0: $06 $42
    ld   c, $06                                 ; $53C2: $0E $06
    ld   h, $37                                 ; $53C4: $26 $37
    call Copy100BytesFromBankAtA                ; $53C6: $CD $13 $0A
.else_53C9_37:
                                                ; $53C9: $3E $C7
    ld   a, $C7
    ld   [wLCDControl], a                       ; $53CB: $EA $FD $D6
    ld   [rLCDC], a                             ; $53CE: $E0 $40
    ld   hl, $5379                              ; $53D0: $21 $79 $53
    ld   a, [wGameplayType]                     ; $53D3: $FA $95 $DB
    sub  $0E                                    ; $53D6: $D6 $0E
    ld   e, a                                   ; $53D8: $5F
    ld   d, $00                                 ; $53D9: $16 $00
    add  hl, de                                 ; $53DB: $19
    ld   a, [hl]                                ; $53DC: $7E
    ld   [$DB9D], a                             ; $53DD: $EA $9D $DB
    ld   hl, $5386                              ; $53E0: $21 $86 $53
    add  hl, de                                 ; $53E3: $19
    ld   a, [hl]                                ; $53E4: $7E
    ld   [$DB9E], a                             ; $53E5: $EA $9E $DB
    xor  a                                      ; $53E8: $AF
    ldh  [hLinkAnimationState], a               ; $53E9: $E0 $9D
    ld   a, DIRECTION_DOWN                      ; $53EB: $3E $03
    ldh  [hLinkDirection], a                    ; $53ED: $E0 $9E
    ld   a, GAMEPLAY_WORLD                      ; $53EF: $3E $0B
    ld   [wGameplayType], a                     ; $53F1: $EA $95 $DB
    xor  a                                      ; $53F4: $AF
    ld   [wGameplaySubtype], a                  ; $53F5: $EA $96 $DB
    ld   a, $02                                 ; $53F8: $3E $02
    ld   [wBGMapToLoad], a                      ; $53FA: $EA $FF $D6
    ret                                         ; $53FD: $C9


Func_037_53FE::
    ld   hl, wGameplaySubtype                   ; $53FE: $21 $96 $DB
    inc  [hl]                                   ; $5401: $34
    ret                                         ; $5402: $C9


    db   $21, $B0, $C3, $09, $C9, $21, $40, $C2 ; $5403 |!....!@.|
    db   $09, $C9, $FF, $47, $CA, $26, $22, $4D ; $540B |...G.&"M|
    db   $00, $00, $DF, $5B, $97, $6E, $2E, $6D ; $5413 |...[.n.m|
    db   $00, $00, $FF, $47, $DF, $3A, $DB, $01 ; $541B |...G.:..|
    db   $00, $00, $FF, $47, $00, $76, $22, $4D ; $5423 |...G.v"M|
    db   $00, $00, $FF, $47, $BC, $06, $83, $26 ; $542B |...G...&|
    db   $00, $00, $FF, $47, $D9, $11, $2D, $00 ; $5433 |...G..-.|
    db   $68, $04, $FF, $47, $CE, $10, $25, $00 ; $543B |h..G..%.|
    db   $00, $00, $FF, $47, $D9, $11, $CE, $10 ; $5443 |...G....|
    db   $00, $00, $FE, $63, $00, $00, $83, $26 ; $544B |...c...&|
    db   $DF, $3A, $FE, $63, $00, $00, $FF, $01 ; $5453 |.:.c....|
    db   $DF, $3A, $FE, $63, $00, $00, $7D, $04 ; $545B |.:.c..}.|
    db   $5F, $5B, $FE, $63, $00, $00, $3A, $00 ; $5463 |_[.c..:.|
    db   $FF, $01, $C7, $1C, $C7, $1C, $C7, $1C ; $546B |........|
    db   $C7, $1C, $FF, $47, $CA, $26, $40, $01 ; $5473 |...G.&@.|
    db   $00, $00, $C7, $1C, $C7, $1C, $C7, $1C ; $547B |........|
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C ; $5483 |........|
    db   $C7, $1C, $FF, $47, $C4, $26, $21, $15 ; $548B |...G.&!.|
    db   $00, $00, $DF, $5B, $97, $6E, $2E, $6D ; $5493 |...[.n.m|
    db   $00, $00, $1F, $40, $C4, $26, $21, $15 ; $549B |...@.&!.|
    db   $00, $00, $FF, $47, $F3, $51, $67, $28 ; $54A3 |...G.Qg(|
    db   $00, $00, $C4, $26, $21, $15, $31, $46 ; $54AB |...&!.1F|
    db   $00, $00, $FF, $47, $68, $7D, $C5, $4C ; $54B3 |...Gh}.L|
    db   $00, $00, $D8, $52, $D9, $11, $CE, $10 ; $54BB |...R....|
    db   $00, $00, $FF, $47, $C4, $26, $21, $15 ; $54C3 |...G.&!.|
    db   $00, $00, $FE, $63, $00, $00, $00, $03 ; $54CB |...c....|
    db   $DF, $3A, $FE, $63, $00, $00, $FF, $01 ; $54D3 |.:.c....|
    db   $DF, $3A, $FE, $63, $00, $00, $7D, $04 ; $54DB |.:.c..}.|
    db   $5F, $5B, $FE, $63, $00, $00, $31, $46 ; $54E3 |_[.c..1F|
    db   $FE, $63, $00, $00, $00, $00, $00, $00 ; $54EB |.c......|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54F3 |........|
    db   $00, $00, $FE, $63, $00, $00, $DF, $3A ; $54FB |...c...:|
    db   $7D, $04, $00, $00, $00, $00, $00, $00 ; $5503 |}.......|
    db   $00, $00, $FF, $47, $F3, $51, $67, $28 ; $550B |...G.Qg(|
    db   $00, $00, $DF, $5B, $97, $6E, $2E, $6D ; $5513 |...[.n.m|
    db   $00, $00, $FF, $47, $CA, $26, $21, $15 ; $551B |...G.&!.|
    db   $00, $00, $FF, $47, $D9, $11, $CE, $10 ; $5523 |...G....|
    db   $00, $00, $FF, $47, $C3, $7C, $00, $2C ; $552B |...G.|.,|
    db   $00, $00, $FF, $47, $D9, $11, $21, $15 ; $5533 |...G..!.|
    db   $00, $00, $FF, $47, $75, $7C, $CA, $26 ; $553B |...Gu|.&|
    db   $00, $00, $FF, $47, $17, $14, $08, $10 ; $5543 |...G....|
    db   $00, $00, $FE, $63, $65, $14, $00, $03 ; $554B |...ce...|
    db   $3F, $53, $DF, $7D, $00, $00, $31, $46 ; $5553 |?S.}..1F|
    db   $FE, $63, $FE, $63, $00, $00, $7D, $04 ; $555B |.c.c..}.|
    db   $5F, $5B, $00, $00, $00, $00, $00, $00 ; $5563 |_[......|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $556B |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5573 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $557B |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5583 |........|
    db   $00, $00, $7F, $5B, $14, $2E, $4E, $19 ; $558B |...[..N.|
    db   $A9, $08, $00, $00, $00, $00, $00, $00 ; $5593 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $559B |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55A3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55AB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55B3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55BB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55C3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55CB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55D3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55DB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55E3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55EB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55F3 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $55FB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5603 |........|
    db   $00, $00, $FF, $47, $F4, $41, $68, $7D ; $560B |...G.Ah}|
    db   $C7, $1C, $DF, $5B, $97, $6E, $2E, $6D ; $5613 |...[.n.m|
    db   $00, $00, $0F, $4B, $00, $00, $06, $00 ; $561B |...K....|
    db   $88, $00, $68, $7D, $F3, $51, $C6, $18 ; $5623 |..h}.Q..|
    db   $00, $00, $FF, $47, $F3, $51, $67, $28 ; $562B |...G.Qg(|
    db   $00, $00, $FF, $47, $15, $36, $0C, $10 ; $5633 |...G.6..|
    db   $00, $00, $0F, $4B, $D9, $11, $CE, $10 ; $563B |...K....|
    db   $00, $00, $F3, $51, $15, $36, $0C, $10 ; $5643 |...Q.6..|
    db   $00, $00, $FE, $63, $65, $14, $00, $03 ; $564B |...ce...|
    db   $FF, $46, $FE, $63, $65, $14, $E5, $7D ; $5653 |.F.ce..}|
    db   $FF, $46, $FE, $63, $00, $00, $7D, $04 ; $565B |.F.c..}.|
    db   $5F, $5B, $FF, $7F, $00, $00, $71, $44 ; $5663 |_[....qD|
    db   $7F, $7D, $C7, $1C, $C7, $1C, $C7, $1C ; $566B |.}......|
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C ; $5673 |........|
    db   $C7, $1C, $DE, $73, $DF, $1E, $34, $01 ; $567B |...s..4.|
    db   $C7, $1C, $FE, $63, $94, $5A, $6A, $39 ; $5683 |...c.Zj9|
    db   $C7, $1C, $FF, $47, $CA, $26, $40, $01 ; $568B |...G.&@.|
    db   $00, $00, $DF, $5B, $97, $6E, $2E, $6D ; $5693 |...[.n.m|
    db   $00, $00, $FF, $47, $F3, $51, $67, $28 ; $569B |...G.Qg(|
    db   $00, $00, $FF, $47, $D9, $11, $CE, $10 ; $56A3 |...G....|
    db   $00, $00, $FF, $47, $17, $14, $DF, $01 ; $56AB |...G....|
    db   $00, $00, $FF, $47, $FF, $7F, $DF, $01 ; $56B3 |...G....|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56BB |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56C3 |........|
    db   $00, $00, $FE, $63, $06, $00, $83, $26 ; $56CB |...c...&|
    db   $DF, $3A, $C7, $1C, $83, $26, $40, $01 ; $56D3 |.:...&@.|
    db   $C7, $1C, $FE, $63, $00, $00, $7D, $04 ; $56DB |...c..}.|
    db   $5F, $5B, $FF, $7F, $00, $00, $71, $44 ; $56E3 |_[....qD|
    db   $7F, $7D, $C7, $1C, $C7, $1C, $C7, $1C ; $56EB |.}......|
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C ; $56F3 |........|
    db   $C7, $1C, $DE, $73, $DF, $1E, $34, $01 ; $56FB |...s..4.|
    db   $C7, $1C, $FE, $63, $94, $5A, $6A, $39 ; $5703 |...c.Zj9|
    db   $C7, $1C                               ; $570B |...U.U.T|

; Palette data?
Data_037_570D::
    db   $8D, $55, $8D, $55, $0D, $54
    db   $00, $00, $8D, $54, $8D, $55, $0D, $55 ; $5713 |...T.U.U|
    db   $00, $00, $8D, $55, $8D, $55, $0D, $56 ; $571B |...U.U.V|
    db   $8D, $56, $8D, $55, $00, $00, $00, $00 ; $5723 |.V.U....|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $572B |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5733 |........|
    db   $00, $00, $00, $00, $08, $58, $2A, $00 ; $573B |.....X*.|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5743 |........|
    db   $08, $48, $2B, $00, $00, $00, $00, $00 ; $574B |.H+.....|
    db   $08, $68, $2B, $00, $00, $00, $00, $00 ; $5753 |.h+.....|
    db   $00, $10, $00, $20, $00, $08, $02, $20 ; $575B |... ... |
    db   $00, $00, $04, $20, $10, $08, $06, $20 ; $5763 |... ... |
    db   $00, $10, $08, $20, $00, $08, $0A, $20 ; $576B |... ... |
    db   $00, $00, $0C, $20, $10, $10, $0E, $20 ; $5773 |... ... |
    db   $10, $08, $10, $20, $10, $00, $12, $20 ; $577B |... ... |
    db   $00, $10, $08, $20, $00, $08, $0A, $20 ; $5783 |... ... |
    db   $00, $00, $0C, $20, $10, $10, $64, $20 ; $578B |... ..d |
    db   $10, $08, $66, $20, $10, $00, $68, $20 ; $5793 |..f ..h |
    db   $00, $FC, $14, $00, $00, $04, $16, $00 ; $579B |........|
    db   $00, $0C, $18, $00, $10, $FC, $1A, $00 ; $57A3 |........|
    db   $10, $04, $1C, $00, $10, $0C, $1E, $00 ; $57AB |........|
    db   $5B, $57, $6B, $57, $5B, $57, $83, $57 ; $57B3 |[WkW[W.W|
    db   $9B, $57, $10, $18, $10, $18, $18, $00 ; $57BB |.W......|
    db   $00, $0A, $00, $10, $08, $0C, $00, $08 ; $57C3 |........|
    db   $10, $0E, $00, $08, $18, $10, $00, $00 ; $57CB |........|
    db   $00, $1C, $00, $10, $08, $1E, $00, $08 ; $57D3 |........|
    db   $10, $20, $00, $08, $18, $22, $00, $C2 ; $57DB |. ..."..|
    db   $57, $D2, $57, $00, $00, $1E, $00, $00 ; $57E3 |W.W.....|
    db   $08, $20, $00, $00, $10, $22, $00, $10 ; $57EB |. ..."..|
    db   $00, $24, $00, $10, $08, $26, $00, $10 ; $57F3 |.$...&..|
    db   $10, $28, $00, $10, $18, $2A, $00, $08 ; $57FB |.(...*..|
    db   $00, $00, $00, $08, $08, $02, $00, $08 ; $5803 |........|
    db   $10, $04, $00, $18, $00, $06, $00, $18 ; $580B |........|
    db   $08, $08, $00, $00, $00, $0C, $00, $00 ; $5813 |........|
    db   $08, $0E, $00, $00, $10, $10, $00, $10 ; $581B |........|
    db   $F8, $0A, $00, $10, $00, $12, $00, $10 ; $5823 |........|
    db   $08, $14, $00, $10, $10, $16, $00, $00 ; $582B |........|
    db   $00, $0C, $00, $00, $08, $0E, $00, $00 ; $5833 |........|
    db   $10, $10, $00, $10, $00, $18, $00, $10 ; $583B |........|
    db   $08, $1A, $00, $10, $10, $1C, $00, $00 ; $5843 |........|
    db   $00, $1E, $00, $00, $08, $20, $00, $00 ; $584B |..... ..|
    db   $10, $22, $00, $10, $00, $2C, $00, $10 ; $5853 |."...,..|
    db   $08, $60, $00, $10, $10, $28, $00, $10 ; $585B |.`...(..|
    db   $18, $2A, $00, $E6, $57, $02, $58, $16 ; $5863 |.*..W.X.|
    db   $58, $32, $58, $4A, $58, $1C, $14, $1C ; $586B |X2XJX...|
    db   $18, $1C, $00, $00, $00, $00, $00, $08 ; $5873 |........|
    db   $02, $00, $10, $00, $04, $00, $10, $08 ; $587B |........|
    db   $06, $00, $00, $00, $08, $00, $00, $08 ; $5883 |........|
    db   $0A, $00, $10, $00, $0C, $00, $10, $08 ; $588B |........|
    db   $0E, $00, $00, $00, $10, $00, $00, $08 ; $5893 |........|
    db   $12, $00, $10, $00, $14, $00, $10, $08 ; $589B |........|
    db   $16, $00, $00, $00, $30, $00, $00, $08 ; $58A3 |....0...|
    db   $32, $00, $00, $10, $34, $00, $10, $00 ; $58AB |2...4...|
    db   $36, $00, $10, $08, $38, $00, $10, $10 ; $58B3 |6...8...|
    db   $3A, $00, $75, $58, $85, $58, $95, $58 ; $58BB |:.uX.X.X|
    db   $A5, $58, $00, $10, $00, $20, $00, $08 ; $58C3 |.X... ..|
    db   $02, $20, $00, $00, $04, $20, $10, $08 ; $58CB |. ... ..|
    db   $06, $20, $00, $10, $08, $20, $00, $08 ; $58D3 |. ... ..|
    db   $0A, $20, $00, $00, $0C, $20, $10, $10 ; $58DB |. ... ..|
    db   $0E, $20, $10, $08, $10, $20, $10, $00 ; $58E3 |. ... ..|
    db   $12, $20, $00, $10, $08, $20, $00, $08 ; $58EB |. ... ..|
    db   $0A, $20, $00, $00, $0C, $20, $10, $10 ; $58F3 |. ... ..|
    db   $7A, $20, $10, $08, $7C, $20, $10, $00 ; $58FB |z ..| ..|
    db   $7E, $20, $00, $00, $14, $00, $00, $08 ; $5903 |~ ......|
    db   $16, $00, $00, $10, $18, $00, $10, $00 ; $590B |........|
    db   $1A, $00, $10, $08, $1C, $00, $10, $10 ; $5913 |........|
    db   $1E, $00, $00, $00, $20, $00, $00, $08 ; $591B |.... ...|
    db   $22, $00, $00, $10, $24, $00, $10, $00 ; $5923 |"...$...|
    db   $26, $00, $10, $08, $52, $00, $10, $10 ; $592B |&...R...|
    db   $54, $00, $C5, $58, $D5, $58, $C5, $58 ; $5933 |T..X.X.X|
    db   $ED, $58, $05, $59, $1D, $59, $10, $18 ; $593B |.X.Y.Y..|
    db   $10, $18, $18, $18, $00, $FE, $54, $00 ; $5943 |......T.|
    db   $00, $06, $56, $00, $00, $0E, $58, $00 ; $594B |..V...X.|
    db   $0F, $00, $5A, $00, $0F, $07, $5A, $20 ; $5953 |..Z...Z |
    db   $FB, $00, $5C, $00, $FB, $08, $5E, $00 ; $595B |..\...^.|
    db   $FB, $10, $60, $00, $0B, $00, $62, $00 ; $5963 |..`...b.|
    db   $0B, $08, $64, $00, $0B, $10, $66, $00 ; $596B |..d...f.|
    db   $FC, $00, $40, $00, $FC, $08, $42, $00 ; $5973 |..@...B.|
    db   $FC, $10, $44, $00, $0C, $00, $46, $00 ; $597B |..D...F.|
    db   $0C, $08, $48, $00, $0C, $10, $4A, $00 ; $5983 |..H...J.|
    db   $FC, $00, $68, $00, $FC, $08, $6A, $00 ; $598B |..h...j.|
    db   $FC, $10, $6C, $00, $0C, $00, $6E, $00 ; $5993 |..l...n.|
    db   $0C, $08, $70, $00, $0C, $10, $72, $00 ; $599B |..p...r.|
    db   $00, $02, $4C, $00, $00, $0A, $4E, $00 ; $59A3 |..L...N.|
    db   $00, $12, $50, $00, $10, $04, $52, $00 ; $59AB |..P...R.|
    db   $10, $0C, $52, $20, $FB, $FF, $74, $00 ; $59B3 |..R ..t.|
    db   $FB, $07, $76, $00, $FB, $0F, $78, $00 ; $59BB |..v...x.|
    db   $0B, $FF, $7A, $00, $0B, $07, $7C, $00 ; $59C3 |..z...|.|
    db   $0B, $0F, $7E, $00, $47, $59, $5B, $59 ; $59CB |..~.GY[Y|
    db   $73, $59, $5B, $59, $8B, $59, $A3, $59 ; $59D3 |sY[Y.Y.Y|
    db   $B7, $59, $14, $18, $18, $18, $18, $14 ; $59DB |.Y......|
    db   $18, $00, $10, $34, $21, $00, $08, $36 ; $59E3 |...4!..6|
    db   $21, $00, $00, $38, $21, $10, $10, $3A ; $59EB |!..8!..:|
    db   $21, $10, $08, $3C, $21, $10, $00, $3E ; $59F3 |!..<!..>|
    db   $21, $00, $10, $28, $21, $00, $08, $2A ; $59FB |!..(!..*|
    db   $21, $00, $00, $2C, $21, $10, $10, $2E ; $5A03 |!..,!...|
    db   $21, $10, $08, $30, $21, $10, $00, $32 ; $5A0B |!..0!..2|
    db   $21, $00, $10, $28, $21, $00, $08, $2A ; $5A13 |!..(!..*|
    db   $21, $00, $00, $2C, $21, $10, $10, $70 ; $5A1B |!..,!..p|
    db   $21, $10, $08, $72, $21, $10, $00, $74 ; $5A23 |!..r!..t|
    db   $21, $00, $00, $20, $01, $00, $08, $22 ; $5A2B |!.. ..."|
    db   $01, $00, $0F, $22, $21, $00, $17, $20 ; $5A33 |..."!.. |
    db   $21, $10, $00, $24, $01, $10, $08, $26 ; $5A3B |!..$...&|
    db   $01, $10, $0F, $26, $21, $10, $17, $24 ; $5A43 |...&!..$|
    db   $21, $E4, $59, $FC, $59, $E4, $59, $14 ; $5A4B |!.Y.Y.Y.|
    db   $5A, $2C, $5A, $18, $18, $18, $18, $20 ; $5A53 |Z,Z.... |
    db   $00, $00, $00, $01, $00, $08, $02, $03 ; $5A5B |........|
    db   $00, $10, $04, $03, $10, $00, $06, $01 ; $5A63 |........|
    db   $10, $10, $08, $01, $10, $08, $24, $01 ; $5A6B |......$.|
    db   $00, $00, $12, $01, $00, $08, $14, $03 ; $5A73 |........|
    db   $00, $10, $16, $03, $10, $00, $18, $01 ; $5A7B |........|
    db   $10, $10, $1A, $01, $10, $08, $26, $01 ; $5A83 |......&.|
    db   $5B, $5A, $73, $5A, $00, $00, $8C, $03 ; $5A8B |[ZsZ....|
    db   $00, $08, $8E, $03, $00, $08, $88, $23 ; $5A93 |.......#|
    db   $00, $00, $8A, $23, $00, $08, $8C, $23 ; $5A9B |...#...#|
    db   $00, $00, $8E, $23, $8F, $5A, $97, $5A ; $5AA3 |...#.Z.Z|
    db   $9F, $5A, $00, $00, $8E, $23, $00, $08 ; $5AAB |.Z...#..|
    db   $8C, $23, $00, $00, $8A, $23, $00, $08 ; $5AB3 |.#...#..|
    db   $88, $23, $00, $00, $8C, $03, $00, $08 ; $5ABB |.#......|
    db   $8E, $03, $00, $00, $88, $03, $00, $08 ; $5AC3 |........|
    db   $8A, $03, $00, $00, $80, $03, $00, $08 ; $5ACB |........|
    db   $82, $03, $00, $00, $84, $03, $00, $08 ; $5AD3 |........|
    db   $86, $03, $AD, $5A, $B5, $5A, $BD, $5A ; $5ADB |...Z.Z.Z|
    db   $C5, $5A, $CD, $5A, $D5, $5A, $00, $00 ; $5AE3 |.Z.Z.Z..|
    db   $64, $01, $00, $08, $66, $01, $00, $10 ; $5AEB |d...f...|
    db   $68, $01, $10, $08, $6A, $01, $10, $10 ; $5AF3 |h...j...|
    db   $6C, $01, $00, $00, $34, $01, $00, $08 ; $5AFB |l...4...|
    db   $36, $01, $00, $10, $38, $01, $10, $00 ; $5B03 |6...8...|
    db   $3A, $01, $10, $08, $3C, $01, $10, $10 ; $5B0B |:...<...|
    db   $3E, $01, $00, $00, $34, $01, $00, $08 ; $5B13 |>...4...|
    db   $36, $01, $00, $10, $38, $01, $10, $00 ; $5B1B |6...8...|
    db   $4C, $01, $10, $08, $4E, $01, $10, $10 ; $5B23 |L...N...|
    db   $50, $01, $00, $00, $58, $01, $00, $08 ; $5B2B |P...X...|
    db   $5A, $01, $00, $10, $5C, $01, $10, $00 ; $5B33 |Z...\...|
    db   $5E, $01, $10, $08, $60, $01, $10, $10 ; $5B3B |^...`...|
    db   $62, $01, $00, $00, $6E, $01, $00, $08 ; $5B43 |b...n...|
    db   $70, $01, $00, $10, $72, $01, $10, $00 ; $5B4B |p...r...|
    db   $74, $01, $10, $08, $76, $01, $10, $10 ; $5B53 |t...v...|
    db   $78, $01, $E9, $5A, $FD, $5A, $E9, $5A ; $5B5B |x..Z.Z.Z|
    db   $15, $5B, $2D, $5B, $45, $5B, $14, $18 ; $5B63 |.[-[E[..|
    db   $14, $18, $18, $18, $F0, $F4, $3E, $01 ; $5B6B |......>.|
    db   $F0, $FC, $40, $01, $F0, $04, $42, $01 ; $5B73 |..@...B.|
    db   $00, $F4, $44, $01, $00, $FC, $46, $01 ; $5B7B |..D...F.|
    db   $00, $04, $48, $01, $F0, $F4, $4A, $01 ; $5B83 |..H...J.|
    db   $F0, $FC, $4C, $01, $F0, $04, $4E, $01 ; $5B8B |..L...N.|
    db   $00, $F4, $50, $01, $00, $FC, $52, $01 ; $5B93 |..P...R.|
    db   $00, $04, $54, $01, $F0, $F4, $42, $21 ; $5B9B |..T...B!|
    db   $F0, $FC, $40, $21, $F0, $04, $3E, $21 ; $5BA3 |..@!..>!|
    db   $00, $F4, $48, $21, $00, $FC, $46, $21 ; $5BAB |..H!..F!|
    db   $00, $04, $44, $21, $F0, $F4, $4E, $21 ; $5BB3 |..D!..N!|
    db   $F0, $FC, $4C, $21, $F0, $04, $4A, $21 ; $5BBB |..L!..J!|
    db   $00, $F4, $54, $21, $00, $FC, $52, $21 ; $5BC3 |..T!..R!|
    db   $00, $04, $50, $21, $F0, $F0, $2E, $01 ; $5BCB |..P!....|
    db   $F0, $F8, $30, $01, $F0, $00, $30, $21 ; $5BD3 |..0...0!|
    db   $F0, $08, $2E, $21, $00, $F0, $32, $01 ; $5BDB |...!..2.|
    db   $00, $F8, $34, $01, $00, $00, $34, $21 ; $5BE3 |..4...4!|
    db   $00, $08, $32, $21, $F0, $F0, $36, $01 ; $5BEB |..2!..6.|
    db   $F0, $F8, $38, $01, $F0, $00, $38, $21 ; $5BF3 |..8...8!|
    db   $F0, $08, $36, $21, $00, $F0, $3A, $01 ; $5BFB |..6!..:.|
    db   $00, $F8, $3C, $01, $00, $00, $3C, $21 ; $5C03 |..<...<!|
    db   $00, $08, $3A, $21, $F0, $F0, $56, $01 ; $5C0B |..:!..V.|
    db   $F0, $F8, $58, $01, $F0, $00, $58, $21 ; $5C13 |..X...X!|
    db   $F0, $08, $56, $21, $00, $F0, $5A, $01 ; $5C1B |..V!..Z.|
    db   $00, $F8, $5C, $01, $00, $00, $5C, $21 ; $5C23 |..\...\!|
    db   $00, $08, $5A, $21, $E4, $E6, $7C, $20 ; $5C2B |..Z!..| |
    db   $E4, $EE, $7A, $20, $E4, $0A, $7A, $00 ; $5C33 |..z ..z.|
    db   $E4, $12, $7C, $00, $F0, $F0, $56, $01 ; $5C3B |..|...V.|
    db   $F0, $F8, $58, $01, $F0, $00, $58, $21 ; $5C43 |..X...X!|
    db   $F0, $08, $56, $21, $00, $F0, $5A, $01 ; $5C4B |..V!..Z.|
    db   $00, $F8, $5C, $01, $00, $00, $5C, $21 ; $5C53 |..\...\!|
    db   $00, $08, $5A, $21, $E2, $E4, $7C, $20 ; $5C5B |..Z!..| |
    db   $E2, $EC, $7A, $20, $E2, $0C, $7A, $00 ; $5C63 |..z ..z.|
    db   $E2, $14, $7C, $00, $6F, $5B, $87, $5B ; $5C6B |..|.o[.[|
    db   $9F, $5B, $B7, $5B, $CF, $5B, $EF, $5B ; $5C73 |.[.[.[.[|
    db   $0F, $5C, $3F, $5C, $18, $18, $18, $18 ; $5C7B |.\?\....|
    db   $20, $20, $30, $30, $00, $00, $18, $01 ; $5C83 |  00....|
    db   $00, $08, $1A, $01, $00, $10, $1C, $01 ; $5C8B |........|
    db   $10, $00, $1E, $01, $10, $08, $20, $01 ; $5C93 |...... .|
    db   $10, $10, $22, $01, $F8, $00, $24, $01 ; $5C9B |.."...$.|
    db   $F8, $08, $26, $01, $F8, $10, $28, $01 ; $5CA3 |..&...(.|
    db   $08, $00, $2A, $01, $08, $08, $2C, $01 ; $5CAB |..*...,.|
    db   $08, $10, $2E, $01, $87, $5C, $9F, $5C ; $5CB3 |.....\.\|
    db   $00, $00, $0C, $03, $00, $08, $0E, $03 ; $5CBB |........|
    db   $00, $00, $08, $03, $00, $08, $0B, $03 ; $5CC3 |........|
    db   $00, $00, $00, $03, $00, $08, $02, $03 ; $5CCB |........|
    db   $00, $00, $04, $03, $00, $08, $06, $03 ; $5CD3 |........|
    db   $BB, $5C, $C3, $5C, $CB, $5C, $D3, $5C ; $5CDB |.\.\.\.\|

