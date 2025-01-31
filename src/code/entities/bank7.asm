; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

func_007_4000:
    ld   a, $04                                   ; $4000: $3E $04
    ldh  [hNoiseSfx], a                            ; $4002: $E0 $F4
    ret                                           ; $4004: $C9

func_007_4005:
    ld   hl, wEntity0SpeedY                       ; $4005: $21 $50 $C2
    add  hl, bc                                   ; $4008: $09
    ret                                           ; $4009: $C9

    ld   a, h                                     ; $400A: $7C
    ld   [bc], a                                  ; $400B: $02
    ld   a, [hl]                                  ; $400C: $7E
    ld   [bc], a                                  ; $400D: $02
    ld   a, [hl]                                  ; $400E: $7E
    ld   [hl+], a                                 ; $400F: $22
    ld   a, h                                     ; $4010: $7C
    ld   [hl+], a                                 ; $4011: $22
    db   $F4                                      ; $4012: $F4
    ld   d, $F6                                   ; $4013: $16 $F6
    ld   d, $F0                                   ; $4015: $16 $F0
    rla                                           ; $4017: $17
    ld   a, [c]                                   ; $4018: $F2
    rla                                           ; $4019: $17
    db   $F4                                      ; $401A: $F4
    ld   d, $F6                                   ; $401B: $16 $F6
    ld   d, $F0                                   ; $401D: $16 $F0
    ld   d, $F2                                   ; $401F: $16 $F2
    ld   d, $21                                   ; $4021: $16 $21
    or   b                                        ; $4023: $B0
    jp   nz, label_007_7E09                       ; $4024: $C2 $09 $7E

    cp   $02                                      ; $4027: $FE $02
    jp   z, label_007_41F0                        ; $4029: $CA $F0 $41

    and  a                                        ; $402C: $A7
    jr   nz, jr_007_4053                          ; $402D: $20 $24

    inc  [hl]                                     ; $402F: $34
    ldh  a, [wActiveEntityPosX]                   ; $4030: $F0 $EE
    rla                                           ; $4032: $17
    rla                                           ; $4033: $17
    and  $40                                      ; $4034: $E6 $40
    push af                                       ; $4036: $F5
    ld   hl, $C430                                ; $4037: $21 $30 $C4
    add  hl, bc                                   ; $403A: $09
    or   [hl]                                     ; $403B: $B6
    ld   [hl], a                                  ; $403C: $77
    pop  af                                       ; $403D: $F1
    sla  a                                        ; $403E: $CB $27
    ld   hl, $C350                                ; $4040: $21 $50 $C3
    add  hl, bc                                   ; $4043: $09
    or   [hl]                                     ; $4044: $B6
    ld   [hl], a                                  ; $4045: $77
    ldh  a, [wActiveEntityPosX]                   ; $4046: $F0 $EE
    rra                                           ; $4048: $1F
    rra                                           ; $4049: $1F
    rra                                           ; $404A: $1F
    rra                                           ; $404B: $1F
    and  $01                                      ; $404C: $E6 $01
    ld   hl, $C440                                ; $404E: $21 $40 $C4
    add  hl, bc                                   ; $4051: $09
    ld   [hl], a                                  ; $4052: $77

jr_007_4053:
    ld   hl, wEntitiesUnknownTableC               ; $4053: $21 $C0 $C2
    add  hl, bc                                   ; $4056: $09
    ldh  a, [wActiveEntityPosY]                   ; $4057: $F0 $EC
    sub  [hl]                                     ; $4059: $96
    ldh  [wActiveEntityPosY], a                   ; $405A: $E0 $EC
    ld   hl, $C440                                ; $405C: $21 $40 $C4
    add  hl, bc                                   ; $405F: $09
    ld   a, [hl]                                  ; $4060: $7E
    ldh  [hActiveEntityUnknownG], a               ; $4061: $E0 $F1
    ld   de, $4012                                ; $4063: $11 $12 $40
    ld   a, [wIsIndoor]                           ; $4066: $FA $A5 $DB
    and  a                                        ; $4069: $A7
    jr   z, jr_007_406F                           ; $406A: $28 $03

    ld   de, $401A                                ; $406C: $11 $1A $40

jr_007_406F:
    call RenderAnimatedActiveEntity                               ; $406F: $CD $C0 $3B
    call label_3D8A                               ; $4072: $CD $8A $3D
    ld   hl, wEntitiesUnknownTableC               ; $4075: $21 $C0 $C2
    add  hl, bc                                   ; $4078: $09
    ld   a, [hl]                                  ; $4079: $7E
    and  a                                        ; $407A: $A7
    jr   z, jr_007_408A                           ; $407B: $28 $0D

    ld   hl, wEntitiesUnknownTableG               ; $407D: $21 $B0 $C3
    add  hl, bc                                   ; $4080: $09
    ld   a, [hl]                                  ; $4081: $7E
    ldh  [hActiveEntityUnknownG], a               ; $4082: $E0 $F1
    ld   de, $400A                                ; $4084: $11 $0A $40
    call RenderAnimatedActiveEntity                               ; $4087: $CD $C0 $3B

jr_007_408A:
    call func_007_7D96                            ; $408A: $CD $96 $7D
    ld   hl, wEntitiesHealthTable                                ; $408D: $21 $60 $C3
    add  hl, bc                                   ; $4090: $09
    ld   [hl], $04                                ; $4091: $36 $04
    ld   hl, $C420                                ; $4093: $21 $20 $C4
    add  hl, bc                                   ; $4096: $09
    ld   a, [hl]                                  ; $4097: $7E
    and  a                                        ; $4098: $A7
    jr   z, jr_007_40C1                           ; $4099: $28 $26

    ld   [hl], b                                  ; $409B: $70
    ld   hl, $C440                                ; $409C: $21 $40 $C4
    add  hl, bc                                   ; $409F: $09
    ld   a, [hl]                                  ; $40A0: $7E
    xor  $01                                      ; $40A1: $EE $01
    call label_3B0C                               ; $40A3: $CD $0C $3B
    ld   hl, wEntitiesTypeTable                   ; $40A6: $21 $A0 $C3
    add  hl, bc                                   ; $40A9: $09
    ld   [hl], $05                                ; $40AA: $36 $05
    ld   hl, hNoiseSfx                             ; $40AC: $21 $F4 $FF
    ld   [hl], $05                                ; $40AF: $36 $05
    call IsEntityUnknownFZero                                ; $40B1: $CD $00 $0C
    ld   [hl], $1F                                ; $40B4: $36 $1F
    ld   hl, $C340                                ; $40B6: $21 $40 $C3
    add  hl, bc                                   ; $40B9: $09
    ld   a, [hl]                                  ; $40BA: $7E
    add  $02                                      ; $40BB: $C6 $02
    ld   [hl], a                                  ; $40BD: $77
    jp   label_007_4198                           ; $40BE: $C3 $98 $41

jr_007_40C1:
    call label_C56                                ; $40C1: $CD $56 $0C
    call label_3B39                               ; $40C4: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                ; $40C7: $F0 $F0
    rst  $00                                      ; $40C9: $C7
    sub  $40                                      ; $40CA: $D6 $40
    cp   c                                        ; $40CC: $B9
    ld   b, c                                     ; $40CD: $41
    db   $10                                      ; $40CE: $10
    ldh  a, [rP1]                                 ; $40CF: $F0 $00
    nop                                           ; $40D1: $00
    nop                                           ; $40D2: $00
    nop                                           ; $40D3: $00
    ldh  a, [rNR10]                               ; $40D4: $F0 $10
    ld   hl, wEntitiesUnknownTableC               ; $40D6: $21 $C0 $C2
    add  hl, bc                                   ; $40D9: $09
    ld   [hl], b                                  ; $40DA: $70
    call GetEntityTransitionCountdown                 ; $40DB: $CD $05 $0C
    jr   nz, jr_007_4128                          ; $40DE: $20 $48

    call func_007_7E6D                            ; $40E0: $CD $6D $7E
    add  $08                                      ; $40E3: $C6 $08
    cp   $10                                      ; $40E5: $FE $10
    jr   c, jr_007_40F9                           ; $40E7: $38 $10

    push de                                       ; $40E9: $D5
    call func_007_7E5D                            ; $40EA: $CD $5D $7E
    add  $08                                      ; $40ED: $C6 $08
    pop  de                                       ; $40EF: $D1
    cp   $10                                      ; $40F0: $FE $10
    jr   nc, jr_007_4128                          ; $40F2: $30 $34

    ld   a, e                                     ; $40F4: $7B
    cp   $02                                      ; $40F5: $FE $02
    jr   z, jr_007_4128                           ; $40F7: $28 $2F

jr_007_40F9:
    call IncrementEntityWalkingAttr               ; $40F9: $CD $12 $3B
    call func_007_7E7D                            ; $40FC: $CD $7D $7E
    ld   d, b                                     ; $40FF: $50
    ld   hl, $40CE                                ; $4100: $21 $CE $40
    add  hl, de                                   ; $4103: $19
    ld   a, [hl]                                  ; $4104: $7E
    ld   hl, wEntity0SpeedX                       ; $4105: $21 $40 $C2
    add  hl, bc                                   ; $4108: $09
    ld   [hl], a                                  ; $4109: $77
    ld   hl, $40D2                                ; $410A: $21 $D2 $40
    add  hl, de                                   ; $410D: $19
    ld   a, [hl]                                  ; $410E: $7E
    call func_007_4005                            ; $410F: $CD $05 $40
    ld   [hl], a                                  ; $4112: $77
    ld   hl, $C340                                ; $4113: $21 $40 $C3
    add  hl, bc                                   ; $4116: $09
    res  7, [hl]                                  ; $4117: $CB $BE
    ld   hl, $C350                                ; $4119: $21 $50 $C3
    add  hl, bc                                   ; $411C: $09
    res  2, [hl]                                  ; $411D: $CB $96
    call label_3AEA                               ; $411F: $CD $EA $3A
    call GetEntityTransitionCountdown                 ; $4122: $CD $05 $0C
    ld   [hl], $30                                ; $4125: $36 $30
    ret                                           ; $4127: $C9

jr_007_4128:
    ld   hl, $C340                                ; $4128: $21 $40 $C3
    add  hl, bc                                   ; $412B: $09
    set  7, [hl]                                  ; $412C: $CB $FE
    ld   hl, $C350                                ; $412E: $21 $50 $C3
    add  hl, bc                                   ; $4131: $09
    set  2, [hl]                                  ; $4132: $CB $D6
    call label_3AEA                               ; $4134: $CD $EA $3A
    call label_3B5A                               ; $4137: $CD $5A $3B
    ret  nc                                       ; $413A: $D0

    ld   a, [$C19B]                               ; $413B: $FA $9B $C1
    and  a                                        ; $413E: $A7
    ret  nz                                       ; $413F: $C0

    ld   a, [wAButtonSlot]                        ; $4140: $FA $00 $DB
    cp   $03                                      ; $4143: $FE $03
    jr   nz, jr_007_414E                          ; $4145: $20 $07

    ldh  a, [hJoypadState]                               ; $4147: $F0 $CC
    and  $20                                      ; $4149: $E6 $20
    jr   nz, jr_007_415A                          ; $414B: $20 $0D

    ret                                           ; $414D: $C9

jr_007_414E:
    ld   a, [wBButtonSlot]                        ; $414E: $FA $01 $DB
    cp   $03                                      ; $4151: $FE $03
    ret  nz                                       ; $4153: $C0

    ldh  a, [hJoypadState]                               ; $4154: $F0 $CC
    and  $10                                      ; $4156: $E6 $10
    jr   z, jr_007_41B8                           ; $4158: $28 $5E

jr_007_415A:
    ld   a, [$C3CF]                               ; $415A: $FA $CF $C3
    and  a                                        ; $415D: $A7
    ret  nz                                       ; $415E: $C0

    inc  a                                        ; $415F: $3C
    ld   [$C3CF], a                               ; $4160: $EA $CF $C3
    call IncrementEntityWalkingAttr               ; $4163: $CD $12 $3B
    ld   [hl], $02                                ; $4166: $36 $02
    ld   hl, wEntity0State                         ; $4168: $21 $80 $C2
    add  hl, bc                                   ; $416B: $09
    ld   [hl], $07                                ; $416C: $36 $07
    ld   hl, $C390                                ; $416E: $21 $90 $C3
    add  hl, bc                                   ; $4171: $09
    ld   [hl], $01                                ; $4172: $36 $01
    ld   hl, $C490                                ; $4174: $21 $90 $C4
    add  hl, bc                                   ; $4177: $09
    ld   [hl], b                                  ; $4178: $70
    ldh  a, [hLinkDirection]                      ; $4179: $F0 $9E
    ld   [wC15D], a                               ; $417B: $EA $5D $C1
    call GetEntityTransitionCountdown                 ; $417E: $CD $05 $0C
    ld   [hl], $02                                ; $4181: $36 $02
    ld   hl, hWaveSfx                                 ; $4183: $21 $F3 $FF
    ld   [hl], $02                                ; $4186: $36 $02
    ld   hl, wEntitiesTypeTable                   ; $4188: $21 $A0 $C3
    add  hl, bc                                   ; $418B: $09
    ld   [hl], $05                                ; $418C: $36 $05
    ld   hl, $C440                                ; $418E: $21 $40 $C4
    add  hl, bc                                   ; $4191: $09
    ld   a, [hl]                                  ; $4192: $7E
    xor  $01                                      ; $4193: $EE $01
    call label_3B0C                               ; $4195: $CD $0C $3B

label_007_4198:
    ld   a, $BB                                   ; $4198: $3E $BB
    call label_3B86                               ; $419A: $CD $86 $3B
    ret  c                                        ; $419D: $D8

    ldh  a, [hScratchA]                           ; $419E: $F0 $D7
    ld   hl, wEntity0PosX                         ; $41A0: $21 $00 $C2
    add  hl, de                                   ; $41A3: $19
    ld   [hl], a                                  ; $41A4: $77
    ldh  a, [hScratchB]                           ; $41A5: $F0 $D8
    ld   hl, wEntity0PosY                         ; $41A7: $21 $10 $C2
    add  hl, de                                   ; $41AA: $19
    ld   [hl], a                                  ; $41AB: $77
    ld   hl, wEntitiesUnknownTableB               ; $41AC: $21 $B0 $C2
    add  hl, de                                   ; $41AF: $19
    ld   [hl], $02                                ; $41B0: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable           ; $41B2: $21 $E0 $C2
    add  hl, de                                   ; $41B5: $19
    ld   [hl], $40                                ; $41B6: $36 $40

jr_007_41B8:
    ret                                           ; $41B8: $C9

    call GetEntityTransitionCountdown                 ; $41B9: $CD $05 $0C
    jr   nz, jr_007_41C8                          ; $41BC: $20 $0A

jr_007_41BE:
    call GetEntityTransitionCountdown                 ; $41BE: $CD $05 $0C
    ld   [hl], $20                                ; $41C1: $36 $20
    call IncrementEntityWalkingAttr               ; $41C3: $CD $12 $3B
    ld   [hl], b                                  ; $41C6: $70
    ret                                           ; $41C7: $C9

jr_007_41C8:
    call func_007_7E0A                            ; $41C8: $CD $0A $7E
    call label_3B23                               ; $41CB: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $41CE: $21 $A0 $C2
    add  hl, bc                                   ; $41D1: $09
    ld   a, [hl]                                  ; $41D2: $7E
    and  a                                        ; $41D3: $A7
    jr   nz, jr_007_41BE                          ; $41D4: $20 $E8

    ld   hl, wEntitiesUnknownTableC               ; $41D6: $21 $C0 $C2
    add  hl, bc                                   ; $41D9: $09
    ld   [hl], $04                                ; $41DA: $36 $04
    ldh  a, [hFrameCounter]                       ; $41DC: $F0 $E7
    rra                                           ; $41DE: $1F
    rra                                           ; $41DF: $1F
    rra                                           ; $41E0: $1F
    and  $01                                      ; $41E1: $E6 $01
    jp   label_3B0C                               ; $41E3: $C3 $0C $3B

    ldh  a, [hNoiseSfx]                            ; $41E6: $F0 $F4
    nop                                           ; $41E8: $00
    inc  c                                        ; $41E9: $0C
    db   $10                                      ; $41EA: $10
    inc  c                                        ; $41EB: $0C
    nop                                           ; $41EC: $00
    db   $F4                                      ; $41ED: $F4
    ldh  a, [hNoiseSfx]                            ; $41EE: $F0 $F4

label_007_41F0:
    ld   de, $400A                                ; $41F0: $11 $0A $40
    call RenderAnimatedActiveEntity                               ; $41F3: $CD $C0 $3B
    call func_007_7D96                            ; $41F6: $CD $96 $7D
    call func_007_7DC3                            ; $41F9: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $41FC: $F0 $E7
    rra                                           ; $41FE: $1F
    rra                                           ; $41FF: $1F
    rra                                           ; $4200: $1F
    and  $01                                      ; $4201: $E6 $01
    call label_3B0C                               ; $4203: $CD $0C $3B
    call func_007_7E0A                            ; $4206: $CD $0A $7E
    call label_3B23                               ; $4209: $CD $23 $3B
    call label_3B39                               ; $420C: $CD $39 $3B
    call GetEntityTransitionCountdown                 ; $420F: $CD $05 $0C
    jr   nz, jr_007_4233                          ; $4212: $20 $1F

    call GetRandomByte                            ; $4214: $CD $0D $28
    and  $1F                                      ; $4217: $E6 $1F
    add  $20                                      ; $4219: $C6 $20
    ld   [hl], a                                  ; $421B: $77
    and  $07                                      ; $421C: $E6 $07
    ld   e, a                                     ; $421E: $5F
    ld   d, b                                     ; $421F: $50
    ld   hl, $41E8                                ; $4220: $21 $E8 $41
    add  hl, de                                   ; $4223: $19
    ld   a, [hl]                                  ; $4224: $7E
    ld   hl, wEntity0SpeedX                       ; $4225: $21 $40 $C2
    add  hl, bc                                   ; $4228: $09
    ld   [hl], a                                  ; $4229: $77
    ld   hl, $41E6                                ; $422A: $21 $E6 $41
    add  hl, de                                   ; $422D: $19
    ld   a, [hl]                                  ; $422E: $7E
    call func_007_4005                            ; $422F: $CD $05 $40
    ld   [hl], a                                  ; $4232: $77

jr_007_4233:
    ret                                           ; $4233: $C9

    nop                                           ; $4234: $00
    ldh  a, [$FF78]                               ; $4235: $F0 $78
    ld   bc, $F800                                ; $4237: $01 $00 $F8
    ld   a, d                                     ; $423A: $7A
    ld   bc, $0000                                ; $423B: $01 $00 $00
    ld   [hl], b                                  ; $423E: $70
    ld   bc, label_800                            ; $423F: $01 $00 $08
    ld   [hl], d                                  ; $4242: $72
    ld   bc, $F000                                ; $4243: $01 $00 $F0
    ld   a, h                                     ; $4246: $7C
    ld   bc, $F800                                ; $4247: $01 $00 $F8
    ld   a, [hl]                                  ; $424A: $7E
    ld   bc, $0000                                ; $424B: $01 $00 $00
    ld   [hl], b                                  ; $424E: $70
    ld   bc, label_800                            ; $424F: $01 $00 $08
    ld   [hl], d                                  ; $4252: $72
    ld   bc, $F000                                ; $4253: $01 $00 $F0
    ld   a, b                                     ; $4256: $78
    ld   bc, $F800                                ; $4257: $01 $00 $F8
    ld   a, d                                     ; $425A: $7A
    ld   bc, $0000                                ; $425B: $01 $00 $00
    ld   [hl], h                                  ; $425E: $74
    ld   bc, label_800                            ; $425F: $01 $00 $08
    db   $76                                      ; $4262: $76
    ld   bc, $F0FC                                ; $4263: $01 $FC $F0
    ld   h, h                                     ; $4266: $64
    ld   bc, $F8FC                                ; $4267: $01 $FC $F8
    ld   h, [hl]                                  ; $426A: $66
    ld   bc, $0000                                ; $426B: $01 $00 $00
    ld   h, b                                     ; $426E: $60
    ld   bc, label_800                            ; $426F: $01 $00 $08
    ld   h, d                                     ; $4272: $62
    ld   bc, $F0FC                                ; $4273: $01 $FC $F0
    ld   h, h                                     ; $4276: $64
    ld   bc, $F8FC                                ; $4277: $01 $FC $F8
    ld   h, [hl]                                  ; $427A: $66
    ld   bc, $0000                                ; $427B: $01 $00 $00
    ld   [hl], h                                  ; $427E: $74
    ld   bc, label_800                            ; $427F: $01 $00 $08
    db   $76                                      ; $4282: $76
    ld   bc, $B021                                ; $4283: $01 $21 $B0
    jp   nz, label_007_7E09                       ; $4286: $C2 $09 $7E

    cp   $02                                      ; $4289: $FE $02
    jp   z, $45F7                                 ; $428B: $CA $F7 $45

    and  a                                        ; $428E: $A7
    jr   nz, jr_007_42C4                          ; $428F: $20 $33

    inc  [hl]                                     ; $4291: $34
    ld   hl, wEntity0PosY                         ; $4292: $21 $10 $C2
    add  hl, bc                                   ; $4295: $09
    ld   a, [hl]                                  ; $4296: $7E
    add  $08                                      ; $4297: $C6 $08
    ld   [hl], a                                  ; $4299: $77
    ld   a, $B8                                   ; $429A: $3E $B8
    call label_3B86                               ; $429C: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $429F: $F0 $D7
    ld   hl, wEntity0PosX                         ; $42A1: $21 $00 $C2
    add  hl, de                                   ; $42A4: $19
    add  $06                                      ; $42A5: $C6 $06
    ld   [hl], a                                  ; $42A7: $77
    ldh  a, [hScratchB]                           ; $42A8: $F0 $D8
    ld   hl, wEntity0PosY                         ; $42AA: $21 $10 $C2
    add  hl, de                                   ; $42AD: $19
    add  $10                                      ; $42AE: $C6 $10
    ld   [hl], a                                  ; $42B0: $77
    ld   hl, wEntitiesUnknownTableB               ; $42B1: $21 $B0 $C2
    add  hl, de                                   ; $42B4: $19
    ld   [hl], $02                                ; $42B5: $36 $02
    ld   hl, $C350                                ; $42B7: $21 $50 $C3
    add  hl, de                                   ; $42BA: $19
    ld   [hl], $AC                                ; $42BB: $36 $AC
    push bc                                       ; $42BD: $C5
    ld   c, e                                     ; $42BE: $4B
    ld   b, d                                     ; $42BF: $42
    call label_3AEA                               ; $42C0: $CD $EA $3A
    pop  bc                                       ; $42C3: $C1

jr_007_42C4:
    ldh  a, [hActiveEntityWalking]                ; $42C4: $F0 $F0
    cp   $06                                      ; $42C6: $FE $06
    jr   nc, jr_007_42DC                          ; $42C8: $30 $12

    ld   a, [wDialogState]                        ; $42CA: $FA $9F $C1
    and  a                                        ; $42CD: $A7
    jr   z, jr_007_42DC                           ; $42CE: $28 $0C

    ldh  a, [hActiveEntityUnknownG]               ; $42D0: $F0 $F1
    cp   $03                                      ; $42D2: $FE $03
    ld   a, $02                                   ; $42D4: $3E $02
    jr   nz, jr_007_42DA                          ; $42D6: $20 $02

    ld   a, $04                                   ; $42D8: $3E $04

jr_007_42DA:
    ldh  [hActiveEntityUnknownG], a               ; $42DA: $E0 $F1

jr_007_42DC:
    call func_007_4594                            ; $42DC: $CD $94 $45
    ldh  a, [hActiveEntityWalking]                ; $42DF: $F0 $F0
    cp   $0A                                      ; $42E1: $FE $0A
    jr   c, jr_007_42E8                           ; $42E3: $38 $03

    call func_007_43FD                            ; $42E5: $CD $FD $43

jr_007_42E8:
    call func_007_7D96                            ; $42E8: $CD $96 $7D
    ld   a, [wPhotos1]                            ; $42EB: $FA $0C $DC
    bit  0, a                                     ; $42EE: $CB $47
    jp   z, label_007_4328                        ; $42F0: $CA $28 $43

    bit  7, a                                     ; $42F3: $CB $7F
    jp   nz, label_007_4328                       ; $42F5: $C2 $28 $43

    ld   a, [wTradeSequenceItem]                  ; $42F8: $FA $0E $DB
    cp   $0D                                      ; $42FB: $FE $0D
    jp   c, label_007_4328                        ; $42FD: $DA $28 $43

    ldh  a, [hActiveEntityWalking]                ; $4300: $F0 $F0
    cp   $02                                      ; $4302: $FE $02
    jr   c, jr_007_4309                           ; $4304: $38 $03

    call func_007_434E                            ; $4306: $CD $4E $43

jr_007_4309:
    ldh  a, [hActiveEntityWalking]                ; $4309: $F0 $F0
    rst  $00                                      ; $430B: $C7
    dec  [hl]                                     ; $430C: $35
    ld   b, e                                     ; $430D: $43
    ld   d, [hl]                                  ; $430E: $56
    ld   b, e                                     ; $430F: $43
    ld   [hl], e                                  ; $4310: $73
    ld   b, e                                     ; $4311: $43
    ld   [hl], a                                  ; $4312: $77
    ld   b, e                                     ; $4313: $43
    add  d                                        ; $4314: $82
    ld   b, e                                     ; $4315: $43
    adc  h                                        ; $4316: $8C
    ld   b, e                                     ; $4317: $43
    add  hl, bc                                   ; $4318: $09
    ld   b, l                                     ; $4319: $45
    xor  l                                        ; $431A: $AD
    ld   b, e                                     ; $431B: $43
    push bc                                       ; $431C: $C5
    ld   b, e                                     ; $431D: $43
    ld   a, [de]                                  ; $431E: $1A
    ld   b, h                                     ; $431F: $44
    ld   d, h                                     ; $4320: $54
    ld   b, h                                     ; $4321: $44
    ld   d, h                                     ; $4322: $54
    ld   b, h                                     ; $4323: $44
    ld   [hl], l                                  ; $4324: $75
    ld   b, h                                     ; $4325: $44
    sbc  c                                        ; $4326: $99
    ld   b, h                                     ; $4327: $44

label_007_4328:
    ldh  a, [hActiveEntityWalking]                ; $4328: $F0 $F0
    rst  $00                                      ; $432A: $C7
    or   b                                        ; $432B: $B0
    ld   b, h                                     ; $432C: $44
    add  sp, $44                                  ; $432D: $E8 $44
    add  hl, bc                                   ; $432F: $09
    ld   b, l                                     ; $4330: $45
    scf                                           ; $4331: $37
    ld   b, l                                     ; $4332: $45
    adc  e                                        ; $4333: $8B
    ld   b, l                                     ; $4334: $45
    ld   hl, wEntitiesTypeTable                   ; $4335: $21 $A0 $C3

jr_007_4338:
    ld   a, [hl+]                                 ; $4338: $2A
    cp   $FA                                      ; $4339: $FE $FA
    jr   z, jr_007_4342                           ; $433B: $28 $05

    ld   a, l                                     ; $433D: $7D
    and  $0F                                      ; $433E: $E6 $0F
    jr   nz, jr_007_4338                          ; $4340: $20 $F6

jr_007_4342:
    ld   a, l                                     ; $4342: $7D
    dec  a                                        ; $4343: $3D
    and  $0F                                      ; $4344: $E6 $0F
    ld   hl, $C390                                ; $4346: $21 $90 $C3
    add  hl, bc                                   ; $4349: $09
    ld   [hl], a                                  ; $434A: $77
    jp   IncrementEntityWalkingAttr               ; $434B: $C3 $12 $3B

func_007_434E:
    ld   a, $02                                   ; $434E: $3E $02
    ldh  [$FFA1], a                               ; $4350: $E0 $A1
    ld   [wC167], a                               ; $4352: $EA $67 $C1
    ret                                           ; $4355: $C9

    call func_007_7D43                            ; $4356: $CD $43 $7D
    jp   nc, label_007_44DC                       ; $4359: $D2 $DC $44

    ldh  a, [hLinkAnimationState]                 ; $435C: $F0 $9D
    cp   $06                                      ; $435E: $FE $06
    jp   nz, label_007_44DC                       ; $4360: $C2 $DC $44

    call func_007_434E                            ; $4363: $CD $4E $43
    ld   a, $02                                   ; $4366: $3E $02
    call label_3B0C                               ; $4368: $CD $0C $3B
    ld   a, $25                                   ; $436B: $3E $25

jr_007_436D:
    call OpenDialogInTable1                       ; $436D: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4370: $C3 $12 $3B

    ld   a, $E9                                   ; $4373: $3E $E9
    jr   jr_007_436D                              ; $4375: $18 $F6

    call GetEntityTransitionCountdown                 ; $4377: $CD $05 $0C
    ld   [hl], $40                                ; $437A: $36 $40
    call IncrementEntityWalkingAttr               ; $437C: $CD $12 $3B
    jp   label_007_44DC                           ; $437F: $C3 $DC $44

    call func_007_44DC                            ; $4382: $CD $DC $44
    call GetEntityTransitionCountdown                 ; $4385: $CD $05 $0C
    ret  nz                                       ; $4388: $C0

    jp   IncrementEntityWalkingAttr               ; $4389: $C3 $12 $3B

    call func_007_44DC                            ; $438C: $CD $DC $44
    ld   hl, $C390                                ; $438F: $21 $90 $C3
    add  hl, bc                                   ; $4392: $09
    ld   e, [hl]                                  ; $4393: $5E
    ld   d, $00                                   ; $4394: $16 $00
    ld   hl, wEntity0PosX                         ; $4396: $21 $00 $C2
    add  hl, de                                   ; $4399: $19
    ld   a, [hl]                                  ; $439A: $7E
    cp   $2A                                      ; $439B: $FE $2A
    ret  nz                                       ; $439D: $C0

    ld   a, $08                                   ; $439E: $3E $08
    ld   hl, wEntitiesWalkingTable                ; $43A0: $21 $90 $C2
    add  hl, de                                   ; $43A3: $19
    ld   [hl], a                                  ; $43A4: $77
    call GetEntityTransitionCountdown                 ; $43A5: $CD $05 $0C
    ld   [hl], $C0                                ; $43A8: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $43AA: $C3 $12 $3B

    ldh  a, [hFrameCounter]                       ; $43AD: $F0 $E7
    and  $07                                      ; $43AF: $E6 $07
    ret  nz                                       ; $43B1: $C0

    ld   hl, $C390                                ; $43B2: $21 $90 $C3
    add  hl, bc                                   ; $43B5: $09
    ld   e, [hl]                                  ; $43B6: $5E
    ld   d, $00                                   ; $43B7: $16 $00
    ld   hl, wEntity0PosY                         ; $43B9: $21 $10 $C2
    add  hl, de                                   ; $43BC: $19
    dec  [hl]                                     ; $43BD: $35
    ld   a, [hl]                                  ; $43BE: $7E
    cp   $50                                      ; $43BF: $FE $50
    ret  nc                                       ; $43C1: $D0

    jp   IncrementEntityWalkingAttr               ; $43C2: $C3 $12 $3B

    ld   hl, $C390                                ; $43C5: $21 $90 $C3
    add  hl, bc                                   ; $43C8: $09
    ld   e, [hl]                                  ; $43C9: $5E
    ld   d, $00                                   ; $43CA: $16 $00
    ldh  a, [hFrameCounter]                       ; $43CC: $F0 $E7
    and  $07                                      ; $43CE: $E6 $07
    jr   nz, jr_007_43D7                          ; $43D0: $20 $05

    ld   hl, wEntity0PosX                         ; $43D2: $21 $00 $C2
    add  hl, de                                   ; $43D5: $19
    inc  [hl]                                     ; $43D6: $34

jr_007_43D7:
    ldh  a, [hFrameCounter]                       ; $43D7: $F0 $E7
    and  $01                                      ; $43D9: $E6 $01
    ret  nz                                       ; $43DB: $C0

    ld   hl, wEntity0PosY                         ; $43DC: $21 $10 $C2
    add  hl, de                                   ; $43DF: $19
    dec  [hl]                                     ; $43E0: $35
    ld   e, [hl]                                  ; $43E1: $5E
    ld   hl, wEntity0PosY                         ; $43E2: $21 $10 $C2
    add  hl, bc                                   ; $43E5: $09
    ld   a, [hl]                                  ; $43E6: $7E
    add  $02                                      ; $43E7: $C6 $02
    cp   e                                        ; $43E9: $BB
    ret  c                                        ; $43EA: $D8

    ld   a, $24                                   ; $43EB: $3E $24
    call OpenDialogInTable1                       ; $43ED: $CD $73 $23
    ld   a, $04                                   ; $43F0: $3E $04
    call label_3B0C                               ; $43F2: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $43F5: $CD $05 $0C
    ld   [hl], $50                                ; $43F8: $36 $50
    jp   IncrementEntityWalkingAttr               ; $43FA: $C3 $12 $3B

func_007_43FD:
    push bc                                       ; $43FD: $C5
    ld   bc, $C010                                ; $43FE: $01 $10 $C0
    ldh  a, [hLinkPositionY]                      ; $4401: $F0 $99
    ldh  [hScratchA], a                           ; $4403: $E0 $D7
    ldh  a, [hLinkPositionX]                      ; $4405: $F0 $98
    ldh  [hScratchB], a                           ; $4407: $E0 $D8
    ld   a, $06                                   ; $4409: $3E $06
    ldh  [hScratchC], a                           ; $440B: $E0 $D9
    ld   h, $F0                                   ; $440D: $26 $F0
    ld   l, $FC                                   ; $440F: $2E $FC
    call label_1819                               ; $4411: $CD $19 $18
    pop  bc                                       ; $4414: $C1
    ld   a, $6C                                   ; $4415: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4417: $E0 $9D
    ret                                           ; $4419: $C9

    ld   a, $04                                   ; $441A: $3E $04
    call label_3B0C                               ; $441C: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $441F: $CD $05 $0C
    jr   nz, jr_007_4429                          ; $4422: $20 $05

    ld   [hl], $30                                ; $4424: $36 $30
    call IncrementEntityWalkingAttr               ; $4426: $CD $12 $3B

func_007_4429:
jr_007_4429:
    ldh  a, [hActiveEntityWalking]                ; $4429: $F0 $F0
    cp   $0C                                      ; $442B: $FE $0C
    jr   c, jr_007_4436                           ; $442D: $38 $07

    call func_007_4005                            ; $442F: $CD $05 $40
    ld   a, [hl]                                  ; $4432: $7E
    bit  7, a                                     ; $4433: $CB $7F
    ret  z                                        ; $4435: $C8

jr_007_4436:
    ld   hl, $C390                                ; $4436: $21 $90 $C3
    add  hl, bc                                   ; $4439: $09
    ld   e, [hl]                                  ; $443A: $5E
    ld   d, $00                                   ; $443B: $16 $00
    ld   hl, wEntity0PosY                         ; $443D: $21 $10 $C2
    add  hl, bc                                   ; $4440: $09
    ld   a, [hl]                                  ; $4441: $7E
    ld   hl, wEntity0PosY                         ; $4442: $21 $10 $C2
    add  hl, de                                   ; $4445: $19
    ld   [hl], a                                  ; $4446: $77
    ld   hl, wEntity0PosX                         ; $4447: $21 $00 $C2
    add  hl, bc                                   ; $444A: $09
    ld   a, [hl]                                  ; $444B: $7E
    sub  $1A                                      ; $444C: $D6 $1A
    ld   hl, wEntity0PosX                         ; $444E: $21 $00 $C2
    add  hl, de                                   ; $4451: $19
    ld   [hl], a                                  ; $4452: $77
    ret                                           ; $4453: $C9

    call func_007_4429                            ; $4454: $CD $29 $44
    call GetEntityTransitionCountdown                 ; $4457: $CD $05 $0C
    ret  nz                                       ; $445A: $C0

    ld   [hl], $10                                ; $445B: $36 $10
    ld   a, $04                                   ; $445D: $3E $04
    call label_3B0C                               ; $445F: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $4462: $CD $12 $3B
    ld   a, [hl]                                  ; $4465: $7E
    cp   $0C                                      ; $4466: $FE $0C
    ret  nz                                       ; $4468: $C0

    ld   hl, wEntity0SpeedX                       ; $4469: $21 $40 $C2
    add  hl, bc                                   ; $446C: $09
    ld   [hl], $F8                                ; $446D: $36 $F8
    call func_007_4005                            ; $446F: $CD $05 $40
    ld   [hl], $F8                                ; $4472: $36 $F8
    ret                                           ; $4474: $C9

    call func_007_4429                            ; $4475: $CD $29 $44
    ld   hl, wEntity0PosY                         ; $4478: $21 $10 $C2
    add  hl, bc                                   ; $447B: $09
    ld   a, [hl]                                  ; $447C: $7E
    cp   $4C                                      ; $447D: $FE $4C
    jr   c, jr_007_4491                           ; $447F: $38 $10

    call func_007_48FD                            ; $4481: $CD $FD $48
    ld   a, $17                                   ; $4484: $3E $17
    call OpenDialogInTable1                       ; $4486: $CD $73 $23
    ld   a, $04                                   ; $4489: $3E $04
    call label_3B0C                               ; $448B: $CD $0C $3B
    jp   IncrementEntityWalkingAttr               ; $448E: $C3 $12 $3B

jr_007_4491:
    call func_007_7E0A                            ; $4491: $CD $0A $7E
    call func_007_4005                            ; $4494: $CD $05 $40
    inc  [hl]                                     ; $4497: $34
    ret                                           ; $4498: $C9

    call func_007_4429                            ; $4499: $CD $29 $44
    ld   a, $40                                   ; $449C: $3E $40
    ldh  [hNoiseSfx], a                            ; $449E: $E0 $F4
    ld   a, $16                                   ; $44A0: $3E $16
    ld   [wGameplayType], a                       ; $44A2: $EA $95 $DB
    xor  a                                        ; $44A5: $AF
    ld   [wGameplaySubtype], a                    ; $44A6: $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ; $44A9: $EA $6B $C1
    ld   [wC16C], a                               ; $44AC: $EA $6C $C1
    ret                                           ; $44AF: $C9

    call func_007_7D43                            ; $44B0: $CD $43 $7D
    jr   nc, jr_007_44DC                          ; $44B3: $30 $27

    ldh  a, [hLinkAnimationState]                 ; $44B5: $F0 $9D
    cp   $58                                      ; $44B7: $FE $58
    jr   c, jr_007_44BF                           ; $44B9: $38 $04

    cp   $5E                                      ; $44BB: $FE $5E
    jr   c, jr_007_44DC                           ; $44BD: $38 $1D

jr_007_44BF:
    ld   a, [wTradeSequenceItem]                  ; $44BF: $FA $0E $DB
    cp   $0B                                      ; $44C2: $FE $0B
    jr   nz, jr_007_44CE                          ; $44C4: $20 $08

    ld   a, $E8                                   ; $44C6: $3E $E8
    call OpenDialogInTable1                       ; $44C8: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $44CB: $C3 $12 $3B

jr_007_44CE:
    cp   $0C                                      ; $44CE: $FE $0C
    jr   nc, jr_007_44D7                          ; $44D0: $30 $05

    ld   a, $E7                                   ; $44D2: $3E $E7
    jp   OpenDialogInTable1                       ; $44D4: $C3 $73 $23

jr_007_44D7:
    ld   a, $ED                                   ; $44D7: $3E $ED
    jp   OpenDialogInTable1                       ; $44D9: $C3 $73 $23

func_007_44DC:
label_007_44DC:
jr_007_44DC:
    ldh  a, [hFrameCounter]                       ; $44DC: $F0 $E7
    and  $30                                      ; $44DE: $E6 $30
    ld   e, b                                     ; $44E0: $58
    jr   z, jr_007_44E4                           ; $44E1: $28 $01

    inc  e                                        ; $44E3: $1C

jr_007_44E4:
    ld   a, e                                     ; $44E4: $7B
    jp   label_3B0C                               ; $44E5: $C3 $0C $3B

    call IncrementEntityWalkingAttr               ; $44E8: $CD $12 $3B
    ld   a, [wC177]                               ; $44EB: $FA $77 $C1
    and  a                                        ; $44EE: $A7
    jr   nz, jr_007_4503                          ; $44EF: $20 $12

    ld   a, $01                                   ; $44F1: $3E $01
    ld   [$DB7F], a                               ; $44F3: $EA $7F $DB
    ld   [wC167], a                               ; $44F6: $EA $67 $C1
    call GetEntityTransitionCountdown                 ; $44F9: $CD $05 $0C
    ld   [hl], $D0                                ; $44FC: $36 $D0
    ld   a, $E9                                   ; $44FE: $3E $E9
    jp   OpenDialogInTable1                       ; $4500: $C3 $73 $23

jr_007_4503:
    ld   [hl], b                                  ; $4503: $70
    ld   a, $EA                                   ; $4504: $3E $EA
    jp   OpenDialogInTable1                       ; $4506: $C3 $73 $23

    ld   a, $02                                   ; $4509: $3E $02
    ldh  [$FFA1], a                               ; $450B: $E0 $A1
    ld   a, $01                                   ; $450D: $3E $01
    ld   [wMusicTrackTiming], a                               ; $450F: $EA $0B $C1
    call GetEntityTransitionCountdown                 ; $4512: $CD $05 $0C
    jr   nz, jr_007_4521                          ; $4515: $20 $0A

    ld   [hl], $20                                ; $4517: $36 $20
    ld   a, $EB                                   ; $4519: $3E $EB
    call OpenDialogInTable1                       ; $451B: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $451E: $CD $12 $3B

jr_007_4521:
    ld   e, $03                                   ; $4521: $1E $03
    cp   $30                                      ; $4523: $FE $30
    jr   c, jr_007_4533                           ; $4525: $38 $0C

    cp   $80                                      ; $4527: $FE $80
    jr   nc, jr_007_44DC                          ; $4529: $30 $B1

    ldh  a, [hFrameCounter]                       ; $452B: $F0 $E7
    and  $18                                      ; $452D: $E6 $18
    ld   e, b                                     ; $452F: $58
    jr   z, jr_007_4533                           ; $4530: $28 $01

    inc  e                                        ; $4532: $1C

jr_007_4533:
    ld   a, e                                     ; $4533: $7B
    jp   label_3B0C                               ; $4534: $C3 $0C $3B

    ld   a, $02                                   ; $4537: $3E $02
    ldh  [$FFA1], a                               ; $4539: $E0 $A1
    call GetEntityTransitionCountdown                 ; $453B: $CD $05 $0C
    jr   nz, jr_007_4586                          ; $453E: $20 $46

    ld   [wMusicTrackTiming], a                               ; $4540: $EA $0B $C1
    call IncrementEntityWalkingAttr               ; $4543: $CD $12 $3B
    ld   a, $54                                   ; $4546: $3E $54
    call label_3B86                               ; $4548: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $454B: $F0 $D7
    sub  $20                                      ; $454D: $D6 $20
    ld   hl, wEntity0PosX                         ; $454F: $21 $00 $C2
    add  hl, de                                   ; $4552: $19
    ld   [hl], a                                  ; $4553: $77
    ldh  [wActiveEntityPosX], a                   ; $4554: $E0 $EE
    ldh  a, [hScratchB]                           ; $4556: $F0 $D8
    add  $08                                      ; $4558: $C6 $08
    ld   hl, wEntity0PosY                         ; $455A: $21 $10 $C2
    add  hl, de                                   ; $455D: $19
    ld   [hl], a                                  ; $455E: $77
    ldh  [wActiveEntityPosY], a                   ; $455F: $E0 $EC
    ld   hl, wEntitiesSpeedZTable                                ; $4561: $21 $20 $C3
    add  hl, de                                   ; $4564: $19
    ld   [hl], $20                                ; $4565: $36 $20
    ld   hl, $C440                                ; $4567: $21 $40 $C4
    add  hl, de                                   ; $456A: $19
    ld   [hl], $01                                ; $456B: $36 $01
    push bc                                       ; $456D: $C5
    ld   c, e                                     ; $456E: $4B
    ld   b, d                                     ; $456F: $42
    ld   a, $0A                                   ; $4570: $3E $0A
    call label_3BAA                               ; $4572: $CD $AA $3B
    pop  bc                                       ; $4575: $C1
    call func_007_48FD                            ; $4576: $CD $FD $48
    ld   a, $08                                   ; $4579: $3E $08
    ldh  [hJingle], a                             ; $457B: $E0 $F2
    ld   a, $0C                                   ; $457D: $3E $0C
    ld   [wTradeSequenceItem], a                  ; $457F: $EA $0E $DB
    ld   a, $0D                                   ; $4582: $3E $0D
    ldh  [hFFA5], a                               ; $4584: $E0 $A5

jr_007_4586:
    ld   a, $03                                   ; $4586: $3E $03
    jp   label_3B0C                               ; $4588: $C3 $0C $3B

    ld   a, $02                                   ; $458B: $3E $02
    ldh  [$FFA1], a                               ; $458D: $E0 $A1
    call IncrementEntityWalkingAttr               ; $458F: $CD $12 $3B
    ld   [hl], b                                  ; $4592: $70
    ret                                           ; $4593: $C9

func_007_4594:
    ldh  a, [hActiveEntityUnknownG]               ; $4594: $F0 $F1
    rla                                           ; $4596: $17
    rla                                           ; $4597: $17
    rla                                           ; $4598: $17
    rla                                           ; $4599: $17
    and  $F0                                      ; $459A: $E6 $F0
    ld   e, a                                     ; $459C: $5F
    ld   d, b                                     ; $459D: $50
    ld   hl, $4234                                ; $459E: $21 $34 $42
    add  hl, de                                   ; $45A1: $19
    ld   c, $04                                   ; $45A2: $0E $04
    jp   label_3CE6                               ; $45A4: $C3 $E6 $3C

    cp   $FE                                      ; $45A7: $FE $FE
    cp   $FE                                      ; $45A9: $FE $FE
    rst  $38                                      ; $45AB: $FF
    rst  $38                                      ; $45AC: $FF
    rst  $38                                      ; $45AD: $FF
    rst  $38                                      ; $45AE: $FF
    rst  $38                                      ; $45AF: $FF
    nop                                           ; $45B0: $00
    nop                                           ; $45B1: $00
    ld   bc, $0101                                ; $45B2: $01 $01 $01
    ld   bc, $0201                                ; $45B5: $01 $01 $02
    ld   [bc], a                                  ; $45B8: $02
    ld   [bc], a                                  ; $45B9: $02
    ld   [bc], a                                  ; $45BA: $02
    ld   [bc], a                                  ; $45BB: $02
    ld   [bc], a                                  ; $45BC: $02
    ld   [bc], a                                  ; $45BD: $02
    ld   [bc], a                                  ; $45BE: $02
    ld   [bc], a                                  ; $45BF: $02
    ld   [bc], a                                  ; $45C0: $02
    ld   [bc], a                                  ; $45C1: $02
    ld   [bc], a                                  ; $45C2: $02
    ld   [bc], a                                  ; $45C3: $02
    ld   [bc], a                                  ; $45C4: $02
    ld   [bc], a                                  ; $45C5: $02
    ld   [bc], a                                  ; $45C6: $02
    ld   [bc], a                                  ; $45C7: $02
    ld   [bc], a                                  ; $45C8: $02
    ld   bc, $0000                                ; $45C9: $01 $00 $00
    rst  $38                                      ; $45CC: $FF
    cp   $FE                                      ; $45CD: $FE $FE
    ld   bc, $0101                                ; $45CF: $01 $01 $01
    nop                                           ; $45D2: $00
    nop                                           ; $45D3: $00
    rst  $38                                      ; $45D4: $FF
    rst  $38                                      ; $45D5: $FF
    rst  $38                                      ; $45D6: $FF
    nop                                           ; $45D7: $00
    nop                                           ; $45D8: $00
    nop                                           ; $45D9: $00
    nop                                           ; $45DA: $00
    nop                                           ; $45DB: $00
    nop                                           ; $45DC: $00
    nop                                           ; $45DD: $00
    nop                                           ; $45DE: $00
    rst  $38                                      ; $45DF: $FF
    rst  $38                                      ; $45E0: $FF
    rst  $38                                      ; $45E1: $FF
    nop                                           ; $45E2: $00
    nop                                           ; $45E3: $00
    ld   bc, $0101                                ; $45E4: $01 $01 $01
    cp   $FE                                      ; $45E7: $FE $FE
    rst  $38                                      ; $45E9: $FF
    nop                                           ; $45EA: $00
    nop                                           ; $45EB: $00
    ld   bc, $0202                                ; $45EC: $01 $02 $02
    nop                                           ; $45EF: $00
    nop                                           ; $45F0: $00
    ld   bc, $0202                                ; $45F1: $01 $02 $02
    ld   [bc], a                                  ; $45F4: $02
    ld   bc, $2100                                ; $45F5: $01 $00 $21
    ret  nc                                       ; $45F8: $D0

    jp   label_007_7E09                           ; $45F9: $C3 $09 $7E

    rra                                           ; $45FC: $1F
    rra                                           ; $45FD: $1F
    rra                                           ; $45FE: $1F
    and  $07                                      ; $45FF: $E6 $07
    ld   e, a                                     ; $4601: $5F
    ld   d, b                                     ; $4602: $50
    ld   hl, $45EF                                ; $4603: $21 $EF $45
    add  hl, de                                   ; $4606: $19
    ldh  a, [wActiveEntityPosY]                   ; $4607: $F0 $EC
    add  [hl]                                     ; $4609: $86
    ldh  [wActiveEntityPosY], a                   ; $460A: $E0 $EC
    ld   a, [wEntitiesWalkingTable]               ; $460C: $FA $90 $C2
    cp   $0C                                      ; $460F: $FE $0C
    jr   nc, jr_007_461A                          ; $4611: $30 $07

    ldh  a, [wActiveEntityPosY]                   ; $4613: $F0 $EC
    sub  $10                                      ; $4615: $D6 $10
    ld   [wEntity0PosY], a                        ; $4617: $EA $10 $C2

jr_007_461A:
    call func_007_467B                            ; $461A: $CD $7B $46
    call label_3B5A                               ; $461D: $CD $5A $3B
    jr   nc, jr_007_4640                          ; $4620: $30 $1E

    ldh  a, [hLinkPositionYIncrement]             ; $4622: $F0 $9B
    and  $80                                      ; $4624: $E6 $80
    jr   nz, jr_007_4640                          ; $4626: $20 $18

    call func_007_7E6D                            ; $4628: $CD $6D $7E
    add  $08                                      ; $462B: $C6 $08
    bit  7, a                                     ; $462D: $CB $7F
    jr   z, jr_007_4640                           ; $462F: $28 $0F

    ldh  a, [wActiveEntityPosY]                   ; $4631: $F0 $EC
    sub  $0F                                      ; $4633: $D6 $0F
    ldh  [hLinkPositionY], a                      ; $4635: $E0 $99
    ld   a, $02                                   ; $4637: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $4639: $E0 $9B
    ld   a, $01                                   ; $463B: $3E $01
    ld   [$C147], a                               ; $463D: $EA $47 $C1

jr_007_4640:
    call func_007_7D96                            ; $4640: $CD $96 $7D
    ld   hl, $C3D0                                ; $4643: $21 $D0 $C3
    add  hl, bc                                   ; $4646: $09
    inc  [hl]                                     ; $4647: $34
    ld   a, [hl]                                  ; $4648: $7E
    and  $07                                      ; $4649: $E6 $07
    jr   nz, jr_007_4666                          ; $464B: $20 $19

    ld   e, $48                                   ; $464D: $1E $48
    ld   a, [$C147]                               ; $464F: $FA $47 $C1
    and  a                                        ; $4652: $A7
    jr   z, jr_007_4657                           ; $4653: $28 $02

    ld   e, $4B                                   ; $4655: $1E $4B

jr_007_4657:
    ld   hl, wEntity0PosY                         ; $4657: $21 $10 $C2
    add  hl, bc                                   ; $465A: $09
    ld   a, [hl]                                  ; $465B: $7E
    sub  e                                        ; $465C: $93
    jr   z, jr_007_4666                           ; $465D: $28 $07

    and  $80                                      ; $465F: $E6 $80
    jr   z, jr_007_4665                           ; $4661: $28 $02

    inc  [hl]                                     ; $4663: $34
    inc  [hl]                                     ; $4664: $34

jr_007_4665:
    dec  [hl]                                     ; $4665: $35

jr_007_4666:
    ret                                           ; $4666: $C9

    nop                                           ; $4667: $00
    ld   hl, sp+$68                               ; $4668: $F8 $68
    ld   [bc], a                                  ; $466A: $02
    nop                                           ; $466B: $00
    nop                                           ; $466C: $00
    ld   l, d                                     ; $466D: $6A
    ld   [bc], a                                  ; $466E: $02
    nop                                           ; $466F: $00
    ld   [$026A], sp                              ; $4670: $08 $6A $02
    nop                                           ; $4673: $00
    db   $10                                      ; $4674: $10
    ld   l, d                                     ; $4675: $6A
    ld   [bc], a                                  ; $4676: $02
    nop                                           ; $4677: $00
    jr   jr_007_46E6                              ; $4678: $18 $6C

    ld   [bc], a                                  ; $467A: $02

func_007_467B:
    ld   hl, $4667                                ; $467B: $21 $67 $46
    ld   c, $05                                   ; $467E: $0E $05
    jp   label_3CE6                               ; $4680: $C3 $E6 $3C

    ld   [hl], d                                  ; $4683: $72
    ld   hl, $2170                                ; $4684: $21 $70 $21
    ld   [hl], b                                  ; $4687: $70
    ld   bc, $0172                                ; $4688: $01 $72 $01
    db   $76                                      ; $468B: $76
    ld   bc, $0178                                ; $468C: $01 $78 $01
    ld   a, b                                     ; $468F: $78
    ld   hl, $2176                                ; $4690: $21 $76 $21
    ld   [hl], h                                  ; $4693: $74
    nop                                           ; $4694: $00
    ld   [hl], h                                  ; $4695: $74
    jr   nz, @+$76                                ; $4696: $20 $74

    db   $10                                      ; $4698: $10
    ld   [hl], h                                  ; $4699: $74
    jr   nc, jr_007_469C                          ; $469A: $30 $00

jr_007_469C:
    db   $FC                                      ; $469C: $FC
    ld   a, d                                     ; $469D: $7A
    ld   bc, $0400                                ; $469E: $01 $00 $04
    ld   a, h                                     ; $46A1: $7C
    ld   bc, IsEntityUnknownFZero                            ; $46A2: $01 $00 $0C
    ld   a, [hl]                                  ; $46A5: $7E
    ld   bc, $FC00                                ; $46A6: $01 $00 $FC
    ld   a, [hl]                                  ; $46A9: $7E
    ld   hl, $0400                                ; $46AA: $21 $00 $04
    ld   a, h                                     ; $46AD: $7C
    ld   hl, IsEntityUnknownFZero                            ; $46AE: $21 $00 $0C
    ld   a, d                                     ; $46B1: $7A
    ld   hl, $0000                                ; $46B2: $21 $00 $00
    ld   bc, $0202                                ; $46B5: $01 $02 $02
    ld   [bc], a                                  ; $46B8: $02
    ld   bc, $2100                                ; $46B9: $01 $00 $21
    ret  nc                                       ; $46BC: $D0

    jp   nz, label_007_7E09                       ; $46BD: $C2 $09 $7E

    and  a                                        ; $46C0: $A7
    jp   nz, label_007_490F                       ; $46C1: $C2 $0F $49

    ldh  a, [hActiveEntityWalking]                ; $46C4: $F0 $F0
    cp   $02                                      ; $46C6: $FE $02
    jr   nc, jr_007_46E4                          ; $46C8: $30 $1A

    ldh  a, [hRoomStatus]                         ; $46CA: $F0 $F8
    and  $20                                      ; $46CC: $E6 $20
    jr   z, jr_007_46D2                           ; $46CE: $28 $02

    inc  [hl]                                     ; $46D0: $34
    ret                                           ; $46D1: $C9

jr_007_46D2:
    ldh  a, [hFrameCounter]                       ; $46D2: $F0 $E7
    rra                                           ; $46D4: $1F
    rra                                           ; $46D5: $1F
    rra                                           ; $46D6: $1F
    and  $07                                      ; $46D7: $E6 $07
    ld   e, a                                     ; $46D9: $5F
    ld   d, b                                     ; $46DA: $50
    ld   hl, $46B3                                ; $46DB: $21 $B3 $46
    add  hl, de                                   ; $46DE: $19
    ldh  a, [wActiveEntityPosY]                   ; $46DF: $F0 $EC
    add  [hl]                                     ; $46E1: $86
    ldh  [wActiveEntityPosY], a                   ; $46E2: $E0 $EC

jr_007_46E4:
    ldh  a, [hActiveEntityUnknownG]               ; $46E4: $F0 $F1

jr_007_46E6:
    cp   $04                                      ; $46E6: $FE $04
    jr   c, jr_007_4702                           ; $46E8: $38 $18

    sub  $04                                      ; $46EA: $D6 $04
    rla                                           ; $46EC: $17
    rla                                           ; $46ED: $17
    and  $FC                                      ; $46EE: $E6 $FC
    ld   e, a                                     ; $46F0: $5F
    rla                                           ; $46F1: $17
    and  $F8                                      ; $46F2: $E6 $F8
    add  e                                        ; $46F4: $83
    ld   e, a                                     ; $46F5: $5F
    ld   d, b                                     ; $46F6: $50
    ld   hl, $469B                                ; $46F7: $21 $9B $46
    add  hl, de                                   ; $46FA: $19
    ld   c, $03                                   ; $46FB: $0E $03
    call label_3CE6                               ; $46FD: $CD $E6 $3C
    jr   jr_007_470B                              ; $4700: $18 $09

jr_007_4702:
    ld   de, $4683                                ; $4702: $11 $83 $46
    call RenderAnimatedActiveEntity                               ; $4705: $CD $C0 $3B
    call label_3D8A                               ; $4708: $CD $8A $3D

jr_007_470B:
    ldh  a, [hActiveEntityWalking]                ; $470B: $F0 $F0
    cp   $05                                      ; $470D: $FE $05
    jr   z, jr_007_4715                           ; $470F: $28 $04

    cp   $03                                      ; $4711: $FE $03
    jr   nc, jr_007_4727                          ; $4713: $30 $12

jr_007_4715:
    ldh  a, [wActiveEntityPosY]                   ; $4715: $F0 $EC
    add  $0B                                      ; $4717: $C6 $0B
    ldh  [wActiveEntityPosY], a                   ; $4719: $E0 $EC
    xor  a                                        ; $471B: $AF
    ldh  [hActiveEntityUnknownG], a               ; $471C: $E0 $F1
    ld   de, $4693                                ; $471E: $11 $93 $46
    call RenderAnimatedActiveEntity                               ; $4721: $CD $C0 $3B
    call label_3D8A                               ; $4724: $CD $8A $3D

jr_007_4727:
    ldh  a, [hActiveEntityWalking]                ; $4727: $F0 $F0
    cp   $07                                      ; $4729: $FE $07
    jr   c, jr_007_4734                           ; $472B: $38 $07

    ld   a, $02                                   ; $472D: $3E $02
    ldh  [$FFA1], a                               ; $472F: $E0 $A1
    ld   [wC167], a                               ; $4731: $EA $67 $C1

jr_007_4734:
    call func_007_7D96                            ; $4734: $CD $96 $7D
    ldh  a, [hActiveEntityWalking]                ; $4737: $F0 $F0
    rst  $00                                      ; $4739: $C7
    ld   d, b                                     ; $473A: $50
    ld   b, a                                     ; $473B: $47
    ld   e, c                                     ; $473C: $59
    ld   b, a                                     ; $473D: $47
    xor  [hl]                                     ; $473E: $AE
    ld   b, a                                     ; $473F: $47
    or   c                                        ; $4740: $B1
    ld   b, a                                     ; $4741: $47
    reti                                          ; $4742: $D9

    ld   b, a                                     ; $4743: $47
    push af                                       ; $4744: $F5
    ld   b, a                                     ; $4745: $47
    ld   a, [bc]                                  ; $4746: $0A
    ld   c, b                                     ; $4747: $48
    ld   h, a                                     ; $4748: $67
    ld   c, b                                     ; $4749: $48
    adc  [hl]                                     ; $474A: $8E
    ld   c, b                                     ; $474B: $48
    or   b                                        ; $474C: $B0
    ld   c, b                                     ; $474D: $48
    jp   z, $2148                                 ; $474E: $CA $48 $21

    or   b                                        ; $4751: $B0
    jp   nz, $3609                                ; $4752: $C2 $09 $36

    jr   nc, @-$3B                                ; $4755: $30 $C3

    ld   [de], a                                  ; $4757: $12
    dec  sp                                       ; $4758: $3B
    ld   a, [wGameplayType]                       ; $4759: $FA $95 $DB
    cp   $0B                                      ; $475C: $FE $0B
    ret  nz                                       ; $475E: $C0

    ld   a, [wTransitionSequenceCounter]          ; $475F: $FA $6B $C1
    cp   $04                                      ; $4762: $FE $04
    ret  nz                                       ; $4764: $C0

    call func_007_7E5D                            ; $4765: $CD $5D $7E
    ld   a, e                                     ; $4768: $7B
    call label_3B0C                               ; $4769: $CD $0C $3B
    call func_007_7CF0                            ; $476C: $CD $F0 $7C
    call func_007_7E5D                            ; $476F: $CD $5D $7E
    add  $12                                      ; $4772: $C6 $12
    cp   $24                                      ; $4774: $FE $24
    jr   nc, jr_007_4793                          ; $4776: $30 $1B

    call func_007_7E6D                            ; $4778: $CD $6D $7E
    add  $12                                      ; $477B: $C6 $12
    cp   $24                                      ; $477D: $FE $24
    jr   nc, jr_007_4793                          ; $477F: $30 $12

    ldh  a, [hFF9C]                               ; $4781: $F0 $9C
    and  a                                        ; $4783: $A7
    jr   z, jr_007_4793                           ; $4784: $28 $0D

    call IncrementEntityWalkingAttr               ; $4786: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $4789: $CD $05 $0C
    ld   [hl], $14                                ; $478C: $36 $14
    ld   a, $F1                                   ; $478E: $3E $F1
    jp   OpenDialogInTable1                       ; $4790: $C3 $73 $23

jr_007_4793:
    call func_007_7D43                            ; $4793: $CD $43 $7D
    ret  nc                                       ; $4796: $D0

    ld   a, [wTradeSequenceItem]                  ; $4797: $FA $0E $DB
    cp   $0C                                      ; $479A: $FE $0C
    jr   nz, jr_007_47A9                          ; $479C: $20 $0B

    ld   a, $F2                                   ; $479E: $3E $F2
    call OpenDialogInTable1                       ; $47A0: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $47A3: $CD $12 $3B
    ld   [hl], $05                                ; $47A6: $36 $05
    ret                                           ; $47A8: $C9

jr_007_47A9:
    ld   a, $F0                                   ; $47A9: $3E $F0
    jp   OpenDialogInTable1                       ; $47AB: $C3 $73 $23

    jp   IncrementEntityWalkingAttr               ; $47AE: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $47B1: $FA $9F $C1
    and  a                                        ; $47B4: $A7
    ret  nz                                       ; $47B5: $C0

    call GetEntityTransitionCountdown                 ; $47B6: $CD $05 $0C
    jr   nz, jr_007_47C8                          ; $47B9: $20 $0D

    ld   [hl], $40                                ; $47BB: $36 $40
    call func_007_48FD                            ; $47BD: $CD $FD $48
    call IncrementEntityWalkingAttr               ; $47C0: $CD $12 $3B
    ld   a, $FF                                   ; $47C3: $3E $FF
    jp   label_3B0C                               ; $47C5: $C3 $0C $3B

jr_007_47C8:
    ld   e, $FF                                   ; $47C8: $1E $FF
    cp   $10                                      ; $47CA: $FE $10
    jr   nc, jr_007_47D5                          ; $47CC: $30 $07

    ld   e, $02                                   ; $47CE: $1E $02
    cp   $08                                      ; $47D0: $FE $08
    jr   c, jr_007_47D5                           ; $47D2: $38 $01

    inc  e                                        ; $47D4: $1C

jr_007_47D5:
    ld   a, e                                     ; $47D5: $7B
    jp   label_3B0C                               ; $47D6: $C3 $0C $3B

    call GetEntityTransitionCountdown                 ; $47D9: $CD $05 $0C
    ret  nz                                       ; $47DC: $C0

    ld   hl, wEntitiesUnknownTableB               ; $47DD: $21 $B0 $C2
    add  hl, bc                                   ; $47E0: $09
    ld   a, [hl]                                  ; $47E1: $7E
    cpl                                           ; $47E2: $2F
    inc  a                                        ; $47E3: $3C
    ld   [hl], a                                  ; $47E4: $77
    ld   hl, wEntity0PosX                         ; $47E5: $21 $00 $C2
    add  hl, bc                                   ; $47E8: $09
    add  [hl]                                     ; $47E9: $86
    ld   [hl], a                                  ; $47EA: $77
    ldh  [wActiveEntityPosX], a                   ; $47EB: $E0 $EE
    call IncrementEntityWalkingAttr               ; $47ED: $CD $12 $3B
    ld   [hl], $01                                ; $47F0: $36 $01
    jp   label_007_48FD                           ; $47F2: $C3 $FD $48

    call IncrementEntityWalkingAttr               ; $47F5: $CD $12 $3B
    ld   a, [wC177]                               ; $47F8: $FA $77 $C1
    and  a                                        ; $47FB: $A7
    jr   nz, jr_007_4804                          ; $47FC: $20 $06

    call GetEntityTransitionCountdown                 ; $47FE: $CD $05 $0C
    ld   [hl], $C0                                ; $4801: $36 $C0
    ret                                           ; $4803: $C9

jr_007_4804:
    ld   [hl], b                                  ; $4804: $70
    ld   a, $F4                                   ; $4805: $3E $F4
    jp   OpenDialogInTable1                       ; $4807: $C3 $73 $23

    ld   a, [wDialogState]                        ; $480A: $FA $9F $C1
    and  a                                        ; $480D: $A7
    ret  nz                                       ; $480E: $C0

    call GetEntityTransitionCountdown                 ; $480F: $CD $05 $0C
    jr   z, jr_007_4854                           ; $4812: $28 $40

    cp   $70                                      ; $4814: $FE $70
    jr   nz, jr_007_4820                          ; $4816: $20 $08

    dec  [hl]                                     ; $4818: $35
    push af                                       ; $4819: $F5
    ld   a, $F3                                   ; $481A: $3E $F3
    call OpenDialogInTable1                       ; $481C: $CD $73 $23
    pop  af                                       ; $481F: $F1

jr_007_4820:
    cp   $90                                      ; $4820: $FE $90
    jr   nz, jr_007_483A                          ; $4822: $20 $16

    ldh  a, [hLinkPositionY]                      ; $4824: $F0 $99
    sub  $03                                      ; $4826: $D6 $03
    ldh  [hScratchB], a                           ; $4828: $E0 $D8
    ldh  a, [hLinkPositionX]                      ; $482A: $F0 $98
    ldh  [hScratchA], a                           ; $482C: $E0 $D7
    ld   a, $0E                                   ; $482E: $3E $0E
    ldh  [hJingle], a                             ; $4830: $E0 $F2
    ld   a, $01                                   ; $4832: $3E $01
    call label_CC7                                ; $4834: $CD $C7 $0C
    call GetEntityTransitionCountdown                 ; $4837: $CD $05 $0C

jr_007_483A:
    ld   e, $00                                   ; $483A: $1E $00
    cp   $20                                      ; $483C: $FE $20
    jr   c, jr_007_4846                           ; $483E: $38 $06

    cp   $90                                      ; $4840: $FE $90
    jr   nc, jr_007_4846                          ; $4842: $30 $02

    ld   e, $01                                   ; $4844: $1E $01

jr_007_4846:
    ld   a, e                                     ; $4846: $7B
    ldh  [hFF9C], a                               ; $4847: $E0 $9C
    ld   hl, $FFA1                                ; $4849: $21 $A1 $FF
    ld   [hl], $02                                ; $484C: $36 $02
    ld   a, $04                                   ; $484E: $3E $04
    ld   [$C13B], a                               ; $4850: $EA $3B $C1
    ret                                           ; $4853: $C9

jr_007_4854:
    ld   a, $0D                                   ; $4854: $3E $0D
    ld   [wTradeSequenceItem], a                  ; $4856: $EA $0E $DB
    ldh  [hFFA5], a                               ; $4859: $E0 $A5
    call label_C0C                                ; $485B: $CD $0C $0C
    call IncrementEntityWalkingAttr               ; $485E: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $4861: $CD $05 $0C
    ld   [hl], $30                                ; $4864: $36 $30
    ret                                           ; $4866: $C9

    call GetEntityTransitionCountdown                 ; $4867: $CD $05 $0C
    ret  nz                                       ; $486A: $C0

    call IncrementEntityWalkingAttr               ; $486B: $CD $12 $3B
    ldh  a, [hActiveEntityUnknownG]               ; $486E: $F0 $F1
    add  $04                                      ; $4870: $C6 $04
    call label_3B0C                               ; $4872: $CD $0C $3B
    ld   e, $08                                   ; $4875: $1E $08
    cp   $04                                      ; $4877: $FE $04
    jr   nz, jr_007_487D                          ; $4879: $20 $02

    ld   e, $F8                                   ; $487B: $1E $F8

jr_007_487D:
    ld   hl, wEntity0SpeedX                       ; $487D: $21 $40 $C2
    add  hl, bc                                   ; $4880: $09
    ld   [hl], e                                  ; $4881: $73
    ld   hl, wEntitiesSpeedZTable                                ; $4882: $21 $20 $C3
    add  hl, bc                                   ; $4885: $09
    ld   [hl], $20                                ; $4886: $36 $20
    call func_007_48FD                            ; $4888: $CD $FD $48
    jp   label_007_733F                           ; $488B: $C3 $3F $73

    call func_007_7E0A                            ; $488E: $CD $0A $7E
    call func_007_7E43                            ; $4891: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $4894: $21 $20 $C3
    add  hl, bc                                   ; $4897: $09
    dec  [hl]                                     ; $4898: $35
    dec  [hl]                                     ; $4899: $35
    ld   hl, wEntitiesPosZTable                                ; $489A: $21 $10 $C3
    add  hl, bc                                   ; $489D: $09
    ld   a, [hl]                                  ; $489E: $7E
    and  $80                                      ; $489F: $E6 $80
    jr   z, jr_007_48AF                           ; $48A1: $28 $0C

    ld   [hl], b                                  ; $48A3: $70
    call IncrementEntityWalkingAttr               ; $48A4: $CD $12 $3B
    call func_007_48FD                            ; $48A7: $CD $FD $48
    call GetEntityTransitionCountdown                 ; $48AA: $CD $05 $0C
    ld   [hl], $10                                ; $48AD: $36 $10

jr_007_48AF:
    ret                                           ; $48AF: $C9

    call GetEntityTransitionCountdown                 ; $48B0: $CD $05 $0C
    jr   nz, jr_007_48BF                          ; $48B3: $20 $0A

    ld   [hl], $20                                ; $48B5: $36 $20
    ld   a, $FF                                   ; $48B7: $3E $FF
    call label_3B0C                               ; $48B9: $CD $0C $3B
    jp   IncrementEntityWalkingAttr               ; $48BC: $C3 $12 $3B

jr_007_48BF:
    ld   e, $02                                   ; $48BF: $1E $02
    cp   $08                                      ; $48C1: $FE $08
    jr   nc, jr_007_48C6                          ; $48C3: $30 $01

    inc  e                                        ; $48C5: $1C

jr_007_48C6:
    ld   a, e                                     ; $48C6: $7B
    jp   label_3B0C                               ; $48C7: $C3 $0C $3B

    call GetEntityTransitionCountdown                 ; $48CA: $CD $05 $0C
    ret  nz                                       ; $48CD: $C0

    ld   hl, $C390                                ; $48CE: $21 $90 $C3
    add  hl, bc                                   ; $48D1: $09
    ld   a, [hl]                                  ; $48D2: $7E
    cp   $03                                      ; $48D3: $FE $03
    jr   nz, jr_007_48E0                          ; $48D5: $20 $09

    xor  a                                        ; $48D7: $AF
    ldh  [$FFA1], a                               ; $48D8: $E0 $A1
    ld   [wC167], a                               ; $48DA: $EA $67 $C1
    jp   label_007_7EA4                           ; $48DD: $C3 $A4 $7E

jr_007_48E0:
    inc  [hl]                                     ; $48E0: $34
    call GetRandomByte                            ; $48E1: $CD $0D $28
    and  $01                                      ; $48E4: $E6 $01
    call label_3B0C                               ; $48E6: $CD $0C $3B
    ld   e, $10                                   ; $48E9: $1E $10
    and  a                                        ; $48EB: $A7
    jr   z, jr_007_48F0                           ; $48EC: $28 $02

    ld   e, $F0                                   ; $48EE: $1E $F0

jr_007_48F0:
    ld   hl, wEntity0PosY                         ; $48F0: $21 $10 $C2
    add  hl, bc                                   ; $48F3: $09
    ld   a, [hl]                                  ; $48F4: $7E
    add  e                                        ; $48F5: $83
    ld   [hl], a                                  ; $48F6: $77
    call IncrementEntityWalkingAttr               ; $48F7: $CD $12 $3B
    ld   [hl], $07                                ; $48FA: $36 $07
    ret                                           ; $48FC: $C9

func_007_48FD:
label_007_48FD:
    ldh  a, [wActiveEntityPosY]                   ; $48FD: $F0 $EC
    ldh  [hScratchB], a                           ; $48FF: $E0 $D8
    ldh  a, [wActiveEntityPosX]                   ; $4901: $F0 $EE
    ldh  [hScratchA], a                           ; $4903: $E0 $D7
    ld   a, $01                                   ; $4905: $3E $01
    call label_CC7                                ; $4907: $CD $C7 $0C
    ld   a, $0E                                   ; $490A: $3E $0E
    ldh  [hJingle], a                             ; $490C: $E0 $F2
    ret                                           ; $490E: $C9

label_007_490F:
    push bc                                       ; $490F: $C5
    sla  c                                        ; $4910: $CB $21
    sla  c                                        ; $4912: $CB $21
    ld   hl, $D580                                ; $4914: $21 $80 $D5
    add  hl, bc                                   ; $4917: $09
    inc  hl                                       ; $4918: $23
    ld   a, $0A                                   ; $4919: $3E $0A
    ld   [hl+], a                                 ; $491B: $22
    ld   a, $FC                                   ; $491C: $3E $FC
    ld   [hl+], a                                 ; $491E: $22
    ld   a, $10                                   ; $491F: $3E $10
    ld   [hl], a                                  ; $4921: $77
    pop  bc                                       ; $4922: $C1
    ldh  a, [hActiveEntityWalking]                ; $4923: $F0 $F0
    rst  $00                                      ; $4925: $C7
    ld   l, $49                                   ; $4926: $2E $49
    ld   b, l                                     ; $4928: $45
    ld   c, c                                     ; $4929: $49
    ld   e, c                                     ; $492A: $59
    ld   c, c                                     ; $492B: $49
    add  d                                        ; $492C: $82
    ld   c, c                                     ; $492D: $49
    call func_007_7D96                            ; $492E: $CD $96 $7D
    ld   hl, wEntity0PosX                         ; $4931: $21 $00 $C2
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $58                                ; $4935: $36 $58
    ld   hl, wEntity0PosY                         ; $4937: $21 $10 $C2
    add  hl, bc                                   ; $493A: $09
    ld   [hl], $80                                ; $493B: $36 $80
    ld   a, [$C130]                               ; $493D: $FA $30 $C1
    and  a                                        ; $4940: $A7
    ret  z                                        ; $4941: $C8

    jp   IncrementEntityWalkingAttr               ; $4942: $C3 $12 $3B

    call func_007_7D96                            ; $4945: $CD $96 $7D
    ld   hl, wEntitiesSpeedZTable                                ; $4948: $21 $20 $C3
    add  hl, bc                                   ; $494B: $09
    ld   [hl], $20                                ; $494C: $36 $20
    call func_007_4005                            ; $494E: $CD $05 $40
    ld   [hl], $FC                                ; $4951: $36 $FC
    call func_007_48FD                            ; $4953: $CD $FD $48
    jp   IncrementEntityWalkingAttr               ; $4956: $C3 $12 $3B

    call $49DC                                    ; $4959: $CD $DC $49
    call func_007_7D96                            ; $495C: $CD $96 $7D
    call func_007_7E0A                            ; $495F: $CD $0A $7E
    call func_007_7E43                            ; $4962: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $4965: $21 $20 $C3
    add  hl, bc                                   ; $4968: $09
    dec  [hl]                                     ; $4969: $35
    ld   hl, wEntitiesPosZTable                                ; $496A: $21 $10 $C3
    add  hl, bc                                   ; $496D: $09
    ld   a, [hl]                                  ; $496E: $7E
    and  $80                                      ; $496F: $E6 $80
    jr   z, jr_007_4977                           ; $4971: $28 $04

    ld   [hl], b                                  ; $4973: $70
    call IncrementEntityWalkingAttr               ; $4974: $CD $12 $3B

jr_007_4977:
    ldh  a, [hFrameCounter]                       ; $4977: $F0 $E7
    rra                                           ; $4979: $1F
    rra                                           ; $497A: $1F
    rra                                           ; $497B: $1F
    rra                                           ; $497C: $1F
    and  $01                                      ; $497D: $E6 $01
    jp   label_3B0C                               ; $497F: $C3 $0C $3B

    call func_007_7CF0                            ; $4982: $CD $F0 $7C
    call func_007_7E5D                            ; $4985: $CD $5D $7E
    ld   a, e                                     ; $4988: $7B
    add  $02                                      ; $4989: $C6 $02
    ldh  [hActiveEntityUnknownG], a               ; $498B: $E0 $F1
    call $49DC                                    ; $498D: $CD $DC $49
    call func_007_7D96                            ; $4990: $CD $96 $7D
    call func_007_7D43                            ; $4993: $CD $43 $7D
    ret  nc                                       ; $4996: $D0

    ld   a, $F7                                   ; $4997: $3E $F7
    jp   OpenDialogInTable1                       ; $4999: $C3 $73 $23

    ldh  a, [rP1]                                 ; $499C: $F0 $00
    ld   [hl], b                                  ; $499E: $70
    ld   bc, label_8F0                            ; $499F: $01 $F0 $08
    ld   [hl], d                                  ; $49A2: $72
    ld   bc, $0000                                ; $49A3: $01 $00 $00
    ld   [hl], h                                  ; $49A6: $74
    ld   bc, label_800                            ; $49A7: $01 $00 $08
    db   $76                                      ; $49AA: $76
    ld   bc, $00F0                                ; $49AB: $01 $F0 $00
    ld   [hl], d                                  ; $49AE: $72
    ld   hl, label_8F0                            ; $49AF: $21 $F0 $08
    ld   [hl], b                                  ; $49B2: $70
    ld   hl, $0000                                ; $49B3: $21 $00 $00
    db   $76                                      ; $49B6: $76
    ld   hl, label_800                            ; $49B7: $21 $00 $08
    ld   [hl], h                                  ; $49BA: $74
    ld   hl, hActiveEntityWalking                 ; $49BB: $21 $F0 $FF
    ld   [hl], d                                  ; $49BE: $72
    ld   hl, $07F0                                ; $49BF: $21 $F0 $07
    ld   [hl], b                                  ; $49C2: $70
    ld   hl, $0000                                ; $49C3: $21 $00 $00
    ld   a, d                                     ; $49C6: $7A
    ld   hl, label_800                            ; $49C7: $21 $00 $08
    ld   a, b                                     ; $49CA: $78
    ld   hl, $01F0                                ; $49CB: $21 $F0 $01
    ld   [hl], b                                  ; $49CE: $70
    ld   bc, $09F0                                ; $49CF: $01 $F0 $09
    ld   [hl], d                                  ; $49D2: $72
    ld   bc, $0000                                ; $49D3: $01 $00 $00
    ld   a, b                                     ; $49D6: $78
    ld   bc, label_800                            ; $49D7: $01 $00 $08
    ld   a, d                                     ; $49DA: $7A
    ld   bc, $F1F0                                ; $49DB: $01 $F0 $F1
    rla                                           ; $49DE: $17
    rla                                           ; $49DF: $17
    rla                                           ; $49E0: $17
    rla                                           ; $49E1: $17
    and  $F0                                      ; $49E2: $E6 $F0
    ld   e, a                                     ; $49E4: $5F
    ld   d, b                                     ; $49E5: $50
    ld   hl, $499C                                ; $49E6: $21 $9C $49
    add  hl, de                                   ; $49E9: $19
    ld   c, $04                                   ; $49EA: $0E $04
    jp   label_3CE6                               ; $49EC: $C3 $E6 $3C

    ld   l, [hl]                                  ; $49EF: $6E
    jr   nz, @+$6E                                ; $49F0: $20 $6C

    jr   nz, @+$6E                                ; $49F2: $20 $6C

    nop                                           ; $49F4: $00
    ld   l, [hl]                                  ; $49F5: $6E
    nop                                           ; $49F6: $00
    ld   [hl], b                                  ; $49F7: $70
    nop                                           ; $49F8: $00
    ld   [hl], d                                  ; $49F9: $72
    ld   bc, $0074                                ; $49FA: $01 $74 $00
    db   $76                                      ; $49FD: $76
    ld   bc, $0078                                ; $49FE: $01 $78 $00
    ld   a, d                                     ; $4A01: $7A
    ld   bc, $007C                                ; $4A02: $01 $7C $00
    db   $76                                      ; $4A05: $76
    ld   bc, $2072                                ; $4A06: $01 $72 $20
    ld   [hl], b                                  ; $4A09: $70
    ld   hl, $2076                                ; $4A0A: $21 $76 $20
    ld   [hl], h                                  ; $4A0D: $74
    ld   hl, $207A                                ; $4A0E: $21 $7A $20
    ld   a, b                                     ; $4A11: $78
    ld   hl, $2076                                ; $4A12: $21 $76 $20
    ld   a, h                                     ; $4A15: $7C
    ld   hl, $017E                                ; $4A16: $21 $7E $01
    ld   a, [hl]                                  ; $4A19: $7E
    ld   hl, $A5FA                                ; $4A1A: $21 $FA $A5
    db   $DB                                      ; $4A1D: $DB
    and  a                                        ; $4A1E: $A7
    jr   z, jr_007_4A69                           ; $4A1F: $28 $48

    ld   a, [wTradeSequenceItem]                  ; $4A21: $FA $0E $DB
    cp   $08                                      ; $4A24: $FE $08
    jr   nc, jr_007_4A30                          ; $4A26: $30 $08

    ld   a, [wHasInstrument3]                     ; $4A28: $FA $67 $DB
    and  $02                                      ; $4A2B: $E6 $02
    jp   nz, label_007_7EA4                       ; $4A2D: $C2 $A4 $7E

jr_007_4A30:
    ld   de, $4A07                                ; $4A30: $11 $07 $4A
    ld   a, [wTradeSequenceItem]                  ; $4A33: $FA $0E $DB
    cp   $08                                      ; $4A36: $FE $08
    jr   nc, jr_007_4A43                          ; $4A38: $30 $09

    call func_007_7E5D                            ; $4A3A: $CD $5D $7E
    ld   a, e                                     ; $4A3D: $7B
    ldh  [hActiveEntityUnknownG], a               ; $4A3E: $E0 $F1
    ld   de, $49EF                                ; $4A40: $11 $EF $49

jr_007_4A43:
    call RenderAnimatedActiveEntity                               ; $4A43: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $4A46: $F0 $E7
    rra                                           ; $4A48: $1F
    rra                                           ; $4A49: $1F
    rra                                           ; $4A4A: $1F
    rra                                           ; $4A4B: $1F
    and  $01                                      ; $4A4C: $E6 $01
    call label_3B0C                               ; $4A4E: $CD $0C $3B
    call func_007_7CF0                            ; $4A51: $CD $F0 $7C
    call func_007_7D43                            ; $4A54: $CD $43 $7D
    ret  nc                                       ; $4A57: $D0

    ld   a, [wTradeSequenceItem]                  ; $4A58: $FA $0E $DB
    cp   $08                                      ; $4A5B: $FE $08
    jr   nc, jr_007_4A64                          ; $4A5D: $30 $05

    ld   a, $27                                   ; $4A5F: $3E $27
    jp   OpenDialog                               ; $4A61: $C3 $85 $23

jr_007_4A64:
    ld   a, $76                                   ; $4A64: $3E $76
    jp   OpenDialogInTable1                       ; $4A66: $C3 $73 $23

jr_007_4A69:
    ldh  a, [hRoomStatus]                         ; $4A69: $F0 $F8
    and  $20                                      ; $4A6B: $E6 $20
    jp   nz, label_007_7EA4                       ; $4A6D: $C2 $A4 $7E

    ld   de, $49F7                                ; $4A70: $11 $F7 $49
    ld   hl, $C380                                ; $4A73: $21 $80 $C3
    add  hl, bc                                   ; $4A76: $09
    ld   a, [hl]                                  ; $4A77: $7E
    and  a                                        ; $4A78: $A7
    jr   nz, jr_007_4A7E                          ; $4A79: $20 $03

    ld   de, $4A07                                ; $4A7B: $11 $07 $4A

jr_007_4A7E:
    call RenderAnimatedActiveEntity                               ; $4A7E: $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ; $4A81: $FA $0E $DB
    cp   $08                                      ; $4A84: $FE $08
    jr   nc, jr_007_4AA0                          ; $4A86: $30 $18

    ldh  a, [wActiveEntityPosX]                   ; $4A88: $F0 $EE
    add  $10                                      ; $4A8A: $C6 $10
    ldh  [wActiveEntityPosX], a                   ; $4A8C: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $4A8E: $F0 $EC
    sub  $10                                      ; $4A90: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $4A92: $E0 $EC
    xor  a                                        ; $4A94: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4A95: $E0 $F1
    ld   de, $4A17                                ; $4A97: $11 $17 $4A
    call RenderAnimatedActiveEntity                               ; $4A9A: $CD $C0 $3B
    call label_3D8A                               ; $4A9D: $CD $8A $3D

jr_007_4AA0:
    call func_007_7D96                            ; $4AA0: $CD $96 $7D
    call func_007_7CF0                            ; $4AA3: $CD $F0 $7C
    ldh  a, [hActiveEntityWalking]                ; $4AA6: $F0 $F0
    rst  $00                                      ; $4AA8: $C7
    or   e                                        ; $4AA9: $B3
    ld   c, d                                     ; $4AAA: $4A
    di                                            ; $4AAB: $F3
    ld   c, d                                     ; $4AAC: $4A
    inc  e                                        ; $4AAD: $1C
    ld   c, e                                     ; $4AAE: $4B
    ld   d, b                                     ; $4AAF: $50
    ld   c, e                                     ; $4AB0: $4B
    ld   e, e                                     ; $4AB1: $5B
    ld   c, e                                     ; $4AB2: $4B
    call func_007_7E5D                            ; $4AB3: $CD $5D $7E
    ld   hl, $C380                                ; $4AB6: $21 $80 $C3
    add  hl, bc                                   ; $4AB9: $09
    ld   [hl], e                                  ; $4ABA: $73
    add  $24                                      ; $4ABB: $C6 $24
    cp   $48                                      ; $4ABD: $FE $48
    jr   nc, jr_007_4AE9                          ; $4ABF: $30 $28

    call func_007_7E6D                            ; $4AC1: $CD $6D $7E
    add  $24                                      ; $4AC4: $C6 $24
    cp   $48                                      ; $4AC6: $FE $48
    jr   nc, jr_007_4AE9                          ; $4AC8: $30 $1F

    call func_007_7D43                            ; $4ACA: $CD $43 $7D
    jr   nc, jr_007_4AE5                          ; $4ACD: $30 $16

    ld   a, [wTradeSequenceItem]                  ; $4ACF: $FA $0E $DB
    cp   $07                                      ; $4AD2: $FE $07
    ld   a, $70                                   ; $4AD4: $3E $70
    jr   z, jr_007_4ADA                           ; $4AD6: $28 $02

    ld   a, $77                                   ; $4AD8: $3E $77

jr_007_4ADA:
    call OpenDialogInTable1                       ; $4ADA: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4ADD: $CD $12 $3B
    ld   a, $01                                   ; $4AE0: $3E $01
    ld   [wC167], a                               ; $4AE2: $EA $67 $C1

jr_007_4AE5:
    xor  a                                        ; $4AE5: $AF
    jp   label_3B0C                               ; $4AE6: $C3 $0C $3B

jr_007_4AE9:
    ldh  a, [hFrameCounter]                       ; $4AE9: $F0 $E7
    rra                                           ; $4AEB: $1F
    rra                                           ; $4AEC: $1F
    rra                                           ; $4AED: $1F
    and  $01                                      ; $4AEE: $E6 $01
    jp   label_3B0C                               ; $4AF0: $C3 $0C $3B

    ld   a, [wC177]                               ; $4AF3: $FA $77 $C1
    and  a                                        ; $4AF6: $A7
    jr   nz, jr_007_4B0E                          ; $4AF7: $20 $15

    ld   a, [wTradeSequenceItem]                  ; $4AF9: $FA $0E $DB
    cp   $07                                      ; $4AFC: $FE $07
    jr   nz, jr_007_4B0E                          ; $4AFE: $20 $0E

    ld   a, $72                                   ; $4B00: $3E $72
    call OpenDialogInTable1                       ; $4B02: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4B05: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $4B08: $CD $05 $0C
    ld   [hl], $C0                                ; $4B0B: $36 $C0
    ret                                           ; $4B0D: $C9

jr_007_4B0E:
    ld   a, $71                                   ; $4B0E: $3E $71
    call OpenDialogInTable1                       ; $4B10: $CD $73 $23
    xor  a                                        ; $4B13: $AF
    ld   [wC167], a                               ; $4B14: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $4B17: $CD $12 $3B
    ld   [hl], b                                  ; $4B1A: $70
    ret                                           ; $4B1B: $C9

    ld   a, [wDialogState]                        ; $4B1C: $FA $9F $C1
    and  a                                        ; $4B1F: $A7
    jr   nz, jr_007_4B44                          ; $4B20: $20 $22

    call GetEntityTransitionCountdown                 ; $4B22: $CD $05 $0C
    jr   nz, jr_007_4B3B                          ; $4B25: $20 $14

    ld   [wMusicTrackTiming], a                               ; $4B27: $EA $0B $C1
    ld   a, $73                                   ; $4B2A: $3E $73
    call OpenDialogInTable1                       ; $4B2C: $CD $73 $23
    ld   a, $08                                   ; $4B2F: $3E $08
    ld   [wTradeSequenceItem], a                  ; $4B31: $EA $0E $DB
    ld   a, $0D                                   ; $4B34: $3E $0D
    ldh  [hFFA5], a                               ; $4B36: $E0 $A5
    jp   IncrementEntityWalkingAttr               ; $4B38: $C3 $12 $3B

jr_007_4B3B:
    ld   a, $02                                   ; $4B3B: $3E $02
    ldh  [$FFA1], a                               ; $4B3D: $E0 $A1
    ld   a, $01                                   ; $4B3F: $3E $01
    ld   [wMusicTrackTiming], a                               ; $4B41: $EA $0B $C1

func_007_4B44:
jr_007_4B44:
    ldh  a, [hFrameCounter]                       ; $4B44: $F0 $E7
    rra                                           ; $4B46: $1F
    rra                                           ; $4B47: $1F
    rra                                           ; $4B48: $1F
    and  $01                                      ; $4B49: $E6 $01
    add  $02                                      ; $4B4B: $C6 $02
    jp   label_3B0C                               ; $4B4D: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $4B50: $FA $9F $C1
    and  a                                        ; $4B53: $A7
    ret  nz                                       ; $4B54: $C0

    call label_C0C                                ; $4B55: $CD $0C $0C
    jp   IncrementEntityWalkingAttr               ; $4B58: $C3 $12 $3B

    call func_007_4B44                            ; $4B5B: $CD $44 $4B
    call func_007_7D43                            ; $4B5E: $CD $43 $7D
    ret  nc                                       ; $4B61: $D0

    xor  a                                        ; $4B62: $AF
    ld   [wC167], a                               ; $4B63: $EA $67 $C1
    ld   a, $75                                   ; $4B66: $3E $75
    jp   OpenDialogInTable1                       ; $4B68: $C3 $73 $23

    ld   a, [$7000]                               ; $4B6B: $FA $00 $70
    inc  bc                                       ; $4B6E: $03
    ld   a, [$7208]                               ; $4B6F: $FA $08 $72
    inc  bc                                       ; $4B72: $03
    ld   a, [$7410]                               ; $4B73: $FA $10 $74
    inc  bc                                       ; $4B76: $03
    ld   a, [$7018]                               ; $4B77: $FA $18 $70
    inc  hl                                       ; $4B7A: $23
    ld   a, [bc]                                  ; $4B7B: $0A
    nop                                           ; $4B7C: $00
    db   $76                                      ; $4B7D: $76
    inc  bc                                       ; $4B7E: $03
    ld   a, [bc]                                  ; $4B7F: $0A
    ld   [$0378], sp                              ; $4B80: $08 $78 $03
    ld   a, [bc]                                  ; $4B83: $0A
    db   $10                                      ; $4B84: $10
    ld   a, b                                     ; $4B85: $78
    inc  hl                                       ; $4B86: $23
    ld   a, [bc]                                  ; $4B87: $0A
    jr   jr_007_4C00                              ; $4B88: $18 $76

    inc  hl                                       ; $4B8A: $23
    ld   a, [$7000]                               ; $4B8B: $FA $00 $70
    inc  bc                                       ; $4B8E: $03
    ld   a, [$7408]                               ; $4B8F: $FA $08 $74
    inc  hl                                       ; $4B92: $23
    ld   a, [$7210]                               ; $4B93: $FA $10 $72
    inc  hl                                       ; $4B96: $23
    ld   a, [$7018]                               ; $4B97: $FA $18 $70
    inc  hl                                       ; $4B9A: $23
    ld   a, [bc]                                  ; $4B9B: $0A
    nop                                           ; $4B9C: $00
    db   $76                                      ; $4B9D: $76
    inc  bc                                       ; $4B9E: $03
    ld   a, [bc]                                  ; $4B9F: $0A
    ld   [$0378], sp                              ; $4BA0: $08 $78 $03
    ld   a, [bc]                                  ; $4BA3: $0A
    db   $10                                      ; $4BA4: $10
    ld   a, b                                     ; $4BA5: $78
    inc  hl                                       ; $4BA6: $23
    ld   a, [bc]                                  ; $4BA7: $0A
    jr   @+$78                                    ; $4BA8: $18 $76

    inc  hl                                       ; $4BAA: $23
    ld   a, [hl]                                  ; $4BAB: $7E
    rlca                                          ; $4BAC: $07
    ld   a, d                                     ; $4BAD: $7A
    ld   bc, $017C                                ; $4BAE: $01 $7C $01
    ld   a, h                                     ; $4BB1: $7C
    ld   hl, $217A                                ; $4BB2: $21 $7A $21
    xor  a                                        ; $4BB5: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4BB6: $E0 $F1
    ld   a, $4A                                   ; $4BB8: $3E $4A
    ldh  [wActiveEntityPosY], a                   ; $4BBA: $E0 $EC
    ld   de, $4BAD                                ; $4BBC: $11 $AD $4B
    call RenderAnimatedActiveEntity                               ; $4BBF: $CD $C0 $3B
    ld   a, $68                                   ; $4BC2: $3E $68
    ldh  [wActiveEntityPosX], a                   ; $4BC4: $E0 $EE
    ld   de, $4BB1                                ; $4BC6: $11 $B1 $4B
    call RenderAnimatedActiveEntity                               ; $4BC9: $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ; $4BCC: $FA $0E $DB
    cp   $06                                      ; $4BCF: $FE $06
    jr   nz, jr_007_4BE1                          ; $4BD1: $20 $0E

    ld   a, $74                                   ; $4BD3: $3E $74
    ldh  [wActiveEntityPosX], a                   ; $4BD5: $E0 $EE
    ld   a, $38                                   ; $4BD7: $3E $38
    ldh  [wActiveEntityPosY], a                   ; $4BD9: $E0 $EC
    ld   de, $4BAB                                ; $4BDB: $11 $AB $4B
    call label_3C77                               ; $4BDE: $CD $77 $3C

jr_007_4BE1:
    call label_3D8A                               ; $4BE1: $CD $8A $3D
    ld   hl, wEntitiesUnknownTableG               ; $4BE4: $21 $B0 $C3
    add  hl, bc                                   ; $4BE7: $09
    ld   a, [hl]                                  ; $4BE8: $7E
    ld   hl, $4B6B                                ; $4BE9: $21 $6B $4B
    and  a                                        ; $4BEC: $A7
    jr   z, jr_007_4BF2                           ; $4BED: $28 $03

    ld   hl, $4B8B                                ; $4BEF: $21 $8B $4B

jr_007_4BF2:
    ld   c, $08                                   ; $4BF2: $0E $08
    call label_3CE6                               ; $4BF4: $CD $E6 $3C
    ld   a, $06                                   ; $4BF7: $3E $06
    call label_3DA0                               ; $4BF9: $CD $A0 $3D
    xor  a                                        ; $4BFC: $AF
    call label_3B0C                               ; $4BFD: $CD $0C $3B

jr_007_4C00:
    call func_007_7D96                            ; $4C00: $CD $96 $7D
    ldh  a, [hFrameCounter]                       ; $4C03: $F0 $E7
    and  $20                                      ; $4C05: $E6 $20
    call label_3B0C                               ; $4C07: $CD $0C $3B
    call func_007_7CF0                            ; $4C0A: $CD $F0 $7C
    ldh  a, [hActiveEntityWalking]                ; $4C0D: $F0 $F0
    rst  $00                                      ; $4C0F: $C7
    ld   d, $4C                                   ; $4C10: $16 $4C
    ld   c, c                                     ; $4C12: $49
    ld   c, h                                     ; $4C13: $4C
    ld   [hl], b                                  ; $4C14: $70
    ld   c, h                                     ; $4C15: $4C
    call func_007_7D36                            ; $4C16: $CD $36 $7D
    ret  nc                                       ; $4C19: $D0

    ld   e, $D3                                   ; $4C1A: $1E $D3
    ld   a, [$D8FD]                               ; $4C1C: $FA $FD $D8
    and  $30                                      ; $4C1F: $E6 $30
    jr   nz, jr_007_4C45                          ; $4C21: $20 $22

    ld   a, [wTradeSequenceItem]                  ; $4C23: $FA $0E $DB
    cp   $06                                      ; $4C26: $FE $06
    jr   nz, jr_007_4C32                          ; $4C28: $20 $08

    ld   a, $CF                                   ; $4C2A: $3E $CF
    call func_007_4C83                            ; $4C2C: $CD $83 $4C
    jp   IncrementEntityWalkingAttr               ; $4C2F: $C3 $12 $3B

jr_007_4C32:
    ld   e, $D4                                   ; $4C32: $1E $D4
    ld   a, [wIsMarinFollowingLink]               ; $4C34: $FA $73 $DB
    and  a                                        ; $4C37: $A7
    jr   nz, jr_007_4C45                          ; $4C38: $20 $0B

    ld   e, $CE                                   ; $4C3A: $1E $CE
    ld   a, [wTradeSequenceItem]                  ; $4C3C: $FA $0E $DB
    cp   $07                                      ; $4C3F: $FE $07
    jr   nz, jr_007_4C45                          ; $4C41: $20 $02

func_007_4C43:
    ld   e, $D2                                   ; $4C43: $1E $D2

jr_007_4C45:
    ld   a, e                                     ; $4C45: $7B
    jp   label_007_4C83                           ; $4C46: $C3 $83 $4C

    ld   a, [wDialogState]                        ; $4C49: $FA $9F $C1
    and  a                                        ; $4C4C: $A7
    jr   nz, jr_007_4C6F                          ; $4C4D: $20 $20

    call IncrementEntityWalkingAttr               ; $4C4F: $CD $12 $3B
    ld   a, [wC177]                               ; $4C52: $FA $77 $C1
    and  a                                        ; $4C55: $A7
    jr   z, jr_007_4C5E                           ; $4C56: $28 $06

    ld   [hl], b                                  ; $4C58: $70
    ld   a, $D1                                   ; $4C59: $3E $D1
    jp   label_007_4C83                           ; $4C5B: $C3 $83 $4C

jr_007_4C5E:
    ld   a, $07                                   ; $4C5E: $3E $07
    ld   [wTradeSequenceItem], a                  ; $4C60: $EA $0E $DB
    ld   a, $0D                                   ; $4C63: $3E $0D
    ldh  [hFFA5], a                               ; $4C65: $E0 $A5
    call label_C0C                                ; $4C67: $CD $0C $0C
    call GetEntityTransitionCountdown                 ; $4C6A: $CD $05 $0C
    ld   [hl], $70                                ; $4C6D: $36 $70

jr_007_4C6F:
    ret                                           ; $4C6F: $C9

    call GetEntityTransitionCountdown                 ; $4C70: $CD $05 $0C
    jr   nz, jr_007_4C82                          ; $4C73: $20 $0D

    ld   a, [wDialogState]                        ; $4C75: $FA $9F $C1
    and  a                                        ; $4C78: $A7
    jr   nz, jr_007_4C82                          ; $4C79: $20 $07

    call func_007_4C43                            ; $4C7B: $CD $43 $4C
    call IncrementEntityWalkingAttr               ; $4C7E: $CD $12 $3B
    ld   [hl], b                                  ; $4C81: $70

jr_007_4C82:
    ret                                           ; $4C82: $C9

func_007_4C83:
label_007_4C83:
    ld   e, a                                     ; $4C83: $5F
    ldh  a, [hLinkPositionY]                      ; $4C84: $F0 $99
    push af                                       ; $4C86: $F5
    ld   a, $10                                   ; $4C87: $3E $10
    ldh  [hLinkPositionY], a                      ; $4C89: $E0 $99
    ld   a, e                                     ; $4C8B: $7B
    call OpenDialogInTable1                       ; $4C8C: $CD $73 $23
    pop  af                                       ; $4C8F: $F1
    ldh  [hLinkPositionY], a                      ; $4C90: $E0 $99
    ret                                           ; $4C92: $C9

    ld   [hl], b                                  ; $4C93: $70
    ld   bc, $2170                                ; $4C94: $01 $70 $21
    ldh  a, [hRoomStatus]                         ; $4C97: $F0 $F8
    and  $20                                      ; $4C99: $E6 $20
    jp   nz, label_007_7EA4                       ; $4C9B: $C2 $A4 $7E

    ld   hl, $C440                                ; $4C9E: $21 $40 $C4
    add  hl, bc                                   ; $4CA1: $09
    ld   a, [hl]                                  ; $4CA2: $7E
    and  a                                        ; $4CA3: $A7
    jp   nz, label_007_4D84                       ; $4CA4: $C2 $84 $4D

    ld   a, c                                     ; $4CA7: $79
    ld   [$D201], a                               ; $4CA8: $EA $01 $D2
    call GetEntityTransitionCountdown                 ; $4CAB: $CD $05 $0C
    and  $20                                      ; $4CAE: $E6 $20
    jr   z, jr_007_4CB6                           ; $4CB0: $28 $04

    ld   hl, wActiveEntityPosX                    ; $4CB2: $21 $EE $FF
    dec  [hl]                                     ; $4CB5: $35

jr_007_4CB6:
    ld   de, $4C93                                ; $4CB6: $11 $93 $4C
    call RenderAnimatedActiveEntity                               ; $4CB9: $CD $C0 $3B
    call func_007_7D96                            ; $4CBC: $CD $96 $7D
    ldh  a, [hActiveEntityWalking]                ; $4CBF: $F0 $F0
    rst  $00                                      ; $4CC1: $C7
    call z, $1F4C                                 ; $4CC2: $CC $4C $1F
    ld   c, l                                     ; $4CC5: $4D
    daa                                           ; $4CC6: $27
    ld   c, l                                     ; $4CC7: $4D
    ld   c, l                                     ; $4CC8: $4D
    ld   c, l                                     ; $4CC9: $4D
    ld   c, [hl]                                  ; $4CCA: $4E
    ld   c, l                                     ; $4CCB: $4D
    ld   a, [$DB7F]                               ; $4CCC: $FA $7F $DB
    cp   $02                                      ; $4CCF: $FE $02
    jr   nz, jr_007_4CE7                          ; $4CD1: $20 $14

    ld   hl, wEntity0PosY                         ; $4CD3: $21 $10 $C2
    add  hl, bc                                   ; $4CD6: $09
    ld   a, [hl]                                  ; $4CD7: $7E
    add  $10                                      ; $4CD8: $C6 $10
    ld   [hl], a                                  ; $4CDA: $77
    ld   hl, wEntitiesPosZTable                                ; $4CDB: $21 $10 $C3
    add  hl, bc                                   ; $4CDE: $09
    ld   [hl], $10                                ; $4CDF: $36 $10
    call IncrementEntityWalkingAttr               ; $4CE1: $CD $12 $3B
    ld   [hl], $04                                ; $4CE4: $36 $04
    ret                                           ; $4CE6: $C9

jr_007_4CE7:
    xor  a                                        ; $4CE7: $AF
    ld   [$D202], a                               ; $4CE8: $EA $02 $D2
    call IncrementEntityWalkingAttr               ; $4CEB: $CD $12 $3B

func_007_4CEE:
    ld   a, $B3                                   ; $4CEE: $3E $B3
    call label_3B86                               ; $4CF0: $CD $86 $3B
    jr   c, jr_007_4D1D                           ; $4CF3: $38 $28

    ldh  a, [hScratchA]                           ; $4CF5: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4CF7: $21 $00 $C2
    add  hl, de                                   ; $4CFA: $19
    ld   [hl], a                                  ; $4CFB: $77
    ldh  a, [hScratchB]                           ; $4CFC: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4CFE: $21 $10 $C2
    add  hl, de                                   ; $4D01: $19
    ld   [hl], a                                  ; $4D02: $77
    ld   hl, $C440                                ; $4D03: $21 $40 $C4
    add  hl, de                                   ; $4D06: $19
    ld   [hl], $01                                ; $4D07: $36 $01
    ld   hl, wEntity0SpeedX                       ; $4D09: $21 $40 $C2
    add  hl, de                                   ; $4D0C: $19
    ld   [hl], $0E                                ; $4D0D: $36 $0E
    ld   hl, $C340                                ; $4D0F: $21 $40 $C3
    add  hl, de                                   ; $4D12: $19
    ld   [hl], $C1                                ; $4D13: $36 $C1
    ld   hl, $C350                                ; $4D15: $21 $50 $C3
    add  hl, de                                   ; $4D18: $19
    ld   [hl], $00                                ; $4D19: $36 $00
    and  a                                        ; $4D1B: $A7
    ret                                           ; $4D1C: $C9

jr_007_4D1D:
    scf                                           ; $4D1D: $37
    ret                                           ; $4D1E: $C9

    ld   a, [$D202]                               ; $4D1F: $FA $02 $D2
    and  a                                        ; $4D22: $A7
    jp   nz, IncrementEntityWalkingAttr           ; $4D23: $C2 $12 $3B

    ret                                           ; $4D26: $C9

    ld   hl, $C3D0                                ; $4D27: $21 $D0 $C3
    add  hl, bc                                   ; $4D2A: $09
    ld   a, [hl]                                  ; $4D2B: $7E
    cp   $05                                      ; $4D2C: $FE $05
    jp   z, IncrementEntityWalkingAttr            ; $4D2E: $CA $12 $3B

    ldh  a, [hFrameCounter]                       ; $4D31: $F0 $E7
    and  $07                                      ; $4D33: $E6 $07
    jr   nz, jr_007_4D4C                          ; $4D35: $20 $15

    call func_007_4CEE                            ; $4D37: $CD $EE $4C
    jr   c, jr_007_4D4C                           ; $4D3A: $38 $10

    ld   hl, $C3D0                                ; $4D3C: $21 $D0 $C3
    add  hl, bc                                   ; $4D3F: $09
    inc  [hl]                                     ; $4D40: $34
    ld   a, [hl]                                  ; $4D41: $7E
    ld   hl, $C3D0                                ; $4D42: $21 $D0 $C3
    add  hl, de                                   ; $4D45: $19
    ld   [hl], a                                  ; $4D46: $77
    ld   hl, wEntity0SpeedX                       ; $4D47: $21 $40 $C2
    add  hl, de                                   ; $4D4A: $19
    ld   [hl], b                                  ; $4D4B: $70

jr_007_4D4C:
    ret                                           ; $4D4C: $C9

    ret                                           ; $4D4D: $C9

    call GetEntityTransitionCountdown                 ; $4D4E: $CD $05 $0C
    ret  nz                                       ; $4D51: $C0

    call func_007_7E43                            ; $4D52: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $4D55: $21 $20 $C3
    add  hl, bc                                   ; $4D58: $09
    dec  [hl]                                     ; $4D59: $35
    dec  [hl]                                     ; $4D5A: $35
    ld   hl, wEntitiesPosZTable                                ; $4D5B: $21 $10 $C3
    add  hl, bc                                   ; $4D5E: $09
    ld   a, [hl]                                  ; $4D5F: $7E
    and  $80                                      ; $4D60: $E6 $80
    ret  z                                        ; $4D62: $C8

    ld   [hl], b                                  ; $4D63: $70
    ld   hl, wEntitiesSpeedZTable                                ; $4D64: $21 $20 $C3
    add  hl, bc                                   ; $4D67: $09
    ld   [hl], b                                  ; $4D68: $70
    call label_3B5A                               ; $4D69: $CD $5A $3B
    ret  nc                                       ; $4D6C: $D0

    xor  a                                        ; $4D6D: $AF
    ld   [$DB7F], a                               ; $4D6E: $EA $7F $DB
    ld   a, $06                                   ; $4D71: $3E $06
    ld   [wTradeSequenceItem], a                  ; $4D73: $EA $0E $DB
    ld   a, $0D                                   ; $4D76: $3E $0D
    ldh  [hFFA5], a                               ; $4D78: $E0 $A5
    call label_C0C                                ; $4D7A: $CD $0C $0C
    jp   label_007_7EA4                           ; $4D7D: $C3 $A4 $7E

    ld   [hl], d                                  ; $4D80: $72
    nop                                           ; $4D81: $00
    ld   [hl], d                                  ; $4D82: $72
    ld   b, b                                     ; $4D83: $40

label_007_4D84:
    ld   de, $4D80                                ; $4D84: $11 $80 $4D
    call label_3C77                               ; $4D87: $CD $77 $3C
    ldh  a, [hFrameCounter]                       ; $4D8A: $F0 $E7
    rra                                           ; $4D8C: $1F
    rra                                           ; $4D8D: $1F
    and  $01                                      ; $4D8E: $E6 $01
    call label_3B0C                               ; $4D90: $CD $0C $3B
    call func_007_7D96                            ; $4D93: $CD $96 $7D
    ldh  a, [hActiveEntityWalking]                ; $4D96: $F0 $F0
    rst  $00                                      ; $4D98: $C7
    and  l                                        ; $4D99: $A5
    ld   c, l                                     ; $4D9A: $4D
    dec  h                                        ; $4D9B: $25
    ld   c, [hl]                                  ; $4D9C: $4E
    adc  h                                        ; $4D9D: $8C
    ld   c, [hl]                                  ; $4D9E: $4E
    ld   bc, $10FF                                ; $4D9F: $01 $FF $10
    ldh  a, [$FF0B]                               ; $4DA2: $F0 $0B
    push af                                       ; $4DA4: $F5
    ldh  a, [hFrameCounter]                       ; $4DA5: $F0 $E7
    and  $01                                      ; $4DA7: $E6 $01
    jr   nz, jr_007_4DEA                          ; $4DA9: $20 $3F

    ld   hl, wEntitiesUnknownTableB               ; $4DAB: $21 $B0 $C2
    add  hl, bc                                   ; $4DAE: $09
    ld   e, [hl]                                  ; $4DAF: $5E
    ld   d, b                                     ; $4DB0: $50
    ld   hl, $4D9F                                ; $4DB1: $21 $9F $4D
    add  hl, de                                   ; $4DB4: $19
    ld   a, [hl]                                  ; $4DB5: $7E
    ld   hl, wEntity0SpeedX                       ; $4DB6: $21 $40 $C2
    add  hl, bc                                   ; $4DB9: $09
    add  [hl]                                     ; $4DBA: $86
    ld   [hl], a                                  ; $4DBB: $77
    ld   hl, $4DA1                                ; $4DBC: $21 $A1 $4D
    add  hl, de                                   ; $4DBF: $19
    cp   [hl]                                     ; $4DC0: $BE
    jr   nz, jr_007_4DCB                          ; $4DC1: $20 $08

    ld   hl, wEntitiesUnknownTableB               ; $4DC3: $21 $B0 $C2
    add  hl, bc                                   ; $4DC6: $09
    ld   a, [hl]                                  ; $4DC7: $7E
    xor  $01                                      ; $4DC8: $EE $01
    ld   [hl], a                                  ; $4DCA: $77

jr_007_4DCB:
    ld   hl, wEntitiesUnknownTableC               ; $4DCB: $21 $C0 $C2
    add  hl, bc                                   ; $4DCE: $09
    ld   e, [hl]                                  ; $4DCF: $5E
    ld   d, b                                     ; $4DD0: $50
    ld   hl, $4D9F                                ; $4DD1: $21 $9F $4D
    add  hl, de                                   ; $4DD4: $19
    ld   a, [hl]                                  ; $4DD5: $7E
    call func_007_4005                            ; $4DD6: $CD $05 $40
    add  [hl]                                     ; $4DD9: $86
    ld   [hl], a                                  ; $4DDA: $77
    ld   hl, $4DA3                                ; $4DDB: $21 $A3 $4D
    add  hl, de                                   ; $4DDE: $19
    cp   [hl]                                     ; $4DDF: $BE
    jr   nz, jr_007_4DEA                          ; $4DE0: $20 $08

    ld   hl, wEntitiesUnknownTableC               ; $4DE2: $21 $C0 $C2
    add  hl, bc                                   ; $4DE5: $09
    ld   a, [hl]                                  ; $4DE6: $7E
    xor  $01                                      ; $4DE7: $EE $01
    ld   [hl], a                                  ; $4DE9: $77

jr_007_4DEA:
    call func_007_7E0A                            ; $4DEA: $CD $0A $7E
    ld   a, [$D202]                               ; $4DED: $FA $02 $D2
    and  a                                        ; $4DF0: $A7
    jp   nz, IncrementEntityWalkingAttr           ; $4DF1: $C2 $12 $3B

    ret                                           ; $4DF4: $C9

    ldh  a, [hFFE8]                               ; $4DF5: $F0 $E8
    add  sp, -$20                                 ; $4DF7: $E8 $E0
    ldh  [hScratchB], a                           ; $4DF9: $E0 $D8
    db   $10                                      ; $4DFB: $10
    jr   @+$1A                                    ; $4DFC: $18 $18

    jr   nz, jr_007_4E20                          ; $4DFE: $20 $20

    jr   z, jr_007_4E02                           ; $4E00: $28 $00

jr_007_4E02:
    ld   hl, sp+$08                               ; $4E02: $F8 $08
    ld   hl, sp+$08                               ; $4E04: $F8 $08
    nop                                           ; $4E06: $00
    nop                                           ; $4E07: $00
    ld   [$08F8], sp                              ; $4E08: $08 $F8 $08
    ld   hl, sp+$00                               ; $4E0B: $F8 $00
    nop                                           ; $4E0D: $00
    ld   hl, sp+$08                               ; $4E0E: $F8 $08

jr_007_4E10:
    ld   hl, sp+$08                               ; $4E10: $F8 $08
    nop                                           ; $4E12: $00
    nop                                           ; $4E13: $00
    ld   [$08F8], sp                              ; $4E14: $08 $F8 $08
    ld   hl, sp+$00                               ; $4E17: $F8 $00
    db   $10                                      ; $4E19: $10
    jr   jr_007_4E34                              ; $4E1A: $18 $18

    jr   nz, jr_007_4E3E                          ; $4E1C: $20 $20

    jr   z, jr_007_4E10                           ; $4E1E: $28 $F0

jr_007_4E20:
    add  sp, -$18                                 ; $4E20: $E8 $E8
    ldh  [hBGMapOffsetHigh], a                    ; $4E22: $E0 $E0
    ret  c                                        ; $4E24: $D8

    ld   a, $22                                   ; $4E25: $3E $22
    ldh  [hJingle], a                             ; $4E27: $E0 $F2
    ld   a, [$D204]                               ; $4E29: $FA $04 $D2
    ld   e, a                                     ; $4E2C: $5F
    ld   d, b                                     ; $4E2D: $50
    ld   hl, wEntity0State                         ; $4E2E: $21 $80 $C2
    add  hl, de                                   ; $4E31: $19
    ld   a, [hl]                                  ; $4E32: $7E
    and  a                                        ; $4E33: $A7

jr_007_4E34:
    jp   z, label_007_7EA4                        ; $4E34: $CA $A4 $7E

    ldh  a, [hFrameCounter]                       ; $4E37: $F0 $E7
    and  $07                                      ; $4E39: $E6 $07
    ld   hl, $C3D0                                ; $4E3B: $21 $D0 $C3

jr_007_4E3E:
    add  hl, bc                                   ; $4E3E: $09
    cp   [hl]                                     ; $4E3F: $BE
    jr   nz, jr_007_4E89                          ; $4E40: $20 $47

    ld   a, [$D204]                               ; $4E42: $FA $04 $D2
    ld   e, a                                     ; $4E45: $5F
    ld   d, b                                     ; $4E46: $50
    ld   hl, $C380                                ; $4E47: $21 $80 $C3
    add  hl, de                                   ; $4E4A: $19
    ld   a, [hl]                                  ; $4E4B: $7E
    ld   e, a                                     ; $4E4C: $5F
    ld   hl, $C3D0                                ; $4E4D: $21 $D0 $C3
    add  hl, bc                                   ; $4E50: $09
    rla                                           ; $4E51: $17
    rla                                           ; $4E52: $17
    and  $FC                                      ; $4E53: $E6 $FC
    add  e                                        ; $4E55: $83
    add  e                                        ; $4E56: $83
    add  [hl]                                     ; $4E57: $86
    ld   e, a                                     ; $4E58: $5F
    ld   d, b                                     ; $4E59: $50
    ldh  a, [hLinkPositionX]                      ; $4E5A: $F0 $98
    push af                                       ; $4E5C: $F5
    ldh  a, [hLinkPositionY]                      ; $4E5D: $F0 $99
    push af                                       ; $4E5F: $F5
    push bc                                       ; $4E60: $C5
    ld   a, [$D204]                               ; $4E61: $FA $04 $D2
    ld   c, a                                     ; $4E64: $4F
    ld   hl, $4DF5                                ; $4E65: $21 $F5 $4D
    add  hl, de                                   ; $4E68: $19
    ld   a, [hl]                                  ; $4E69: $7E
    ld   hl, wEntity0PosX                         ; $4E6A: $21 $00 $C2
    add  hl, bc                                   ; $4E6D: $09
    add  [hl]                                     ; $4E6E: $86
    ldh  [hLinkPositionX], a                      ; $4E6F: $E0 $98
    ld   hl, $4E0D                                ; $4E71: $21 $0D $4E
    add  hl, de                                   ; $4E74: $19
    ld   a, [hl]                                  ; $4E75: $7E
    ld   hl, wEntity0PosY                         ; $4E76: $21 $10 $C2
    add  hl, bc                                   ; $4E79: $09
    add  [hl]                                     ; $4E7A: $86
    ldh  [hLinkPositionY], a                      ; $4E7B: $E0 $99
    pop  bc                                       ; $4E7D: $C1
    ld   a, $24                                   ; $4E7E: $3E $24
    call label_3BAA                               ; $4E80: $CD $AA $3B
    pop  af                                       ; $4E83: $F1
    ldh  [hLinkPositionY], a                      ; $4E84: $E0 $99
    pop  af                                       ; $4E86: $F1
    ldh  [hLinkPositionX], a                      ; $4E87: $E0 $98

jr_007_4E89:
    jp   label_007_7E0A                           ; $4E89: $C3 $0A $7E

    ret                                           ; $4E8C: $C9

    ld   e, d                                     ; $4E8D: $5A
    ld   [hl+], a                                 ; $4E8E: $22
    ld   e, b                                     ; $4E8F: $58
    ld   [hl+], a                                 ; $4E90: $22
    ld   e, [hl]                                  ; $4E91: $5E
    ld   [hl+], a                                 ; $4E92: $22
    ld   e, h                                     ; $4E93: $5C
    ld   [hl+], a                                 ; $4E94: $22
    ld   e, b                                     ; $4E95: $58
    ld   [bc], a                                  ; $4E96: $02
    ld   e, d                                     ; $4E97: $5A
    ld   [bc], a                                  ; $4E98: $02
    ld   e, h                                     ; $4E99: $5C
    ld   [bc], a                                  ; $4E9A: $02
    ld   e, [hl]                                  ; $4E9B: $5E
    ld   [bc], a                                  ; $4E9C: $02
    ld   d, h                                     ; $4E9D: $54
    ld   [bc], a                                  ; $4E9E: $02
    ld   d, [hl]                                  ; $4E9F: $56
    ld   [bc], a                                  ; $4EA0: $02
    ld   d, [hl]                                  ; $4EA1: $56
    ld   [hl+], a                                 ; $4EA2: $22
    ld   d, h                                     ; $4EA3: $54
    ld   [hl+], a                                 ; $4EA4: $22
    ld   d, b                                     ; $4EA5: $50
    ld   [bc], a                                  ; $4EA6: $02
    ld   d, d                                     ; $4EA7: $52
    ld   [bc], a                                  ; $4EA8: $02
    ld   d, d                                     ; $4EA9: $52
    ld   [hl+], a                                 ; $4EAA: $22
    ld   d, b                                     ; $4EAB: $50
    ld   [hl+], a                                 ; $4EAC: $22
    ld   [hl], h                                  ; $4EAD: $74
    ld   [bc], a                                  ; $4EAE: $02
    db   $76                                      ; $4EAF: $76
    ld   [bc], a                                  ; $4EB0: $02
    ld   a, c                                     ; $4EB1: $79
    ld   [$D204], a                               ; $4EB2: $EA $04 $D2
    ld   hl, $C390                                ; $4EB5: $21 $90 $C3
    add  hl, bc                                   ; $4EB8: $09
    ld   a, [hl]                                  ; $4EB9: $7E
    and  a                                        ; $4EBA: $A7
    jr   nz, jr_007_4EC5                          ; $4EBB: $20 $08

    inc  [hl]                                     ; $4EBD: $34
    ldh  a, [hRoomStatus]                         ; $4EBE: $F0 $F8
    and  $40                                      ; $4EC0: $E6 $40
    jp   nz, label_007_7EA4                       ; $4EC2: $C2 $A4 $7E

jr_007_4EC5:
    ld   a, [wHasInstrument3]                     ; $4EC5: $FA $67 $DB
    and  $02                                      ; $4EC8: $E6 $02
    jp   z, label_007_7EA4                        ; $4ECA: $CA $A4 $7E

    ld   de, $4E8D                                ; $4ECD: $11 $8D $4E
    call RenderAnimatedActiveEntity                               ; $4ED0: $CD $C0 $3B
    call func_007_7D96                            ; $4ED3: $CD $96 $7D
    call func_007_7E43                            ; $4ED6: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $4ED9: $21 $20 $C3
    add  hl, bc                                   ; $4EDC: $09
    dec  [hl]                                     ; $4EDD: $35
    dec  [hl]                                     ; $4EDE: $35
    ld   hl, wEntitiesPosZTable                                ; $4EDF: $21 $10 $C3
    add  hl, bc                                   ; $4EE2: $09
    ld   a, [hl]                                  ; $4EE3: $7E
    and  $80                                      ; $4EE4: $E6 $80
    jr   z, jr_007_4EEE                           ; $4EE6: $28 $06

    ld   [hl], b                                  ; $4EE8: $70
    ld   hl, wEntitiesSpeedZTable                                ; $4EE9: $21 $20 $C3
    add  hl, bc                                   ; $4EEC: $09
    ld   [hl], b                                  ; $4EED: $70

jr_007_4EEE:
    ldh  a, [hActiveEntityWalking]                ; $4EEE: $F0 $F0
    rst  $00                                      ; $4EF0: $C7
    rst  $38                                      ; $4EF1: $FF
    ld   c, [hl]                                  ; $4EF2: $4E
    rra                                           ; $4EF3: $1F
    ld   c, a                                     ; $4EF4: $4F
    ld   d, [hl]                                  ; $4EF5: $56
    ld   c, a                                     ; $4EF6: $4F
    add  $4F                                      ; $4EF7: $C6 $4F
    ld   c, [hl]                                  ; $4EF9: $4E
    ld   d, b                                     ; $4EFA: $50
    or   h                                        ; $4EFB: $B4
    ld   d, b                                     ; $4EFC: $50
    db   $E3                                      ; $4EFD: $E3
    ld   d, b                                     ; $4EFE: $50
    ld   a, $02                                   ; $4EFF: $3E $02
    call label_3B0C                               ; $4F01: $CD $0C $3B
    ld   hl, wEntity0PosX                         ; $4F04: $21 $00 $C2
    add  hl, bc                                   ; $4F07: $09
    ld   [hl], $60                                ; $4F08: $36 $60
    ld   hl, wEntity0PosY                         ; $4F0A: $21 $10 $C2
    add  hl, bc                                   ; $4F0D: $09
    ld   [hl], $58                                ; $4F0E: $36 $58
    call func_007_7CF0                            ; $4F10: $CD $F0 $7C
    call func_007_7D43                            ; $4F13: $CD $43 $7D
    ret  nc                                       ; $4F16: $D0

    ld   a, $C0                                   ; $4F17: $3E $C0
    call OpenDialogInTable1                       ; $4F19: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4F1C: $C3 $12 $3B

    call func_007_7CF0                            ; $4F1F: $CD $F0 $7C
    ld   a, [wDialogState]                        ; $4F22: $FA $9F $C1
    and  a                                        ; $4F25: $A7
    jr   nz, jr_007_4F4D                          ; $4F26: $20 $25

    ld   a, [wC177]                               ; $4F28: $FA $77 $C1
    and  a                                        ; $4F2B: $A7
    jr   nz, jr_007_4F44                          ; $4F2C: $20 $16

    ld   a, $02                                   ; $4F2E: $3E $02
    ld   [$DB7F], a                               ; $4F30: $EA $7F $DB
    ld   hl, $D887                                ; $4F33: $21 $87 $D8
    set  6, [hl]                                  ; $4F36: $CB $F6
    call GetEntityTransitionCountdown                 ; $4F38: $CD $05 $0C
    ld   [hl], $A0                                ; $4F3B: $36 $A0
    ld   a, $01                                   ; $4F3D: $3E $01
    ldh  [hJingle], a                             ; $4F3F: $E0 $F2
    jp   IncrementEntityWalkingAttr               ; $4F41: $C3 $12 $3B

jr_007_4F44:
    ld   a, $C2                                   ; $4F44: $3E $C2
    call OpenDialogInTable1                       ; $4F46: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4F49: $CD $12 $3B
    ld   [hl], b                                  ; $4F4C: $70

jr_007_4F4D:
    ret                                           ; $4F4D: $C9

    ld   a, b                                     ; $4F4E: $78
    ld   bc, $00FF                                ; $4F4F: $01 $FF $00
    ld   a, d                                     ; $4F52: $7A
    ld   bc, $017C                                ; $4F53: $01 $7C $01
    ld   a, $01                                   ; $4F56: $3E $01
    ldh  [$FFA1], a                               ; $4F58: $E0 $A1
    ld   [wC167], a                               ; $4F5A: $EA $67 $C1
    call GetEntityTransitionCountdown                 ; $4F5D: $CD $05 $0C
    cp   $30                                      ; $4F60: $FE $30
    jr   c, jr_007_4F7B                           ; $4F62: $38 $17

    xor  a                                        ; $4F64: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4F65: $E0 $F1
    ldh  a, [wActiveEntityPosY]                   ; $4F67: $F0 $EC
    sub  $10                                      ; $4F69: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $4F6B: $E0 $EC
    ld   de, $4F4E                                ; $4F6D: $11 $4E $4F
    call RenderAnimatedActiveEntity                               ; $4F70: $CD $C0 $3B
    call label_3D8A                               ; $4F73: $CD $8A $3D
    ld   a, $08                                   ; $4F76: $3E $08
    jp   label_3B0C                               ; $4F78: $C3 $0C $3B

jr_007_4F7B:
    cp   $18                                      ; $4F7B: $FE $18
    jr   nc, jr_007_4FA5                          ; $4F7D: $30 $26

    ld   a, $02                                   ; $4F7F: $3E $02
    ldh  [hLinkDirection], a                      ; $4F81: $E0 $9E
    ld   hl, wEntity0SpeedX                       ; $4F83: $21 $40 $C2
    add  hl, bc                                   ; $4F86: $09
    ld   [hl], $FE                                ; $4F87: $36 $FE
    call func_007_4005                            ; $4F89: $CD $05 $40
    ld   [hl], $F4                                ; $4F8C: $36 $F4
    call func_007_7E0A                            ; $4F8E: $CD $0A $7E
    call GetEntityTransitionCountdown                 ; $4F91: $CD $05 $0C
    jr   nz, jr_007_4FA5                          ; $4F94: $20 $0F

    ld   a, $34                                   ; $4F96: $3E $34
    ld   [wActiveMusicTrack], a                   ; $4F98: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $4F9B: $E0 $B0
    call GetEntityTransitionCountdown                 ; $4F9D: $CD $05 $0C
    ld   [hl], $C0                                ; $4FA0: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $4FA2: $C3 $12 $3B

jr_007_4FA5:
    ld   a, $01                                   ; $4FA5: $3E $01
    ldh  [hActiveEntityUnknownG], a               ; $4FA7: $E0 $F1
    ldh  a, [wActiveEntityPosX]                   ; $4FA9: $F0 $EE
    sub  $0C                                      ; $4FAB: $D6 $0C
    ldh  [wActiveEntityPosX], a                   ; $4FAD: $E0 $EE
    ld   de, $4F4E                                ; $4FAF: $11 $4E $4F
    call RenderAnimatedActiveEntity                               ; $4FB2: $CD $C0 $3B
    call label_3D8A                               ; $4FB5: $CD $8A $3D
    call GetEntityTransitionCountdown                 ; $4FB8: $CD $05 $0C
    rra                                           ; $4FBB: $1F
    rra                                           ; $4FBC: $1F
    rra                                           ; $4FBD: $1F
    rra                                           ; $4FBE: $1F
    and  $01                                      ; $4FBF: $E6 $01
    add  $02                                      ; $4FC1: $C6 $02
    jp   label_3B0C                               ; $4FC3: $C3 $0C $3B

    ld   a, $01                                   ; $4FC6: $3E $01
    ldh  [$FFA1], a                               ; $4FC8: $E0 $A1
    call GetEntityTransitionCountdown                 ; $4FCA: $CD $05 $0C
    jr   nz, jr_007_4FD4                          ; $4FCD: $20 $05

    ld   [hl], $0C                                ; $4FCF: $36 $0C
    call IncrementEntityWalkingAttr               ; $4FD1: $CD $12 $3B

jr_007_4FD4:
    call GetEntityTransitionCountdown                 ; $4FD4: $CD $05 $0C
    cp   $20                                      ; $4FD7: $FE $20
    jr   nz, jr_007_4FE5                          ; $4FD9: $20 $0A

    ld   hl, wEntitiesSpeedZTable                                ; $4FDB: $21 $20 $C3
    add  hl, bc                                   ; $4FDE: $09
    ld   [hl], $18                                ; $4FDF: $36 $18
    call func_007_733F                            ; $4FE1: $CD $3F $73
    xor  a                                        ; $4FE4: $AF

jr_007_4FE5:
    cp   $60                                      ; $4FE5: $FE $60
    jr   nz, jr_007_4FED                          ; $4FE7: $20 $04

    ld   hl, $D202                                ; $4FE9: $21 $02 $D2
    inc  [hl]                                     ; $4FEC: $34

jr_007_4FED:
    cp   $A0                                      ; $4FED: $FE $A0
    jr   nz, jr_007_4FFC                          ; $4FEF: $20 $0B

    ld   a, [$D201]                               ; $4FF1: $FA $01 $D2
    ld   e, a                                     ; $4FF4: $5F
    ld   d, b                                     ; $4FF5: $50
    ld   hl, wEntitiesTransitionCountdownTable           ; $4FF6: $21 $E0 $C2
    add  hl, de                                   ; $4FF9: $19
    ld   [hl], $A0                                ; $4FFA: $36 $A0

jr_007_4FFC:
    and  $20                                      ; $4FFC: $E6 $20
    jr   z, jr_007_5012                           ; $4FFE: $28 $12

    ld   a, $01                                   ; $5000: $3E $01
    ldh  [hActiveEntityUnknownG], a               ; $5002: $E0 $F1
    ldh  a, [wActiveEntityPosX]                   ; $5004: $F0 $EE
    sub  $0E                                      ; $5006: $D6 $0E
    ldh  [wActiveEntityPosX], a                   ; $5008: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $500A: $F0 $EC
    sub  $08                                      ; $500C: $D6 $08
    ldh  [wActiveEntityPosY], a                   ; $500E: $E0 $EC
    jr   jr_007_501B                              ; $5010: $18 $09

jr_007_5012:
    xor  a                                        ; $5012: $AF
    ldh  [hActiveEntityUnknownG], a               ; $5013: $E0 $F1
    ldh  a, [wActiveEntityPosY]                   ; $5015: $F0 $EC
    sub  $10                                      ; $5017: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $5019: $E0 $EC

jr_007_501B:
    ld   de, $4F4E                                ; $501B: $11 $4E $4F
    call RenderAnimatedActiveEntity                               ; $501E: $CD $C0 $3B
    call label_3D8A                               ; $5021: $CD $8A $3D
    call GetEntityTransitionCountdown                 ; $5024: $CD $05 $0C
    ld   e, $02                                   ; $5027: $1E $02
    and  $20                                      ; $5029: $E6 $20
    jr   z, jr_007_502E                           ; $502B: $28 $01

    inc  e                                        ; $502D: $1C

jr_007_502E:
    ld   a, e                                     ; $502E: $7B
    jp   label_3B0C                               ; $502F: $C3 $0C $3B

    jr   nz, jr_007_5034                          ; $5032: $20 $00

jr_007_5034:
    ldh  [rP1], a                                 ; $5034: $E0 $00
    nop                                           ; $5036: $00
    ldh  [rP1], a                                 ; $5037: $E0 $00
    jr   nz, jr_007_503B                          ; $5039: $20 $00

jr_007_503B:
    ld   [bc], a                                  ; $503B: $02
    ld   bc, $1603                                ; $503C: $01 $03 $16
    jr   z, jr_007_5069                           ; $503F: $28 $28

    jr   z, @+$2A                                 ; $5041: $28 $28

    jr   z, jr_007_506D                           ; $5043: $28 $28

    jr   z, @+$2A                                 ; $5045: $28 $28

    jr   z, jr_007_5071                           ; $5047: $28 $28

    jr   z, jr_007_504B                           ; $5049: $28 $00

jr_007_504B:
    ld   [bc], a                                  ; $504B: $02
    inc  b                                        ; $504C: $04
    ld   b, $3E                                   ; $504D: $06 $3E
    ld   bc, $A1E0                                ; $504F: $01 $E0 $A1
    call GetEntityTransitionCountdown                 ; $5052: $CD $05 $0C
    jr   nz, jr_007_506E                          ; $5055: $20 $17

    ld   hl, $C3D0                                ; $5057: $21 $D0 $C3
    add  hl, bc                                   ; $505A: $09
    ld   a, [hl]                                  ; $505B: $7E
    inc  a                                        ; $505C: $3C
    ld   [hl], a                                  ; $505D: $77
    cp   $0B                                      ; $505E: $FE $0B
    jp   z, IncrementEntityWalkingAttr            ; $5060: $CA $12 $3B

    ld   e, a                                     ; $5063: $5F
    ld   d, b                                     ; $5064: $50
    ld   hl, $503D                                ; $5065: $21 $3D $50
    add  hl, de                                   ; $5068: $19

jr_007_5069:
    ld   e, [hl]                                  ; $5069: $5E
    call GetEntityTransitionCountdown                 ; $506A: $CD $05 $0C

jr_007_506D:
    ld   [hl], e                                  ; $506D: $73

jr_007_506E:
    ld   hl, $C3D0                                ; $506E: $21 $D0 $C3

jr_007_5071:
    add  hl, bc                                   ; $5071: $09
    ld   a, [hl]                                  ; $5072: $7E
    and  $03                                      ; $5073: $E6 $03
    ld   e, a                                     ; $5075: $5F
    ld   d, b                                     ; $5076: $50
    ld   hl, $5032                                ; $5077: $21 $32 $50
    add  hl, de                                   ; $507A: $19
    ld   a, [hl]                                  ; $507B: $7E
    ld   hl, wEntity0SpeedX                       ; $507C: $21 $40 $C2
    add  hl, bc                                   ; $507F: $09
    ld   [hl], a                                  ; $5080: $77
    ld   hl, $5036                                ; $5081: $21 $36 $50
    add  hl, de                                   ; $5084: $19
    ld   a, [hl]                                  ; $5085: $7E
    call func_007_4005                            ; $5086: $CD $05 $40
    ld   [hl], a                                  ; $5089: $77
    ld   hl, $503A                                ; $508A: $21 $3A $50
    add  hl, de                                   ; $508D: $19
    ld   a, [hl]                                  ; $508E: $7E
    ld   hl, $C380                                ; $508F: $21 $80 $C3
    add  hl, bc                                   ; $5092: $09
    ld   [hl], a                                  ; $5093: $77
    call func_007_7E7D                            ; $5094: $CD $7D $7E
    ld   a, e                                     ; $5097: $7B
    xor  $01                                      ; $5098: $EE $01

jr_007_509A:
    ldh  [hLinkDirection], a                      ; $509A: $E0 $9E
    call func_007_7E0A                            ; $509C: $CD $0A $7E
    ld   hl, $C380                                ; $509F: $21 $80 $C3
    add  hl, bc                                   ; $50A2: $09
    ld   e, [hl]                                  ; $50A3: $5E
    ld   d, b                                     ; $50A4: $50
    ld   hl, $504A                                ; $50A5: $21 $4A $50
    add  hl, de                                   ; $50A8: $19
    ldh  a, [hFrameCounter]                       ; $50A9: $F0 $E7
    rra                                           ; $50AB: $1F
    rra                                           ; $50AC: $1F
    rra                                           ; $50AD: $1F
    and  $01                                      ; $50AE: $E6 $01
    or   [hl]                                     ; $50B0: $B6
    jp   label_3B0C                               ; $50B1: $C3 $0C $3B

    ld   a, $01                                   ; $50B4: $3E $01
    ldh  [$FFA1], a                               ; $50B6: $E0 $A1
    ld   hl, $C380                                ; $50B8: $21 $80 $C3
    add  hl, bc                                   ; $50BB: $09
    ld   a, $01                                   ; $50BC: $3E $01
    ld   [hl], a                                  ; $50BE: $77
    ld   hl, wEntity0SpeedX                       ; $50BF: $21 $40 $C2
    add  hl, bc                                   ; $50C2: $09
    ld   [hl], $E4                                ; $50C3: $36 $E4
    call func_007_4005                            ; $50C5: $CD $05 $40
    ld   [hl], $08                                ; $50C8: $36 $08
    call func_007_7E0A                            ; $50CA: $CD $0A $7E
    ldh  a, [wActiveEntityPosX]                   ; $50CD: $F0 $EE
    cp   $C0                                      ; $50CF: $FE $C0
    jr   c, jr_007_50DF                           ; $50D1: $38 $0C

    cp   $C4                                      ; $50D3: $FE $C4
    jp   nc, label_007_50DF                       ; $50D5: $D2 $DF $50

    xor  a                                        ; $50D8: $AF
    ld   [wC167], a                               ; $50D9: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $50DC: $CD $12 $3B

label_007_50DF:
jr_007_50DF:
    ld   a, $01                                   ; $50DF: $3E $01
    jr   jr_007_509A                              ; $50E1: $18 $B7

    ld   a, [$D201]                               ; $50E3: $FA $01 $D2
    ld   e, a                                     ; $50E6: $5F
    ld   d, b                                     ; $50E7: $50
    ld   hl, wEntitiesWalkingTable                ; $50E8: $21 $90 $C2
    add  hl, de                                   ; $50EB: $19
    inc  [hl]                                     ; $50EC: $34
    ld   hl, wEntitiesTransitionCountdownTable           ; $50ED: $21 $E0 $C2
    add  hl, de                                   ; $50F0: $19
    ld   [hl], $50                                ; $50F1: $36 $50
    ld   hl, wEntity0PosY                         ; $50F3: $21 $10 $C2
    add  hl, de                                   ; $50F6: $19
    ld   a, [hl]                                  ; $50F7: $7E
    add  $10                                      ; $50F8: $C6 $10
    ld   [hl], a                                  ; $50FA: $77
    ld   hl, wEntitiesPosZTable                                ; $50FB: $21 $10 $C3
    add  hl, de                                   ; $50FE: $19
    ld   [hl], $10                                ; $50FF: $36 $10
    jp   label_007_7EA4                           ; $5101: $C3 $A4 $7E

    ld   b, b                                     ; $5104: $40
    ld   [bc], a                                  ; $5105: $02
    ld   b, b                                     ; $5106: $40
    ld   [hl+], a                                 ; $5107: $22
    ld   b, d                                     ; $5108: $42
    ld   [bc], a                                  ; $5109: $02
    ld   b, d                                     ; $510A: $42
    ld   [hl+], a                                 ; $510B: $22
    ld   de, $5104                                ; $510C: $11 $04 $51
    call RenderAnimatedActiveEntity                               ; $510F: $CD $C0 $3B
    call func_007_7D96                            ; $5112: $CD $96 $7D
    ldh  a, [hFrameCounter]                       ; $5115: $F0 $E7
    rra                                           ; $5117: $1F
    rra                                           ; $5118: $1F
    rra                                           ; $5119: $1F
    rra                                           ; $511A: $1F
    and  $01                                      ; $511B: $E6 $01
    call label_3B0C                               ; $511D: $CD $0C $3B
    ldh  a, [hActiveEntityWalking]                ; $5120: $F0 $F0
    rst  $00                                      ; $5122: $C7
    cpl                                           ; $5123: $2F
    ld   d, c                                     ; $5124: $51
    ld   a, h                                     ; $5125: $7C
    ld   d, c                                     ; $5126: $51
    ld   [$00F8], sp                              ; $5127: $08 $F8 $00
    nop                                           ; $512A: $00
    nop                                           ; $512B: $00
    nop                                           ; $512C: $00
    ld   hl, sp+$08                               ; $512D: $F8 $08
    call func_007_7CF0                            ; $512F: $CD $F0 $7C
    jr   nc, jr_007_516E                          ; $5132: $30 $3A

    ldh  a, [hPressedButtonsMask]                 ; $5134: $F0 $CB
    and  $0F                                      ; $5136: $E6 $0F
    jr   z, jr_007_516E                           ; $5138: $28 $34

    ld   a, $01                                   ; $513A: $3E $01
    ld   [$C144], a                               ; $513C: $EA $44 $C1
    ld   hl, $C3D0                                ; $513F: $21 $D0 $C3
    add  hl, bc                                   ; $5142: $09
    ld   a, [hl]                                  ; $5143: $7E
    inc  a                                        ; $5144: $3C
    ld   [hl], a                                  ; $5145: $77
    cp   $10                                      ; $5146: $FE $10
    jr   nz, jr_007_5173                          ; $5148: $20 $29

    call IncrementEntityWalkingAttr               ; $514A: $CD $12 $3B
    call func_007_7E7D                            ; $514D: $CD $7D $7E
    ld   hl, $C380                                ; $5150: $21 $80 $C3
    add  hl, bc                                   ; $5153: $09
    ld   a, e                                     ; $5154: $7B
    xor  $01                                      ; $5155: $EE $01
    ld   e, a                                     ; $5157: $5F
    ld   [hl], e                                  ; $5158: $73

func_007_5159:
    ld   d, b                                     ; $5159: $50
    ld   hl, $5127                                ; $515A: $21 $27 $51
    add  hl, de                                   ; $515D: $19
    ld   a, [hl]                                  ; $515E: $7E
    ld   hl, wEntity0SpeedX                       ; $515F: $21 $40 $C2
    add  hl, bc                                   ; $5162: $09
    ld   [hl], a                                  ; $5163: $77
    ld   hl, $512B                                ; $5164: $21 $2B $51
    add  hl, de                                   ; $5167: $19
    ld   a, [hl]                                  ; $5168: $7E
    call func_007_4005                            ; $5169: $CD $05 $40
    ld   [hl], a                                  ; $516C: $77
    ret                                           ; $516D: $C9

jr_007_516E:
    ld   hl, $C3D0                                ; $516E: $21 $D0 $C3
    add  hl, bc                                   ; $5171: $09
    ld   [hl], b                                  ; $5172: $70

jr_007_5173:
    ret                                           ; $5173: $C9

    db   $10                                      ; $5174: $10
    ldh  a, [rP1]                                 ; $5175: $F0 $00
    nop                                           ; $5177: $00
    nop                                           ; $5178: $00
    nop                                           ; $5179: $00
    ldh  a, [rNR10]                               ; $517A: $F0 $10
    ld   a, $01                                   ; $517C: $3E $01
    ldh  [$FFA1], a                               ; $517E: $E0 $A1
    ld   a, $3E                                   ; $5180: $3E $3E
    ldh  [hJingle], a                             ; $5182: $E0 $F2
    ldh  a, [hJoypadState]                               ; $5184: $F0 $CC
    and  $0F                                      ; $5186: $E6 $0F
    ld   d, a                                     ; $5188: $57
    jr   z, jr_007_51AA                           ; $5189: $28 $1F

    and  $03                                      ; $518B: $E6 $03
    jr   z, jr_007_5198                           ; $518D: $28 $09

    ld   e, $00                                   ; $518F: $1E $00
    and  $01                                      ; $5191: $E6 $01
    jr   nz, jr_007_5196                          ; $5193: $20 $01

    inc  e                                        ; $5195: $1C

jr_007_5196:
    jr   jr_007_519F                              ; $5196: $18 $07

jr_007_5198:
    ld   e, $02                                   ; $5198: $1E $02
    bit  2, d                                     ; $519A: $CB $52
    jr   nz, jr_007_519F                          ; $519C: $20 $01

    inc  e                                        ; $519E: $1C

jr_007_519F:
    ld   hl, $C380                                ; $519F: $21 $80 $C3
    add  hl, bc                                   ; $51A2: $09
    ld   a, [hl]                                  ; $51A3: $7E
    xor  e                                        ; $51A4: $AB
    cp   $01                                      ; $51A5: $FE $01
    jr   z, jr_007_51AA                           ; $51A7: $28 $01

    ld   [hl], e                                  ; $51A9: $73

jr_007_51AA:
    call func_007_7E0A                            ; $51AA: $CD $0A $7E
    ld   hl, wEntity0PosX                         ; $51AD: $21 $00 $C2
    add  hl, bc                                   ; $51B0: $09
    ld   a, [hl]                                  ; $51B1: $7E
    sub  $08                                      ; $51B2: $D6 $08
    ld   hl, wEntity0PosY                         ; $51B4: $21 $10 $C2
    add  hl, bc                                   ; $51B7: $09
    or   [hl]                                     ; $51B8: $B6
    and  $0F                                      ; $51B9: $E6 $0F
    jp   nz, label_007_529F                       ; $51BB: $C2 $9F $52

    ld   a, [hl]                                  ; $51BE: $7E
    sub  $10                                      ; $51BF: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $51C1: $E0 $CD
    ld   hl, wEntity0PosX                         ; $51C3: $21 $00 $C2
    add  hl, bc                                   ; $51C6: $09
    ld   a, [hl]                                  ; $51C7: $7E
    sub  $08                                      ; $51C8: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $51CA: $E0 $CE
    swap a                                        ; $51CC: $CB $37
    and  $0F                                      ; $51CE: $E6 $0F
    ld   e, a                                     ; $51D0: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $51D1: $F0 $CD
    and  $F0                                      ; $51D3: $E6 $F0
    or   e                                        ; $51D5: $B3
    ld   e, a                                     ; $51D6: $5F
    ld   d, b                                     ; $51D7: $50
    ld   hl, wRoomObjects                         ; $51D8: $21 $11 $D7
    add  hl, de                                   ; $51DB: $19
    ld   [hl], $0D                                ; $51DC: $36 $0D
    call label_2887                               ; $51DE: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $51E1: $F0 $FE
    and  a                                        ; $51E3: $A7
    jr   z, jr_007_51F2                           ; $51E4: $28 $0C

    push bc                                       ; $51E6: $C5
    ld   a, $0D                                   ; $51E7: $3E $0D
    ld   [$DDD8], a                               ; $51E9: $EA $D8 $DD
    ld   a, $07                                   ; $51EC: $3E $07
    call label_91D                                ; $51EE: $CD $1D $09
    pop  bc                                       ; $51F1: $C1

jr_007_51F2:
    ld   hl, wRequestDestinationHigh              ; $51F2: $21 $01 $D6
    ld   a, [wRequests]                           ; $51F5: $FA $00 $D6
    ld   e, a                                     ; $51F8: $5F
    add  $0A                                      ; $51F9: $C6 $0A
    ld   [wRequests], a                           ; $51FB: $EA $00 $D6
    ld   d, $00                                   ; $51FE: $16 $00
    add  hl, de                                   ; $5200: $19
    ldh  a, [$FFCF]                               ; $5201: $F0 $CF
    ld   [hl+], a                                 ; $5203: $22
    ldh  a, [$FFD0]                               ; $5204: $F0 $D0
    ld   [hl+], a                                 ; $5206: $22
    ld   a, $81                                   ; $5207: $3E $81
    ld   [hl+], a                                 ; $5209: $22
    ld   a, $10                                   ; $520A: $3E $10
    ld   [hl+], a                                 ; $520C: $22
    ld   a, $12                                   ; $520D: $3E $12
    ld   [hl+], a                                 ; $520F: $22
    ldh  a, [$FFCF]                               ; $5210: $F0 $CF
    ld   [hl+], a                                 ; $5212: $22
    ldh  a, [$FFD0]                               ; $5213: $F0 $D0
    inc  a                                        ; $5215: $3C
    ld   [hl+], a                                 ; $5216: $22
    ld   a, $81                                   ; $5217: $3E $81
    ld   [hl+], a                                 ; $5219: $22
    ld   a, $11                                   ; $521A: $3E $11
    ld   [hl+], a                                 ; $521C: $22
    ld   a, $13                                   ; $521D: $3E $13
    ld   [hl+], a                                 ; $521F: $22
    ld   [hl], b                                  ; $5220: $70
    ld   hl, $C380                                ; $5221: $21 $80 $C3
    add  hl, bc                                   ; $5224: $09
    ld   e, [hl]                                  ; $5225: $5E
    call func_007_5159                            ; $5226: $CD $59 $51
    ld   hl, $C380                                ; $5229: $21 $80 $C3
    add  hl, bc                                   ; $522C: $09
    ld   e, [hl]                                  ; $522D: $5E
    ld   d, b                                     ; $522E: $50
    ld   hl, $5174                                ; $522F: $21 $74 $51
    add  hl, de                                   ; $5232: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $5233: $F0 $CE
    add  [hl]                                     ; $5235: $86
    swap a                                        ; $5236: $CB $37
    and  $0F                                      ; $5238: $E6 $0F
    push af                                       ; $523A: $F5
    ld   hl, $5178                                ; $523B: $21 $78 $51
    add  hl, de                                   ; $523E: $19
    pop  af                                       ; $523F: $F1
    ld   e, a                                     ; $5240: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $5241: $F0 $CD
    add  [hl]                                     ; $5243: $86
    and  $F0                                      ; $5244: $E6 $F0
    or   e                                        ; $5246: $B3
    ld   e, a                                     ; $5247: $5F
    ld   d, b                                     ; $5248: $50
    ld   hl, wRoomObjects                         ; $5249: $21 $11 $D7
    add  hl, de                                   ; $524C: $19
    ld   e, [hl]                                  ; $524D: $5E
    ld   d, $01                                   ; $524E: $16 $01
    call label_2A26                               ; $5250: $CD $26 $2A
    cp   $0B                                      ; $5253: $FE $0B
    jr   z, jr_007_529F                           ; $5255: $28 $48

    cp   $50                                      ; $5257: $FE $50
    jr   z, jr_007_529F                           ; $5259: $28 $44

    cp   $51                                      ; $525B: $FE $51
    jr   z, jr_007_529F                           ; $525D: $28 $40

    ldh  a, [wActiveEntityPosX]                   ; $525F: $F0 $EE
    ldh  [hScratchA], a                           ; $5261: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $5263: $F0 $EC
    ldh  [hScratchB], a                           ; $5265: $E0 $D8
    ld   a, $2F                                   ; $5267: $3E $2F
    ldh  [hJingle], a                             ; $5269: $E0 $F2
    ld   a, $02                                   ; $526B: $3E $02
    call label_CC7                                ; $526D: $CD $C7 $0C
    ld   hl, $C520                                ; $5270: $21 $20 $C5
    add  hl, de                                   ; $5273: $19
    ld   [hl], $0F                                ; $5274: $36 $0F
    call func_007_7EA4                            ; $5276: $CD $A4 $7E
    ld   a, [$C18E]                               ; $5279: $FA $8E $C1
    and  $0F                                      ; $527C: $E6 $0F
    cp   $0E                                      ; $527E: $FE $0E
    jr   nz, jr_007_529F                          ; $5280: $20 $1D

    push bc                                       ; $5282: $C5
    ld   c, b                                     ; $5283: $48
    ld   hl, wRoomObjectsArea                     ; $5284: $21 $00 $D7

jr_007_5287:
    ld   a, [hl+]                                 ; $5287: $2A
    push hl                                       ; $5288: $E5
    ld   e, a                                     ; $5289: $5F
    ld   d, $01                                   ; $528A: $16 $01
    call label_2A26                               ; $528C: $CD $26 $2A
    pop  hl                                       ; $528F: $E1
    cp   $50                                      ; $5290: $FE $50
    jr   z, jr_007_529E                           ; $5292: $28 $0A

    cp   $51                                      ; $5294: $FE $51
    jr   z, jr_007_529E                           ; $5296: $28 $06

    dec  c                                        ; $5298: $0D
    jr   nz, jr_007_5287                          ; $5299: $20 $EC

    call label_C60                                ; $529B: $CD $60 $0C

jr_007_529E:
    pop  bc                                       ; $529E: $C1

label_007_529F:
jr_007_529F:
    ret                                           ; $529F: $C9

    nop                                           ; $52A0: $00
    nop                                           ; $52A1: $00
    ld   bc, $0101                                ; $52A2: $01 $01 $01
    ld   [bc], a                                  ; $52A5: $02
    ld   [bc], a                                  ; $52A6: $02
    ld   [bc], a                                  ; $52A7: $02
    nop                                           ; $52A8: $00
    nop                                           ; $52A9: $00
    rrca                                          ; $52AA: $0F
    rrca                                          ; $52AB: $0F
    rrca                                          ; $52AC: $0F
    ld   c, $0E                                   ; $52AD: $0E $0E
    ld   c, $08                                   ; $52AF: $0E $08
    ld   [$0707], sp                              ; $52B1: $08 $07 $07
    rlca                                          ; $52B4: $07
    ld   b, $06                                   ; $52B5: $06 $06
    ld   b, $08                                   ; $52B7: $06 $08
    ld   [$0909], sp                              ; $52B9: $08 $09 $09
    add  hl, bc                                   ; $52BC: $09
    ld   a, [bc]                                  ; $52BD: $0A
    ld   a, [bc]                                  ; $52BE: $0A
    ld   a, [bc]                                  ; $52BF: $0A
    inc  b                                        ; $52C0: $04
    inc  b                                        ; $52C1: $04
    inc  bc                                       ; $52C2: $03
    inc  bc                                       ; $52C3: $03
    inc  bc                                       ; $52C4: $03
    ld   [bc], a                                  ; $52C5: $02
    ld   [bc], a                                  ; $52C6: $02
    ld   [bc], a                                  ; $52C7: $02
    inc  c                                        ; $52C8: $0C
    inc  c                                        ; $52C9: $0C
    dec  c                                        ; $52CA: $0D
    dec  c                                        ; $52CB: $0D
    dec  c                                        ; $52CC: $0D
    ld   c, $0E                                   ; $52CD: $0E $0E
    ld   c, $04                                   ; $52CF: $0E $04
    inc  b                                        ; $52D1: $04
    dec  b                                        ; $52D2: $05
    dec  b                                        ; $52D3: $05
    dec  b                                        ; $52D4: $05
    ld   b, $06                                   ; $52D5: $06 $06
    ld   b, $0C                                   ; $52D7: $06 $0C
    inc  c                                        ; $52D9: $0C
    dec  bc                                       ; $52DA: $0B
    dec  bc                                       ; $52DB: $0B
    dec  bc                                       ; $52DC: $0B
    ld   a, [bc]                                  ; $52DD: $0A
    ld   a, [bc]                                  ; $52DE: $0A
    ld   a, [bc]                                  ; $52DF: $0A

func_007_52E0:
    ldh  a, [hScratchA]                           ; $52E0: $F0 $D7
    rlca                                          ; $52E2: $07
    and  $01                                      ; $52E3: $E6 $01
    ld   e, a                                     ; $52E5: $5F
    ldh  a, [hScratchB]                           ; $52E6: $F0 $D8
    rlca                                          ; $52E8: $07
    rla                                           ; $52E9: $17
    and  $02                                      ; $52EA: $E6 $02
    or   e                                        ; $52EC: $B3
    rla                                           ; $52ED: $17
    rla                                           ; $52EE: $17
    rla                                           ; $52EF: $17
    and  $18                                      ; $52F0: $E6 $18
    ld   h, a                                     ; $52F2: $67
    ldh  a, [hScratchB]                           ; $52F3: $F0 $D8
    bit  7, a                                     ; $52F5: $CB $7F
    jr   z, jr_007_52FB                           ; $52F7: $28 $02

    cpl                                           ; $52F9: $2F
    inc  a                                        ; $52FA: $3C

jr_007_52FB:
    ld   d, a                                     ; $52FB: $57
    ldh  a, [hScratchA]                           ; $52FC: $F0 $D7
    bit  7, a                                     ; $52FE: $CB $7F
    jr   z, jr_007_5304                           ; $5300: $28 $02

    cpl                                           ; $5302: $2F
    inc  a                                        ; $5303: $3C

jr_007_5304:
    cp   d                                        ; $5304: $BA
    jr   nc, jr_007_5314                          ; $5305: $30 $0D

    sra  a                                        ; $5307: $CB $2F
    sra  a                                        ; $5309: $CB $2F
    add  h                                        ; $530B: $84
    ld   e, a                                     ; $530C: $5F
    ld   d, b                                     ; $530D: $50
    ld   hl, $52A0                                ; $530E: $21 $A0 $52
    add  hl, de                                   ; $5311: $19
    ld   a, [hl]                                  ; $5312: $7E
    ret                                           ; $5313: $C9

jr_007_5314:
    ld   a, d                                     ; $5314: $7A
    sra  a                                        ; $5315: $CB $2F
    sra  a                                        ; $5317: $CB $2F
    add  h                                        ; $5319: $84
    ld   e, a                                     ; $531A: $5F
    ld   d, b                                     ; $531B: $50
    ld   hl, $52C0                                ; $531C: $21 $C0 $52
    add  hl, de                                   ; $531F: $19
    ld   a, [hl]                                  ; $5320: $7E
    ret                                           ; $5321: $C9

    ld   hl, $C470                                ; $5322: $21 $70 $C4
    add  hl, bc                                   ; $5325: $09
    ld   [hl], b                                  ; $5326: $70
    ld   hl, $C3F0                                ; $5327: $21 $F0 $C3
    add  hl, bc                                   ; $532A: $09
    ld   [hl], b                                  ; $532B: $70
    ld   hl, $C400                                ; $532C: $21 $00 $C4
    add  hl, bc                                   ; $532F: $09
    ld   [hl], b                                  ; $5330: $70
    call func_007_5453                            ; $5331: $CD $53 $54
    call func_007_7D96                            ; $5334: $CD $96 $7D
    call label_C56                                ; $5337: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $533A: $F0 $F0
    rst  $00                                      ; $533C: $C7
    ld   c, c                                     ; $533D: $49
    ld   d, e                                     ; $533E: $53
    ld   e, d                                     ; $533F: $5A
    ld   d, e                                     ; $5340: $53
    add  e                                        ; $5341: $83
    ld   d, e                                     ; $5342: $53
    cp   l                                        ; $5343: $BD
    ld   d, e                                     ; $5344: $53
    call $D853                                    ; $5345: $CD $53 $D8
    ld   d, e                                     ; $5348: $53
    ldh  a, [wActiveEntityPosX]                   ; $5349: $F0 $EE
    ld   hl, wEntitiesUnknownTableB               ; $534B: $21 $B0 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    ldh  a, [$FFEF]                               ; $5350: $F0 $EF
    ld   hl, wEntitiesUnknownTableC               ; $5352: $21 $C0 $C2
    add  hl, bc                                   ; $5355: $09
    ld   [hl], a                                  ; $5356: $77
    jp   IncrementEntityWalkingAttr               ; $5357: $C3 $12 $3B

    call GetEntityTransitionCountdown                 ; $535A: $CD $05 $0C
    jr   nz, jr_007_537F                          ; $535D: $20 $20

    ld   hl, $C340                                ; $535F: $21 $40 $C3
    add  hl, bc                                   ; $5362: $09
    set  6, [hl]                                  ; $5363: $CB $F6
    call func_007_7E5D                            ; $5365: $CD $5D $7E
    add  $20                                      ; $5368: $C6 $20
    cp   $40                                      ; $536A: $FE $40
    jr   nc, jr_007_537F                          ; $536C: $30 $11

    call func_007_7E6D                            ; $536E: $CD $6D $7E
    add  $20                                      ; $5371: $C6 $20
    cp   $40                                      ; $5373: $FE $40
    jr   nc, jr_007_537F                          ; $5375: $30 $08

    call GetEntityTransitionCountdown                 ; $5377: $CD $05 $0C
    ld   [hl], $30                                ; $537A: $36 $30
    call IncrementEntityWalkingAttr               ; $537C: $CD $12 $3B

jr_007_537F:
    xor  a                                        ; $537F: $AF
    jp   label_3B0C                               ; $5380: $C3 $0C $3B

    call GetEntityTransitionCountdown                 ; $5383: $CD $05 $0C
    jr   nz, jr_007_539E                          ; $5386: $20 $16

    ld   hl, wEntitiesUnknownTableD               ; $5388: $21 $D0 $C2
    add  hl, bc                                   ; $538B: $09
    ld   a, [hl]                                  ; $538C: $7E
    call label_3B0C                               ; $538D: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $5390: $CD $05 $0C
    ld   [hl], $18                                ; $5393: $36 $18
    ld   hl, $C340                                ; $5395: $21 $40 $C3
    add  hl, bc                                   ; $5398: $09
    res  6, [hl]                                  ; $5399: $CB $B6
    jp   IncrementEntityWalkingAttr               ; $539B: $C3 $12 $3B

jr_007_539E:
    cp   $10                                      ; $539E: $FE $10
    jr   nz, jr_007_53B8                          ; $53A0: $20 $16

    ld   a, $1F                                   ; $53A2: $3E $1F
    call label_3BAA                               ; $53A4: $CD $AA $3B
    call func_007_52E0                            ; $53A7: $CD $E0 $52
    sra  a                                        ; $53AA: $CB $2F
    add  $02                                      ; $53AC: $C6 $02
    ld   hl, wEntitiesUnknownTableD               ; $53AE: $21 $D0 $C2
    add  hl, bc                                   ; $53B1: $09
    ld   [hl], a                                  ; $53B2: $77
    ld   a, $18                                   ; $53B3: $3E $18
    call label_3BAA                               ; $53B5: $CD $AA $3B

jr_007_53B8:
    ld   a, $01                                   ; $53B8: $3E $01
    jp   label_3B0C                               ; $53BA: $C3 $0C $3B

    call func_007_7E0A                            ; $53BD: $CD $0A $7E
    call GetEntityTransitionCountdown                 ; $53C0: $CD $05 $0C
    jr   nz, jr_007_53CA                          ; $53C3: $20 $05

    ld   [hl], $20                                ; $53C5: $36 $20
    call IncrementEntityWalkingAttr               ; $53C7: $CD $12 $3B

jr_007_53CA:
    jp   label_3B39                               ; $53CA: $C3 $39 $3B

    call GetEntityTransitionCountdown                 ; $53CD: $CD $05 $0C
    jr   nz, jr_007_53D5                          ; $53D0: $20 $03

    call IncrementEntityWalkingAttr               ; $53D2: $CD $12 $3B

jr_007_53D5:
    jp   label_3B39                               ; $53D5: $C3 $39 $3B

    ldh  a, [hLinkPositionX]                      ; $53D8: $F0 $98
    push af                                       ; $53DA: $F5
    ldh  a, [hLinkPositionY]                      ; $53DB: $F0 $99
    push af                                       ; $53DD: $F5
    ld   hl, wEntitiesUnknownTableB               ; $53DE: $21 $B0 $C2
    add  hl, bc                                   ; $53E1: $09
    ld   a, [hl]                                  ; $53E2: $7E
    ldh  [hLinkPositionX], a                      ; $53E3: $E0 $98
    ld   hl, wEntitiesUnknownTableC               ; $53E5: $21 $C0 $C2
    add  hl, bc                                   ; $53E8: $09
    ld   a, [hl]                                  ; $53E9: $7E
    ldh  [hLinkPositionY], a                      ; $53EA: $E0 $99
    ld   a, $10                                   ; $53EC: $3E $10
    call label_3BAA                               ; $53EE: $CD $AA $3B
    call func_007_7E5D                            ; $53F1: $CD $5D $7E
    add  $02                                      ; $53F4: $C6 $02
    cp   $04                                      ; $53F6: $FE $04
    jr   nc, jr_007_541F                          ; $53F8: $30 $25

    call func_007_7E6D                            ; $53FA: $CD $6D $7E
    add  $02                                      ; $53FD: $C6 $02
    cp   $04                                      ; $53FF: $FE $04
    jr   nc, jr_007_541F                          ; $5401: $30 $1C

    ld   hl, wEntity0PosX                         ; $5403: $21 $00 $C2
    add  hl, bc                                   ; $5406: $09
    ldh  a, [hLinkPositionX]                      ; $5407: $F0 $98
    ld   [hl], a                                  ; $5409: $77
    ld   hl, wEntity0PosY                         ; $540A: $21 $10 $C2
    add  hl, bc                                   ; $540D: $09
    ldh  a, [hLinkPositionY]                      ; $540E: $F0 $99
    ld   [hl], a                                  ; $5410: $77
    xor  a                                        ; $5411: $AF
    call label_3B0C                               ; $5412: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $5415: $CD $12 $3B
    ld   [hl], $01                                ; $5418: $36 $01
    call GetEntityTransitionCountdown                 ; $541A: $CD $05 $0C
    ld   [hl], $20                                ; $541D: $36 $20

jr_007_541F:
    pop  af                                       ; $541F: $F1
    ldh  [hLinkPositionY], a                      ; $5420: $E0 $99
    pop  af                                       ; $5422: $F1
    ldh  [hLinkPositionX], a                      ; $5423: $E0 $98
    call func_007_7E0A                            ; $5425: $CD $0A $7E
    jp   label_3B39                               ; $5428: $C3 $39 $3B

    rst  $38                                      ; $542B: $FF
    nop                                           ; $542C: $00
    rst  $38                                      ; $542D: $FF
    jr   nz, jr_007_549C                          ; $542E: $20 $6C

    ld   [bc], a                                  ; $5430: $02
    ld   l, h                                     ; $5431: $6C
    ld   [hl+], a                                 ; $5432: $22
    ld   h, h                                     ; $5433: $64
    ld   [hl+], a                                 ; $5434: $22
    ld   h, d                                     ; $5435: $62
    ld   [hl+], a                                 ; $5436: $22
    ld   l, b                                     ; $5437: $68
    ld   [hl+], a                                 ; $5438: $22
    ld   h, [hl]                                  ; $5439: $66
    ld   [hl+], a                                 ; $543A: $22
    ld   h, b                                     ; $543B: $60
    ld   [bc], a                                  ; $543C: $02
    ld   h, b                                     ; $543D: $60
    ld   [hl+], a                                 ; $543E: $22
    ld   h, [hl]                                  ; $543F: $66
    ld   [bc], a                                  ; $5440: $02
    ld   l, b                                     ; $5441: $68
    ld   [bc], a                                  ; $5442: $02
    ld   h, d                                     ; $5443: $62
    ld   [bc], a                                  ; $5444: $02
    ld   h, h                                     ; $5445: $64
    ld   [bc], a                                  ; $5446: $02
    ld   h, [hl]                                  ; $5447: $66
    ld   b, d                                     ; $5448: $42
    ld   l, b                                     ; $5449: $68
    ld   b, d                                     ; $544A: $42
    ld   h, b                                     ; $544B: $60
    ld   b, d                                     ; $544C: $42
    ld   h, b                                     ; $544D: $60
    ld   h, d                                     ; $544E: $62
    ld   l, b                                     ; $544F: $68
    ld   h, d                                     ; $5450: $62
    ld   h, [hl]                                  ; $5451: $66
    ld   h, d                                     ; $5452: $62

func_007_5453:
    ld   de, $542B                                ; $5453: $11 $2B $54
    call RenderAnimatedActiveEntity                               ; $5456: $CD $C0 $3B
    ldh  a, [hActiveEntityWalking]                ; $5459: $F0 $F0
    cp   $03                                      ; $545B: $FE $03
    ret  c                                        ; $545D: $D8

    ldh  a, [wActiveEntityPosX]                   ; $545E: $F0 $EE
    ld   hl, wEntitiesUnknownTableB               ; $5460: $21 $B0 $C2
    add  hl, bc                                   ; $5463: $09
    sub  [hl]                                     ; $5464: $96
    sra  a                                        ; $5465: $CB $2F
    sra  a                                        ; $5467: $CB $2F
    ldh  [hScratchA], a                           ; $5469: $E0 $D7
    ldh  [hScratchC], a                           ; $546B: $E0 $D9
    ldh  a, [wActiveEntityPosY]                   ; $546D: $F0 $EC
    ld   hl, wEntitiesUnknownTableC               ; $546F: $21 $C0 $C2
    add  hl, bc                                   ; $5472: $09
    sub  [hl]                                     ; $5473: $96
    sra  a                                        ; $5474: $CB $2F
    sra  a                                        ; $5476: $CB $2F
    ldh  [hScratchB], a                           ; $5478: $E0 $D8
    ldh  [hScratchD], a                           ; $547A: $E0 $DA
    ld   a, [$C3C0]                               ; $547C: $FA $C0 $C3
    ld   e, a                                     ; $547F: $5F
    ld   d, $00                                   ; $5480: $16 $00
    ld   hl, $C030                                ; $5482: $21 $30 $C0
    add  hl, de                                   ; $5485: $19
    ld   e, l                                     ; $5486: $5D
    ld   d, h                                     ; $5487: $54
    ld   a, $03                                   ; $5488: $3E $03

jr_007_548A:
    ldh  [$FFDB], a                               ; $548A: $E0 $DB
    ld   hl, wEntitiesUnknownTableC               ; $548C: $21 $C0 $C2
    add  hl, bc                                   ; $548F: $09
    ldh  a, [hScratchB]                           ; $5490: $F0 $D8
    add  [hl]                                     ; $5492: $86
    ld   [de], a                                  ; $5493: $12
    inc  de                                       ; $5494: $13
    ld   hl, wEntitiesUnknownTableB               ; $5495: $21 $B0 $C2
    add  hl, bc                                   ; $5498: $09
    ldh  a, [hScratchA]                           ; $5499: $F0 $D7
    add  [hl]                                     ; $549B: $86

jr_007_549C:
    add  $04                                      ; $549C: $C6 $04
    ld   [de], a                                  ; $549E: $12
    inc  de                                       ; $549F: $13
    ld   a, $6A                                   ; $54A0: $3E $6A
    ld   [de], a                                  ; $54A2: $12
    inc  de                                       ; $54A3: $13
    ld   a, $02                                   ; $54A4: $3E $02
    ld   [de], a                                  ; $54A6: $12
    inc  de                                       ; $54A7: $13
    ldh  a, [hScratchA]                           ; $54A8: $F0 $D7
    ld   hl, hScratchC                            ; $54AA: $21 $D9 $FF
    add  [hl]                                     ; $54AD: $86
    ldh  [hScratchA], a                           ; $54AE: $E0 $D7
    ldh  a, [hScratchB]                           ; $54B0: $F0 $D8
    ld   hl, hScratchD                            ; $54B2: $21 $DA $FF
    add  [hl]                                     ; $54B5: $86
    ldh  [hScratchB], a                           ; $54B6: $E0 $D8
    ldh  a, [$FFDB]                               ; $54B8: $F0 $DB
    dec  a                                        ; $54BA: $3D
    jr   nz, jr_007_548A                          ; $54BB: $20 $CD

    ld   a, $03                                   ; $54BD: $3E $03
    jp   label_3DA0                               ; $54BF: $C3 $A0 $3D

    ld   b, h                                     ; $54C2: $44
    add  hl, hl                                   ; $54C3: $29
    add  d                                        ; $54C4: $82
    bit  4, h                                     ; $54C5: $CB $64
    pop  bc                                       ; $54C7: $C1
    ret  nc                                       ; $54C8: $D0

    ld   [hl], h                                  ; $54C9: $74
    ld   l, d                                     ; $54CA: $6A
    ld   [hl], $5E                                ; $54CB: $36 $5E
    db   $EC                                      ; $54CD: $EC
    push af                                       ; $54CE: $F5
    sbc  l                                        ; $54CF: $9D
    sbc  d                                        ; $54D0: $9A
    ld   d, $9C                                   ; $54D1: $16 $9C
    ld   d, $74                                   ; $54D3: $16 $74
    nop                                           ; $54D5: $00
    halt                                          ; $54D6: $76 $00
    sbc  d                                        ; $54D8: $9A
    rla                                           ; $54D9: $17
    sbc  h                                        ; $54DA: $9C
    rla                                           ; $54DB: $17
    sbc  d                                        ; $54DC: $9A
    rla                                           ; $54DD: $17
    sbc  h                                        ; $54DE: $9C
    rla                                           ; $54DF: $17
    sbc  d                                        ; $54E0: $9A
    rla                                           ; $54E1: $17
    sbc  h                                        ; $54E2: $9C
    rla                                           ; $54E3: $17
    sbc  d                                        ; $54E4: $9A
    rla                                           ; $54E5: $17
    sbc  h                                        ; $54E6: $9C
    rla                                           ; $54E7: $17
    sbc  d                                        ; $54E8: $9A
    inc  d                                        ; $54E9: $14
    sbc  h                                        ; $54EA: $9C
    inc  d                                        ; $54EB: $14
    sbc  d                                        ; $54EC: $9A
    inc  d                                        ; $54ED: $14
    sbc  h                                        ; $54EE: $9C
    inc  d                                        ; $54EF: $14
    sbc  d                                        ; $54F0: $9A
    rla                                           ; $54F1: $17
    sbc  h                                        ; $54F2: $9C
    rla                                           ; $54F3: $17
    sbc  d                                        ; $54F4: $9A
    inc  d                                        ; $54F5: $14
    sbc  h                                        ; $54F6: $9C
    inc  d                                        ; $54F7: $14
    sbc  d                                        ; $54F8: $9A
    rla                                           ; $54F9: $17
    sbc  h                                        ; $54FA: $9C
    rla                                           ; $54FB: $17
    sbc  d                                        ; $54FC: $9A
    ld   d, $9C                                   ; $54FD: $16 $9C
    ld   d, $9A                                   ; $54FF: $16 $9A
    rla                                           ; $5501: $17
    sbc  h                                        ; $5502: $9C
    rla                                           ; $5503: $17
    sbc  d                                        ; $5504: $9A
    ld   d, $9C                                   ; $5505: $16 $9C
    ld   d, $9A                                   ; $5507: $16 $9A
    rla                                           ; $5509: $17
    sbc  h                                        ; $550A: $9C
    rla                                           ; $550B: $17
    sbc  d                                        ; $550C: $9A
    rla                                           ; $550D: $17
    sbc  h                                        ; $550E: $9C
    rla                                           ; $550F: $17
    ld   a, [wIsIndoor]                           ; $5510: $FA $A5 $DB
    and  a                                        ; $5513: $A7
    jr   nz, jr_007_552E                          ; $5514: $20 $18

    ldh  a, [hMapRoom]                            ; $5516: $F0 $F6
    cp   $6B                                      ; $5518: $FE $6B
    jr   z, jr_007_5528                           ; $551A: $28 $0C

    cp   $7A                                      ; $551C: $FE $7A
    jr   z, jr_007_5528                           ; $551E: $28 $08

    cp   $8B                                      ; $5520: $FE $8B
    jr   z, jr_007_5528                           ; $5522: $28 $04

    cp   $7B                                      ; $5524: $FE $7B
    jr   nz, jr_007_552E                          ; $5526: $20 $06

jr_007_5528:
    ld   a, [$D87B]                               ; $5528: $FA $7B $D8
    and  $10                                      ; $552B: $E6 $10
    ret  z                                        ; $552D: $C8

jr_007_552E:
    ldh  a, [hRoomStatus]                         ; $552E: $F0 $F8
    and  $20                                      ; $5530: $E6 $20
    jp   nz, label_007_7EA4                       ; $5532: $C2 $A4 $7E

    ldh  a, [hIsGBC]                              ; $5535: $F0 $FE
    and  a                                        ; $5537: $A7
    jr   z, jr_007_555A                           ; $5538: $28 $20

    ldh  a, [hIsSideScrolling]                    ; $553A: $F0 $F9
    and  a                                        ; $553C: $A7
    jr   z, jr_007_5545                           ; $553D: $28 $06

    ldh  a, [wActiveEntityPosY]                   ; $553F: $F0 $EC
    add  $02                                      ; $5541: $C6 $02
    ldh  [wActiveEntityPosY], a                   ; $5543: $E0 $EC

jr_007_5545:
    push hl                                       ; $5545: $E5
    ld   de, $54D8                                ; $5546: $11 $D8 $54
    ld   a, [wTradeSequenceItem]                  ; $5549: $FA $0E $DB
    dec  a                                        ; $554C: $3D
    sla  a                                        ; $554D: $CB $27
    sla  a                                        ; $554F: $CB $27
    ld   l, a                                     ; $5551: $6F
    ld   h, $00                                   ; $5552: $26 $00
    add  hl, de                                   ; $5554: $19
    ld   e, l                                     ; $5555: $5D
    ld   d, h                                     ; $5556: $54
    pop  hl                                       ; $5557: $E1
    jr   jr_007_5572                              ; $5558: $18 $18

jr_007_555A:
    ld   de, $54D4                                ; $555A: $11 $D4 $54
    ld   a, [wTradeSequenceItem]                  ; $555D: $FA $0E $DB
    cp   $04                                      ; $5560: $FE $04
    jr   z, jr_007_5572                           ; $5562: $28 $0E

    ldh  a, [hIsSideScrolling]                    ; $5564: $F0 $F9
    and  a                                        ; $5566: $A7
    jr   z, jr_007_556F                           ; $5567: $28 $06

    ldh  a, [wActiveEntityPosY]                   ; $5569: $F0 $EC
    add  $02                                      ; $556B: $C6 $02
    ldh  [wActiveEntityPosY], a                   ; $556D: $E0 $EC

jr_007_556F:
    ld   de, $54D0                                ; $556F: $11 $D0 $54

jr_007_5572:
    call RenderAnimatedActiveEntity                               ; $5572: $CD $C0 $3B
    call GetEntityTransitionCountdown                 ; $5575: $CD $05 $0C
    jr   nz, jr_007_559A                          ; $5578: $20 $20

    call label_3B5A                               ; $557A: $CD $5A $3B
    jr   nc, jr_007_5599                          ; $557D: $30 $1A

    ld   a, $10                                   ; $557F: $3E $10
    ld   [wActiveMusicTrack], a                   ; $5581: $EA $68 $D3
    ld   [wC167], a                               ; $5584: $EA $67 $C1
    ldh  a, [hNextWorldMusicTrack]                               ; $5587: $F0 $BF
    ldh  [hMusicTrack], a                         ; $5589: $E0 $B0
    call GetEntityTransitionCountdown                 ; $558B: $CD $05 $0C
    ld   a, $68                                   ; $558E: $3E $68
    ld   [hl], a                                  ; $5590: $77
    ld   a, $66                                   ; $5591: $3E $66
    ld   [wC111], a                               ; $5593: $EA $11 $C1
    jp   ResetSpinAttack                                ; $5596: $C3 $AF $0C

jr_007_5599:
    ret                                           ; $5599: $C9

jr_007_559A:
    cp   $10                                      ; $559A: $FE $10
    jr   nz, jr_007_55BA                          ; $559C: $20 $1C

    dec  [hl]                                     ; $559E: $35
    ld   a, [wTradeSequenceItem]                  ; $559F: $FA $0E $DB
    ld   e, a                                     ; $55A2: $5F
    ld   d, b                                     ; $55A3: $50
    ld   hl, $54C1                                ; $55A4: $21 $C1 $54
    add  hl, de                                   ; $55A7: $19
    ld   a, [hl]                                  ; $55A8: $7E
    cp   $9D                                      ; $55A9: $FE $9D
    jr   z, jr_007_55B1                           ; $55AB: $28 $04

    cp   $44                                      ; $55AD: $FE $44
    jr   nz, jr_007_55B6                          ; $55AF: $20 $05

jr_007_55B1:
    call OpenDialog                               ; $55B1: $CD $85 $23
    jr   jr_007_55B9                              ; $55B4: $18 $03

jr_007_55B6:
    call OpenDialogInTable1                       ; $55B6: $CD $73 $23

jr_007_55B9:
    xor  a                                        ; $55B9: $AF

jr_007_55BA:
    dec  a                                        ; $55BA: $3D
    jr   nz, jr_007_55CD                          ; $55BB: $20 $10

    xor  a                                        ; $55BD: $AF
    ld   [$DB7F], a                               ; $55BE: $EA $7F $DB
    ld   [wC167], a                               ; $55C1: $EA $67 $C1
    call func_007_560D                            ; $55C4: $CD $0D $56
    or   $20                                      ; $55C7: $F6 $20
    ld   [hl], a                                  ; $55C9: $77
    jp   label_007_7EA4                           ; $55CA: $C3 $A4 $7E

jr_007_55CD:
    ldh  a, [hLinkPositionX]                      ; $55CD: $F0 $98
    ld   hl, wEntity0PosX                         ; $55CF: $21 $00 $C2
    add  hl, bc                                   ; $55D2: $09
    ld   [hl], a                                  ; $55D3: $77
    ldh  a, [hMapRoom]                            ; $55D4: $F0 $F6
    cp   $C9                                      ; $55D6: $FE $C9
    jr   nz, jr_007_55DF                          ; $55D8: $20 $05

    ld   a, $04                                   ; $55DA: $3E $04
    ld   [$C13B], a                               ; $55DC: $EA $3B $C1

jr_007_55DF:
    ld   hl, $C13B                                ; $55DF: $21 $3B $C1
    ldh  a, [hLinkPositionY]                      ; $55E2: $F0 $99
    add  [hl]                                     ; $55E4: $86
    ld   hl, wEntity0PosY                         ; $55E5: $21 $10 $C2
    add  hl, bc                                   ; $55E8: $09
    sub  $10                                      ; $55E9: $D6 $10
    ld   [hl], a                                  ; $55EB: $77
    ldh  a, [$FFA2]                               ; $55EC: $F0 $A2
    ld   hl, wEntitiesPosZTable                                ; $55EE: $21 $10 $C3
    add  hl, bc                                   ; $55F1: $09
    ld   [hl], a                                  ; $55F2: $77
    ld   a, $6C                                   ; $55F3: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $55F5: $E0 $9D
    ld   a, $02                                   ; $55F7: $3E $02
    ldh  [$FFA1], a                               ; $55F9: $E0 $A1
    ld   a, $03                                   ; $55FB: $3E $03
    ldh  [hLinkDirection], a                      ; $55FD: $E0 $9E
    xor  a                                        ; $55FF: $AF
    ld   [wSwordAnimationState], a                ; $5600: $EA $37 $C1
    ld   [wC16A], a                               ; $5603: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $5606: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $5609: $EA $21 $C1
    ret                                           ; $560C: $C9

func_007_560D:
    ld   hl, wOverworldRoomStatus                 ; $560D: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $5610: $F0 $F6
    ld   e, a                                     ; $5612: $5F
    ld   a, [wIsIndoor]                           ; $5613: $FA $A5 $DB
    ld   d, a                                     ; $5616: $57
    ldh  a, [hMapId]                              ; $5617: $F0 $F7
    cp   $1A                                      ; $5619: $FE $1A
    jr   nc, jr_007_5622                          ; $561B: $30 $05

    cp   $06                                      ; $561D: $FE $06
    jr   c, jr_007_5622                           ; $561F: $38 $01

    inc  d                                        ; $5621: $14

jr_007_5622:
    add  hl, de                                   ; $5622: $19
    ld   a, [hl]                                  ; $5623: $7E
    ret                                           ; $5624: $C9

    ld   [$00F8], sp                              ; $5625: $08 $F8 $00
    nop                                           ; $5628: $00
    nop                                           ; $5629: $00
    nop                                           ; $562A: $00
    ld   hl, sp+$08                               ; $562B: $F8 $08
    ld   d, b                                     ; $562D: $50
    ld   [bc], a                                  ; $562E: $02
    ld   d, b                                     ; $562F: $50
    ld   [hl+], a                                 ; $5630: $22
    ld   d, d                                     ; $5631: $52
    ld   [bc], a                                  ; $5632: $02
    ld   d, d                                     ; $5633: $52
    ld   [hl+], a                                 ; $5634: $22
    ld   d, b                                     ; $5635: $50
    ld   b, d                                     ; $5636: $42
    ld   d, b                                     ; $5637: $50
    ld   h, d                                     ; $5638: $62
    ld   d, d                                     ; $5639: $52
    ld   b, d                                     ; $563A: $42
    ld   d, d                                     ; $563B: $52
    ld   h, d                                     ; $563C: $62
    ld   d, h                                     ; $563D: $54
    ld   [bc], a                                  ; $563E: $02
    ld   d, [hl]                                  ; $563F: $56
    ld   [bc], a                                  ; $5640: $02
    ld   e, b                                     ; $5641: $58
    ld   [bc], a                                  ; $5642: $02
    ld   e, d                                     ; $5643: $5A
    ld   [bc], a                                  ; $5644: $02
    ld   d, [hl]                                  ; $5645: $56
    ld   [hl+], a                                 ; $5646: $22
    ld   d, h                                     ; $5647: $54
    ld   [hl+], a                                 ; $5648: $22
    ld   e, d                                     ; $5649: $5A
    ld   [hl+], a                                 ; $564A: $22
    ld   e, b                                     ; $564B: $58
    ld   [hl+], a                                 ; $564C: $22
    ld   de, $562D                                ; $564D: $11 $2D $56
    call RenderAnimatedActiveEntity                               ; $5650: $CD $C0 $3B
    call $5805                                    ; $5653: $CD $05 $58
    call func_007_7D96                            ; $5656: $CD $96 $7D
    ld   hl, $C410                                ; $5659: $21 $10 $C4
    add  hl, bc                                   ; $565C: $09
    ld   a, [hl]                                  ; $565D: $7E
    and  a                                        ; $565E: $A7
    jr   z, jr_007_566F                           ; $565F: $28 $0E

    ld   hl, wEntitiesWalkingTable                ; $5661: $21 $90 $C2
    add  hl, bc                                   ; $5664: $09
    ld   a, $01                                   ; $5665: $3E $01
    ld   [hl], a                                  ; $5667: $77
    ldh  [hActiveEntityWalking], a                ; $5668: $E0 $F0
    call GetEntityTransitionCountdown                 ; $566A: $CD $05 $0C
    ld   [hl], $40                                ; $566D: $36 $40

jr_007_566F:
    call func_007_7DC3                            ; $566F: $CD $C3 $7D
    call func_007_7E0A                            ; $5672: $CD $0A $7E
    call func_007_7E43                            ; $5675: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $5678: $21 $20 $C3
    add  hl, bc                                   ; $567B: $09
    dec  [hl]                                     ; $567C: $35
    ld   hl, wEntitiesPosZTable                                ; $567D: $21 $10 $C3
    add  hl, bc                                   ; $5680: $09
    ld   a, [hl]                                  ; $5681: $7E
    and  $80                                      ; $5682: $E6 $80
    ldh  [hFFE8], a                               ; $5684: $E0 $E8
    jr   z, jr_007_5693                           ; $5686: $28 $0B

    ld   [hl], b                                  ; $5688: $70
    ld   hl, wEntitiesSpeedZTable                                ; $5689: $21 $20 $C3
    add  hl, bc                                   ; $568C: $09
    ld   [hl], b                                  ; $568D: $70
    ld   hl, wEntitiesUnknownTableC               ; $568E: $21 $C0 $C2
    add  hl, bc                                   ; $5691: $09
    ld   [hl], b                                  ; $5692: $70

jr_007_5693:
    call label_3B23                               ; $5693: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                ; $5696: $F0 $F0
    cp   $02                                      ; $5698: $FE $02
    jp   z, label_007_577A                        ; $569A: $CA $7A $57

    and  a                                        ; $569D: $A7
    jr   z, jr_007_56FF                           ; $569E: $28 $5F

    call GetEntityTransitionCountdown                 ; $56A0: $CD $05 $0C
    jr   z, jr_007_56BD                           ; $56A3: $28 $18

    cp   $0A                                      ; $56A5: $FE $0A
    jr   nz, jr_007_56B7                          ; $56A7: $20 $0E

    call func_007_7E7D                            ; $56A9: $CD $7D $7E
    ld   hl, $C380                                ; $56AC: $21 $80 $C3
    add  hl, bc                                   ; $56AF: $09
    ld   a, e                                     ; $56B0: $7B
    cp   [hl]                                     ; $56B1: $BE
    jr   nz, jr_007_56B7                          ; $56B2: $20 $03

    call func_007_57B0                            ; $56B4: $CD $B0 $57

jr_007_56B7:
    call label_3D7F                               ; $56B7: $CD $7F $3D
    jp   label_007_5721                           ; $56BA: $C3 $21 $57

jr_007_56BD:
    call GetRandomByte                            ; $56BD: $CD $0D $28
    and  $1F                                      ; $56C0: $E6 $1F
    or   $20                                      ; $56C2: $F6 $20
    ld   [hl], a                                  ; $56C4: $77
    ld   hl, wEntitiesWalkingTable                ; $56C5: $21 $90 $C2
    add  hl, bc                                   ; $56C8: $09
    ld   [hl], $00                                ; $56C9: $36 $00
    ld   hl, wEntitiesUnknownTableB               ; $56CB: $21 $B0 $C2
    add  hl, bc                                   ; $56CE: $09
    ld   a, [hl]                                  ; $56CF: $7E
    inc  a                                        ; $56D0: $3C
    and  $03                                      ; $56D1: $E6 $03
    ld   [hl], a                                  ; $56D3: $77
    cp   $00                                      ; $56D4: $FE $00
    jr   nz, jr_007_56DD                          ; $56D6: $20 $05

    call func_007_7E7D                            ; $56D8: $CD $7D $7E
    jr   jr_007_56E0                              ; $56DB: $18 $03

jr_007_56DD:
    call GetRandomByte                            ; $56DD: $CD $0D $28

jr_007_56E0:
    and  $03                                      ; $56E0: $E6 $03
    ld   hl, $C380                                ; $56E2: $21 $80 $C3
    add  hl, bc                                   ; $56E5: $09
    ld   [hl], a                                  ; $56E6: $77
    ld   e, a                                     ; $56E7: $5F
    ld   d, b                                     ; $56E8: $50
    ld   hl, $5625                                ; $56E9: $21 $25 $56
    add  hl, de                                   ; $56EC: $19
    ld   a, [hl]                                  ; $56ED: $7E
    ld   hl, wEntity0SpeedX                       ; $56EE: $21 $40 $C2
    add  hl, bc                                   ; $56F1: $09
    ld   [hl], a                                  ; $56F2: $77
    ld   hl, $5629                                ; $56F3: $21 $29 $56
    add  hl, de                                   ; $56F6: $19
    ld   a, [hl]                                  ; $56F7: $7E
    call func_007_4005                            ; $56F8: $CD $05 $40
    ld   [hl], a                                  ; $56FB: $77
    jp   label_007_5721                           ; $56FC: $C3 $21 $57

jr_007_56FF:
    ld   hl, wEntitiesCollisionsTable             ; $56FF: $21 $A0 $C2
    add  hl, bc                                   ; $5702: $09
    ld   a, [hl]                                  ; $5703: $7E
    and  $0F                                      ; $5704: $E6 $0F
    jr   nz, jr_007_570D                          ; $5706: $20 $05

    call GetEntityTransitionCountdown                 ; $5708: $CD $05 $0C
    jr   nz, jr_007_571E                          ; $570B: $20 $11

jr_007_570D:
    call GetRandomByte                            ; $570D: $CD $0D $28
    and  $0F                                      ; $5710: $E6 $0F
    or   $10                                      ; $5712: $F6 $10
    ld   [hl], a                                  ; $5714: $77
    ld   hl, wEntitiesWalkingTable                ; $5715: $21 $90 $C2
    add  hl, bc                                   ; $5718: $09
    ld   [hl], $01                                ; $5719: $36 $01
    call label_3D7F                               ; $571B: $CD $7F $3D

jr_007_571E:
    call func_007_7D1A                            ; $571E: $CD $1A $7D

label_007_5721:
    ld   hl, $C300                                ; $5721: $21 $00 $C3
    add  hl, bc                                   ; $5724: $09
    ld   a, [hl]                                  ; $5725: $7E
    and  a                                        ; $5726: $A7
    jr   nz, jr_007_5777                          ; $5727: $20 $4E

    call func_007_7E5D                            ; $5729: $CD $5D $7E
    add  $20                                      ; $572C: $C6 $20
    cp   $40                                      ; $572E: $FE $40
    jr   nc, jr_007_5777                          ; $5730: $30 $45

    call func_007_7E6D                            ; $5732: $CD $6D $7E
    add  $20                                      ; $5735: $C6 $20
    cp   $40                                      ; $5737: $FE $40
    jr   nc, jr_007_5777                          ; $5739: $30 $3C

    ld   a, [wAButtonSlot]                        ; $573B: $FA $00 $DB
    cp   $01                                      ; $573E: $FE $01
    jr   nz, jr_007_574A                          ; $5740: $20 $08

    ldh  a, [hJoypadState]                               ; $5742: $F0 $CC
    and  $20                                      ; $5744: $E6 $20
    jr   nz, jr_007_5757                          ; $5746: $20 $0F

    jr   jr_007_5777                              ; $5748: $18 $2D

jr_007_574A:
    ld   a, [wBButtonSlot]                        ; $574A: $FA $01 $DB
    cp   $01                                      ; $574D: $FE $01
    jr   nz, jr_007_5777                          ; $574F: $20 $26

    ldh  a, [hJoypadState]                               ; $5751: $F0 $CC
    and  $10                                      ; $5753: $E6 $10
    jr   z, jr_007_5777                           ; $5755: $28 $20

jr_007_5757:
    call func_007_7E7D                            ; $5757: $CD $7D $7E
    ld   hl, $C380                                ; $575A: $21 $80 $C3
    add  hl, bc                                   ; $575D: $09
    ld   a, [hl]                                  ; $575E: $7E
    xor  $01                                      ; $575F: $EE $01
    cp   e                                        ; $5761: $BB
    jr   z, jr_007_5777                           ; $5762: $28 $13

    ld   hl, wEntitiesSpeedZTable                                ; $5764: $21 $20 $C3
    add  hl, bc                                   ; $5767: $09
    ld   [hl], $18                                ; $5768: $36 $18
    ld   a, $10                                   ; $576A: $3E $10
    call label_3BAA                               ; $576C: $CD $AA $3B
    call IncrementEntityWalkingAttr               ; $576F: $CD $12 $3B
    ld   [hl], $02                                ; $5772: $36 $02
    jp   label_007_733F                           ; $5774: $C3 $3F $73

jr_007_5777:
    jp   label_3B39                               ; $5777: $C3 $39 $3B

label_007_577A:
    ldh  a, [hFrameCounter]                       ; $577A: $F0 $E7
    rra                                           ; $577C: $1F
    rra                                           ; $577D: $1F
    and  $01                                      ; $577E: $E6 $01
    ld   hl, wEntitiesUnknownTableC               ; $5780: $21 $C0 $C2
    add  hl, bc                                   ; $5783: $09
    ld   [hl], a                                  ; $5784: $77
    call func_007_7E7D                            ; $5785: $CD $7D $7E
    ld   hl, $C380                                ; $5788: $21 $80 $C3
    add  hl, bc                                   ; $578B: $09
    ld   [hl], e                                  ; $578C: $73
    call func_007_7D1A                            ; $578D: $CD $1A $7D
    ldh  a, [hFFE8]                               ; $5790: $F0 $E8
    and  a                                        ; $5792: $A7
    jr   z, jr_007_579F                           ; $5793: $28 $0A

    call IncrementEntityWalkingAttr               ; $5795: $CD $12 $3B
    ld   [hl], $01                                ; $5798: $36 $01
    call GetEntityTransitionCountdown                 ; $579A: $CD $05 $0C
    ld   [hl], $20                                ; $579D: $36 $20

jr_007_579F:
    ret                                           ; $579F: $C9

    ld   [$00F8], sp                              ; $57A0: $08 $F8 $00
    nop                                           ; $57A3: $00
    nop                                           ; $57A4: $00
    nop                                           ; $57A5: $00
    ld   hl, sp+$08                               ; $57A6: $F8 $08
    jr   nz, @-$1E                                ; $57A8: $20 $E0

    nop                                           ; $57AA: $00
    nop                                           ; $57AB: $00
    nop                                           ; $57AC: $00
    nop                                           ; $57AD: $00
    ldh  [rNR41], a                               ; $57AE: $E0 $20

func_007_57B0:
    ld   a, $0A                                   ; $57B0: $3E $0A
    call label_3B86                               ; $57B2: $CD $86 $3B
    jr   c, jr_007_57F4                           ; $57B5: $38 $3D

    push bc                                       ; $57B7: $C5
    ld   hl, wEntitiesUnknownTableG               ; $57B8: $21 $B0 $C3
    add  hl, de                                   ; $57BB: $19
    ld   [hl], $01                                ; $57BC: $36 $01
    ldh  a, [hScratchC]                           ; $57BE: $F0 $D9
    ld   hl, $C380                                ; $57C0: $21 $80 $C3
    add  hl, de                                   ; $57C3: $19
    ld   [hl], a                                  ; $57C4: $77
    ld   c, a                                     ; $57C5: $4F
    ld   hl, $57A0                                ; $57C6: $21 $A0 $57
    add  hl, bc                                   ; $57C9: $09
    ldh  a, [hScratchA]                           ; $57CA: $F0 $D7
    add  [hl]                                     ; $57CC: $86
    ld   hl, wEntity0PosX                         ; $57CD: $21 $00 $C2
    add  hl, de                                   ; $57D0: $19
    ld   [hl], a                                  ; $57D1: $77
    ld   hl, $57A4                                ; $57D2: $21 $A4 $57
    add  hl, bc                                   ; $57D5: $09
    ldh  a, [hScratchB]                           ; $57D6: $F0 $D8
    add  [hl]                                     ; $57D8: $86
    ld   hl, wEntity0PosY                         ; $57D9: $21 $10 $C2
    add  hl, de                                   ; $57DC: $19
    ld   [hl], a                                  ; $57DD: $77
    ld   hl, $57A8                                ; $57DE: $21 $A8 $57
    add  hl, bc                                   ; $57E1: $09
    ld   a, [hl]                                  ; $57E2: $7E
    ld   hl, wEntity0SpeedX                       ; $57E3: $21 $40 $C2
    add  hl, de                                   ; $57E6: $19
    ld   [hl], a                                  ; $57E7: $77
    ld   hl, $57AC                                ; $57E8: $21 $AC $57
    add  hl, bc                                   ; $57EB: $09
    ld   a, [hl]                                  ; $57EC: $7E
    ld   hl, wEntity0SpeedY                       ; $57ED: $21 $50 $C2
    add  hl, de                                   ; $57F0: $19
    ld   [hl], a                                  ; $57F1: $77
    pop  bc                                       ; $57F2: $C1
    and  a                                        ; $57F3: $A7

jr_007_57F4:
    ret                                           ; $57F4: $C9

    nop                                           ; $57F5: $00
    db   $FC                                      ; $57F6: $FC
    ld   [hl+], a                                 ; $57F7: $22
    ld   b, b                                     ; $57F8: $40
    nop                                           ; $57F9: $00
    inc  c                                        ; $57FA: $0C
    ld   [hl+], a                                 ; $57FB: $22
    ld   h, b                                     ; $57FC: $60
    nop                                           ; $57FD: $00
    db   $FC                                      ; $57FE: $FC
    ld   [hl+], a                                 ; $57FF: $22
    nop                                           ; $5800: $00
    nop                                           ; $5801: $00
    inc  c                                        ; $5802: $0C
    ld   [hl+], a                                 ; $5803: $22
    jr   nz, jr_007_5827                          ; $5804: $20 $21

    ret  nz                                       ; $5806: $C0

    jp   nz, label_007_7E09                       ; $5807: $C2 $09 $7E

    rla                                           ; $580A: $17
    rla                                           ; $580B: $17
    rla                                           ; $580C: $17
    and  $F8                                      ; $580D: $E6 $F8
    ld   e, a                                     ; $580F: $5F
    ld   d, b                                     ; $5810: $50
    ld   hl, $57F5                                ; $5811: $21 $F5 $57
    add  hl, de                                   ; $5814: $19
    ld   c, $02                                   ; $5815: $0E $02
    jp   label_3CE6                               ; $5817: $C3 $E6 $3C

    ld   a, b                                     ; $581A: $78
    ld   [bc], a                                  ; $581B: $02
    ld   [hl], d                                  ; $581C: $72
    ld   [bc], a                                  ; $581D: $02
    ld   a, d                                     ; $581E: $7A
    ld   [bc], a                                  ; $581F: $02
    ld   [hl], d                                  ; $5820: $72
    ld   [bc], a                                  ; $5821: $02
    ld   [hl], b                                  ; $5822: $70
    ld   [bc], a                                  ; $5823: $02
    ld   [hl], d                                  ; $5824: $72
    ld   [bc], a                                  ; $5825: $02
    ld   a, h                                     ; $5826: $7C

jr_007_5827:
    ld   [bc], a                                  ; $5827: $02
    ld   a, [hl]                                  ; $5828: $7E
    ld   [bc], a                                  ; $5829: $02
    ld   [hl], h                                  ; $582A: $74
    ld   [bc], a                                  ; $582B: $02
    db   $76                                      ; $582C: $76
    ld   [bc], a                                  ; $582D: $02
    ld   [hl], d                                  ; $582E: $72
    ld   [hl+], a                                 ; $582F: $22
    ld   a, b                                     ; $5830: $78
    ld   [hl+], a                                 ; $5831: $22
    ld   [hl], d                                  ; $5832: $72
    ld   [hl+], a                                 ; $5833: $22
    ld   a, d                                     ; $5834: $7A
    ld   [hl+], a                                 ; $5835: $22
    ld   [hl], d                                  ; $5836: $72
    ld   [hl+], a                                 ; $5837: $22
    ld   [hl], b                                  ; $5838: $70
    ld   [hl+], a                                 ; $5839: $22
    ld   a, [hl]                                  ; $583A: $7E
    ld   [hl+], a                                 ; $583B: $22
    ld   a, h                                     ; $583C: $7C
    ld   [hl+], a                                 ; $583D: $22
    db   $76                                      ; $583E: $76
    ld   [hl+], a                                 ; $583F: $22
    ld   [hl], h                                  ; $5840: $74
    ld   [hl+], a                                 ; $5841: $22
    ldh  a, [hRoomStatus]                         ; $5842: $F0 $F8
    and  $10                                      ; $5844: $E6 $10
    jp   nz, label_007_7EA4                       ; $5846: $C2 $A4 $7E

    ld   de, $581A                                ; $5849: $11 $1A $58
    ld   hl, $C380                                ; $584C: $21 $80 $C3
    add  hl, bc                                   ; $584F: $09
    ld   a, [hl]                                  ; $5850: $7E
    and  a                                        ; $5851: $A7
    jr   nz, jr_007_5857                          ; $5852: $20 $03

    ld   de, $582E                                ; $5854: $11 $2E $58

jr_007_5857:
    call RenderAnimatedActiveEntity                               ; $5857: $CD $C0 $3B
    ld   hl, $C480                                ; $585A: $21 $80 $C4
    add  hl, bc                                   ; $585D: $09
    ld   a, [hl]                                  ; $585E: $7E
    and  a                                        ; $585F: $A7
    jr   z, jr_007_5874                           ; $5860: $28 $12

    xor  a                                        ; $5862: $AF
    ldh  [hActiveEntityUnknownG], a               ; $5863: $E0 $F1
    ldh  a, [wActiveEntityPosY]                   ; $5865: $F0 $EC
    sub  $0E                                      ; $5867: $D6 $0E
    ldh  [wActiveEntityPosY], a                   ; $5869: $E0 $EC
    ld   de, $594D                                ; $586B: $11 $4D $59
    call RenderAnimatedActiveEntity                               ; $586E: $CD $C0 $3B
    call label_3D8A                               ; $5871: $CD $8A $3D

jr_007_5874:
    call func_007_7D96                            ; $5874: $CD $96 $7D
    call func_007_7E43                            ; $5877: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $587A: $21 $20 $C3
    add  hl, bc                                   ; $587D: $09
    dec  [hl]                                     ; $587E: $35
    dec  [hl]                                     ; $587F: $35
    ld   hl, wEntitiesPosZTable                                ; $5880: $21 $10 $C3
    add  hl, bc                                   ; $5883: $09
    ld   a, [hl]                                  ; $5884: $7E
    and  $80                                      ; $5885: $E6 $80
    ldh  [hFFE8], a                               ; $5887: $E0 $E8
    jr   z, jr_007_5891                           ; $5889: $28 $06

    ld   [hl], b                                  ; $588B: $70
    ld   hl, wEntitiesSpeedZTable                                ; $588C: $21 $20 $C3
    add  hl, bc                                   ; $588F: $09
    ld   [hl], b                                  ; $5890: $70

jr_007_5891:
    ldh  a, [hActiveEntityWalking]                ; $5891: $F0 $F0
    rst  $00                                      ; $5893: $C7
    xor  b                                        ; $5894: $A8
    ld   e, b                                     ; $5895: $58
    ld   a, [de]                                  ; $5896: $1A
    ld   e, c                                     ; $5897: $59
    inc  [hl]                                     ; $5898: $34
    ld   e, c                                     ; $5899: $59
    ld   d, c                                     ; $589A: $51
    ld   e, c                                     ; $589B: $59
    sub  a                                        ; $589C: $97
    ld   e, c                                     ; $589D: $59
    xor  h                                        ; $589E: $AC
    ld   e, d                                     ; $589F: $5A
    dec  h                                        ; $58A0: $25
    ld   e, e                                     ; $58A1: $5B
    ld   l, c                                     ; $58A2: $69
    ld   e, e                                     ; $58A3: $5B
    reti                                          ; $58A4: $D9

    ld   e, e                                     ; $58A5: $5B
    ldh  a, [$FF5B]                               ; $58A6: $F0 $5B
    ld   a, [wIsBowWowFollowingLink]              ; $58A8: $FA $56 $DB
    cp   $01                                      ; $58AB: $FE $01
    jr   nz, jr_007_58DE                          ; $58AD: $20 $2F

    ld   hl, $C420                                ; $58AF: $21 $20 $C4
    add  hl, bc                                   ; $58B2: $09
    ld   a, [hl]                                  ; $58B3: $7E
    and  a                                        ; $58B4: $A7
    jr   nz, jr_007_58C9                          ; $58B5: $20 $12

    call func_007_7E5D                            ; $58B7: $CD $5D $7E
    add  $18                                      ; $58BA: $C6 $18
    cp   $30                                      ; $58BC: $FE $30
    jr   nc, jr_007_58DD                          ; $58BE: $30 $1D

    call func_007_7E6D                            ; $58C0: $CD $6D $7E
    add  $18                                      ; $58C3: $C6 $18
    cp   $30                                      ; $58C5: $FE $30
    jr   nc, jr_007_58DD                          ; $58C7: $30 $14

jr_007_58C9:
    call GetEntityTransitionCountdown                 ; $58C9: $CD $05 $0C
    ld   [hl], $10                                ; $58CC: $36 $10
    call IncrementEntityWalkingAttr               ; $58CE: $CD $12 $3B
    ld   [hl], $05                                ; $58D1: $36 $05
    ld   a, $60                                   ; $58D3: $3E $60

func_007_58D5:
label_007_58D5:
    call OpenDialogInTable1                       ; $58D5: $CD $73 $23
    ld   a, $14                                   ; $58D8: $3E $14
    ld   [wDialogSFX], a                          ; $58DA: $EA $AB $C5

jr_007_58DD:
    ret                                           ; $58DD: $C9

jr_007_58DE:
    call func_007_7CF0                            ; $58DE: $CD $F0 $7C
    call func_007_7D43                            ; $58E1: $CD $43 $7D
    jr   nc, jr_007_58FA                          ; $58E4: $30 $14

    ld   a, [wTradeSequenceItem]                  ; $58E6: $FA $0E $DB
    cp   $04                                      ; $58E9: $FE $04
    jr   nz, jr_007_58F5                          ; $58EB: $20 $08

    ld   a, $65                                   ; $58ED: $3E $65
    call func_007_58D5                            ; $58EF: $CD $D5 $58
    jp   IncrementEntityWalkingAttr               ; $58F2: $C3 $12 $3B

jr_007_58F5:
    ld   a, $61                                   ; $58F5: $3E $61
    call func_007_58D5                            ; $58F7: $CD $D5 $58

func_007_58FA:
jr_007_58FA:
    ldh  a, [hFrameCounter]                       ; $58FA: $F0 $E7
    rra                                           ; $58FC: $1F
    rra                                           ; $58FD: $1F
    rra                                           ; $58FE: $1F
    and  $01                                      ; $58FF: $E6 $01
    call label_3B0C                               ; $5901: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5904: $F0 $E7
    and  $1F                                      ; $5906: $E6 $1F
    jr   nz, jr_007_5919                          ; $5908: $20 $0F

    call GetRandomByte                            ; $590A: $CD $0D $28
    and  $01                                      ; $590D: $E6 $01
    jr   nz, jr_007_5919                          ; $590F: $20 $08

    ld   hl, $C380                                ; $5911: $21 $80 $C3
    add  hl, bc                                   ; $5914: $09
    ld   a, [hl]                                  ; $5915: $7E
    xor  $01                                      ; $5916: $EE $01
    ld   [hl], a                                  ; $5918: $77

jr_007_5919:
    ret                                           ; $5919: $C9

    ld   a, [wDialogState]                        ; $591A: $FA $9F $C1
    and  a                                        ; $591D: $A7
    ret  nz                                       ; $591E: $C0

    call IncrementEntityWalkingAttr               ; $591F: $CD $12 $3B
    ld   a, [wC177]                               ; $5922: $FA $77 $C1
    and  a                                        ; $5925: $A7
    jr   nz, jr_007_592E                          ; $5926: $20 $06

    call GetEntityTransitionCountdown                 ; $5928: $CD $05 $0C
    ld   [hl], $10                                ; $592B: $36 $10
    ret                                           ; $592D: $C9

jr_007_592E:
    ld   [hl], b                                  ; $592E: $70
    ld   a, $61                                   ; $592F: $3E $61
    jp   label_007_58D5                           ; $5931: $C3 $D5 $58

    call GetEntityTransitionCountdown                 ; $5934: $CD $05 $0C
    jr   nz, jr_007_5948                          ; $5937: $20 $0F

    ld   [hl], $80                                ; $5939: $36 $80
    ld   hl, $C480                                ; $593B: $21 $80 $C4
    add  hl, bc                                   ; $593E: $09
    ld   [hl], $80                                ; $593F: $36 $80
    ld   a, $01                                   ; $5941: $3E $01
    ldh  [hJingle], a                             ; $5943: $E0 $F2
    call IncrementEntityWalkingAttr               ; $5945: $CD $12 $3B

jr_007_5948:
    ld   a, $02                                   ; $5948: $3E $02
    ldh  [$FFA1], a                               ; $594A: $E0 $A1
    ret                                           ; $594C: $C9

    sbc  d                                        ; $594D: $9A
    rla                                           ; $594E: $17
    sbc  h                                        ; $594F: $9C
    rla                                           ; $5950: $17
    ld   a, $03                                   ; $5951: $3E $03
    call label_3B0C                               ; $5953: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $5956: $CD $05 $0C
    jr   nz, jr_007_596A                          ; $5959: $20 $0F

    ld   a, $36                                   ; $595B: $3E $36
    ld   [wActiveMusicTrack], a                   ; $595D: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $5960: $E0 $B0
    call label_BFB                                ; $5962: $CD $FB $0B
    ld   [hl], $80                                ; $5965: $36 $80
    jp   IncrementEntityWalkingAttr               ; $5967: $C3 $12 $3B

jr_007_596A:
    cp   $10                                      ; $596A: $FE $10
    jr   nz, jr_007_5973                          ; $596C: $20 $05

    ld   a, $62                                   ; $596E: $3E $62
    call func_007_58D5                            ; $5970: $CD $D5 $58

jr_007_5973:
    ld   a, $02                                   ; $5973: $3E $02
    ldh  [$FFA1], a                               ; $5975: $E0 $A1
    ret                                           ; $5977: $C9

    ld   c, b                                     ; $5978: $48
    ld   c, b                                     ; $5979: $48
    ld   c, b                                     ; $597A: $48
    ld   c, b                                     ; $597B: $48
    ld   c, b                                     ; $597C: $48
    ld   c, b                                     ; $597D: $48
    ld   c, b                                     ; $597E: $48
    jr   jr_007_59A1                              ; $597F: $18 $20

    jr   z, @+$32                                 ; $5981: $28 $30

    jr   c, jr_007_59C5                           ; $5983: $38 $40

    ld   c, b                                     ; $5985: $48
    nop                                           ; $5986: $00
    ld   a, b                                     ; $5987: $78
    jr   z, jr_007_59E2                           ; $5988: $28 $58

    ld   b, b                                     ; $598A: $40
    jr   nc, @+$62                                ; $598B: $30 $60

    nop                                           ; $598D: $00
    nop                                           ; $598E: $00
    add  b                                        ; $598F: $80
    add  b                                        ; $5990: $80
    nop                                           ; $5991: $00
    add  b                                        ; $5992: $80
    nop                                           ; $5993: $00
    db   $10                                      ; $5994: $10
    jr   nc, @+$22                                ; $5995: $30 $20

    ld   a, $02                                   ; $5997: $3E $02
    ldh  [$FFA1], a                               ; $5999: $E0 $A1
    call func_007_58FA                            ; $599B: $CD $FA $58
    call label_BFB                                ; $599E: $CD $FB $0B

jr_007_59A1:
    jr   nz, jr_007_59C8                          ; $59A1: $20 $25

    ld   a, $02                                   ; $59A3: $3E $02
    ldh  [hJingle], a                             ; $59A5: $E0 $F2
    ld   a, [$D87B]                               ; $59A7: $FA $7B $D8
    or   $10                                      ; $59AA: $F6 $10
    ld   [$D87B], a                               ; $59AC: $EA $7B $D8
    ld   a, $01                                   ; $59AF: $3E $01
    ld   [$DB7F], a                               ; $59B1: $EA $7F $DB
    ld   a, $63                                   ; $59B4: $3E $63
    ld   [wC168], a                               ; $59B6: $EA $68 $C1
    call func_007_58D5                            ; $59B9: $CD $D5 $58
    call IncrementEntityWalkingAttr               ; $59BC: $CD $12 $3B
    ld   [hl], $05                                ; $59BF: $36 $05
    ld   hl, $C3D0                                ; $59C1: $21 $D0 $C3
    add  hl, bc                                   ; $59C4: $09

jr_007_59C5:
    ld   [hl], $06                                ; $59C5: $36 $06
    ret                                           ; $59C7: $C9

jr_007_59C8:
    cp   $01                                      ; $59C8: $FE $01
    jr   nz, jr_007_59D5                          ; $59CA: $20 $09

    ld   a, $05                                   ; $59CC: $3E $05
    ld   [wTradeSequenceItem], a                  ; $59CE: $EA $0E $DB
    ld   a, $0D                                   ; $59D1: $3E $0D
    ldh  [hFFA5], a                               ; $59D3: $E0 $A5

jr_007_59D5:
    ldh  a, [hFrameCounter]                       ; $59D5: $F0 $E7
    and  $1F                                      ; $59D7: $E6 $1F
    jr   nz, jr_007_5A2A                          ; $59D9: $20 $4F

    ld   hl, wEntitiesUnknownTableD               ; $59DB: $21 $D0 $C2
    add  hl, bc                                   ; $59DE: $09
    ld   a, [hl]                                  ; $59DF: $7E
    cp   $07                                      ; $59E0: $FE $07

jr_007_59E2:
    jr   z, jr_007_5A2A                           ; $59E2: $28 $46

    ld   a, $AD                                   ; $59E4: $3E $AD
    call label_3B86                               ; $59E6: $CD $86 $3B
    jr   c, jr_007_5A2A                           ; $59E9: $38 $3F

    push bc                                       ; $59EB: $C5
    call func_007_733F                            ; $59EC: $CD $3F $73
    ld   hl, wEntitiesUnknownTableD               ; $59EF: $21 $D0 $C2
    add  hl, bc                                   ; $59F2: $09
    ld   c, [hl]                                  ; $59F3: $4E
    inc  [hl]                                     ; $59F4: $34
    ld   hl, $5978                                ; $59F5: $21 $78 $59
    add  hl, bc                                   ; $59F8: $09
    ld   a, [hl]                                  ; $59F9: $7E
    ld   hl, wEntitiesUnknownTableB               ; $59FA: $21 $B0 $C2
    add  hl, de                                   ; $59FD: $19
    ld   [hl], a                                  ; $59FE: $77
    ld   hl, $597F                                ; $59FF: $21 $7F $59
    add  hl, bc                                   ; $5A02: $09
    ld   a, [hl]                                  ; $5A03: $7E
    ld   hl, wEntitiesUnknownTableC               ; $5A04: $21 $C0 $C2
    add  hl, de                                   ; $5A07: $19
    ld   [hl], a                                  ; $5A08: $77
    ld   hl, $5986                                ; $5A09: $21 $86 $59
    add  hl, bc                                   ; $5A0C: $09
    ld   a, [hl]                                  ; $5A0D: $7E
    ld   hl, wEntity0PosX                         ; $5A0E: $21 $00 $C2
    add  hl, de                                   ; $5A11: $19
    ld   [hl], a                                  ; $5A12: $77
    ld   hl, $598D                                ; $5A13: $21 $8D $59
    add  hl, bc                                   ; $5A16: $09
    ld   a, [hl]                                  ; $5A17: $7E
    ld   hl, wEntity0PosY                         ; $5A18: $21 $10 $C2
    add  hl, de                                   ; $5A1B: $19
    ld   [hl], a                                  ; $5A1C: $77
    ld   hl, wEntitiesWalkingTable                ; $5A1D: $21 $90 $C2
    add  hl, de                                   ; $5A20: $19
    ld   [hl], $07                                ; $5A21: $36 $07
    ld   hl, $C300                                ; $5A23: $21 $00 $C3
    add  hl, de                                   ; $5A26: $19
    ld   [hl], $80                                ; $5A27: $36 $80
    pop  bc                                       ; $5A29: $C1

jr_007_5A2A:
    call label_BFB                                ; $5A2A: $CD $FB $0B
    cp   $40                                      ; $5A2D: $FE $40
    ret  nc                                       ; $5A2F: $D0

    ldh  a, [hFrameCounter]                       ; $5A30: $F0 $E7
    and  $3F                                      ; $5A32: $E6 $3F
    ret  nz                                       ; $5A34: $C0

    ld   hl, $C440                                ; $5A35: $21 $40 $C4
    add  hl, bc                                   ; $5A38: $09
    ld   a, [hl]                                  ; $5A39: $7E
    cp   $03                                      ; $5A3A: $FE $03
    ret  nc                                       ; $5A3C: $D0

    ld   e, a                                     ; $5A3D: $5F
    ld   d, b                                     ; $5A3E: $50
    inc  [hl]                                     ; $5A3F: $34
    ld   hl, $5994                                ; $5A40: $21 $94 $59
    add  hl, de                                   ; $5A43: $19
    ld   a, [hl]                                  ; $5A44: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $5A45: $E0 $CD
    ld   a, $40                                   ; $5A47: $3E $40
    ldh  [hSwordIntersectedAreaX], a              ; $5A49: $E0 $CE
    call label_2887                               ; $5A4B: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5A4E: $F0 $FE
    and  a                                        ; $5A50: $A7
    jr   z, jr_007_5A5F                           ; $5A51: $28 $0C

    push bc                                       ; $5A53: $C5
    ld   a, $DB                                   ; $5A54: $3E $DB
    ld   [$DDD8], a                               ; $5A56: $EA $D8 $DD
    ld   a, $07                                   ; $5A59: $3E $07
    call label_91D                                ; $5A5B: $CD $1D $09
    pop  bc                                       ; $5A5E: $C1

jr_007_5A5F:
    ld   hl, wRequestDestinationHigh              ; $5A5F: $21 $01 $D6
    ld   a, [wRequests]                           ; $5A62: $FA $00 $D6
    ld   e, a                                     ; $5A65: $5F
    add  $0A                                      ; $5A66: $C6 $0A
    ld   [wRequests], a                           ; $5A68: $EA $00 $D6
    ld   d, $00                                   ; $5A6B: $16 $00
    add  hl, de                                   ; $5A6D: $19
    ldh  a, [$FFCF]                               ; $5A6E: $F0 $CF
    ld   [hl+], a                                 ; $5A70: $22
    ldh  a, [$FFD0]                               ; $5A71: $F0 $D0
    ld   [hl+], a                                 ; $5A73: $22
    ld   a, $81                                   ; $5A74: $3E $81
    ld   [hl+], a                                 ; $5A76: $22
    ld   a, $0C                                   ; $5A77: $3E $0C
    ld   [hl+], a                                 ; $5A79: $22
    ld   a, $1C                                   ; $5A7A: $3E $1C
    ld   [hl+], a                                 ; $5A7C: $22
    ldh  a, [$FFCF]                               ; $5A7D: $F0 $CF
    ld   [hl+], a                                 ; $5A7F: $22
    ldh  a, [$FFD0]                               ; $5A80: $F0 $D0
    inc  a                                        ; $5A82: $3C
    ld   [hl+], a                                 ; $5A83: $22
    ld   a, $81                                   ; $5A84: $3E $81
    ld   [hl+], a                                 ; $5A86: $22
    ld   a, $0D                                   ; $5A87: $3E $0D
    ld   [hl+], a                                 ; $5A89: $22
    ld   a, $1D                                   ; $5A8A: $3E $1D
    ld   [hl+], a                                 ; $5A8C: $22
    ld   [hl], b                                  ; $5A8D: $70
    ld   hl, $D725                                ; $5A8E: $21 $25 $D7
    ld   [hl], $DB                                ; $5A91: $36 $DB
    ld   a, $87                                   ; $5A93: $3E $87
    call label_B2F                                ; $5A95: $CD $2F $0B
    ld   hl, $D735                                ; $5A98: $21 $35 $D7
    ld   [hl], $DB                                ; $5A9B: $36 $DB
    ld   a, $87                                   ; $5A9D: $3E $87
    call label_B2F                                ; $5A9F: $CD $2F $0B
    ld   hl, $D745                                ; $5AA2: $21 $45 $D7
    ld   [hl], $DB                                ; $5AA5: $36 $DB
    ld   a, $87                                   ; $5AA7: $3E $87
    jp   label_B2F                                ; $5AA9: $C3 $2F $0B

    call GetEntityTransitionCountdown                 ; $5AAC: $CD $05 $0C
    jr   nz, jr_007_5B19                          ; $5AAF: $20 $68

    call IncrementEntityWalkingAttr               ; $5AB1: $CD $12 $3B
    ld   hl, $C3D0                                ; $5AB4: $21 $D0 $C3
    add  hl, bc                                   ; $5AB7: $09
    ld   a, [hl]                                  ; $5AB8: $7E
    cp   $05                                      ; $5AB9: $FE $05
    jr   c, jr_007_5ADE                           ; $5ABB: $38 $21

    call GetRandomByte                            ; $5ABD: $CD $0D $28
    and  $0F                                      ; $5AC0: $E6 $0F
    add  $10                                      ; $5AC2: $C6 $10
    ld   hl, wEntitiesSpeedZTable                                ; $5AC4: $21 $20 $C3
    add  hl, bc                                   ; $5AC7: $09
    ld   [hl], a                                  ; $5AC8: $77
    ld   e, $10                                   ; $5AC9: $1E $10
    and  $01                                      ; $5ACB: $E6 $01
    jr   z, jr_007_5AD1                           ; $5ACD: $28 $02

    ld   e, $F0                                   ; $5ACF: $1E $F0

jr_007_5AD1:
    ld   hl, wEntity0SpeedX                       ; $5AD1: $21 $40 $C2
    add  hl, bc                                   ; $5AD4: $09
    ld   [hl], e                                  ; $5AD5: $73
    call func_007_4005                            ; $5AD6: $CD $05 $40
    ld   [hl], $F0                                ; $5AD9: $36 $F0
    jp   label_007_5B08                           ; $5ADB: $C3 $08 $5B

jr_007_5ADE:
    ld   hl, wEntitiesSpeedZTable                                ; $5ADE: $21 $20 $C3
    add  hl, bc                                   ; $5AE1: $09
    ld   [hl], $18                                ; $5AE2: $36 $18
    ldh  a, [hLinkPositionX]                      ; $5AE4: $F0 $98
    push af                                       ; $5AE6: $F5
    ldh  a, [hLinkPositionY]                      ; $5AE7: $F0 $99
    push af                                       ; $5AE9: $F5
    ld   a, [$D154]                               ; $5AEA: $FA $54 $D1
    ld   e, a                                     ; $5AED: $5F
    ld   d, b                                     ; $5AEE: $50
    ld   hl, wEntity0PosX                         ; $5AEF: $21 $00 $C2
    add  hl, de                                   ; $5AF2: $19
    ld   a, [hl]                                  ; $5AF3: $7E
    ldh  [hLinkPositionX], a                      ; $5AF4: $E0 $98
    ld   hl, wEntity0PosY                         ; $5AF6: $21 $10 $C2
    add  hl, de                                   ; $5AF9: $19
    ld   a, [hl]                                  ; $5AFA: $7E
    ldh  [hLinkPositionY], a                      ; $5AFB: $E0 $99
    ld   a, $14                                   ; $5AFD: $3E $14
    call label_3BAA                               ; $5AFF: $CD $AA $3B
    pop  af                                       ; $5B02: $F1
    ldh  [hLinkPositionY], a                      ; $5B03: $E0 $99
    pop  af                                       ; $5B05: $F1
    ldh  [hLinkPositionX], a                      ; $5B06: $E0 $98

func_007_5B08:
label_007_5B08:
    ld   hl, wEntity0SpeedX                       ; $5B08: $21 $40 $C2
    add  hl, bc                                   ; $5B0B: $09
    ld   a, [hl]                                  ; $5B0C: $7E
    ld   e, $00                                   ; $5B0D: $1E $00
    and  $80                                      ; $5B0F: $E6 $80
    jr   z, jr_007_5B14                           ; $5B11: $28 $01

    inc  e                                        ; $5B13: $1C

jr_007_5B14:
    ld   hl, $C380                                ; $5B14: $21 $80 $C3
    add  hl, bc                                   ; $5B17: $09
    ld   [hl], e                                  ; $5B18: $73

jr_007_5B19:
    call func_007_58FA                            ; $5B19: $CD $FA $58
    call IsEntityUnknownFZero                                ; $5B1C: $CD $00 $0C
    ret  z                                        ; $5B1F: $C8

    ld   a, $04                                   ; $5B20: $3E $04
    jp   label_3B0C                               ; $5B22: $C3 $0C $3B

    call func_007_7E0A                            ; $5B25: $CD $0A $7E
    ldh  a, [$FFEF]                               ; $5B28: $F0 $EF
    cp   $08                                      ; $5B2A: $FE $08
    jp   c, label_007_7EA4                        ; $5B2C: $DA $A4 $7E

    ld   hl, $C3D0                                ; $5B2F: $21 $D0 $C3
    add  hl, bc                                   ; $5B32: $09
    ld   a, [hl]                                  ; $5B33: $7E
    cp   $05                                      ; $5B34: $FE $05
    jr   nc, jr_007_5B3B                          ; $5B36: $30 $03

    call label_3B23                               ; $5B38: $CD $23 $3B

jr_007_5B3B:
    ldh  a, [hFFE8]                               ; $5B3B: $F0 $E8
    and  a                                        ; $5B3D: $A7
    jr   z, jr_007_5B64                           ; $5B3E: $28 $24

    call IncrementEntityWalkingAttr               ; $5B40: $CD $12 $3B
    ld   [hl], $05                                ; $5B43: $36 $05
    ld   hl, $C3D0                                ; $5B45: $21 $D0 $C3
    add  hl, bc                                   ; $5B48: $09
    ld   a, [hl]                                  ; $5B49: $7E
    cp   $05                                      ; $5B4A: $FE $05
    jr   c, jr_007_5B59                           ; $5B4C: $38 $0B

    call GetEntityTransitionCountdown                 ; $5B4E: $CD $05 $0C
    ld   [hl], $10                                ; $5B51: $36 $10
    call IsEntityUnknownFZero                                ; $5B53: $CD $00 $0C
    ld   [hl], $10                                ; $5B56: $36 $10
    ret                                           ; $5B58: $C9

jr_007_5B59:
    call GetEntityTransitionCountdown                 ; $5B59: $CD $05 $0C
    call GetRandomByte                            ; $5B5C: $CD $0D $28
    and  $3F                                      ; $5B5F: $E6 $3F
    add  $30                                      ; $5B61: $C6 $30
    ld   [hl], a                                  ; $5B63: $77

jr_007_5B64:
    ld   a, $03                                   ; $5B64: $3E $03
    jp   label_3B0C                               ; $5B66: $C3 $0C $3B

    call GetEntityTransitionCountdown                 ; $5B69: $CD $05 $0C
    jr   nz, jr_007_5BCA                          ; $5B6C: $20 $5C

    ldh  a, [hLinkPositionX]                      ; $5B6E: $F0 $98
    push af                                       ; $5B70: $F5
    ldh  a, [hLinkPositionY]                      ; $5B71: $F0 $99
    push af                                       ; $5B73: $F5
    ld   hl, wEntitiesUnknownTableB               ; $5B74: $21 $B0 $C2
    add  hl, bc                                   ; $5B77: $09
    ld   a, [hl]                                  ; $5B78: $7E
    ldh  [hLinkPositionX], a                      ; $5B79: $E0 $98
    ld   hl, wEntitiesUnknownTableC               ; $5B7B: $21 $C0 $C2
    add  hl, bc                                   ; $5B7E: $09
    ld   a, [hl]                                  ; $5B7F: $7E
    ldh  [hLinkPositionY], a                      ; $5B80: $E0 $99
    ld   hl, $C300                                ; $5B82: $21 $00 $C3
    add  hl, bc                                   ; $5B85: $09
    ld   a, [wC168]                               ; $5B86: $FA $68 $C1
    or   [hl]                                     ; $5B89: $B6
    ld   a, $10                                   ; $5B8A: $3E $10
    ld   e, $10                                   ; $5B8C: $1E $10
    jr   nz, jr_007_5B94                          ; $5B8E: $20 $04

    ld   a, $08                                   ; $5B90: $3E $08
    ld   e, $08                                   ; $5B92: $1E $08

jr_007_5B94:
    push de                                       ; $5B94: $D5
    call label_3BAA                               ; $5B95: $CD $AA $3B
    pop  de                                       ; $5B98: $D1
    ld   hl, wEntitiesSpeedZTable                                ; $5B99: $21 $20 $C3
    add  hl, bc                                   ; $5B9C: $09
    ld   [hl], e                                  ; $5B9D: $73
    ld   a, [wC168]                               ; $5B9E: $FA $68 $C1
    and  a                                        ; $5BA1: $A7
    jr   z, jr_007_5BBE                           ; $5BA2: $28 $1A

    ldh  a, [hScratchA]                           ; $5BA4: $F0 $D7
    call func_007_4005                            ; $5BA6: $CD $05 $40
    cpl                                           ; $5BA9: $2F
    inc  a                                        ; $5BAA: $3C
    ld   [hl], a                                  ; $5BAB: $77
    ldh  a, [hScratchB]                           ; $5BAC: $F0 $D8
    ld   hl, wEntity0SpeedX                       ; $5BAE: $21 $40 $C2
    add  hl, bc                                   ; $5BB1: $09
    cpl                                           ; $5BB2: $2F
    inc  a                                        ; $5BB3: $3C
    ld   [hl], a                                  ; $5BB4: $77
    ldh  a, [$FFEF]                               ; $5BB5: $F0 $EF
    cp   $90                                      ; $5BB7: $FE $90
    jr   c, jr_007_5BBE                           ; $5BB9: $38 $03

    call func_007_7EA4                            ; $5BBB: $CD $A4 $7E

jr_007_5BBE:
    pop  af                                       ; $5BBE: $F1
    ldh  [hLinkPositionY], a                      ; $5BBF: $E0 $99
    pop  af                                       ; $5BC1: $F1
    ldh  [hLinkPositionX], a                      ; $5BC2: $E0 $98
    call IncrementEntityWalkingAttr               ; $5BC4: $CD $12 $3B
    call func_007_5B08                            ; $5BC7: $CD $08 $5B

jr_007_5BCA:
    call func_007_4005                            ; $5BCA: $CD $05 $40
    ld   a, [hl]                                  ; $5BCD: $7E
    and  $80                                      ; $5BCE: $E6 $80
    ld   a, $02                                   ; $5BD0: $3E $02
    jr   z, jr_007_5BD6                           ; $5BD2: $28 $02

    ld   a, $04                                   ; $5BD4: $3E $04

jr_007_5BD6:
    jp   label_3B0C                               ; $5BD6: $C3 $0C $3B

    ldh  a, [hFFE8]                               ; $5BD9: $F0 $E8
    and  a                                        ; $5BDB: $A7
    jr   z, jr_007_5BE8                           ; $5BDC: $28 $0A

    call GetEntityTransitionCountdown                 ; $5BDE: $CD $05 $0C
    ld   [hl], $08                                ; $5BE1: $36 $08
    call IncrementEntityWalkingAttr               ; $5BE3: $CD $12 $3B
    dec  [hl]                                     ; $5BE6: $35
    dec  [hl]                                     ; $5BE7: $35

jr_007_5BE8:
    ld   a, $03                                   ; $5BE8: $3E $03
    call label_3B0C                               ; $5BEA: $CD $0C $3B
    jp   label_007_7E0A                           ; $5BED: $C3 $0A $7E

    ret                                           ; $5BF0: $C9

    ld   l, d                                     ; $5BF1: $6A
    nop                                           ; $5BF2: $00
    ld   l, d                                     ; $5BF3: $6A
    jr   nz, jr_007_5C5E                          ; $5BF4: $20 $68

    nop                                           ; $5BF6: $00
    ld   l, b                                     ; $5BF7: $68
    jr   nz, jr_007_5C0B                          ; $5BF8: $20 $11

    pop  af                                       ; $5BFA: $F1
    ld   e, e                                     ; $5BFB: $5B
    call RenderAnimatedActiveEntity                               ; $5BFC: $CD $C0 $3B
    call func_007_7D96                            ; $5BFF: $CD $96 $7D
    call func_007_7DC3                            ; $5C02: $CD $C3 $7D
    call label_3B39                               ; $5C05: $CD $39 $3B
    call func_007_7E0A                            ; $5C08: $CD $0A $7E

jr_007_5C0B:
    call label_3B23                               ; $5C0B: $CD $23 $3B
    ld   hl, $C470                                ; $5C0E: $21 $70 $C4
    add  hl, bc                                   ; $5C11: $09
    ld   a, [hl]                                  ; $5C12: $7E
    and  a                                        ; $5C13: $A7
    jr   nz, jr_007_5C2A                          ; $5C14: $20 $14

    ld   hl, $C480                                ; $5C16: $21 $80 $C4
    add  hl, bc                                   ; $5C19: $09
    ld   [hl], $10                                ; $5C1A: $36 $10
    ldh  a, [wActiveEntityPosX]                   ; $5C1C: $F0 $EE
    ld   hl, wEntity0PosX                         ; $5C1E: $21 $00 $C2
    add  hl, bc                                   ; $5C21: $09
    ld   [hl], a                                  ; $5C22: $77
    ldh  a, [$FFEF]                               ; $5C23: $F0 $EF
    ld   hl, wEntity0PosY                         ; $5C25: $21 $10 $C2
    add  hl, bc                                   ; $5C28: $09
    ld   [hl], a                                  ; $5C29: $77

jr_007_5C2A:
    xor  a                                        ; $5C2A: $AF
    call label_3B0C                               ; $5C2B: $CD $0C $3B
    ldh  a, [hActiveEntityWalking]                ; $5C2E: $F0 $F0
    rst  $00                                      ; $5C30: $C7
    dec  [hl]                                     ; $5C31: $35
    ld   e, h                                     ; $5C32: $5C
    ld   a, c                                     ; $5C33: $79
    ld   e, h                                     ; $5C34: $5C
    call GetEntityTransitionCountdown                 ; $5C35: $CD $05 $0C
    jr   nz, jr_007_5C58                          ; $5C38: $20 $1E

    call func_007_7E6D                            ; $5C3A: $CD $6D $7E
    ld   a, e                                     ; $5C3D: $7B
    cp   $03                                      ; $5C3E: $FE $03
    jr   z, jr_007_5C58                           ; $5C40: $28 $16

    call label_3D7F                               ; $5C42: $CD $7F $3D
    call GetEntityTransitionCountdown                 ; $5C45: $CD $05 $0C
    ld   [hl], $25                                ; $5C48: $36 $25
    call func_007_7E5D                            ; $5C4A: $CD $5D $7E
    ld   hl, $C380                                ; $5C4D: $21 $80 $C3
    add  hl, bc                                   ; $5C50: $09
    ld   [hl], e                                  ; $5C51: $73
    call IncrementEntityWalkingAttr               ; $5C52: $CD $12 $3B
    ld   [hl], $01                                ; $5C55: $36 $01
    ret                                           ; $5C57: $C9

jr_007_5C58:
    call func_007_4005                            ; $5C58: $CD $05 $40
    ld   a, [hl]                                  ; $5C5B: $7E
    sub  $04                                      ; $5C5C: $D6 $04

jr_007_5C5E:
    jr   z, jr_007_5C67                           ; $5C5E: $28 $07

    and  $80                                      ; $5C60: $E6 $80
    jr   z, jr_007_5C66                           ; $5C62: $28 $02

    inc  [hl]                                     ; $5C64: $34
    inc  [hl]                                     ; $5C65: $34

jr_007_5C66:
    dec  [hl]                                     ; $5C66: $35

jr_007_5C67:
    ld   hl, wEntity0SpeedX                       ; $5C67: $21 $40 $C2
    add  hl, bc                                   ; $5C6A: $09
    ld   a, [hl]                                  ; $5C6B: $7E
    and  a                                        ; $5C6C: $A7
    jr   z, jr_007_5C76                           ; $5C6D: $28 $07

    and  $80                                      ; $5C6F: $E6 $80
    jr   z, jr_007_5C75                           ; $5C71: $28 $02

    inc  [hl]                                     ; $5C73: $34
    inc  [hl]                                     ; $5C74: $34

jr_007_5C75:
    dec  [hl]                                     ; $5C75: $35

jr_007_5C76:
    ret                                           ; $5C76: $C9

    ld   bc, $CDFF                                ; $5C77: $01 $FF $CD
    dec  b                                        ; $5C7A: $05
    inc  c                                        ; $5C7B: $0C
    jr   nz, jr_007_5C85                          ; $5C7C: $20 $07

    ld   [hl], $40                                ; $5C7E: $36 $40
    call IncrementEntityWalkingAttr               ; $5C80: $CD $12 $3B
    ld   [hl], b                                  ; $5C83: $70
    ret                                           ; $5C84: $C9

jr_007_5C85:
    ldh  a, [hFrameCounter]                       ; $5C85: $F0 $E7
    and  $01                                      ; $5C87: $E6 $01
    jr   nz, jr_007_5CA0                          ; $5C89: $20 $15

    call func_007_4005                            ; $5C8B: $CD $05 $40
    dec  [hl]                                     ; $5C8E: $35
    ld   hl, $C380                                ; $5C8F: $21 $80 $C3
    add  hl, bc                                   ; $5C92: $09
    ld   e, [hl]                                  ; $5C93: $5E
    ld   d, b                                     ; $5C94: $50
    ld   hl, $5C77                                ; $5C95: $21 $77 $5C
    add  hl, de                                   ; $5C98: $19
    ld   a, [hl]                                  ; $5C99: $7E
    ld   hl, wEntity0SpeedX                       ; $5C9A: $21 $40 $C2
    add  hl, bc                                   ; $5C9D: $09
    add  [hl]                                     ; $5C9E: $86
    ld   [hl], a                                  ; $5C9F: $77

jr_007_5CA0:
    ld   a, $01                                   ; $5CA0: $3E $01
    jp   label_3B0C                               ; $5CA2: $C3 $0C $3B

func_007_5CA5:
    ldh  a, [hActiveEntityUnknownG]               ; $5CA5: $F0 $F1
    inc  a                                        ; $5CA7: $3C
    jr   z, jr_007_5CF3                           ; $5CA8: $28 $49

    push hl                                       ; $5CAA: $E5
    ld   a, [$C3C0]                               ; $5CAB: $FA $C0 $C3
    ld   e, a                                     ; $5CAE: $5F
    ld   d, $00                                   ; $5CAF: $16 $00
    ld   hl, $C030                                ; $5CB1: $21 $30 $C0
    add  hl, de                                   ; $5CB4: $19
    ld   e, l                                     ; $5CB5: $5D
    ld   d, h                                     ; $5CB6: $54
    pop  hl                                       ; $5CB7: $E1

jr_007_5CB8:
    ldh  a, [wActiveEntityPosY]                   ; $5CB8: $F0 $EC
    add  [hl]                                     ; $5CBA: $86
    cp   $7E                                      ; $5CBB: $FE $7E
    jr   c, jr_007_5CC0                           ; $5CBD: $38 $01

    xor  a                                        ; $5CBF: $AF

jr_007_5CC0:
    ld   [de], a                                  ; $5CC0: $12
    inc  hl                                       ; $5CC1: $23
    inc  de                                       ; $5CC2: $13
    push bc                                       ; $5CC3: $C5
    ld   a, [wScreenShakeHorizontal]              ; $5CC4: $FA $55 $C1
    ld   c, a                                     ; $5CC7: $4F
    ldh  a, [wActiveEntityPosX]                   ; $5CC8: $F0 $EE
    add  [hl]                                     ; $5CCA: $86
    sub  c                                        ; $5CCB: $91
    ld   [de], a                                  ; $5CCC: $12
    inc  hl                                       ; $5CCD: $23
    inc  de                                       ; $5CCE: $13
    ldh  a, [hFFF5]                               ; $5CCF: $F0 $F5
    ld   c, a                                     ; $5CD1: $4F
    ld   a, [hl+]                                 ; $5CD2: $2A
    push af                                       ; $5CD3: $F5
    add  c                                        ; $5CD4: $81
    ld   [de], a                                  ; $5CD5: $12
    pop  af                                       ; $5CD6: $F1
    cp   $FF                                      ; $5CD7: $FE $FF
    jr   nz, jr_007_5CDF                          ; $5CD9: $20 $04

    dec  de                                       ; $5CDB: $1B
    xor  a                                        ; $5CDC: $AF
    ld   [de], a                                  ; $5CDD: $12
    inc  de                                       ; $5CDE: $13

jr_007_5CDF:
    pop  bc                                       ; $5CDF: $C1
    inc  de                                       ; $5CE0: $13
    ldh  a, [$FFED]                               ; $5CE1: $F0 $ED
    xor  [hl]                                     ; $5CE3: $AE
    inc  hl                                       ; $5CE4: $23
    ld   [de], a                                  ; $5CE5: $12
    inc  de                                       ; $5CE6: $13
    dec  c                                        ; $5CE7: $0D
    jr   nz, jr_007_5CB8                          ; $5CE8: $20 $CE

    ld   a, [wLinkWalkingFrameCount]              ; $5CEA: $FA $23 $C1
    ld   c, a                                     ; $5CED: $4F
    ld   a, $0A                                   ; $5CEE: $3E $0A
    jp   label_3DA0                               ; $5CF0: $C3 $A0 $3D

jr_007_5CF3:
    ld   a, [wLinkWalkingFrameCount]              ; $5CF3: $FA $23 $C1
    ld   c, a                                     ; $5CF6: $4F
    ret                                           ; $5CF7: $C9

    nop                                           ; $5CF8: $00
    nop                                           ; $5CF9: $00
    ld   c, h                                     ; $5CFA: $4C
    rlca                                          ; $5CFB: $07
    nop                                           ; $5CFC: $00
    ld   [$274C], sp                              ; $5CFD: $08 $4C $27
    ldh  a, [rP1]                                 ; $5D00: $F0 $00
    ld   c, d                                     ; $5D02: $4A
    rlca                                          ; $5D03: $07
    ldh  a, [$FF08]                               ; $5D04: $F0 $08
    ld   c, d                                     ; $5D06: $4A
    daa                                           ; $5D07: $27
    ldh  [rP1], a                                 ; $5D08: $E0 $00
    ld   c, d                                     ; $5D0A: $4A
    rlca                                          ; $5D0B: $07
    ldh  [$FF08], a                               ; $5D0C: $E0 $08
    ld   c, d                                     ; $5D0E: $4A
    daa                                           ; $5D0F: $27
    ret  nc                                       ; $5D10: $D0

    nop                                           ; $5D11: $00
    ld   c, d                                     ; $5D12: $4A
    rlca                                          ; $5D13: $07
    ret  nc                                       ; $5D14: $D0

    ld   [$274A], sp                              ; $5D15: $08 $4A $27
    ret  nz                                       ; $5D18: $C0

    nop                                           ; $5D19: $00
    ld   c, b                                     ; $5D1A: $48
    rlca                                          ; $5D1B: $07
    ret  nz                                       ; $5D1C: $C0

    ld   [$2748], sp                              ; $5D1D: $08 $48 $27
    nop                                           ; $5D20: $00
    nop                                           ; $5D21: $00
    ld   c, d                                     ; $5D22: $4A
    rlca                                          ; $5D23: $07
    nop                                           ; $5D24: $00
    ld   [$274A], sp                              ; $5D25: $08 $4A $27
    ldh  a, [rP1]                                 ; $5D28: $F0 $00
    ld   c, d                                     ; $5D2A: $4A
    rlca                                          ; $5D2B: $07
    ldh  a, [$FF08]                               ; $5D2C: $F0 $08
    ld   c, d                                     ; $5D2E: $4A
    daa                                           ; $5D2F: $27
    ldh  [rP1], a                                 ; $5D30: $E0 $00
    ld   c, d                                     ; $5D32: $4A
    rlca                                          ; $5D33: $07
    ldh  [$FF08], a                               ; $5D34: $E0 $08
    ld   c, d                                     ; $5D36: $4A
    daa                                           ; $5D37: $27
    ret  nc                                       ; $5D38: $D0

    nop                                           ; $5D39: $00
    ld   c, b                                     ; $5D3A: $48
    rlca                                          ; $5D3B: $07
    ret  nc                                       ; $5D3C: $D0

    ld   [$2748], sp                              ; $5D3D: $08 $48 $27
    ret  nz                                       ; $5D40: $C0

    nop                                           ; $5D41: $00
    rst  $38                                      ; $5D42: $FF
    rlca                                          ; $5D43: $07
    ret  nz                                       ; $5D44: $C0

    ld   [label_27F2.skip], sp                    ; $5D45: $08 $FF $27
    nop                                           ; $5D48: $00
    nop                                           ; $5D49: $00
    ld   c, d                                     ; $5D4A: $4A
    rlca                                          ; $5D4B: $07
    nop                                           ; $5D4C: $00
    ld   [$274A], sp                              ; $5D4D: $08 $4A $27
    ldh  a, [rP1]                                 ; $5D50: $F0 $00
    ld   c, d                                     ; $5D52: $4A
    rlca                                          ; $5D53: $07
    ldh  a, [$FF08]                               ; $5D54: $F0 $08
    ld   c, d                                     ; $5D56: $4A
    daa                                           ; $5D57: $27
    ldh  [rP1], a                                 ; $5D58: $E0 $00
    ld   c, b                                     ; $5D5A: $48
    rlca                                          ; $5D5B: $07
    ldh  [$FF08], a                               ; $5D5C: $E0 $08
    ld   c, b                                     ; $5D5E: $48
    daa                                           ; $5D5F: $27
    ret  nc                                       ; $5D60: $D0

    nop                                           ; $5D61: $00
    rst  $38                                      ; $5D62: $FF
    rlca                                          ; $5D63: $07
    ret  nc                                       ; $5D64: $D0

    ld   [label_27F2.skip], sp                    ; $5D65: $08 $FF $27
    ret  nz                                       ; $5D68: $C0

    nop                                           ; $5D69: $00
    rst  $38                                      ; $5D6A: $FF
    rlca                                          ; $5D6B: $07
    ret  nz                                       ; $5D6C: $C0

    ld   [label_27F2.skip], sp                    ; $5D6D: $08 $FF $27
    nop                                           ; $5D70: $00
    nop                                           ; $5D71: $00
    ld   c, d                                     ; $5D72: $4A
    rlca                                          ; $5D73: $07
    nop                                           ; $5D74: $00
    ld   [$274A], sp                              ; $5D75: $08 $4A $27
    ldh  a, [rP1]                                 ; $5D78: $F0 $00
    ld   c, b                                     ; $5D7A: $48
    rlca                                          ; $5D7B: $07
    ldh  a, [$FF08]                               ; $5D7C: $F0 $08
    ld   c, b                                     ; $5D7E: $48
    daa                                           ; $5D7F: $27
    ldh  [rP1], a                                 ; $5D80: $E0 $00
    rst  $38                                      ; $5D82: $FF
    rlca                                          ; $5D83: $07
    ldh  [$FF08], a                               ; $5D84: $E0 $08
    rst  $38                                      ; $5D86: $FF
    daa                                           ; $5D87: $27
    ret  nc                                       ; $5D88: $D0

    nop                                           ; $5D89: $00
    rst  $38                                      ; $5D8A: $FF
    rlca                                          ; $5D8B: $07
    ret  nc                                       ; $5D8C: $D0

    ld   [label_27F2.skip], sp                    ; $5D8D: $08 $FF $27
    ret  nz                                       ; $5D90: $C0

    nop                                           ; $5D91: $00
    rst  $38                                      ; $5D92: $FF
    rlca                                          ; $5D93: $07
    ret  nz                                       ; $5D94: $C0

    ld   [label_27F2.skip], sp                    ; $5D95: $08 $FF $27
    nop                                           ; $5D98: $00
    nop                                           ; $5D99: $00
    ld   c, b                                     ; $5D9A: $48
    rlca                                          ; $5D9B: $07
    nop                                           ; $5D9C: $00
    ld   [$2748], sp                              ; $5D9D: $08 $48 $27
    ldh  a, [rP1]                                 ; $5DA0: $F0 $00
    rst  $38                                      ; $5DA2: $FF
    rlca                                          ; $5DA3: $07
    ldh  a, [$FF08]                               ; $5DA4: $F0 $08
    rst  $38                                      ; $5DA6: $FF
    daa                                           ; $5DA7: $27
    ldh  [rP1], a                                 ; $5DA8: $E0 $00
    rst  $38                                      ; $5DAA: $FF
    rlca                                          ; $5DAB: $07
    ldh  [$FF08], a                               ; $5DAC: $E0 $08
    rst  $38                                      ; $5DAE: $FF
    daa                                           ; $5DAF: $27
    ret  nc                                       ; $5DB0: $D0

    nop                                           ; $5DB1: $00
    rst  $38                                      ; $5DB2: $FF
    rlca                                          ; $5DB3: $07
    ret  nc                                       ; $5DB4: $D0

    ld   [label_27F2.skip], sp                    ; $5DB5: $08 $FF $27
    ret  nz                                       ; $5DB8: $C0

    nop                                           ; $5DB9: $00
    rst  $38                                      ; $5DBA: $FF
    rlca                                          ; $5DBB: $07
    ret  nz                                       ; $5DBC: $C0

    ld   [label_27F2.skip], sp                    ; $5DBD: $08 $FF $27
    ldh  a, [hLinkPositionY]                      ; $5DC0: $F0 $99
    ld   e, a                                     ; $5DC2: $5F
    ld   hl, wEntity0PosY                         ; $5DC3: $21 $10 $C2
    add  hl, bc                                   ; $5DC6: $09
    ld   a, [hl]                                  ; $5DC7: $7E
    sub  e                                        ; $5DC8: $93
    jr   c, jr_007_5DD0                           ; $5DC9: $38 $05

    ld   a, $01                                   ; $5DCB: $3E $01
    ld   [$DE00], a                               ; $5DCD: $EA $00 $DE

jr_007_5DD0:
    ld   hl, wEntitiesUnknownTableB               ; $5DD0: $21 $B0 $C2
    add  hl, bc                                   ; $5DD3: $09
    ld   a, [hl]                                  ; $5DD4: $7E
    cp   $02                                      ; $5DD5: $FE $02
    jp   z, label_007_5FAB                        ; $5DD7: $CA $AB $5F

    and  a                                        ; $5DDA: $A7
    jp   nz, label_007_5F4D                       ; $5DDB: $C2 $4D $5F

    ldh  a, [hRoomStatus]                         ; $5DDE: $F0 $F8
    and  $20                                      ; $5DE0: $E6 $20
    jp   nz, label_007_7EA4                       ; $5DE2: $C2 $A4 $7E

    ld   a, [wRoomTransitionState]                ; $5DE5: $FA $24 $C1
    and  a                                        ; $5DE8: $A7
    jr   nz, jr_007_5DF5                          ; $5DE9: $20 $0A

    ld   hl, $C3E0                                ; $5DEB: $21 $E0 $C3
    add  hl, bc                                   ; $5DEE: $09
    ldh  a, [hMapRoom]                            ; $5DEF: $F0 $F6
    cp   [hl]                                     ; $5DF1: $BE
    jp   nz, label_007_7EA4                       ; $5DF2: $C2 $A4 $7E

jr_007_5DF5:
    ldh  a, [hActiveEntityUnknownG]               ; $5DF5: $F0 $F1
    cp   $05                                      ; $5DF7: $FE $05
    jr   nc, jr_007_5E12                          ; $5DF9: $30 $17

    rla                                           ; $5DFB: $17
    rla                                           ; $5DFC: $17
    and  $FC                                      ; $5DFD: $E6 $FC
    sla  a                                        ; $5DFF: $CB $27
    ld   e, a                                     ; $5E01: $5F
    sla  a                                        ; $5E02: $CB $27
    sla  a                                        ; $5E04: $CB $27
    add  e                                        ; $5E06: $83
    ld   e, a                                     ; $5E07: $5F
    ld   d, b                                     ; $5E08: $50

label_007_5E09:
    ld   hl, $5CF8                                ; $5E09: $21 $F8 $5C
    add  hl, de                                   ; $5E0C: $19
    ld   c, $0A                                   ; $5E0D: $0E $0A
    call func_007_5CA5                            ; $5E0F: $CD $A5 $5C

jr_007_5E12:
    call label_C56                                ; $5E12: $CD $56 $0C
    call label_3B70                               ; $5E15: $CD $70 $3B
    call func_007_7CF0                            ; $5E18: $CD $F0 $7C
    ldh  a, [hActiveEntityWalking]                ; $5E1B: $F0 $F0
    rst  $00                                      ; $5E1D: $C7
    ld   a, [hl+]                                 ; $5E1E: $2A
    ld   e, [hl]                                  ; $5E1F: $5E
    dec  hl                                       ; $5E20: $2B
    ld   e, [hl]                                  ; $5E21: $5E
    ld   b, e                                     ; $5E22: $43
    ld   e, [hl]                                  ; $5E23: $5E
    push bc                                       ; $5E24: $C5
    ld   e, [hl]                                  ; $5E25: $5E
    ld   a, [c]                                   ; $5E26: $F2
    ld   e, [hl]                                  ; $5E27: $5E
    ld   de, $C95F                                ; $5E28: $11 $5F $C9
    call func_007_5EEA                            ; $5E2B: $CD $EA $5E
    call GetEntityTransitionCountdown                 ; $5E2E: $CD $05 $0C
    jr   nz, jr_007_5E36                          ; $5E31: $20 $03

    jp   IncrementEntityWalkingAttr               ; $5E33: $C3 $12 $3B

func_007_5E36:
jr_007_5E36:
    ld   e, $00                                   ; $5E36: $1E $00
    and  $04                                      ; $5E38: $E6 $04
    jr   z, jr_007_5E3E                           ; $5E3A: $28 $02

    ld   e, $02                                   ; $5E3C: $1E $02

jr_007_5E3E:
    ld   a, e                                     ; $5E3E: $7B
    ld   [wScreenShakeHorizontal], a              ; $5E3F: $EA $55 $C1
    ret                                           ; $5E42: $C9

    call func_007_5EEA                            ; $5E43: $CD $EA $5E
    ldh  a, [hFrameCounter]                       ; $5E46: $F0 $E7
    call func_007_5E36                            ; $5E48: $CD $36 $5E
    ldh  a, [hFrameCounter]                       ; $5E4B: $F0 $E7
    and  $1F                                      ; $5E4D: $E6 $1F
    jr   nz, jr_007_5E67                          ; $5E4F: $20 $16

    ld   hl, wEntitiesUnknownTableG               ; $5E51: $21 $B0 $C3
    add  hl, bc                                   ; $5E54: $09
    ld   a, [hl]                                  ; $5E55: $7E
    inc  a                                        ; $5E56: $3C
    ld   [hl], a                                  ; $5E57: $77
    cp   $05                                      ; $5E58: $FE $05
    jp   z, label_007_5EA7                        ; $5E5A: $CA $A7 $5E

    call GetRandomByte                            ; $5E5D: $CD $0D $28
    and  $03                                      ; $5E60: $E6 $03
    jr   z, jr_007_5E67                           ; $5E62: $28 $03

    call func_007_5F61                            ; $5E64: $CD $61 $5F

jr_007_5E67:
    ldh  a, [hFrameCounter]                       ; $5E67: $F0 $E7
    and  $03                                      ; $5E69: $E6 $03
    jr   nz, jr_007_5EA6                          ; $5E6B: $20 $39

    ld   a, $A7                                   ; $5E6D: $3E $A7
    call label_3B86                               ; $5E6F: $CD $86 $3B
    jr   c, jr_007_5EA6                           ; $5E72: $38 $32

    call GetRandomByte                            ; $5E74: $CD $0D $28
    and  $07                                      ; $5E77: $E6 $07
    sub  $04                                      ; $5E79: $D6 $04
    ld   hl, hScratchB                            ; $5E7B: $21 $D8 $FF
    add  [hl]                                     ; $5E7E: $86
    ld   hl, wEntity0PosY                         ; $5E7F: $21 $10 $C2
    add  hl, de                                   ; $5E82: $19
    ld   [hl], a                                  ; $5E83: $77
    call GetRandomByte                            ; $5E84: $CD $0D $28
    and  $1F                                      ; $5E87: $E6 $1F
    sub  $10                                      ; $5E89: $D6 $10
    ld   hl, hScratchA                            ; $5E8B: $21 $D7 $FF
    add  [hl]                                     ; $5E8E: $86
    ld   hl, wEntity0PosX                         ; $5E8F: $21 $00 $C2
    add  hl, de                                   ; $5E92: $19
    ld   [hl], a                                  ; $5E93: $77
    ld   hl, $C340                                ; $5E94: $21 $40 $C3
    add  hl, de                                   ; $5E97: $19
    ld   [hl], $C2                                ; $5E98: $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable           ; $5E9A: $21 $E0 $C2
    add  hl, de                                   ; $5E9D: $19
    ld   [hl], $10                                ; $5E9E: $36 $10
    ld   hl, wEntitiesUnknownTableB               ; $5EA0: $21 $B0 $C2
    add  hl, de                                   ; $5EA3: $19
    ld   [hl], $01                                ; $5EA4: $36 $01

jr_007_5EA6:
    ret                                           ; $5EA6: $C9

label_007_5EA7:
    ld   a, $00                                   ; $5EA7: $3E $00
    ld   [wScreenShakeHorizontal], a              ; $5EA9: $EA $55 $C1
    ld   a, [wDB72]                               ; $5EAC: $FA $72 $DB
    inc  a                                        ; $5EAF: $3C
    ld   [wDB72], a                               ; $5EB0: $EA $72 $DB
    cp   $04                                      ; $5EB3: $FE $04
    jr   c, jr_007_5EBF                           ; $5EB5: $38 $08

    call GetEntityTransitionCountdown                 ; $5EB7: $CD $05 $0C
    ld   [hl], $20                                ; $5EBA: $36 $20
    jp   IncrementEntityWalkingAttr               ; $5EBC: $C3 $12 $3B

jr_007_5EBF:
    call func_007_6E7F                            ; $5EBF: $CD $7F $6E
    jp   label_007_7EA4                           ; $5EC2: $C3 $A4 $7E

    call GetEntityTransitionCountdown                 ; $5EC5: $CD $05 $0C
    jr   nz, jr_007_5EDE                          ; $5EC8: $20 $14

    ld   [hl], $20                                ; $5ECA: $36 $20
    ld   a, $08                                   ; $5ECC: $3E $08
    ld   [wGameplayType], a                       ; $5ECE: $EA $95 $DB
    xor  a                                        ; $5ED1: $AF
    ld   [wTransitionSequenceCounter], a          ; $5ED2: $EA $6B $C1
    ld   [wC16C], a                               ; $5ED5: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $5ED8: $EA $96 $DB
    jp   IncrementEntityWalkingAttr               ; $5EDB: $C3 $12 $3B

jr_007_5EDE:
    ld   e, $00                                   ; $5EDE: $1E $00
    and  $04                                      ; $5EE0: $E6 $04
    jr   z, jr_007_5EE6                           ; $5EE2: $28 $02

    ld   e, $02                                   ; $5EE4: $1E $02

jr_007_5EE6:
    ld   a, e                                     ; $5EE6: $7B
    ld   [wScreenShakeHorizontal], a              ; $5EE7: $EA $55 $C1

func_007_5EEA:
label_007_5EEA:
    ld   a, $02                                   ; $5EEA: $3E $02
    ldh  [$FFA1], a                               ; $5EEC: $E0 $A1
    ld   [wC111], a                               ; $5EEE: $EA $11 $C1
    ret                                           ; $5EF1: $C9

    xor  a                                        ; $5EF2: $AF
    ld   [wScreenShakeHorizontal], a              ; $5EF3: $EA $55 $C1
    call GetEntityTransitionCountdown                 ; $5EF6: $CD $05 $0C
    jr   nz, jr_007_5F06                          ; $5EF9: $20 $0B

    call func_007_6E7F                            ; $5EFB: $CD $7F $6E
    ld   hl, wHasInstrument7                      ; $5EFE: $21 $6B $DB
    set  2, [hl]                                  ; $5F01: $CB $D6
    jp   label_007_7EA4                           ; $5F03: $C3 $A4 $7E

jr_007_5F06:
    jp   label_007_5EEA                           ; $5F06: $C3 $EA $5E

    nop                                           ; $5F09: $00
    ld   [bc], a                                  ; $5F0A: $02
    inc  b                                        ; $5F0B: $04
    ld   b, $06                                   ; $5F0C: $06 $06
    inc  b                                        ; $5F0E: $04
    ld   [bc], a                                  ; $5F0F: $02
    nop                                           ; $5F10: $00
    xor  a                                        ; $5F11: $AF
    ld   [wScreenShakeVertical], a                ; $5F12: $EA $56 $C1
    call GetEntityTransitionCountdown                 ; $5F15: $CD $05 $0C
    jr   nz, jr_007_5F1D                          ; $5F18: $20 $03

    jp   label_007_7EA4                           ; $5F1A: $C3 $A4 $7E

jr_007_5F1D:
    push af                                       ; $5F1D: $F5
    and  $07                                      ; $5F1E: $E6 $07
    ld   e, a                                     ; $5F20: $5F
    ld   d, b                                     ; $5F21: $50
    ld   hl, $5F09                                ; $5F22: $21 $09 $5F
    add  hl, de                                   ; $5F25: $19
    ld   a, [hl]                                  ; $5F26: $7E
    ld   [wScreenShakeVertical], a                ; $5F27: $EA $56 $C1
    pop  af                                       ; $5F2A: $F1
    cp   $20                                      ; $5F2B: $FE $20
    jr   nc, jr_007_5F37                          ; $5F2D: $30 $08

    and  $03                                      ; $5F2F: $E6 $03
    jr   nz, jr_007_5F37                          ; $5F31: $20 $04

    call func_007_5F61                            ; $5F33: $CD $61 $5F
    xor  a                                        ; $5F36: $AF

jr_007_5F37:
    cp   $40                                      ; $5F37: $FE $40
    jr   c, jr_007_5F44                           ; $5F39: $38 $09

    and  $07                                      ; $5F3B: $E6 $07
    jr   nz, jr_007_5F44                          ; $5F3D: $20 $05

    ld   hl, hNoiseSfx                             ; $5F3F: $21 $F4 $FF
    ld   [hl], $0C                                ; $5F42: $36 $0C

jr_007_5F44:
    ret                                           ; $5F44: $C9

    jr   nc, @+$03                                ; $5F45: $30 $01

    jr   nc, @+$23                                ; $5F47: $30 $21

    ld   [hl-], a                                 ; $5F49: $32
    ld   bc, $2132                                ; $5F4A: $01 $32 $21

label_007_5F4D:
    ld   de, $5F45                                ; $5F4D: $11 $45 $5F
    call RenderAnimatedActiveEntity                               ; $5F50: $CD $C0 $3B
    call GetEntityTransitionCountdown                 ; $5F53: $CD $05 $0C
    jp   z, label_007_7EA4                        ; $5F56: $CA $A4 $7E

    cp   $04                                      ; $5F59: $FE $04
    ret  nz                                       ; $5F5B: $C0

    ld   a, $01                                   ; $5F5C: $3E $01
    jp   label_3B0C                               ; $5F5E: $C3 $0C $3B

func_007_5F61:
    ld   a, $A7                                   ; $5F61: $3E $A7
    call label_3B86                               ; $5F63: $CD $86 $3B
    jr   c, jr_007_5F9A                           ; $5F66: $38 $32

    ld   hl, wEntitiesUnknownTableB               ; $5F68: $21 $B0 $C2
    add  hl, de                                   ; $5F6B: $19
    ld   [hl], $02                                ; $5F6C: $36 $02
    ld   hl, $C340                                ; $5F6E: $21 $40 $C3
    add  hl, de                                   ; $5F71: $19
    ld   [hl], $D1                                ; $5F72: $36 $D1
    ld   hl, wEntitiesPosZTable                                ; $5F74: $21 $10 $C3
    add  hl, de                                   ; $5F77: $19
    ld   [hl], $70                                ; $5F78: $36 $70
    call GetRandomByte                            ; $5F7A: $CD $0D $28
    and  $3F                                      ; $5F7D: $E6 $3F
    sub  $20                                      ; $5F7F: $D6 $20
    ld   hl, hScratchA                            ; $5F81: $21 $D7 $FF
    add  [hl]                                     ; $5F84: $86
    ld   hl, wEntity0PosX                         ; $5F85: $21 $00 $C2
    add  hl, de                                   ; $5F88: $19
    ld   [hl], a                                  ; $5F89: $77
    call GetRandomByte                            ; $5F8A: $CD $0D $28
    and  $3F                                      ; $5F8D: $E6 $3F
    sub  $20                                      ; $5F8F: $D6 $20
    ld   hl, hScratchB                            ; $5F91: $21 $D8 $FF
    add  [hl]                                     ; $5F94: $86
    ld   hl, wEntity0PosY                         ; $5F95: $21 $10 $C2
    add  hl, de                                   ; $5F98: $19
    ld   [hl], a                                  ; $5F99: $77

jr_007_5F9A:
    ret                                           ; $5F9A: $C9

    ld   d, $03                                   ; $5F9B: $16 $03
    ld   d, $23                                   ; $5F9D: $16 $23
    jr   jr_007_5FB1                              ; $5F9F: $18 $10

    inc  c                                        ; $5FA1: $0C
    ld   [$F40C], sp                              ; $5FA2: $08 $0C $F4
    inc  c                                        ; $5FA5: $0C
    db   $F4                                      ; $5FA6: $F4
    db   $F4                                      ; $5FA7: $F4
    db   $F4                                      ; $5FA8: $F4
    inc  c                                        ; $5FA9: $0C
    inc  c                                        ; $5FAA: $0C

label_007_5FAB:
    ldh  a, [wActiveEntityPosY]                   ; $5FAB: $F0 $EC
    add  $08                                      ; $5FAD: $C6 $08
    ldh  [wActiveEntityPosY], a                   ; $5FAF: $E0 $EC

jr_007_5FB1:
    ld   de, $5F9B                                ; $5FB1: $11 $9B $5F
    call label_3C77                               ; $5FB4: $CD $77 $3C
    call func_007_7E0A                            ; $5FB7: $CD $0A $7E
    call func_007_7E43                            ; $5FBA: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $5FBD: $21 $20 $C3
    add  hl, bc                                   ; $5FC0: $09
    dec  [hl]                                     ; $5FC1: $35
    dec  [hl]                                     ; $5FC2: $35
    ld   hl, wEntitiesPosZTable                                ; $5FC3: $21 $10 $C3
    add  hl, bc                                   ; $5FC6: $09
    ld   a, [hl]                                  ; $5FC7: $7E
    and  $80                                      ; $5FC8: $E6 $80
    ret  z                                        ; $5FCA: $C8

    ld   [hl], b                                  ; $5FCB: $70
    ld   hl, wEntitiesWalkingTable                ; $5FCC: $21 $90 $C2
    add  hl, bc                                   ; $5FCF: $09
    ld   a, [hl]                                  ; $5FD0: $7E
    inc  [hl]                                     ; $5FD1: $34
    cp   $04                                      ; $5FD2: $FE $04
    jp   z, label_007_7EA4                        ; $5FD4: $CA $A4 $7E

    ld   e, a                                     ; $5FD7: $5F
    ld   d, b                                     ; $5FD8: $50
    ld   hl, $5F9F                                ; $5FD9: $21 $9F $5F
    add  hl, de                                   ; $5FDC: $19
    ld   a, [hl]                                  ; $5FDD: $7E
    ld   hl, wEntitiesSpeedZTable                                ; $5FDE: $21 $20 $C3
    add  hl, bc                                   ; $5FE1: $09
    ld   [hl], a                                  ; $5FE2: $77
    call GetRandomByte                            ; $5FE3: $CD $0D $28
    and  $03                                      ; $5FE6: $E6 $03
    ld   e, a                                     ; $5FE8: $5F
    ld   d, b                                     ; $5FE9: $50
    ld   hl, $5FA3                                ; $5FEA: $21 $A3 $5F
    add  hl, de                                   ; $5FED: $19
    ld   a, [hl]                                  ; $5FEE: $7E
    ld   hl, wEntity0SpeedX                       ; $5FEF: $21 $40 $C2
    add  hl, bc                                   ; $5FF2: $09
    ld   [hl], a                                  ; $5FF3: $77
    ld   hl, $5FA7                                ; $5FF4: $21 $A7 $5F
    add  hl, de                                   ; $5FF7: $19

jr_007_5FF8:
    ld   a, [hl]                                  ; $5FF8: $7E
    call func_007_4005                            ; $5FF9: $CD $05 $40
    ld   [hl], a                                  ; $5FFC: $77
    ld   a, e                                     ; $5FFD: $7B
    and  $01                                      ; $5FFE: $E6 $01
    jp   label_3B0C                               ; $6000: $C3 $0C $3B

    ld   c, [hl]                                  ; $6003: $4E
    nop                                           ; $6004: $00
    ld   c, [hl]                                  ; $6005: $4E
    jr   nz, jr_007_5FF8                          ; $6006: $20 $F0

    ld   [$07FE], a                               ; $6008: $EA $FE $07
    jr   nz, jr_007_602A                          ; $600B: $20 $1D

    ld   a, [wLinkMotionState]                    ; $600D: $FA $1C $C1
    cp   $05                                      ; $6010: $FE $05
    jr   nz, jr_007_6019                          ; $6012: $20 $05

    ld   a, $10                                   ; $6014: $3E $10
    ld   [$C5AE], a                               ; $6016: $EA $AE $C5

jr_007_6019:
    ldh  a, [hMapRoom]                            ; $6019: $F0 $F6
    ld   hl, $C3E0                                ; $601B: $21 $E0 $C3
    add  hl, bc                                   ; $601E: $09
    ld   [hl], a                                  ; $601F: $77
    ld   hl, wEntitiesPosXSignTable                                ; $6020: $21 $20 $C2
    add  hl, bc                                   ; $6023: $09
    ld   [hl], b                                  ; $6024: $70
    ld   hl, wEntitiesPosYSignTable                                ; $6025: $21 $30 $C2
    add  hl, bc                                   ; $6028: $09
    ld   [hl], b                                  ; $6029: $70

jr_007_602A:
    ld   de, $6003                                ; $602A: $11 $03 $60
    call RenderAnimatedActiveEntity                               ; $602D: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $6030: $FA $24 $C1
    and  a                                        ; $6033: $A7
    ret  nz                                       ; $6034: $C0

    ldh  a, [hMapRoom]                            ; $6035: $F0 $F6
    ld   [wDB6F], a                               ; $6037: $EA $6F $DB
    ldh  a, [wActiveEntityPosX]                   ; $603A: $F0 $EE
    ld   [wDB70], a                               ; $603C: $EA $70 $DB
    ldh  a, [$FFEF]                               ; $603F: $F0 $EF
    ld   [wDB71], a                               ; $6041: $EA $71 $DB
    ld   a, [wDialogState]                        ; $6044: $FA $9F $C1
    and  a                                        ; $6047: $A7
    ret  nz                                       ; $6048: $C0

    ldh  a, [hActiveEntityState]                   ; $6049: $F0 $EA
    cp   $02                                      ; $604B: $FE $02
    ret  z                                        ; $604D: $C8

    call label_C56                                ; $604E: $CD $56 $0C
    call label_3B70                               ; $6051: $CD $70 $3B
    call func_007_7E0A                            ; $6054: $CD $0A $7E
    call func_007_7E43                            ; $6057: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $605A: $21 $20 $C3
    add  hl, bc                                   ; $605D: $09
    dec  [hl]                                     ; $605E: $35
    dec  [hl]                                     ; $605F: $35
    ld   hl, wEntitiesPosZTable                                ; $6060: $21 $10 $C3
    add  hl, bc                                   ; $6063: $09
    ld   a, [hl]                                  ; $6064: $7E
    ldh  [hFFE9], a                               ; $6065: $E0 $E9
    and  $80                                      ; $6067: $E6 $80
    ldh  [hFFE8], a                               ; $6069: $E0 $E8
    jr   z, jr_007_608F                           ; $606B: $28 $22

    ld   [hl], b                                  ; $606D: $70
    ld   hl, wEntitiesSpeedZTable                                ; $606E: $21 $20 $C3
    add  hl, bc                                   ; $6071: $09
    ld   a, [hl]                                  ; $6072: $7E
    sra  a                                        ; $6073: $CB $2F
    cpl                                           ; $6075: $2F
    cp   $07                                      ; $6076: $FE $07
    jr   c, jr_007_6082                           ; $6078: $38 $08

    push af                                       ; $607A: $F5
    ld   a, $17                                   ; $607B: $3E $17
    ldh  [hNoiseSfx], a                            ; $607D: $E0 $F4
    pop  af                                       ; $607F: $F1
    jr   jr_007_6083                              ; $6080: $18 $01

jr_007_6082:
    xor  a                                        ; $6082: $AF

jr_007_6083:
    ld   [hl], a                                  ; $6083: $77
    ld   hl, wEntity0SpeedX                       ; $6084: $21 $40 $C2
    add  hl, bc                                   ; $6087: $09
    sra  [hl]                                     ; $6088: $CB $2E
    call func_007_4005                            ; $608A: $CD $05 $40
    sra  [hl]                                     ; $608D: $CB $2E

jr_007_608F:
    ld   hl, $C410                                ; $608F: $21 $10 $C4
    add  hl, bc                                   ; $6092: $09
    ld   [hl], $03                                ; $6093: $36 $03
    ld   e, $03                                   ; $6095: $1E $03
    ld   a, e                                     ; $6097: $7B
    ldh  [$FFED], a                               ; $6098: $E0 $ED
    ld   hl, wEntity0PosY                         ; $609A: $21 $10 $C2
    add  hl, bc                                   ; $609D: $09
    ld   a, [hl]                                  ; $609E: $7E
    add  e                                        ; $609F: $83
    ld   [hl], a                                  ; $60A0: $77
    ldh  a, [$FFEF]                               ; $60A1: $F0 $EF
    add  e                                        ; $60A3: $83
    ldh  [$FFEF], a                               ; $60A4: $E0 $EF
    call label_3B23                               ; $60A6: $CD $23 $3B
    ldh  a, [$FFED]                               ; $60A9: $F0 $ED
    ld   e, a                                     ; $60AB: $5F
    ld   hl, wEntity0PosY                         ; $60AC: $21 $10 $C2
    add  hl, bc                                   ; $60AF: $09
    ld   a, [hl]                                  ; $60B0: $7E
    sub  e                                        ; $60B1: $93
    ld   [hl], a                                  ; $60B2: $77
    ldh  a, [$FFEF]                               ; $60B3: $F0 $EF
    sub  e                                        ; $60B5: $93
    ldh  [$FFEF], a                               ; $60B6: $E0 $EF
    ldh  a, [hActiveEntityWalking]                ; $60B8: $F0 $F0
    rst  $00                                      ; $60BA: $C7
    pop  bc                                       ; $60BB: $C1
    ld   h, b                                     ; $60BC: $60
    inc  [hl]                                     ; $60BD: $34
    ld   h, c                                     ; $60BE: $61
    dec  [hl]                                     ; $60BF: $35
    ld   h, c                                     ; $60C0: $61
    ldh  a, [hFFE9]                               ; $60C1: $F0 $E9
    dec  a                                        ; $60C3: $3D
    and  $80                                      ; $60C4: $E6 $80
    jr   z, jr_007_60DD                           ; $60C6: $28 $15

    ld   hl, wEntity0SpeedY                       ; $60C8: $21 $50 $C2
    call func_007_60D1                            ; $60CB: $CD $D1 $60
    ld   hl, wEntity0SpeedX                       ; $60CE: $21 $40 $C2

func_007_60D1:
    add  hl, bc                                   ; $60D1: $09
    ld   a, [hl]                                  ; $60D2: $7E
    and  a                                        ; $60D3: $A7
    jr   z, jr_007_60DD                           ; $60D4: $28 $07

    and  $80                                      ; $60D6: $E6 $80
    jr   z, jr_007_60DC                           ; $60D8: $28 $02

    inc  [hl]                                     ; $60DA: $34
    inc  [hl]                                     ; $60DB: $34

jr_007_60DC:
    dec  [hl]                                     ; $60DC: $35

jr_007_60DD:
    call label_3B5A                               ; $60DD: $CD $5A $3B
    jr   nc, jr_007_6133                          ; $60E0: $30 $51

    ld   a, [$C19B]                               ; $60E2: $FA $9B $C1
    and  a                                        ; $60E5: $A7
    jr   nz, jr_007_6133                          ; $60E6: $20 $4B

    ld   a, [wAButtonSlot]                        ; $60E8: $FA $00 $DB
    cp   $03                                      ; $60EB: $FE $03
    jr   nz, jr_007_60F7                          ; $60ED: $20 $08

    ldh  a, [hJoypadState]                               ; $60EF: $F0 $CC
    and  $20                                      ; $60F1: $E6 $20
    jr   nz, jr_007_6104                          ; $60F3: $20 $0F

    jr   jr_007_6133                              ; $60F5: $18 $3C

jr_007_60F7:
    ld   a, [wBButtonSlot]                        ; $60F7: $FA $01 $DB
    cp   $03                                      ; $60FA: $FE $03
    jr   nz, jr_007_6133                          ; $60FC: $20 $35

    ldh  a, [hJoypadState]                               ; $60FE: $F0 $CC
    and  $10                                      ; $6100: $E6 $10
    jr   z, jr_007_6133                           ; $6102: $28 $2F

jr_007_6104:
    ld   a, [$C3CF]                               ; $6104: $FA $CF $C3
    and  a                                        ; $6107: $A7
    jr   nz, jr_007_6133                          ; $6108: $20 $29

    inc  a                                        ; $610A: $3C
    ld   [$C3CF], a                               ; $610B: $EA $CF $C3
    ldh  a, [hActiveEntityState]                   ; $610E: $F0 $EA
    cp   $07                                      ; $6110: $FE $07
    jr   z, jr_007_6133                           ; $6112: $28 $1F

    call IncrementEntityWalkingAttr               ; $6114: $CD $12 $3B
    ld   [hl], $02                                ; $6117: $36 $02
    ld   hl, wEntity0State                         ; $6119: $21 $80 $C2
    add  hl, bc                                   ; $611C: $09
    ld   [hl], $07                                ; $611D: $36 $07
    ld   hl, $C490                                ; $611F: $21 $90 $C4
    add  hl, bc                                   ; $6122: $09
    ld   [hl], b                                  ; $6123: $70
    ldh  a, [hLinkDirection]                      ; $6124: $F0 $9E
    ld   [wC15D], a                               ; $6126: $EA $5D $C1
    call GetEntityTransitionCountdown                 ; $6129: $CD $05 $0C
    ld   [hl], $02                                ; $612C: $36 $02
    ld   hl, hWaveSfx                                 ; $612E: $21 $F3 $FF
    ld   [hl], $02                                ; $6131: $36 $02

jr_007_6133:
    ret                                           ; $6133: $C9

    ret                                           ; $6134: $C9

    ldh  a, [hFFE8]                               ; $6135: $F0 $E8
    and  a                                        ; $6137: $A7
    jr   nz, jr_007_6159                          ; $6138: $20 $1F

    ld   hl, wEntitiesCollisionsTable             ; $613A: $21 $A0 $C2
    add  hl, bc                                   ; $613D: $09
    ld   a, [hl]                                  ; $613E: $7E
    and  a                                        ; $613F: $A7
    jr   z, jr_007_6164                           ; $6140: $28 $22

func_007_6142:
    ld   a, $07                                   ; $6142: $3E $07
    ldh  [hJingle], a                             ; $6144: $E0 $F2
    ld   hl, wEntity0SpeedX                       ; $6146: $21 $40 $C2
    add  hl, bc                                   ; $6149: $09
    ld   a, [hl]                                  ; $614A: $7E
    cpl                                           ; $614B: $2F
    inc  a                                        ; $614C: $3C
    sra  a                                        ; $614D: $CB $2F
    ld   [hl], a                                  ; $614F: $77
    call func_007_4005                            ; $6150: $CD $05 $40
    ld   a, [hl]                                  ; $6153: $7E
    cpl                                           ; $6154: $2F
    inc  a                                        ; $6155: $3C
    sra  a                                        ; $6156: $CB $2F
    ld   [hl], a                                  ; $6158: $77

jr_007_6159:
    ld   hl, $C5D0                                ; $6159: $21 $D0 $C5
    add  hl, bc                                   ; $615C: $09
    ld   [hl], $FF                                ; $615D: $36 $FF
    call IncrementEntityWalkingAttr               ; $615F: $CD $12 $3B
    ld   [hl], b                                  ; $6162: $70
    ret                                           ; $6163: $C9

jr_007_6164:
    call func_007_7D96                            ; $6164: $CD $96 $7D
    ld   a, $0B                                   ; $6167: $3E $0B
    ld   [$C19E], a                               ; $6169: $EA $9E $C1
    call label_3B7B                               ; $616C: $CD $7B $3B
    ld   e, $0F                                   ; $616F: $1E $0F
    ld   d, b                                     ; $6171: $50

jr_007_6172:
    ld   hl, wEntity0State                         ; $6172: $21 $80 $C2
    add  hl, de                                   ; $6175: $19
    ld   a, [hl]                                  ; $6176: $7E
    and  a                                        ; $6177: $A7
    jr   z, jr_007_6188                           ; $6178: $28 $0E

    ld   hl, wEntitiesTypeTable                   ; $617A: $21 $A0 $C3
    add  hl, de                                   ; $617D: $19
    ld   a, [hl]                                  ; $617E: $7E
    cp   $A7                                      ; $617F: $FE $A7
    jr   nz, jr_007_6188                          ; $6181: $20 $05

    push de                                       ; $6183: $D5
    call func_007_618F                            ; $6184: $CD $8F $61
    pop  de                                       ; $6187: $D1

jr_007_6188:
    dec  e                                        ; $6188: $1D
    ld   a, e                                     ; $6189: $7B
    cp   $FF                                      ; $618A: $FE $FF
    jr   nz, jr_007_6172                          ; $618C: $20 $E4

    ret                                           ; $618E: $C9

func_007_618F:
    call GetEntityTransitionCountdown                 ; $618F: $CD $05 $0C
    jr   nz, jr_007_61CD                          ; $6192: $20 $39

    ld   hl, wEntity0PosX                         ; $6194: $21 $00 $C2
    add  hl, de                                   ; $6197: $19
    ldh  a, [wActiveEntityPosX]                   ; $6198: $F0 $EE
    sub  [hl]                                     ; $619A: $96
    add  $10                                      ; $619B: $C6 $10
    cp   $20                                      ; $619D: $FE $20
    jr   nc, jr_007_61CD                          ; $619F: $30 $2C

    ld   hl, wEntity0PosY                         ; $61A1: $21 $10 $C2
    add  hl, de                                   ; $61A4: $19
    ldh  a, [wActiveEntityPosY]                   ; $61A5: $F0 $EC
    sub  [hl]                                     ; $61A7: $96
    add  $18                                      ; $61A8: $C6 $18
    cp   $28                                      ; $61AA: $FE $28
    jr   nc, jr_007_61CD                          ; $61AC: $30 $1F

    call func_007_6142                            ; $61AE: $CD $42 $61
    ld   a, $25                                   ; $61B1: $3E $25
    ldh  [hNoiseSfx], a                            ; $61B3: $E0 $F4
    ld   a, $0B                                   ; $61B5: $3E $0B
    ldh  [hJingle], a                             ; $61B7: $E0 $F2
    call GetEntityTransitionCountdown                 ; $61B9: $CD $05 $0C
    ld   [hl], $10                                ; $61BC: $36 $10
    ld   hl, wEntitiesWalkingTable                ; $61BE: $21 $90 $C2
    add  hl, de                                   ; $61C1: $19
    ld   a, [hl]                                  ; $61C2: $7E
    and  a                                        ; $61C3: $A7
    jr   nz, jr_007_61CD                          ; $61C4: $20 $07

    inc  [hl]                                     ; $61C6: $34
    ld   hl, wEntitiesTransitionCountdownTable           ; $61C7: $21 $E0 $C2
    add  hl, de                                   ; $61CA: $19
    ld   [hl], $50                                ; $61CB: $36 $50

jr_007_61CD:
    ret                                           ; $61CD: $C9

    ld   d, b                                     ; $61CE: $50
    rlca                                          ; $61CF: $07
    ld   d, b                                     ; $61D0: $50
    daa                                           ; $61D1: $27
    ld   de, $61CE                                ; $61D2: $11 $CE $61
    call RenderAnimatedActiveEntity                               ; $61D5: $CD $C0 $3B
    call func_007_7D96                            ; $61D8: $CD $96 $7D
    call func_007_639E                            ; $61DB: $CD $9E $63
    ld   hl, wEntitiesUnknownTableD               ; $61DE: $21 $D0 $C2
    add  hl, bc                                   ; $61E1: $09
    ld   a, [hl]                                  ; $61E2: $7E
    ld   e, a                                     ; $61E3: $5F
    and  a                                        ; $61E4: $A7
    jr   nz, jr_007_61FA                          ; $61E5: $20 $13

    ld   hl, wEntitiesUnknownTableC               ; $61E7: $21 $C0 $C2
    add  hl, bc                                   ; $61EA: $09
    ld   a, [hl]                                  ; $61EB: $7E
    and  a                                        ; $61EC: $A7
    jr   z, jr_007_6248                           ; $61ED: $28 $59

    call func_007_631C                            ; $61EF: $CD $1C $63
    ld   hl, wEntitiesUnknownTableD               ; $61F2: $21 $D0 $C2
    add  hl, de                                   ; $61F5: $19
    ld   [hl], $F0                                ; $61F6: $36 $F0
    ld   e, $10                                   ; $61F8: $1E $10

jr_007_61FA:
    ldh  a, [hFrameCounter]                       ; $61FA: $F0 $E7
    and  $01                                      ; $61FC: $E6 $01
    jr   nz, jr_007_620E                          ; $61FE: $20 $0E

    call func_007_4005                            ; $6200: $CD $05 $40
    ld   a, [hl]                                  ; $6203: $7E
    sub  e                                        ; $6204: $93
    jr   z, jr_007_620E                           ; $6205: $28 $07

    and  $80                                      ; $6207: $E6 $80
    jr   z, jr_007_620D                           ; $6209: $28 $02

    inc  [hl]                                     ; $620B: $34
    inc  [hl]                                     ; $620C: $34

jr_007_620D:
    dec  [hl]                                     ; $620D: $35

jr_007_620E:
    ld   hl, $C350                                ; $620E: $21 $50 $C3
    add  hl, bc                                   ; $6211: $09
    ld   [hl], $02                                ; $6212: $36 $02
    call func_007_4005                            ; $6214: $CD $05 $40
    ld   a, [hl]                                  ; $6217: $7E
    push hl                                       ; $6218: $E5
    push af                                       ; $6219: $F5
    ld   [hl], e                                  ; $621A: $73
    ld   hl, wEntity0PosY                         ; $621B: $21 $10 $C2
    add  hl, bc                                   ; $621E: $09
    ld   a, [hl]                                  ; $621F: $7E
    push hl                                       ; $6220: $E5
    push af                                       ; $6221: $F5
    call label_3B23                               ; $6222: $CD $23 $3B
    pop  af                                       ; $6225: $F1
    pop  hl                                       ; $6226: $E1
    ld   [hl], a                                  ; $6227: $77
    pop  af                                       ; $6228: $F1
    pop  hl                                       ; $6229: $E1
    ld   [hl], a                                  ; $622A: $77
    ld   hl, $C350                                ; $622B: $21 $50 $C3
    add  hl, bc                                   ; $622E: $09
    ld   [hl], $30                                ; $622F: $36 $30
    ld   hl, wEntitiesCollisionsTable             ; $6231: $21 $A0 $C2
    add  hl, bc                                   ; $6234: $09
    ld   a, [hl]                                  ; $6235: $7E
    and  a                                        ; $6236: $A7
    jr   z, jr_007_6246                           ; $6237: $28 $0D

    call func_007_4005                            ; $6239: $CD $05 $40
    ld   [hl], b                                  ; $623C: $70
    call func_007_631C                            ; $623D: $CD $1C $63
    ld   hl, wEntity0SpeedY                       ; $6240: $21 $50 $C2
    add  hl, de                                   ; $6243: $19
    ld   [hl], $00                                ; $6244: $36 $00

jr_007_6246:
    jr   jr_007_625F                              ; $6246: $18 $17

jr_007_6248:
    call func_007_4005                            ; $6248: $CD $05 $40
    ld   a, [hl]                                  ; $624B: $7E
    and  a                                        ; $624C: $A7
    jr   z, jr_007_6256                           ; $624D: $28 $07

    and  $80                                      ; $624F: $E6 $80
    jr   z, jr_007_6255                           ; $6251: $28 $02

    inc  [hl]                                     ; $6253: $34
    inc  [hl]                                     ; $6254: $34

jr_007_6255:
    dec  [hl]                                     ; $6255: $35

jr_007_6256:
    call func_007_631C                            ; $6256: $CD $1C $63
    ld   hl, wEntitiesUnknownTableD               ; $6259: $21 $D0 $C2
    add  hl, de                                   ; $625C: $19
    ld   [hl], $00                                ; $625D: $36 $00

jr_007_625F:
    ldh  a, [$FFEF]                               ; $625F: $F0 $EF
    and  $0F                                      ; $6261: $E6 $0F
    cp   $00                                      ; $6263: $FE $00
    jr   nz, jr_007_62D1                          ; $6265: $20 $6A

    ldh  a, [$FFEF]                               ; $6267: $F0 $EF
    sub  $10                                      ; $6269: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $626B: $E0 $CD
    and  $F0                                      ; $626D: $E6 $F0
    ld   e, a                                     ; $626F: $5F
    ldh  a, [wActiveEntityPosX]                   ; $6270: $F0 $EE
    sub  $08                                      ; $6272: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $6274: $E0 $CE
    swap a                                        ; $6276: $CB $37
    and  $0F                                      ; $6278: $E6 $0F
    or   e                                        ; $627A: $B3
    ld   e, a                                     ; $627B: $5F
    ld   d, b                                     ; $627C: $50
    call func_007_4005                            ; $627D: $CD $05 $40
    ld   a, [hl]                                  ; $6280: $7E
    and  a                                        ; $6281: $A7
    jr   z, jr_007_62D1                           ; $6282: $28 $4D

    and  $80                                      ; $6284: $E6 $80
    jr   nz, jr_007_62D2                          ; $6286: $20 $4A

    ld   hl, wRoomObjects                         ; $6288: $21 $11 $D7
    add  hl, de                                   ; $628B: $19
    ld   [hl], $4D                                ; $628C: $36 $4D
    call label_2887                               ; $628E: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $6291: $F0 $FE
    and  a                                        ; $6293: $A7
    jr   z, jr_007_62A2                           ; $6294: $28 $0C

    push bc                                       ; $6296: $C5
    ld   a, $4D                                   ; $6297: $3E $4D
    ld   [$DDD8], a                               ; $6299: $EA $D8 $DD
    ld   a, $07                                   ; $629C: $3E $07
    call label_91D                                ; $629E: $CD $1D $09
    pop  bc                                       ; $62A1: $C1

jr_007_62A2:
    ld   hl, wRequestDestinationHigh              ; $62A2: $21 $01 $D6
    ld   a, [wRequests]                           ; $62A5: $FA $00 $D6
    ld   e, a                                     ; $62A8: $5F
    add  $0A                                      ; $62A9: $C6 $0A
    ld   [wRequests], a                           ; $62AB: $EA $00 $D6
    ld   d, $00                                   ; $62AE: $16 $00
    add  hl, de                                   ; $62B0: $19
    ldh  a, [$FFCF]                               ; $62B1: $F0 $CF
    ld   [hl+], a                                 ; $62B3: $22
    ldh  a, [$FFD0]                               ; $62B4: $F0 $D0
    ld   [hl+], a                                 ; $62B6: $22
    ld   a, $81                                   ; $62B7: $3E $81
    ld   [hl+], a                                 ; $62B9: $22
    ld   a, $44                                   ; $62BA: $3E $44
    ld   [hl+], a                                 ; $62BC: $22
    ld   a, $54                                   ; $62BD: $3E $54
    ld   [hl+], a                                 ; $62BF: $22
    ldh  a, [$FFCF]                               ; $62C0: $F0 $CF
    ld   [hl+], a                                 ; $62C2: $22
    ldh  a, [$FFD0]                               ; $62C3: $F0 $D0
    inc  a                                        ; $62C5: $3C
    ld   [hl+], a                                 ; $62C6: $22
    ld   a, $81                                   ; $62C7: $3E $81
    ld   [hl+], a                                 ; $62C9: $22
    ld   a, $45                                   ; $62CA: $3E $45
    ld   [hl+], a                                 ; $62CC: $22
    ld   a, $55                                   ; $62CD: $3E $55
    ld   [hl+], a                                 ; $62CF: $22
    ld   [hl], b                                  ; $62D0: $70

jr_007_62D1:
    ret                                           ; $62D1: $C9

jr_007_62D2:
    ld   hl, wRoomObjects                         ; $62D2: $21 $11 $D7
    add  hl, de                                   ; $62D5: $19
    ld   [hl], $04                                ; $62D6: $36 $04
    call label_2887                               ; $62D8: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $62DB: $F0 $FE
    and  a                                        ; $62DD: $A7
    jr   z, jr_007_62EC                           ; $62DE: $28 $0C

    push bc                                       ; $62E0: $C5
    ld   a, $04                                   ; $62E1: $3E $04
    ld   [$DDD8], a                               ; $62E3: $EA $D8 $DD
    ld   a, $07                                   ; $62E6: $3E $07
    call label_91D                                ; $62E8: $CD $1D $09
    pop  bc                                       ; $62EB: $C1

jr_007_62EC:
    ld   hl, wRequestDestinationHigh              ; $62EC: $21 $01 $D6
    ld   a, [wRequests]                           ; $62EF: $FA $00 $D6
    ld   e, a                                     ; $62F2: $5F
    add  $0A                                      ; $62F3: $C6 $0A
    ld   [wRequests], a                           ; $62F5: $EA $00 $D6
    ld   d, $00                                   ; $62F8: $16 $00
    add  hl, de                                   ; $62FA: $19
    ldh  a, [$FFCF]                               ; $62FB: $F0 $CF
    ld   [hl+], a                                 ; $62FD: $22
    ldh  a, [$FFD0]                               ; $62FE: $F0 $D0
    ld   [hl+], a                                 ; $6300: $22
    ld   a, $81                                   ; $6301: $3E $81
    ld   [hl+], a                                 ; $6303: $22
    ld   a, $7E                                   ; $6304: $3E $7E
    ld   [hl+], a                                 ; $6306: $22
    ld   a, $7E                                   ; $6307: $3E $7E
    ld   [hl+], a                                 ; $6309: $22
    ldh  a, [$FFCF]                               ; $630A: $F0 $CF
    ld   [hl+], a                                 ; $630C: $22
    ldh  a, [$FFD0]                               ; $630D: $F0 $D0
    inc  a                                        ; $630F: $3C
    ld   [hl+], a                                 ; $6310: $22
    ld   a, $81                                   ; $6311: $3E $81
    ld   [hl+], a                                 ; $6313: $22
    ld   a, $7E                                   ; $6314: $3E $7E
    ld   [hl+], a                                 ; $6316: $22
    ld   a, $7E                                   ; $6317: $3E $7E
    ld   [hl+], a                                 ; $6319: $22
    ld   [hl], b                                  ; $631A: $70
    ret                                           ; $631B: $C9

func_007_631C:
    ld   hl, $C460                                ; $631C: $21 $60 $C4
    add  hl, bc                                   ; $631F: $09
    ld   a, [hl]                                  ; $6320: $7E
    xor  $01                                      ; $6321: $EE $01
    ldh  [hScratchA], a                           ; $6323: $E0 $D7
    ld   e, b                                     ; $6325: $58
    ld   d, b                                     ; $6326: $50

jr_007_6327:
    ld   hl, wEntity0State                         ; $6327: $21 $80 $C2
    add  hl, de                                   ; $632A: $19
    ld   a, [hl]                                  ; $632B: $7E
    and  a                                        ; $632C: $A7
    jr   z, jr_007_6341                           ; $632D: $28 $12

    ld   hl, wEntitiesTypeTable                   ; $632F: $21 $A0 $C3
    add  hl, de                                   ; $6332: $19
    ld   a, [hl]                                  ; $6333: $7E
    cp   $A6                                      ; $6334: $FE $A6
    jr   nz, jr_007_6341                          ; $6336: $20 $09

    ld   hl, $C460                                ; $6338: $21 $60 $C4
    add  hl, de                                   ; $633B: $19
    ldh  a, [hScratchA]                           ; $633C: $F0 $D7
    cp   [hl]                                     ; $633E: $BE
    jr   z, jr_007_6347                           ; $633F: $28 $06

jr_007_6341:
    inc  e                                        ; $6341: $1C
    ld   a, e                                     ; $6342: $7B
    cp   $10                                      ; $6343: $FE $10
    jr   nz, jr_007_6327                          ; $6345: $20 $E0

jr_007_6347:
    ret                                           ; $6347: $C9

    nop                                           ; $6348: $00
    nop                                           ; $6349: $00
    ld   d, b                                     ; $634A: $50
    rlca                                          ; $634B: $07
    nop                                           ; $634C: $00
    ld   [$0752], sp                              ; $634D: $08 $52 $07
    nop                                           ; $6350: $00
    db   $10                                      ; $6351: $10
    ld   d, d                                     ; $6352: $52
    daa                                           ; $6353: $27
    nop                                           ; $6354: $00
    jr   @+$52                                    ; $6355: $18 $50

    daa                                           ; $6357: $27
    ld   hl, $6348                                ; $6358: $21 $48 $63
    ld   c, $04                                   ; $635B: $0E $04
    call label_3CE6                               ; $635D: $CD $E6 $3C
    call func_007_7D96                            ; $6360: $CD $96 $7D
    call GetEntityTransitionCountdown                 ; $6363: $CD $05 $0C
    ld   e, a                                     ; $6366: $5F
    ld   hl, $C3D0                                ; $6367: $21 $D0 $C3
    add  hl, bc                                   ; $636A: $09
    inc  [hl]                                     ; $636B: $34
    ld   a, [hl]                                  ; $636C: $7E
    and  $03                                      ; $636D: $E6 $03
    or   e                                        ; $636F: $B3
    jr   nz, jr_007_639E                          ; $6370: $20 $2C

    ldh  a, [hActiveEntityType]                     ; $6372: $F0 $EB
    cp   $A4                                      ; $6374: $FE $A4
    jp   z, $63FB                                 ; $6376: $CA $FB $63

    ld   hl, wEntitiesUnknownTableB               ; $6379: $21 $B0 $C2
    add  hl, bc                                   ; $637C: $09
    ld   e, [hl]                                  ; $637D: $5E
    ld   d, b                                     ; $637E: $50
    ld   hl, $63F7                                ; $637F: $21 $F7 $63
    add  hl, de                                   ; $6382: $19
    ld   a, [hl]                                  ; $6383: $7E
    ld   hl, wEntity0SpeedX                       ; $6384: $21 $40 $C2
    add  hl, bc                                   ; $6387: $09
    add  [hl]                                     ; $6388: $86
    ld   [hl], a                                  ; $6389: $77
    ld   hl, $63F9                                ; $638A: $21 $F9 $63
    add  hl, de                                   ; $638D: $19
    cp   [hl]                                     ; $638E: $BE
    jr   nz, jr_007_639E                          ; $638F: $20 $0D

    ld   hl, wEntitiesUnknownTableB               ; $6391: $21 $B0 $C2
    add  hl, bc                                   ; $6394: $09
    ld   a, [hl]                                  ; $6395: $7E
    xor  $01                                      ; $6396: $EE $01
    ld   [hl], a                                  ; $6398: $77
    call GetEntityTransitionCountdown                 ; $6399: $CD $05 $0C
    ld   [hl], $6A                                ; $639C: $36 $6A

func_007_639E:
label_007_639E:
jr_007_639E:
    ld   hl, wEntitiesUnknownTableC               ; $639E: $21 $C0 $C2
    add  hl, bc                                   ; $63A1: $09
    ld   [hl], b                                  ; $63A2: $70
    ldh  a, [wActiveEntityPosX]                   ; $63A3: $F0 $EE
    push af                                       ; $63A5: $F5
    call func_007_7E0A                            ; $63A6: $CD $0A $7E
    pop  af                                       ; $63A9: $F1
    ld   e, a                                     ; $63AA: $5F
    ld   hl, wEntity0PosX                         ; $63AB: $21 $00 $C2
    add  hl, bc                                   ; $63AE: $09
    ld   a, [hl]                                  ; $63AF: $7E
    sub  e                                        ; $63B0: $93
    ldh  [hFFE8], a                               ; $63B1: $E0 $E8
    call label_3B23                               ; $63B3: $CD $23 $3B
    call label_3B5A                               ; $63B6: $CD $5A $3B
    jr   nc, jr_007_63F6                          ; $63B9: $30 $3B

    ldh  a, [hLinkPositionYIncrement]             ; $63BB: $F0 $9B
    and  $80                                      ; $63BD: $E6 $80
    jr   nz, jr_007_63F6                          ; $63BF: $20 $35

    call func_007_7E6D                            ; $63C1: $CD $6D $7E
    add  $08                                      ; $63C4: $C6 $08
    bit  7, a                                     ; $63C6: $CB $7F
    jr   z, jr_007_63F6                           ; $63C8: $28 $2C

    ld   hl, wEntity0PosY                         ; $63CA: $21 $10 $C2
    add  hl, bc                                   ; $63CD: $09
    ld   a, [hl]                                  ; $63CE: $7E
    sub  $10                                      ; $63CF: $D6 $10
    ldh  [hLinkPositionY], a                      ; $63D1: $E0 $99
    ldh  a, [hLinkPositionXIncrement]             ; $63D3: $F0 $9A
    push af                                       ; $63D5: $F5
    ldh  a, [hFFE8]                               ; $63D6: $F0 $E8
    ldh  [hLinkPositionXIncrement], a             ; $63D8: $E0 $9A
    ld   hl, hLinkPositionX                       ; $63DA: $21 $98 $FF
    add  [hl]                                     ; $63DD: $86
    ld   [hl], a                                  ; $63DE: $77
    push bc                                       ; $63DF: $C5
    call label_3E19                               ; $63E0: $CD $19 $3E
    pop  bc                                       ; $63E3: $C1
    pop  af                                       ; $63E4: $F1
    ldh  [hLinkPositionXIncrement], a             ; $63E5: $E0 $9A
    ld   a, $02                                   ; $63E7: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $63E9: $E0 $9B
    ld   a, $01                                   ; $63EB: $3E $01
    ld   [$C147], a                               ; $63ED: $EA $47 $C1
    ld   hl, wEntitiesUnknownTableC               ; $63F0: $21 $C0 $C2
    add  hl, bc                                   ; $63F3: $09
    ld   [hl], $10                                ; $63F4: $36 $10

jr_007_63F6:
    ret                                           ; $63F6: $C9

    ld   bc, $06FF                                ; $63F7: $01 $FF $06
    ld   a, [$B021]                               ; $63FA: $FA $21 $B0
    jp   nz, label_007_5E09                       ; $63FD: $C2 $09 $5E

    ld   d, b                                     ; $6400: $50
    ld   hl, $63F7                                ; $6401: $21 $F7 $63
    add  hl, de                                   ; $6404: $19
    ld   a, [hl]                                  ; $6405: $7E
    call func_007_4005                            ; $6406: $CD $05 $40
    add  [hl]                                     ; $6409: $86
    ld   [hl], a                                  ; $640A: $77
    ld   hl, $63F9                                ; $640B: $21 $F9 $63
    add  hl, de                                   ; $640E: $19
    cp   [hl]                                     ; $640F: $BE
    jr   nz, jr_007_641F                          ; $6410: $20 $0D

    ld   hl, wEntitiesUnknownTableB               ; $6412: $21 $B0 $C2
    add  hl, bc                                   ; $6415: $09
    ld   a, [hl]                                  ; $6416: $7E
    xor  $01                                      ; $6417: $EE $01
    ld   [hl], a                                  ; $6419: $77
    call GetEntityTransitionCountdown                 ; $641A: $CD $05 $0C
    ld   [hl], $6A                                ; $641D: $36 $6A

jr_007_641F:
    jp   label_007_639E                           ; $641F: $C3 $9E $63

    nop                                           ; $6422: $00
    nop                                           ; $6423: $00
    ld   d, b                                     ; $6424: $50
    rlca                                          ; $6425: $07
    nop                                           ; $6426: $00
    ld   [$0752], sp                              ; $6427: $08 $52 $07
    nop                                           ; $642A: $00
    db   $10                                      ; $642B: $10
    ld   d, d                                     ; $642C: $52
    daa                                           ; $642D: $27
    nop                                           ; $642E: $00
    jr   jr_007_6481                              ; $642F: $18 $50

    daa                                           ; $6431: $27
    call IsEntityUnknownFZero                                ; $6432: $CD $00 $0C
    jr   z, jr_007_643B                           ; $6435: $28 $04

    ld   a, $04                                   ; $6437: $3E $04
    ldh  [hFFF5], a                               ; $6439: $E0 $F5

jr_007_643B:
    ld   hl, $6422                                ; $643B: $21 $22 $64
    ld   c, $04                                   ; $643E: $0E $04
    call label_3CE6                               ; $6440: $CD $E6 $3C
    call func_007_7D96                            ; $6443: $CD $96 $7D
    call func_007_639E                            ; $6446: $CD $9E $63
    ld   hl, wEntitiesUnknownTableC               ; $6449: $21 $C0 $C2
    add  hl, bc                                   ; $644C: $09
    ld   a, [hl]                                  ; $644D: $7E
    and  a                                        ; $644E: $A7
    jr   z, jr_007_6489                           ; $644F: $28 $38

    ld   e, $04                                   ; $6451: $1E $04
    ldh  a, [hMapRoom]                            ; $6453: $F0 $F6
    cp   $3B                                      ; $6455: $FE $3B
    jr   z, jr_007_6466                           ; $6457: $28 $0D

    call IsEntityUnknownFZero                                ; $6459: $CD $00 $0C
    ld   [hl], $08                                ; $645C: $36 $08
    ld   a, [$C3CF]                               ; $645E: $FA $CF $C3
    and  a                                        ; $6461: $A7
    jr   z, jr_007_6489                           ; $6462: $28 $25

    ld   e, $04                                   ; $6464: $1E $04

jr_007_6466:
    ld   hl, $C440                                ; $6466: $21 $40 $C4
    add  hl, bc                                   ; $6469: $09
    ld   a, [hl]                                  ; $646A: $7E
    cp   $04                                      ; $646B: $FE $04
    jr   z, jr_007_6478                           ; $646D: $28 $09

    inc  [hl]                                     ; $646F: $34
    cp   $03                                      ; $6470: $FE $03
    jr   nz, jr_007_6478                          ; $6472: $20 $04

    ld   a, $11                                   ; $6474: $3E $11
    ldh  [hNoiseSfx], a                            ; $6476: $E0 $F4

jr_007_6478:
    ldh  a, [hFrameCounter]                       ; $6478: $F0 $E7
    and  $03                                      ; $647A: $E6 $03
    jr   nz, jr_007_6488                          ; $647C: $20 $0A

    call func_007_4005                            ; $647E: $CD $05 $40

jr_007_6481:
    ld   a, [hl]                                  ; $6481: $7E
    sub  e                                        ; $6482: $93
    and  $80                                      ; $6483: $E6 $80
    jr   z, jr_007_6488                           ; $6485: $28 $01

    inc  [hl]                                     ; $6487: $34

jr_007_6488:
    ret                                           ; $6488: $C9

jr_007_6489:
    call func_007_4005                            ; $6489: $CD $05 $40
    ld   [hl], b                                  ; $648C: $70
    ld   hl, $C440                                ; $648D: $21 $40 $C4
    add  hl, bc                                   ; $6490: $09
    ld   [hl], b                                  ; $6491: $70
    ret                                           ; $6492: $C9

    sbc  b                                        ; $6493: $98
    nop                                           ; $6494: $00
    ld   d, e                                     ; $6495: $53
    ld   a, a                                     ; $6496: $7F
    sbc  b                                        ; $6497: $98
    jr   nz, jr_007_64ED                          ; $6498: $20 $53

    ld   a, a                                     ; $649A: $7F
    sbc  b                                        ; $649B: $98
    ld   b, b                                     ; $649C: $40
    ld   d, e                                     ; $649D: $53
    ld   a, a                                     ; $649E: $7F
    sbc  b                                        ; $649F: $98
    ld   h, b                                     ; $64A0: $60
    ld   d, e                                     ; $64A1: $53
    ld   a, a                                     ; $64A2: $7F
    sbc  b                                        ; $64A3: $98
    add  b                                        ; $64A4: $80
    ld   d, e                                     ; $64A5: $53
    ld   a, a                                     ; $64A6: $7F
    sbc  b                                        ; $64A7: $98
    and  b                                        ; $64A8: $A0
    ld   d, e                                     ; $64A9: $53
    ld   a, a                                     ; $64AA: $7F
    sbc  b                                        ; $64AB: $98
    ret  nz                                       ; $64AC: $C0

    ld   d, e                                     ; $64AD: $53
    ld   a, a                                     ; $64AE: $7F
    sbc  b                                        ; $64AF: $98
    ldh  [rHDMA3], a                              ; $64B0: $E0 $53
    ld   a, a                                     ; $64B2: $7F
    sbc  c                                        ; $64B3: $99
    nop                                           ; $64B4: $00
    ld   d, e                                     ; $64B5: $53
    ld   a, a                                     ; $64B6: $7F
    sbc  c                                        ; $64B7: $99
    jr   nz, jr_007_650D                          ; $64B8: $20 $53

    ld   a, a                                     ; $64BA: $7F
    sbc  c                                        ; $64BB: $99
    ld   b, b                                     ; $64BC: $40
    ld   d, e                                     ; $64BD: $53
    ld   a, a                                     ; $64BE: $7F
    sbc  c                                        ; $64BF: $99
    ld   h, b                                     ; $64C0: $60
    ld   d, e                                     ; $64C1: $53
    ld   a, a                                     ; $64C2: $7F
    sbc  c                                        ; $64C3: $99
    add  b                                        ; $64C4: $80
    ld   d, e                                     ; $64C5: $53
    ld   a, a                                     ; $64C6: $7F
    sbc  c                                        ; $64C7: $99
    and  b                                        ; $64C8: $A0
    ld   d, e                                     ; $64C9: $53
    ld   a, a                                     ; $64CA: $7F
    sbc  c                                        ; $64CB: $99
    ret  nz                                       ; $64CC: $C0

    ld   d, e                                     ; $64CD: $53
    ld   a, a                                     ; $64CE: $7F
    sbc  c                                        ; $64CF: $99
    ldh  [rHDMA3], a                              ; $64D0: $E0 $53
    ld   a, a                                     ; $64D2: $7F
    sbc  d                                        ; $64D3: $9A
    nop                                           ; $64D4: $00
    ld   d, e                                     ; $64D5: $53
    ld   a, a                                     ; $64D6: $7F
    sbc  d                                        ; $64D7: $9A
    jr   nz, @+$55                                ; $64D8: $20 $53

    ld   a, a                                     ; $64DA: $7F
    sbc  b                                        ; $64DB: $98
    nop                                           ; $64DC: $00
    ld   d, e                                     ; $64DD: $53
    ld   bc, label_2098                           ; $64DE: $01 $98 $20
    ld   d, e                                     ; $64E1: $53
    ld   bc, $4098                                ; $64E2: $01 $98 $40
    ld   d, e                                     ; $64E5: $53
    ld   bc, $6098                                ; $64E6: $01 $98 $60
    ld   d, e                                     ; $64E9: $53
    ld   bc, $8098                                ; $64EA: $01 $98 $80

jr_007_64ED:
    ld   d, e                                     ; $64ED: $53
    ld   bc, $A098                                ; $64EE: $01 $98 $A0
    ld   d, e                                     ; $64F1: $53
    ld   bc, $C098                                ; $64F2: $01 $98 $C0
    ld   d, e                                     ; $64F5: $53
    ld   bc, $E098                                ; $64F6: $01 $98 $E0
    ld   d, e                                     ; $64F9: $53
    ld   bc, $0099                                ; $64FA: $01 $99 $00
    ld   d, e                                     ; $64FD: $53
    ld   bc, $2099                                ; $64FE: $01 $99 $20
    ld   d, e                                     ; $6501: $53
    ld   bc, $4099                                ; $6502: $01 $99 $40
    ld   d, e                                     ; $6505: $53
    ld   bc, $6099                                ; $6506: $01 $99 $60
    ld   d, e                                     ; $6509: $53
    ld   bc, $8099                                ; $650A: $01 $99 $80

jr_007_650D:
    ld   d, e                                     ; $650D: $53
    ld   bc, $A099                                ; $650E: $01 $99 $A0
    ld   d, e                                     ; $6511: $53
    ld   bc, $C099                                ; $6512: $01 $99 $C0
    ld   d, e                                     ; $6515: $53
    ld   bc, $E099                                ; $6516: $01 $99 $E0
    ld   d, e                                     ; $6519: $53
    ld   bc, $009A                                ; $651A: $01 $9A $00
    ld   d, e                                     ; $651D: $53
    ld   bc, $209A                                ; $651E: $01 $9A $20
    ld   d, e                                     ; $6521: $53
    ld   bc, $E0AF                                ; $6522: $01 $AF $E0
    sub  [hl]                                     ; $6525: $96
    ldh  [hBaseScrollY], a                        ; $6526: $E0 $97
    ld   [wBGOriginLow], a                        ; $6528: $EA $2F $C1
    ld   [wBGOriginHigh], a                       ; $652B: $EA $2E $C1
    ld   hl, wLCDControl                          ; $652E: $21 $FD $D6
    res  5, [hl]                                  ; $6531: $CB $AE
    ld   hl, $C3D0                                ; $6533: $21 $D0 $C3
    add  hl, bc                                   ; $6536: $09
    ld   a, [hl]                                  ; $6537: $7E
    cp   $09                                      ; $6538: $FE $09
    jr   z, jr_007_659D                           ; $653A: $28 $61

    ld   a, [wRequests]                           ; $653C: $FA $00 $D6
    ld   e, a                                     ; $653F: $5F
    add  $08                                      ; $6540: $C6 $08
    ld   [wRequests], a                           ; $6542: $EA $00 $D6
    ld   d, b                                     ; $6545: $50
    push bc                                       ; $6546: $C5
    ld   hl, $C3D0                                ; $6547: $21 $D0 $C3
    add  hl, bc                                   ; $654A: $09
    ld   c, [hl]                                  ; $654B: $4E
    sla  c                                        ; $654C: $CB $21
    sla  c                                        ; $654E: $CB $21
    sla  c                                        ; $6550: $CB $21
    ld   hl, $6493                                ; $6552: $21 $93 $64
    add  hl, bc                                   ; $6555: $09
    ld   c, l                                     ; $6556: $4D
    ld   b, h                                     ; $6557: $44
    ld   hl, wRequestDestinationHigh              ; $6558: $21 $01 $D6
    add  hl, de                                   ; $655B: $19
    ld   e, $08                                   ; $655C: $1E $08

jr_007_655E:
    ld   a, [bc]                                  ; $655E: $0A
    inc  bc                                       ; $655F: $03
    ld   [hl+], a                                 ; $6560: $22
    dec  e                                        ; $6561: $1D
    jr   nz, jr_007_655E                          ; $6562: $20 $FA

    ld   [hl], $00                                ; $6564: $36 $00
    ldh  a, [hIsGBC]                              ; $6566: $F0 $FE
    and  a                                        ; $6568: $A7
    jr   z, jr_007_6596                           ; $6569: $28 $2B

    pop  bc                                       ; $656B: $C1
    ld   a, [$DC90]                               ; $656C: $FA $90 $DC
    ld   e, a                                     ; $656F: $5F
    add  $08                                      ; $6570: $C6 $08
    ld   [$DC90], a                               ; $6572: $EA $90 $DC
    ld   d, b                                     ; $6575: $50
    push bc                                       ; $6576: $C5
    ld   hl, $C3D0                                ; $6577: $21 $D0 $C3
    add  hl, bc                                   ; $657A: $09
    ld   c, [hl]                                  ; $657B: $4E
    sla  c                                        ; $657C: $CB $21
    sla  c                                        ; $657E: $CB $21
    sla  c                                        ; $6580: $CB $21
    ld   hl, $6493                                ; $6582: $21 $93 $64
    add  hl, bc                                   ; $6585: $09
    ld   c, l                                     ; $6586: $4D
    ld   b, h                                     ; $6587: $44
    ld   hl, $DC91                                ; $6588: $21 $91 $DC
    add  hl, de                                   ; $658B: $19
    ld   e, $08                                   ; $658C: $1E $08

jr_007_658E:
    ld   a, [bc]                                  ; $658E: $0A
    inc  bc                                       ; $658F: $03
    ld   [hl+], a                                 ; $6590: $22
    dec  e                                        ; $6591: $1D
    jr   nz, jr_007_658E                          ; $6592: $20 $FA

    ld   [hl], $00                                ; $6594: $36 $00

jr_007_6596:
    pop  bc                                       ; $6596: $C1
    ld   hl, $C3D0                                ; $6597: $21 $D0 $C3
    add  hl, bc                                   ; $659A: $09
    inc  [hl]                                     ; $659B: $34
    ret                                           ; $659C: $C9

jr_007_659D:
    call GetEntityTransitionCountdown                 ; $659D: $CD $05 $0C
    ret  nz                                       ; $65A0: $C0

    ldh  a, [hMapId]                              ; $65A1: $F0 $F7
    add  $50                                      ; $65A3: $C6 $50
    call OpenDialogInTable1                       ; $65A5: $CD $73 $23
    ld   a, $E4                                   ; $65A8: $3E $E4
    ld   [wBGPalette], a                          ; $65AA: $EA $97 $DB
    ldh  a, [hIsGBC]                              ; $65AD: $F0 $FE
    and  a                                        ; $65AF: $A7
    jr   z, jr_007_65CB                           ; $65B0: $28 $19

    ld   de, $DC18                                ; $65B2: $11 $18 $DC
    ld   hl, $FF70                                ; $65B5: $21 $70 $FF
    di                                            ; $65B8: $F3

jr_007_65B9:
    ld   [hl], $02                                ; $65B9: $36 $02
    ld   a, [de]                                  ; $65BB: $1A
    ld   [hl], $00                                ; $65BC: $36 $00
    ld   [de], a                                  ; $65BE: $12
    inc  de                                       ; $65BF: $13
    ld   a, e                                     ; $65C0: $7B
    and  $07                                      ; $65C1: $E6 $07
    jr   nz, jr_007_65B9                          ; $65C3: $20 $F4

    ld   a, $01                                   ; $65C5: $3E $01
    ld   [wPaletteDataFlags], a                    ; $65C7: $EA $D1 $DD
    ei                                            ; $65CA: $FB

jr_007_65CB:
    jp   label_007_7EA4                           ; $65CB: $C3 $A4 $7E

    ld   c, d                                     ; $65CE: $4A
    ld   [bc], a                                  ; $65CF: $02
    ld   c, h                                     ; $65D0: $4C
    ld   [bc], a                                  ; $65D1: $02
    ld   c, h                                     ; $65D2: $4C
    ld   [hl+], a                                 ; $65D3: $22
    ld   c, d                                     ; $65D4: $4A
    ld   [hl+], a                                 ; $65D5: $22
    ld   c, [hl]                                  ; $65D6: $4E
    ld   [bc], a                                  ; $65D7: $02
    ld   c, [hl]                                  ; $65D8: $4E
    ld   [hl+], a                                 ; $65D9: $22
    ld   hl, wEntitiesUnknownTableB               ; $65DA: $21 $B0 $C2
    add  hl, bc                                   ; $65DD: $09
    ld   a, [hl]                                  ; $65DE: $7E
    and  a                                        ; $65DF: $A7
    jp   nz, $6523                                ; $65E0: $C2 $23 $65

    ld   de, $65CE                                ; $65E3: $11 $CE $65
    call RenderAnimatedActiveEntity                               ; $65E6: $CD $C0 $3B
    call func_007_7D96                            ; $65E9: $CD $96 $7D
    call func_007_7DC3                            ; $65EC: $CD $C3 $7D
    ldh  a, [hIsSideScrolling]                    ; $65EF: $F0 $F9
    and  a                                        ; $65F1: $A7
    jp   nz, label_007_6693                       ; $65F2: $C2 $93 $66

    ldh  a, [hActiveEntityWalking]                ; $65F5: $F0 $F0
    rst  $00                                      ; $65F7: $C7
    ld   b, $66                                   ; $65F8: $06 $66
    ld   c, c                                     ; $65FA: $49
    ld   h, [hl]                                  ; $65FB: $66
    ld   l, e                                     ; $65FC: $6B
    ld   h, [hl]                                  ; $65FD: $66
    ld   [$00F8], sp                              ; $65FE: $08 $F8 $00
    nop                                           ; $6601: $00
    nop                                           ; $6602: $00
    nop                                           ; $6603: $00
    ld   hl, sp+$08                               ; $6604: $F8 $08
    call label_3B70                               ; $6606: $CD $70 $3B
    call func_007_66F2                            ; $6609: $CD $F2 $66
    call GetEntityTransitionCountdown                 ; $660C: $CD $05 $0C
    jr   nz, jr_007_6647                          ; $660F: $20 $36

    call GetRandomByte                            ; $6611: $CD $0D $28
    and  $3F                                      ; $6614: $E6 $3F
    add  $30                                      ; $6616: $C6 $30
    ld   [hl], a                                  ; $6618: $77
    ld   hl, $C3D0                                ; $6619: $21 $D0 $C3
    add  hl, bc                                   ; $661C: $09
    ld   a, [hl]                                  ; $661D: $7E
    inc  a                                        ; $661E: $3C
    ld   [hl], a                                  ; $661F: $77
    cp   $04                                      ; $6620: $FE $04
    jr   nz, jr_007_662A                          ; $6622: $20 $06

    ld   [hl], b                                  ; $6624: $70
    call func_007_7E7D                            ; $6625: $CD $7D $7E
    jr   jr_007_6630                              ; $6628: $18 $06

jr_007_662A:
    call GetRandomByte                            ; $662A: $CD $0D $28
    and  $03                                      ; $662D: $E6 $03
    ld   e, a                                     ; $662F: $5F

jr_007_6630:
    ld   d, b                                     ; $6630: $50
    ld   hl, $65FE                                ; $6631: $21 $FE $65
    add  hl, de                                   ; $6634: $19
    ld   a, [hl]                                  ; $6635: $7E
    ld   hl, wEntity0SpeedX                       ; $6636: $21 $40 $C2
    add  hl, bc                                   ; $6639: $09
    ld   [hl], a                                  ; $663A: $77
    ld   hl, $6602                                ; $663B: $21 $02 $66
    add  hl, de                                   ; $663E: $19
    ld   a, [hl]                                  ; $663F: $7E
    call func_007_4005                            ; $6640: $CD $05 $40
    ld   [hl], a                                  ; $6643: $77
    call IncrementEntityWalkingAttr               ; $6644: $CD $12 $3B

jr_007_6647:
    jr   jr_007_6660                              ; $6647: $18 $17

    call label_3B70                               ; $6649: $CD $70 $3B
    call func_007_66F2                            ; $664C: $CD $F2 $66
    call GetEntityTransitionCountdown                 ; $664F: $CD $05 $0C
    jr   nz, jr_007_665A                          ; $6652: $20 $06

    ld   [hl], $20                                ; $6654: $36 $20
    call IncrementEntityWalkingAttr               ; $6656: $CD $12 $3B
    ld   [hl], b                                  ; $6659: $70

jr_007_665A:
    call func_007_7E0A                            ; $665A: $CD $0A $7E
    call label_3B23                               ; $665D: $CD $23 $3B

label_007_6660:
jr_007_6660:
    ldh  a, [hFrameCounter]                       ; $6660: $F0 $E7
    rra                                           ; $6662: $1F
    rra                                           ; $6663: $1F
    rra                                           ; $6664: $1F
    rra                                           ; $6665: $1F
    and  $01                                      ; $6666: $E6 $01
    jp   label_3B0C                               ; $6668: $C3 $0C $3B

jr_007_666B:
    ld   hl, $C340                                ; $666B: $21 $40 $C3
    add  hl, bc                                   ; $666E: $09
    ld   [hl], $C2                                ; $666F: $36 $C2
    call GetEntityTransitionCountdown                 ; $6671: $CD $05 $0C
    jr   nz, jr_007_668E                          ; $6674: $20 $18

    ld   hl, $C4E0                                ; $6676: $21 $E0 $C4
    add  hl, bc                                   ; $6679: $09
    ld   [hl], $2D                                ; $667A: $36 $2D
    ld   hl, $C480                                ; $667C: $21 $80 $C4
    add  hl, bc                                   ; $667F: $09
    ld   [hl], $0C                                ; $6680: $36 $0C
    ld   hl, wEntity0State                         ; $6682: $21 $80 $C2
    add  hl, bc                                   ; $6685: $09
    ld   [hl], $01                                ; $6686: $36 $01
    ld   hl, $C340                                ; $6688: $21 $40 $C3
    add  hl, bc                                   ; $668B: $09
    ld   [hl], $04                                ; $668C: $36 $04

jr_007_668E:
    ld   a, $02                                   ; $668E: $3E $02
    jp   label_3B0C                               ; $6690: $C3 $0C $3B

label_007_6693:
    ldh  a, [hActiveEntityWalking]                ; $6693: $F0 $F0
    cp   $02                                      ; $6695: $FE $02
    jr   z, jr_007_666B                           ; $6697: $28 $D2

    call label_3B70                               ; $6699: $CD $70 $3B
    call func_007_66FE                            ; $669C: $CD $FE $66
    ldh  a, [hActiveEntityWalking]                ; $669F: $F0 $F0
    rst  $00                                      ; $66A1: $C7
    and  [hl]                                     ; $66A2: $A6
    ld   h, [hl]                                  ; $66A3: $66
    cp   b                                        ; $66A4: $B8
    ld   h, [hl]                                  ; $66A5: $66
    call func_007_7E5D                            ; $66A6: $CD $5D $7E
    ld   a, $08                                   ; $66A9: $3E $08
    dec  e                                        ; $66AB: $1D
    jr   nz, jr_007_66B0                          ; $66AC: $20 $02

    ld   a, $F8                                   ; $66AE: $3E $F8

jr_007_66B0:
    ld   hl, wEntity0SpeedX                       ; $66B0: $21 $40 $C2
    add  hl, bc                                   ; $66B3: $09
    ld   [hl], a                                  ; $66B4: $77
    jp   IncrementEntityWalkingAttr               ; $66B5: $C3 $12 $3B

    call func_007_7E0A                            ; $66B8: $CD $0A $7E
    call func_007_4005                            ; $66BB: $CD $05 $40
    inc  [hl]                                     ; $66BE: $34
    inc  [hl]                                     ; $66BF: $34
    call label_3B23                               ; $66C0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66C3: $21 $A0 $C2
    add  hl, bc                                   ; $66C6: $09
    ld   a, [hl]                                  ; $66C7: $7E
    and  $03                                      ; $66C8: $E6 $03
    jr   z, jr_007_66D4                           ; $66CA: $28 $08

    ld   hl, wEntity0SpeedX                       ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    cpl                                           ; $66D1: $2F
    inc  a                                        ; $66D2: $3C
    ld   [hl], a                                  ; $66D3: $77

jr_007_66D4:
    ld   hl, wEntitiesCollisionsTable             ; $66D4: $21 $A0 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    and  $08                                      ; $66D9: $E6 $08
    jr   z, jr_007_66EE                           ; $66DB: $28 $11

    ld   hl, wEntity0PosY                         ; $66DD: $21 $10 $C2
    add  hl, bc                                   ; $66E0: $09
    ld   a, [hl]                                  ; $66E1: $7E
    and  $F0                                      ; $66E2: $E6 $F0
    add  $03                                      ; $66E4: $C6 $03
    ld   [hl], a                                  ; $66E6: $77
    call func_007_4005                            ; $66E7: $CD $05 $40
    ld   [hl], b                                  ; $66EA: $70
    jp   label_007_6660                           ; $66EB: $C3 $60 $66

jr_007_66EE:
    xor  a                                        ; $66EE: $AF
    jp   label_3B0C                               ; $66EF: $C3 $0C $3B

func_007_66F2:
    ldh  a, [$FFA2]                               ; $66F2: $F0 $A2
    and  a                                        ; $66F4: $A7
    jp   z, label_3B5A                            ; $66F5: $CA $5A $3B

    cp   $08                                      ; $66F8: $FE $08
    jp   c, label_3B5A                            ; $66FA: $DA $5A $3B

    ret                                           ; $66FD: $C9

func_007_66FE:
    jp   label_3B5A                               ; $66FE: $C3 $5A $3B

    ld   b, b                                     ; $6701: $40
    ld   [bc], a                                  ; $6702: $02
    ld   b, b                                     ; $6703: $40
    ld   [hl+], a                                 ; $6704: $22
    ld   b, d                                     ; $6705: $42
    ld   [bc], a                                  ; $6706: $02
    ld   b, d                                     ; $6707: $42
    ld   [hl+], a                                 ; $6708: $22
    ld   de, $6701                                ; $6709: $11 $01 $67
    call RenderAnimatedActiveEntity                               ; $670C: $CD $C0 $3B
    call func_007_7D96                            ; $670F: $CD $96 $7D
    call func_007_7DC3                            ; $6712: $CD $C3 $7D
    call label_3B39                               ; $6715: $CD $39 $3B
    call func_007_7E0A                            ; $6718: $CD $0A $7E
    call func_007_7E43                            ; $671B: $CD $43 $7E
    call label_3B23                               ; $671E: $CD $23 $3B
    ld   hl, $C350                                ; $6721: $21 $50 $C3
    add  hl, bc                                   ; $6724: $09
    set  7, [hl]                                  ; $6725: $CB $FE
    ld   hl, $C430                                ; $6727: $21 $30 $C4
    add  hl, bc                                   ; $672A: $09
    set  6, [hl]                                  ; $672B: $CB $F6
    ldh  a, [hActiveEntityWalking]                ; $672D: $F0 $F0
    rst  $00                                      ; $672F: $C7
    ld   [hl], $67                                ; $6730: $36 $67
    sub  b                                        ; $6732: $90
    ld   h, a                                     ; $6733: $67
    rst  $10                                      ; $6734: $D7
    ld   h, a                                     ; $6735: $67
    ld   hl, wEntitiesPosZTable                                ; $6736: $21 $10 $C3
    add  hl, bc                                   ; $6739: $09
    ld   a, [hl]                                  ; $673A: $7E
    and  a                                        ; $673B: $A7
    jr   z, jr_007_6747                           ; $673C: $28 $09

    ldh  a, [hFrameCounter]                       ; $673E: $F0 $E7
    and  $07                                      ; $6740: $E6 $07
    jr   nz, jr_007_6753                          ; $6742: $20 $0F

    dec  [hl]                                     ; $6744: $35
    jr   jr_007_6753                              ; $6745: $18 $0C

jr_007_6747:
    ld   hl, $C350                                ; $6747: $21 $50 $C3
    add  hl, bc                                   ; $674A: $09
    res  7, [hl]                                  ; $674B: $CB $BE
    ld   hl, $C430                                ; $674D: $21 $30 $C4
    add  hl, bc                                   ; $6750: $09
    res  6, [hl]                                  ; $6751: $CB $B6

jr_007_6753:
    ldh  a, [hFrameCounter]                       ; $6753: $F0 $E7
    and  $07                                      ; $6755: $E6 $07
    jr   nz, jr_007_6776                          ; $6757: $20 $1D

    ld   hl, wEntity0SpeedX                       ; $6759: $21 $40 $C2
    add  hl, bc                                   ; $675C: $09
    ld   a, [hl]                                  ; $675D: $7E
    and  a                                        ; $675E: $A7
    jr   z, jr_007_6768                           ; $675F: $28 $07

    and  $80                                      ; $6761: $E6 $80
    jr   z, jr_007_6767                           ; $6763: $28 $02

    inc  [hl]                                     ; $6765: $34
    inc  [hl]                                     ; $6766: $34

jr_007_6767:
    dec  [hl]                                     ; $6767: $35

jr_007_6768:
    call func_007_4005                            ; $6768: $CD $05 $40
    ld   a, [hl]                                  ; $676B: $7E
    and  a                                        ; $676C: $A7
    jr   z, jr_007_6776                           ; $676D: $28 $07

    and  $80                                      ; $676F: $E6 $80
    jr   z, jr_007_6775                           ; $6771: $28 $02

    inc  [hl]                                     ; $6773: $34
    inc  [hl]                                     ; $6774: $34

jr_007_6775:
    dec  [hl]                                     ; $6775: $35

jr_007_6776:
    call label_BFB                                ; $6776: $CD $FB $0B
    jr   nz, jr_007_677E                          ; $6779: $20 $03

    call IncrementEntityWalkingAttr               ; $677B: $CD $12 $3B

jr_007_677E:
    ld   hl, wEntitiesUnknownTableB               ; $677E: $21 $B0 $C2
    add  hl, bc                                   ; $6781: $09
    ld   a, [hl]                                  ; $6782: $7E
    and  a                                        ; $6783: $A7
    jr   z, jr_007_678D                           ; $6784: $28 $07

    ldh  a, [hFrameCounter]                       ; $6786: $F0 $E7
    and  $1F                                      ; $6788: $E6 $1F
    jr   nz, jr_007_678D                          ; $678A: $20 $01

    dec  [hl]                                     ; $678C: $35

jr_007_678D:
    jp   label_007_67AE                           ; $678D: $C3 $AE $67

    ld   hl, wEntitiesUnknownTableB               ; $6790: $21 $B0 $C2
    add  hl, bc                                   ; $6793: $09
    ld   a, [hl]                                  ; $6794: $7E
    cp   $08                                      ; $6795: $FE $08
    jr   c, jr_007_67A7                           ; $6797: $38 $0E

    call label_BFB                                ; $6799: $CD $FB $0B
    call GetRandomByte                            ; $679C: $CD $0D $28
    and  $1F                                      ; $679F: $E6 $1F
    add  $80                                      ; $67A1: $C6 $80
    ld   [hl], a                                  ; $67A3: $77
    jp   IncrementEntityWalkingAttr               ; $67A4: $C3 $12 $3B

jr_007_67A7:
    ldh  a, [hFrameCounter]                       ; $67A7: $F0 $E7
    and  $0F                                      ; $67A9: $E6 $0F
    jr   nz, jr_007_67AE                          ; $67AB: $20 $01

    inc  [hl]                                     ; $67AD: $34

func_007_67AE:
label_007_67AE:
jr_007_67AE:
    ld   hl, wEntitiesUnknownTableB               ; $67AE: $21 $B0 $C2
    add  hl, bc                                   ; $67B1: $09
    ld   a, [hl]                                  ; $67B2: $7E
    ld   hl, $C3D0                                ; $67B3: $21 $D0 $C3
    add  hl, bc                                   ; $67B6: $09
    add  [hl]                                     ; $67B7: $86
    ld   [hl], a                                  ; $67B8: $77
    rra                                           ; $67B9: $1F
    rra                                           ; $67BA: $1F
    rra                                           ; $67BB: $1F
    rra                                           ; $67BC: $1F
    rra                                           ; $67BD: $1F
    and  $01                                      ; $67BE: $E6 $01
    jp   label_3B0C                               ; $67C0: $C3 $0C $3B

    nop                                           ; $67C3: $00
    dec  b                                        ; $67C4: $05
    ld   a, [bc]                                  ; $67C5: $0A
    dec  c                                        ; $67C6: $0D
    ld   c, $0D                                   ; $67C7: $0E $0D
    ld   a, [bc]                                  ; $67C9: $0A
    dec  b                                        ; $67CA: $05
    nop                                           ; $67CB: $00
    ei                                            ; $67CC: $FB
    or   $F3                                      ; $67CD: $F6 $F3
    ld   a, [c]                                   ; $67CF: $F2
    di                                            ; $67D0: $F3
    or   $FB                                      ; $67D1: $F6 $FB
    nop                                           ; $67D3: $00
    dec  b                                        ; $67D4: $05
    ld   a, [bc]                                  ; $67D5: $0A
    dec  c                                        ; $67D6: $0D
    call func_007_67AE                            ; $67D7: $CD $AE $67
    ld   hl, wEntitiesPosZTable                                ; $67DA: $21 $10 $C3
    add  hl, bc                                   ; $67DD: $09
    ld   a, [hl]                                  ; $67DE: $7E
    cp   $10                                      ; $67DF: $FE $10
    jr   z, jr_007_67EB                           ; $67E1: $28 $08

    ldh  a, [hFrameCounter]                       ; $67E3: $F0 $E7
    and  $07                                      ; $67E5: $E6 $07
    jr   nz, jr_007_67EA                          ; $67E7: $20 $01

    inc  [hl]                                     ; $67E9: $34

jr_007_67EA:
    ret                                           ; $67EA: $C9

jr_007_67EB:
    call label_BFB                                ; $67EB: $CD $FB $0B
    jr   nz, jr_007_67F6                          ; $67EE: $20 $06

    ld   [hl], $60                                ; $67F0: $36 $60
    call IncrementEntityWalkingAttr               ; $67F2: $CD $12 $3B
    ld   [hl], b                                  ; $67F5: $70

jr_007_67F6:
    ld   hl, wEntitiesUnknownTableD               ; $67F6: $21 $D0 $C2
    add  hl, bc                                   ; $67F9: $09
    inc  [hl]                                     ; $67FA: $34
    ld   a, [hl]                                  ; $67FB: $7E
    cp   $18                                      ; $67FC: $FE $18
    jr   c, jr_007_683D                           ; $67FE: $38 $3D

    ld   [hl], b                                  ; $6800: $70
    ld   hl, wEntitiesUnknownTableC               ; $6801: $21 $C0 $C2
    add  hl, bc                                   ; $6804: $09
    ld   a, [hl]                                  ; $6805: $7E
    ld   hl, $C440                                ; $6806: $21 $40 $C4
    add  hl, bc                                   ; $6809: $09
    add  [hl]                                     ; $680A: $86
    and  $0F                                      ; $680B: $E6 $0F
    ld   [hl], a                                  ; $680D: $77
    ld   hl, $C440                                ; $680E: $21 $40 $C4
    add  hl, bc                                   ; $6811: $09
    ld   e, [hl]                                  ; $6812: $5E
    ld   d, b                                     ; $6813: $50
    ld   hl, $67C3                                ; $6814: $21 $C3 $67
    add  hl, de                                   ; $6817: $19
    ld   a, [hl]                                  ; $6818: $7E
    sra  a                                        ; $6819: $CB $2F
    call func_007_4005                            ; $681B: $CD $05 $40
    ld   [hl], a                                  ; $681E: $77
    ld   hl, $67C7                                ; $681F: $21 $C7 $67
    add  hl, de                                   ; $6822: $19
    ld   a, [hl]                                  ; $6823: $7E
    sra  a                                        ; $6824: $CB $2F
    ld   hl, wEntity0SpeedX                       ; $6826: $21 $40 $C2
    add  hl, bc                                   ; $6829: $09
    ld   [hl], a                                  ; $682A: $77
    call GetRandomByte                            ; $682B: $CD $0D $28
    and  $07                                      ; $682E: $E6 $07
    jr   nz, jr_007_683D                          ; $6830: $20 $0B

    call GetRandomByte                            ; $6832: $CD $0D $28
    and  $02                                      ; $6835: $E6 $02
    dec  a                                        ; $6837: $3D
    ld   hl, wEntitiesUnknownTableC               ; $6838: $21 $C0 $C2
    add  hl, bc                                   ; $683B: $09
    ld   [hl], a                                  ; $683C: $77

jr_007_683D:
    ret                                           ; $683D: $C9

    ld   b, h                                     ; $683E: $44
    inc  bc                                       ; $683F: $03
    ld   b, [hl]                                  ; $6840: $46
    inc  bc                                       ; $6841: $03
    ld   b, h                                     ; $6842: $44
    inc  bc                                       ; $6843: $03
    ld   c, b                                     ; $6844: $48
    inc  bc                                       ; $6845: $03
    ld   b, [hl]                                  ; $6846: $46
    inc  hl                                       ; $6847: $23
    ld   b, h                                     ; $6848: $44
    inc  hl                                       ; $6849: $23
    ld   c, b                                     ; $684A: $48
    inc  hl                                       ; $684B: $23
    ld   b, h                                     ; $684C: $44
    inc  hl                                       ; $684D: $23
    ld   hl, $C380                                ; $684E: $21 $80 $C3
    add  hl, bc                                   ; $6851: $09
    ldh  a, [hActiveEntityUnknownG]               ; $6852: $F0 $F1
    add  [hl]                                     ; $6854: $86
    ldh  [hActiveEntityUnknownG], a               ; $6855: $E0 $F1
    ld   de, $683E                                ; $6857: $11 $3E $68
    call RenderAnimatedActiveEntity                               ; $685A: $CD $C0 $3B
    call func_007_7D96                            ; $685D: $CD $96 $7D
    call func_007_7DC3                            ; $6860: $CD $C3 $7D
    call label_3B39                               ; $6863: $CD $39 $3B
    call func_007_7E0A                            ; $6866: $CD $0A $7E
    call label_3B23                               ; $6869: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $686C: $21 $A0 $C2
    add  hl, bc                                   ; $686F: $09
    ld   a, [hl]                                  ; $6870: $7E
    and  a                                        ; $6871: $A7
    jr   z, jr_007_6882                           ; $6872: $28 $0E

    call IncrementEntityWalkingAttr               ; $6874: $CD $12 $3B
    ld   [hl], b                                  ; $6877: $70
    call GetEntityTransitionCountdown                 ; $6878: $CD $05 $0C
    ld   [hl], $08                                ; $687B: $36 $08
    call IsEntityUnknownFZero                                ; $687D: $CD $00 $0C
    ld   [hl], $20                                ; $6880: $36 $20

jr_007_6882:
    ldh  a, [hActiveEntityWalking]                ; $6882: $F0 $F0
    rst  $00                                      ; $6884: $C7
    sub  a                                        ; $6885: $97
    ld   l, b                                     ; $6886: $68
    ret  c                                        ; $6887: $D8

    ld   l, b                                     ; $6888: $68
    add  hl, hl                                   ; $6889: $29
    ld   l, c                                     ; $688A: $69
    ld   [$00F8], sp                              ; $688B: $08 $F8 $00
    nop                                           ; $688E: $00
    nop                                           ; $688F: $00
    nop                                           ; $6890: $00
    ld   hl, sp+$08                               ; $6891: $F8 $08
    ld   [bc], a                                  ; $6893: $02
    nop                                           ; $6894: $00
    rst  $38                                      ; $6895: $FF
    rst  $38                                      ; $6896: $FF
    call GetEntityTransitionCountdown                 ; $6897: $CD $05 $0C
    jr   nz, jr_007_68D0                          ; $689A: $20 $34

    call IncrementEntityWalkingAttr               ; $689C: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $689F: $CD $05 $0C
    call GetRandomByte                            ; $68A2: $CD $0D $28
    and  $1F                                      ; $68A5: $E6 $1F
    add  $30                                      ; $68A7: $C6 $30
    ld   [hl], a                                  ; $68A9: $77
    and  $03                                      ; $68AA: $E6 $03
    ld   e, a                                     ; $68AC: $5F

func_007_68AD:
    ld   d, b                                     ; $68AD: $50
    ld   hl, $688B                                ; $68AE: $21 $8B $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntity0SpeedX                       ; $68B3: $21 $40 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, $688F                                ; $68B8: $21 $8F $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    call func_007_4005                            ; $68BD: $CD $05 $40
    ld   [hl], a                                  ; $68C0: $77
    ld   hl, $6893                                ; $68C1: $21 $93 $68
    add  hl, de                                   ; $68C4: $19
    ld   a, [hl]                                  ; $68C5: $7E
    cp   $FF                                      ; $68C6: $FE $FF
    jr   z, jr_007_68CF                           ; $68C8: $28 $05

    ld   hl, $C380                                ; $68CA: $21 $80 $C3
    add  hl, bc                                   ; $68CD: $09
    ld   [hl], a                                  ; $68CE: $77

jr_007_68CF:
    ret                                           ; $68CF: $C9

jr_007_68D0:
    call label_3D7F                               ; $68D0: $CD $7F $3D
    call func_007_68F0                            ; $68D3: $CD $F0 $68
    jr   jr_007_68E6                              ; $68D6: $18 $0E

    call GetEntityTransitionCountdown                 ; $68D8: $CD $05 $0C
    jr   nz, jr_007_68E3                          ; $68DB: $20 $06

    ld   [hl], $18                                ; $68DD: $36 $18
    call IncrementEntityWalkingAttr               ; $68DF: $CD $12 $3B
    ld   [hl], b                                  ; $68E2: $70

jr_007_68E3:
    call func_007_68F0                            ; $68E3: $CD $F0 $68

jr_007_68E6:
    ldh  a, [hFrameCounter]                       ; $68E6: $F0 $E7
    rra                                           ; $68E8: $1F
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    and  $01                                      ; $68EB: $E6 $01
    jp   label_3B0C                               ; $68ED: $C3 $0C $3B

func_007_68F0:
    call IsEntityUnknownFZero                                ; $68F0: $CD $00 $0C
    jr   nz, jr_007_6919                          ; $68F3: $20 $24

    call func_007_7E5D                            ; $68F5: $CD $5D $7E
    add  $08                                      ; $68F8: $C6 $08
    cp   $10                                      ; $68FA: $FE $10
    jr   nc, jr_007_691A                          ; $68FC: $30 $1C

    call func_007_7E6D                            ; $68FE: $CD $6D $7E

jr_007_6901:
    call func_007_68AD                            ; $6901: $CD $AD $68
    ld   hl, wEntity0SpeedX                       ; $6904: $21 $40 $C2
    add  hl, bc                                   ; $6907: $09
    sla  [hl]                                     ; $6908: $CB $26
    call func_007_4005                            ; $690A: $CD $05 $40
    sla  [hl]                                     ; $690D: $CB $26
    call IncrementEntityWalkingAttr               ; $690F: $CD $12 $3B
    ld   [hl], $02                                ; $6912: $36 $02
    call GetEntityTransitionCountdown                 ; $6914: $CD $05 $0C
    ld   [hl], $30                                ; $6917: $36 $30

jr_007_6919:
    ret                                           ; $6919: $C9

jr_007_691A:
    call func_007_7E6D                            ; $691A: $CD $6D $7E
    add  $08                                      ; $691D: $C6 $08
    cp   $10                                      ; $691F: $FE $10
    jr   nc, jr_007_6928                          ; $6921: $30 $05

    call func_007_7E5D                            ; $6923: $CD $5D $7E
    jr   jr_007_6901                              ; $6926: $18 $D9

jr_007_6928:
    ret                                           ; $6928: $C9

    call GetEntityTransitionCountdown                 ; $6929: $CD $05 $0C
    jr   nz, jr_007_6939                          ; $692C: $20 $0B

    ld   [hl], $20                                ; $692E: $36 $20
    call IncrementEntityWalkingAttr               ; $6930: $CD $12 $3B
    ld   [hl], b                                  ; $6933: $70
    call IsEntityUnknownFZero                                ; $6934: $CD $00 $0C
    ld   [hl], $40                                ; $6937: $36 $40

jr_007_6939:
    ldh  a, [hFrameCounter]                       ; $6939: $F0 $E7
    rra                                           ; $693B: $1F
    rra                                           ; $693C: $1F
    and  $01                                      ; $693D: $E6 $01
    jp   label_3B0C                               ; $693F: $C3 $0C $3B

    ld   a, [hl-]                                 ; $6942: $3A
    push de                                       ; $6943: $D5
    sub  $D7                                      ; $6944: $D6 $D7
    ld   a, [hl-]                                 ; $6946: $3A
    ld   a, [hl-]                                 ; $6947: $3A
    call $CEE1                                    ; $6948: $CD $E1 $CE
    ld   a, [hl-]                                 ; $694B: $3A
    inc  bc                                       ; $694C: $03
    add  hl, bc                                   ; $694D: $09
    inc  bc                                       ; $694E: $03
    add  hl, bc                                   ; $694F: $09
    add  $1B                                      ; $6950: $C6 $1B
    dec  de                                       ; $6952: $1B
    inc  bc                                       ; $6953: $03
    inc  bc                                       ; $6954: $03
    add  hl, bc                                   ; $6955: $09
    ld   c, $1B                                   ; $6956: $0E $1B
    dec  de                                       ; $6958: $1B
    dec  de                                       ; $6959: $1B
    dec  de                                       ; $695A: $1B
    ld   [bc], a                                  ; $695B: $02
    ld   [de], a                                  ; $695C: $12
    ld   [hl+], a                                 ; $695D: $22
    ld   [hl-], a                                 ; $695E: $32
    ld   b, d                                     ; $695F: $42
    nop                                           ; $6960: $00
    ld   [$1810], sp                              ; $6961: $08 $10 $18
    jr   nz, jr_007_698E                          ; $6964: $20 $28

    jr   nc, @+$3A                                ; $6966: $30 $38

    ld   b, b                                     ; $6968: $40
    ld   c, b                                     ; $6969: $48

label_007_696A:
    call func_007_7D96                            ; $696A: $CD $96 $7D
    ld   a, $02                                   ; $696D: $3E $02
    ldh  [$FFA1], a                               ; $696F: $E0 $A1
    ld   [wC167], a                               ; $6971: $EA $67 $C1
    ldh  a, [hActiveEntityWalking]                ; $6974: $F0 $F0
    rst  $00                                      ; $6976: $C7
    ld   a, a                                     ; $6977: $7F
    ld   l, c                                     ; $6978: $69
    adc  d                                        ; $6979: $8A
    ld   l, c                                     ; $697A: $69
    sub  [hl]                                     ; $697B: $96
    ld   l, c                                     ; $697C: $69
    and  d                                        ; $697D: $A2
    ld   l, c                                     ; $697E: $69
    call func_007_4000                            ; $697F: $CD $00 $40
    call GetEntityTransitionCountdown                 ; $6982: $CD $05 $0C
    ld   [hl], $28                                ; $6985: $36 $28
    jp   IncrementEntityWalkingAttr               ; $6987: $C3 $12 $3B

    call GetEntityTransitionCountdown                 ; $698A: $CD $05 $0C
    ret  nz                                       ; $698D: $C0

jr_007_698E:
    ld   a, $4C                                   ; $698E: $3E $4C
    ld   [wActiveMusicTrack], a                   ; $6990: $EA $68 $D3
    jp   IncrementEntityWalkingAttr               ; $6993: $C3 $12 $3B

    ld   a, $1D                                   ; $6996: $3E $1D
    ldh  [hNoiseSfx], a                            ; $6998: $E0 $F4
    call GetEntityTransitionCountdown                 ; $699A: $CD $05 $0C
    ld   [hl], $80                                ; $699D: $36 $80
    jp   IncrementEntityWalkingAttr               ; $699F: $C3 $12 $3B

    ldh  a, [hFrameCounter]                       ; $69A2: $F0 $E7
    ld   e, $00                                   ; $69A4: $1E $00
    and  $08                                      ; $69A6: $E6 $08
    jr   z, jr_007_69AC                           ; $69A8: $28 $02

    ld   e, $02                                   ; $69AA: $1E $02

jr_007_69AC:
    ld   a, e                                     ; $69AC: $7B
    ld   [wScreenShakeHorizontal], a              ; $69AD: $EA $55 $C1
    call GetEntityTransitionCountdown                 ; $69B0: $CD $05 $0C
    ret  nz                                       ; $69B3: $C0

    ld   hl, wEntitiesUnknownTableB               ; $69B4: $21 $B0 $C2
    add  hl, bc                                   ; $69B7: $09
    ld   a, [hl]                                  ; $69B8: $7E
    ld   e, a                                     ; $69B9: $5F
    inc  a                                        ; $69BA: $3C
    ld   [hl], a                                  ; $69BB: $77
    ldh  [hFFE8], a                               ; $69BC: $E0 $E8
    ld   a, e                                     ; $69BE: $7B
    and  $1F                                      ; $69BF: $E6 $1F
    jp   nz, label_007_69D0                       ; $69C1: $C2 $D0 $69

    ld   hl, $C3D0                                ; $69C4: $21 $D0 $C3
    add  hl, bc                                   ; $69C7: $09
    ld   a, [hl]                                  ; $69C8: $7E
    cp   $0A                                      ; $69C9: $FE $0A
    jp   z, label_007_6A34                        ; $69CB: $CA $34 $6A

    inc  a                                        ; $69CE: $3C
    ld   [hl], a                                  ; $69CF: $77

label_007_69D0:
    ld   hl, $C3D0                                ; $69D0: $21 $D0 $C3
    add  hl, bc                                   ; $69D3: $09
    push hl                                       ; $69D4: $E5
    ld   a, [hl]                                  ; $69D5: $7E
    ld   e, a                                     ; $69D6: $5F
    ld   d, b                                     ; $69D7: $50
    ld   hl, $695F                                ; $69D8: $21 $5F $69
    add  hl, de                                   ; $69DB: $19
    ld   a, [hl]                                  ; $69DC: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $69DD: $E0 $CD
    ld   a, $20                                   ; $69DF: $3E $20
    ldh  [hSwordIntersectedAreaX], a              ; $69E1: $E0 $CE
    call label_2887                               ; $69E3: $CD $87 $28
    pop  hl                                       ; $69E6: $E1
    ld   d, h                                     ; $69E7: $54
    ld   e, l                                     ; $69E8: $5D
    ld   hl, $DE01                                ; $69E9: $21 $01 $DE
    ld   a, $1A                                   ; $69EC: $3E $1A
    ld   [hl+], a                                 ; $69EE: $22
    ld   a, $71                                   ; $69EF: $3E $71
    ld   [hl+], a                                 ; $69F1: $22
    ld   a, $11                                   ; $69F2: $3E $11
    ld   [hl+], a                                 ; $69F4: $22
    ld   a, $07                                   ; $69F5: $3E $07
    ld   [hl], a                                  ; $69F7: $77
    call label_BD7                                ; $69F8: $CD $D7 $0B
    push bc                                       ; $69FB: $C5
    ld   hl, $C3D0                                ; $69FC: $21 $D0 $C3
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    dec  a                                        ; $6A01: $3D
    rra                                           ; $6A02: $1F
    and  $07                                      ; $6A03: $E6 $07
    push af                                       ; $6A05: $F5
    ld   e, a                                     ; $6A06: $5F
    ld   d, b                                     ; $6A07: $50
    ld   hl, $695B                                ; $6A08: $21 $5B $69
    add  hl, de                                   ; $6A0B: $19
    ld   e, [hl]                                  ; $6A0C: $5E
    ld   hl, wRoomObjects                         ; $6A0D: $21 $11 $D7
    add  hl, de                                   ; $6A10: $19
    ld   c, l                                     ; $6A11: $4D
    ld   b, h                                     ; $6A12: $44
    pop  af                                       ; $6A13: $F1
    ld   e, a                                     ; $6A14: $5F
    sla  a                                        ; $6A15: $CB $27
    sla  a                                        ; $6A17: $CB $27
    add  e                                        ; $6A19: $83
    ld   e, a                                     ; $6A1A: $5F
    ld   d, $00                                   ; $6A1B: $16 $00
    ld   hl, $6942                                ; $6A1D: $21 $42 $69
    add  hl, de                                   ; $6A20: $19
    ld   e, $05                                   ; $6A21: $1E $05

jr_007_6A23:
    ld   a, [hl+]                                 ; $6A23: $2A
    ld   [bc], a                                  ; $6A24: $02
    push hl                                       ; $6A25: $E5
    ld   h, b                                     ; $6A26: $60
    ld   l, c                                     ; $6A27: $69
    ld   a, $87                                   ; $6A28: $3E $87
    call label_B2F                                ; $6A2A: $CD $2F $0B
    pop  hl                                       ; $6A2D: $E1
    inc  bc                                       ; $6A2E: $03
    dec  e                                        ; $6A2F: $1D
    jr   nz, jr_007_6A23                          ; $6A30: $20 $F1

    pop  bc                                       ; $6A32: $C1
    ret                                           ; $6A33: $C9

label_007_6A34:
    xor  a                                        ; $6A34: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A35: $EA $55 $C1
    ld   [wC167], a                               ; $6A38: $EA $67 $C1
    call label_27DD                               ; $6A3B: $CD $DD $27
    jp   label_007_7EA4                           ; $6A3E: $C3 $A4 $7E

    ld   hl, $C440                                ; $6A41: $21 $40 $C4
    add  hl, bc                                   ; $6A44: $09
    ld   a, [hl]                                  ; $6A45: $7E
    cp   $FF                                      ; $6A46: $FE $FF
    jp   z, label_007_696A                        ; $6A48: $CA $6A $69

    and  a                                        ; $6A4B: $A7
    jr   nz, jr_007_6A52                          ; $6A4C: $20 $04

    inc  [hl]                                     ; $6A4E: $34
    call func_007_6ED0                            ; $6A4F: $CD $D0 $6E

jr_007_6A52:
    call func_007_6FB1                            ; $6A52: $CD $B1 $6F
    ldh  a, [hActiveEntityState]                   ; $6A55: $F0 $EA
    cp   $05                                      ; $6A57: $FE $05
    jp   nz, label_007_7EAA                       ; $6A59: $C2 $AA $7E

    call func_007_7D96                            ; $6A5C: $CD $96 $7D
    call label_394D                               ; $6A5F: $CD $4D $39
    call label_3EE8                               ; $6A62: $CD $E8 $3E
    ld   hl, $C420                                ; $6A65: $21 $20 $C4
    add  hl, bc                                   ; $6A68: $09
    ld   a, [hl]                                  ; $6A69: $7E
    cp   $16                                      ; $6A6A: $FE $16
    jr   nz, jr_007_6A89                          ; $6A6C: $20 $1B

    ldh  a, [hActiveEntityWalking]                ; $6A6E: $F0 $F0
    cp   $09                                      ; $6A70: $FE $09
    jr   nc, jr_007_6A84                          ; $6A72: $30 $10

    ld   [hl], b                                  ; $6A74: $70
    ld   hl, wEntitiesSpeedZTable                                ; $6A75: $21 $20 $C3
    add  hl, bc                                   ; $6A78: $09
    ld   [hl], b                                  ; $6A79: $70
    call IncrementEntityWalkingAttr               ; $6A7A: $CD $12 $3B
    ld   a, $09                                   ; $6A7D: $3E $09
    ld   [hl], a                                  ; $6A7F: $77
    ldh  [hActiveEntityWalking], a                ; $6A80: $E0 $F0
    jr   jr_007_6A89                              ; $6A82: $18 $05

jr_007_6A84:
    ld   hl, $C3D0                                ; $6A84: $21 $D0 $C3
    add  hl, bc                                   ; $6A87: $09
    inc  [hl]                                     ; $6A88: $34

jr_007_6A89:
    call func_007_7DC3                            ; $6A89: $CD $C3 $7D
    call func_007_7E43                            ; $6A8C: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $6A8F: $21 $20 $C3
    add  hl, bc                                   ; $6A92: $09
    dec  [hl]                                     ; $6A93: $35
    dec  [hl]                                     ; $6A94: $35
    ld   hl, wEntitiesPosZTable                                ; $6A95: $21 $10 $C3
    add  hl, bc                                   ; $6A98: $09
    ld   a, [hl]                                  ; $6A99: $7E
    and  $80                                      ; $6A9A: $E6 $80
    ldh  [hFFE8], a                               ; $6A9C: $E0 $E8
    jr   z, jr_007_6AA6                           ; $6A9E: $28 $06

    ld   [hl], b                                  ; $6AA0: $70
    ld   hl, wEntitiesSpeedZTable                                ; $6AA1: $21 $20 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], b                                  ; $6AA5: $70

jr_007_6AA6:
    ldh  a, [hActiveEntityWalking]                ; $6AA6: $F0 $F0
    cp   $09                                      ; $6AA8: $FE $09
    jr   nc, jr_007_6AC0                          ; $6AAA: $30 $14

    call label_3B65                               ; $6AAC: $CD $65 $3B
    ld   hl, $C410                                ; $6AAF: $21 $10 $C4
    add  hl, bc                                   ; $6AB2: $09
    ld   a, [$C13E]                               ; $6AB3: $FA $3E $C1
    or   [hl]                                     ; $6AB6: $B6
    and  a                                        ; $6AB7: $A7
    jr   nz, jr_007_6AC0                          ; $6AB8: $20 $06

    call label_3B5A                               ; $6ABA: $CD $5A $3B
    call label_3B70                               ; $6ABD: $CD $70 $3B

jr_007_6AC0:
    ldh  a, [hActiveEntityWalking]                ; $6AC0: $F0 $F0
    rst  $00                                      ; $6AC2: $C7
    rst  $18                                      ; $6AC3: $DF
    ld   l, d                                     ; $6AC4: $6A
    push af                                       ; $6AC5: $F5
    ld   l, d                                     ; $6AC6: $6A
    ld   d, $6B                                   ; $6AC7: $16 $6B
    ld   l, b                                     ; $6AC9: $68
    ld   l, e                                     ; $6ACA: $6B
    ret  z                                        ; $6ACB: $C8

    ld   l, e                                     ; $6ACC: $6B
    db   $F4                                      ; $6ACD: $F4
    ld   l, e                                     ; $6ACE: $6B
    add  hl, sp                                   ; $6ACF: $39
    ld   l, h                                     ; $6AD0: $6C
    jr   jr_007_6B40                              ; $6AD1: $18 $6D

    ld   e, a                                     ; $6AD3: $5F
    ld   l, l                                     ; $6AD4: $6D
    ld   a, a                                     ; $6AD5: $7F
    ld   l, l                                     ; $6AD6: $6D
    sbc  a                                        ; $6AD7: $9F
    ld   l, l                                     ; $6AD8: $6D
    reti                                          ; $6AD9: $D9

    ld   l, l                                     ; $6ADA: $6D
    or   $6D                                      ; $6ADB: $F6 $6D
    ld   e, b                                     ; $6ADD: $58
    ld   l, [hl]                                  ; $6ADE: $6E
    ld   hl, wEntitiesSpeedZTable                                ; $6ADF: $21 $20 $C3
    add  hl, bc                                   ; $6AE2: $09
    ld   [hl], b                                  ; $6AE3: $70
    call GetEntityTransitionCountdown                 ; $6AE4: $CD $05 $0C
    jr   nz, jr_007_6AF4                          ; $6AE7: $20 $0B

    ld   [hl], $30                                ; $6AE9: $36 $30
    call IncrementEntityWalkingAttr               ; $6AEB: $CD $12 $3B
    ld   hl, wEntitiesPosZTable                                ; $6AEE: $21 $10 $C3
    add  hl, bc                                   ; $6AF1: $09
    ld   [hl], $6F                                ; $6AF2: $36 $6F

jr_007_6AF4:
    ret                                           ; $6AF4: $C9

    call GetEntityTransitionCountdown                 ; $6AF5: $CD $05 $0C
    jr   z, jr_007_6B08                           ; $6AF8: $28 $0E

    cp   $01                                      ; $6AFA: $FE $01
    jr   nz, jr_007_6B02                          ; $6AFC: $20 $04

    ld   a, $08                                   ; $6AFE: $3E $08
    ldh  [hJingle], a                             ; $6B00: $E0 $F2

jr_007_6B02:
    ld   hl, wEntitiesSpeedZTable                                ; $6B02: $21 $20 $C3
    add  hl, bc                                   ; $6B05: $09
    ld   [hl], b                                  ; $6B06: $70
    ret                                           ; $6B07: $C9

jr_007_6B08:
    ldh  a, [hFFE8]                               ; $6B08: $F0 $E8
    and  a                                        ; $6B0A: $A7
    jr   z, jr_007_6B15                           ; $6B0B: $28 $08

    call GetEntityTransitionCountdown                 ; $6B0D: $CD $05 $0C
    ld   [hl], $40                                ; $6B10: $36 $40
    call IncrementEntityWalkingAttr               ; $6B12: $CD $12 $3B

label_007_6B15:
jr_007_6B15:
    ret                                           ; $6B15: $C9

    call GetEntityTransitionCountdown                 ; $6B16: $CD $05 $0C
    cp   $01                                      ; $6B19: $FE $01
    jr   nz, jr_007_6B33                          ; $6B1B: $20 $16

    ld   e, $12                                   ; $6B1D: $1E $12
    ldh  a, [hMapRoom]                            ; $6B1F: $F0 $F6
    cp   $92                                      ; $6B21: $FE $92
    jr   z, jr_007_6B2F                           ; $6B23: $28 $0A

    cp   $84                                      ; $6B25: $FE $84
    jr   z, jr_007_6B2F                           ; $6B27: $28 $06

    cp   $80                                      ; $6B29: $FE $80
    jr   nz, jr_007_6B33                          ; $6B2B: $20 $06

    ld   e, $14                                   ; $6B2D: $1E $14

jr_007_6B2F:
    ld   a, e                                     ; $6B2F: $7B
    call OpenDialogInTable1                       ; $6B30: $CD $73 $23

jr_007_6B33:
    call GetEntityTransitionCountdown                 ; $6B33: $CD $05 $0C
    jr   nz, jr_007_6B45                          ; $6B36: $20 $0D

    ld   [hl], $A0                                ; $6B38: $36 $A0
    ldh  a, [hMapRoom]                            ; $6B3A: $F0 $F6
    cp   $95                                      ; $6B3C: $FE $95
    jr   z, jr_007_6B42                           ; $6B3E: $28 $02

jr_007_6B40:
    ld   [hl], $20                                ; $6B40: $36 $20

jr_007_6B42:
    jp   IncrementEntityWalkingAttr               ; $6B42: $C3 $12 $3B

jr_007_6B45:
    ld   hl, $D20E                                ; $6B45: $21 $0E $D2
    ld   [hl], $F0                                ; $6B48: $36 $F0
    ld   hl, $D20B                                ; $6B4A: $21 $0B $D2
    ld   [hl], $F8                                ; $6B4D: $36 $F8
    ld   hl, $D20D                                ; $6B4F: $21 $0D $D2
    ld   [hl], $F0                                ; $6B52: $36 $F0
    cp   $20                                      ; $6B54: $FE $20
    jr   c, jr_007_6B67                           ; $6B56: $38 $0F

    ld   hl, $D20E                                ; $6B58: $21 $0E $D2
    ld   [hl], $F2                                ; $6B5B: $36 $F2
    ld   hl, $D20B                                ; $6B5D: $21 $0B $D2
    ld   [hl], $FA                                ; $6B60: $36 $FA
    ld   hl, $D20D                                ; $6B62: $21 $0D $D2
    ld   [hl], $F2                                ; $6B65: $36 $F2

jr_007_6B67:
    ret                                           ; $6B67: $C9

    call GetEntityTransitionCountdown                 ; $6B68: $CD $05 $0C
    jr   nz, jr_007_6B72                          ; $6B6B: $20 $05

    ld   [hl], $20                                ; $6B6D: $36 $20
    jp   IncrementEntityWalkingAttr               ; $6B6F: $C3 $12 $3B

jr_007_6B72:
    and  $3F                                      ; $6B72: $E6 $3F
    jr   nz, jr_007_6B76                          ; $6B74: $20 $00

jr_007_6B76:
    call GetEntityTransitionCountdown                 ; $6B76: $CD $05 $0C
    and  $40                                      ; $6B79: $E6 $40
    jr   z, jr_007_6BA3                           ; $6B7B: $28 $26

func_007_6B7D:
    call func_007_6EF0                            ; $6B7D: $CD $F0 $6E
    ld   hl, $D208                                ; $6B80: $21 $08 $D2
    ld   [hl], $01                                ; $6B83: $36 $01
    ld   hl, $D209                                ; $6B85: $21 $09 $D2
    ld   [hl], b                                  ; $6B88: $70
    ld   hl, $D20A                                ; $6B89: $21 $0A $D2
    ld   [hl], $F0                                ; $6B8C: $36 $F0
    ld   hl, $D20B                                ; $6B8E: $21 $0B $D2
    ld   [hl], $F8                                ; $6B91: $36 $F8
    ld   hl, $D20D                                ; $6B93: $21 $0D $D2
    ld   [hl], $F3                                ; $6B96: $36 $F3
    ld   hl, $D20C                                ; $6B98: $21 $0C $D2
    ld   [hl], $10                                ; $6B9B: $36 $10
    ld   hl, $D207                                ; $6B9D: $21 $07 $D2
    ld   [hl], $00                                ; $6BA0: $36 $00
    ret                                           ; $6BA2: $C9

func_007_6BA3:
label_007_6BA3:
jr_007_6BA3:
    call func_007_6EF0                            ; $6BA3: $CD $F0 $6E
    ld   hl, $D208                                ; $6BA6: $21 $08 $D2
    ld   [hl], b                                  ; $6BA9: $70
    ld   hl, $D209                                ; $6BAA: $21 $09 $D2
    ld   [hl], b                                  ; $6BAD: $70
    ld   hl, $D20A                                ; $6BAE: $21 $0A $D2
    ld   [hl], $F8                                ; $6BB1: $36 $F8
    ld   hl, $D20B                                ; $6BB3: $21 $0B $D2
    ld   [hl], $F8                                ; $6BB6: $36 $F8
    ld   hl, $D20D                                ; $6BB8: $21 $0D $D2
    ld   [hl], $F0                                ; $6BBB: $36 $F0
    ld   hl, $D20C                                ; $6BBD: $21 $0C $D2
    ld   [hl], $10                                ; $6BC0: $36 $10
    ld   hl, $D207                                ; $6BC2: $21 $07 $D2
    ld   [hl], $00                                ; $6BC5: $36 $00
    ret                                           ; $6BC7: $C9

    call func_007_6EA2                            ; $6BC8: $CD $A2 $6E
    call GetEntityTransitionCountdown                 ; $6BCB: $CD $05 $0C
    ret  nz                                       ; $6BCE: $C0

    call GetRandomByte                            ; $6BCF: $CD $0D $28
    and  $1F                                      ; $6BD2: $E6 $1F
    add  $30                                      ; $6BD4: $C6 $30
    ld   [hl], a                                  ; $6BD6: $77
    ld   a, $08                                   ; $6BD7: $3E $08
    call label_3BAA                               ; $6BD9: $CD $AA $3B
    call IncrementEntityWalkingAttr               ; $6BDC: $CD $12 $3B

label_007_6BDF:
    call func_007_7E5D                            ; $6BDF: $CD $5D $7E
    ld   hl, $C380                                ; $6BE2: $21 $80 $C3
    add  hl, bc                                   ; $6BE5: $09
    ld   [hl], e                                  ; $6BE6: $73

func_007_6BE7:
    call func_007_6B7D                            ; $6BE7: $CD $7D $6B
    ld   hl, $C380                                ; $6BEA: $21 $80 $C3
    add  hl, bc                                   ; $6BED: $09
    ld   a, [hl]                                  ; $6BEE: $7E
    and  a                                        ; $6BEF: $A7
    ret  nz                                       ; $6BF0: $C0

    jp   label_007_6BA3                           ; $6BF1: $C3 $A3 $6B

    call func_007_6EA2                            ; $6BF4: $CD $A2 $6E
    call func_007_7E5D                            ; $6BF7: $CD $5D $7E
    add  $20                                      ; $6BFA: $C6 $20
    cp   $40                                      ; $6BFC: $FE $40
    jr   nc, jr_007_6C14                          ; $6BFE: $30 $14

    call func_007_7E6D                            ; $6C00: $CD $6D $7E
    add  $1C                                      ; $6C03: $C6 $1C
    cp   $38                                      ; $6C05: $FE $38
    jr   nc, jr_007_6C14                          ; $6C07: $30 $0B

    call IncrementEntityWalkingAttr               ; $6C09: $CD $12 $3B
    ld   [hl], $06                                ; $6C0C: $36 $06
    call GetEntityTransitionCountdown                 ; $6C0E: $CD $05 $0C
    ld   [hl], $30                                ; $6C11: $36 $30
    ret                                           ; $6C13: $C9

jr_007_6C14:
    call GetEntityTransitionCountdown                 ; $6C14: $CD $05 $0C
    jr   nz, jr_007_6C27                          ; $6C17: $20 $0E

    call GetRandomByte                            ; $6C19: $CD $0D $28
    and  $0F                                      ; $6C1C: $E6 $0F
    add  $10                                      ; $6C1E: $C6 $10
    ld   [hl], a                                  ; $6C20: $77
    call IncrementEntityWalkingAttr               ; $6C21: $CD $12 $3B
    ld   [hl], $04                                ; $6C24: $36 $04
    ret                                           ; $6C26: $C9

jr_007_6C27:
    and  $0F                                      ; $6C27: $E6 $0F
    jr   nz, jr_007_6C33                          ; $6C29: $20 $08

    ld   a, [$D209]                               ; $6C2B: $FA $09 $D2
    xor  $01                                      ; $6C2E: $EE $01
    ld   [$D209], a                               ; $6C30: $EA $09 $D2

func_007_6C33:
label_007_6C33:
jr_007_6C33:
    call func_007_7E0A                            ; $6C33: $CD $0A $7E
    jp   label_3B23                               ; $6C36: $C3 $23 $3B

    call GetEntityTransitionCountdown                 ; $6C39: $CD $05 $0C
    jr   nz, jr_007_6C55                          ; $6C3C: $20 $17

func_007_6C3E:
label_007_6C3E:
    call GetEntityTransitionCountdown                 ; $6C3E: $CD $05 $0C
    ld   [hl], $20                                ; $6C41: $36 $20
    call IncrementEntityWalkingAttr               ; $6C43: $CD $12 $3B
    ld   [hl], $04                                ; $6C46: $36 $04
    ld   hl, $C350                                ; $6C48: $21 $50 $C3
    add  hl, bc                                   ; $6C4B: $09
    set  7, [hl]                                  ; $6C4C: $CB $FE
    ld   hl, $C430                                ; $6C4E: $21 $30 $C4
    add  hl, bc                                   ; $6C51: $09
    res  6, [hl]                                  ; $6C52: $CB $B6
    ret                                           ; $6C54: $C9

jr_007_6C55:
    ld   hl, $C380                                ; $6C55: $21 $80 $C3
    add  hl, bc                                   ; $6C58: $09
    ld   a, [hl]                                  ; $6C59: $7E
    and  a                                        ; $6C5A: $A7
    jr   nz, jr_007_6CB8                          ; $6C5B: $20 $5B

    call GetEntityTransitionCountdown                 ; $6C5D: $CD $05 $0C
    cp   $18                                      ; $6C60: $FE $18
    jr   c, jr_007_6C77                           ; $6C62: $38 $13

    call func_007_6BA3                            ; $6C64: $CD $A3 $6B
    ld   a, $08                                   ; $6C67: $3E $08
    ld   [$D20C], a                               ; $6C69: $EA $0C $D2
    ld   a, $E0                                   ; $6C6C: $3E $E0
    ld   [$D20D], a                               ; $6C6E: $EA $0D $D2
    ld   a, $01                                   ; $6C71: $3E $01
    ld   [$D207], a                               ; $6C73: $EA $07 $D2
    ret                                           ; $6C76: $C9

jr_007_6C77:
    cp   $10                                      ; $6C77: $FE $10
    jr   c, jr_007_6C9E                           ; $6C79: $38 $23

    cp   $17                                      ; $6C7B: $FE $17
    jr   nz, jr_007_6C89                          ; $6C7D: $20 $0A

    ld   a, $27                                   ; $6C7F: $3E $27
    ldh  [hNoiseSfx], a                            ; $6C81: $E0 $F4
    ld   hl, $C300                                ; $6C83: $21 $00 $C3
    add  hl, bc                                   ; $6C86: $09
    ld   [hl], $10                                ; $6C87: $36 $10

jr_007_6C89:
    ld   a, $FF                                   ; $6C89: $3E $FF
    ld   [$D207], a                               ; $6C8B: $EA $07 $D2
    ld   a, $F0                                   ; $6C8E: $3E $F0
    ld   [$D20A], a                               ; $6C90: $EA $0A $D2
    ld   a, $F4                                   ; $6C93: $3E $F4
    ld   [$D20B], a                               ; $6C95: $EA $0B $D2
    ld   a, $01                                   ; $6C98: $3E $01
    ld   [$D208], a                               ; $6C9A: $EA $08 $D2
    ret                                           ; $6C9D: $C9

jr_007_6C9E:
    ld   a, $03                                   ; $6C9E: $3E $03
    ld   [$D207], a                               ; $6CA0: $EA $07 $D2
    ld   a, $F8                                   ; $6CA3: $3E $F8
    ld   [$D20C], a                               ; $6CA5: $EA $0C $D2
    ld   a, $08                                   ; $6CA8: $3E $08
    ld   [$D20D], a                               ; $6CAA: $EA $0D $D2
    ld   a, $F0                                   ; $6CAD: $3E $F0
    ld   [$D20A], a                               ; $6CAF: $EA $0A $D2
    ld   a, $F0                                   ; $6CB2: $3E $F0
    ld   [$D20B], a                               ; $6CB4: $EA $0B $D2
    ret                                           ; $6CB7: $C9

jr_007_6CB8:
    call GetEntityTransitionCountdown                 ; $6CB8: $CD $05 $0C
    cp   $18                                      ; $6CBB: $FE $18
    jr   c, jr_007_6CD7                           ; $6CBD: $38 $18

    call func_007_6B7D                            ; $6CBF: $CD $7D $6B
    ld   a, $01                                   ; $6CC2: $3E $01
    ld   [$D209], a                               ; $6CC4: $EA $09 $D2
    ld   a, $F8                                   ; $6CC7: $3E $F8
    ld   [$D20C], a                               ; $6CC9: $EA $0C $D2
    ld   a, $E8                                   ; $6CCC: $3E $E8
    ld   [$D20D], a                               ; $6CCE: $EA $0D $D2
    ld   a, $00                                   ; $6CD1: $3E $00
    ld   [$D207], a                               ; $6CD3: $EA $07 $D2
    ret                                           ; $6CD6: $C9

jr_007_6CD7:
    cp   $10                                      ; $6CD7: $FE $10
    jr   c, jr_007_6CFE                           ; $6CD9: $38 $23

    cp   $17                                      ; $6CDB: $FE $17
    jr   nz, jr_007_6CE9                          ; $6CDD: $20 $0A

    ld   a, $27                                   ; $6CDF: $3E $27
    ldh  [hNoiseSfx], a                            ; $6CE1: $E0 $F4
    ld   hl, $C300                                ; $6CE3: $21 $00 $C3
    add  hl, bc                                   ; $6CE6: $09
    ld   [hl], $10                                ; $6CE7: $36 $10

jr_007_6CE9:
    ld   a, $FF                                   ; $6CE9: $3E $FF
    ld   [$D207], a                               ; $6CEB: $EA $07 $D2
    ld   a, $F0                                   ; $6CEE: $3E $F0
    ld   [$D20A], a                               ; $6CF0: $EA $0A $D2
    ld   a, $F0                                   ; $6CF3: $3E $F0
    ld   [$D20B], a                               ; $6CF5: $EA $0B $D2
    ld   a, $00                                   ; $6CF8: $3E $00
    ld   [$D208], a                               ; $6CFA: $EA $08 $D2
    ret                                           ; $6CFD: $C9

jr_007_6CFE:
    ld   a, $02                                   ; $6CFE: $3E $02
    ld   [$D207], a                               ; $6D00: $EA $07 $D2
    ld   a, $10                                   ; $6D03: $3E $10
    ld   [$D20C], a                               ; $6D05: $EA $0C $D2
    ld   a, $08                                   ; $6D08: $3E $08
    ld   [$D20D], a                               ; $6D0A: $EA $0D $D2
    ld   a, $F0                                   ; $6D0D: $3E $F0
    ld   [$D20A], a                               ; $6D0F: $EA $0A $D2
    ld   a, $EC                                   ; $6D12: $3E $EC
    ld   [$D20B], a                               ; $6D14: $EA $0B $D2
    ret                                           ; $6D17: $C9

    call func_007_6BE7                            ; $6D18: $CD $E7 $6B
    call GetEntityTransitionCountdown                 ; $6D1B: $CD $05 $0C
    jr   nz, jr_007_6D46                          ; $6D1E: $20 $26

    call IncrementEntityWalkingAttr               ; $6D20: $CD $12 $3B
    call func_007_733F                            ; $6D23: $CD $3F $73
    ld   hl, wEntitiesUnknownTableB               ; $6D26: $21 $B0 $C2
    add  hl, bc                                   ; $6D29: $09
    ld   a, [hl]                                  ; $6D2A: $7E
    ld   hl, wEntitiesSpeedZTable                                ; $6D2B: $21 $20 $C3
    add  hl, bc                                   ; $6D2E: $09
    ld   [hl], $30                                ; $6D2F: $36 $30
    and  a                                        ; $6D31: $A7
    jr   nz, jr_007_6D3B                          ; $6D32: $20 $07

    ld   [hl], $28                                ; $6D34: $36 $28
    ld   a, $18                                   ; $6D36: $3E $18
    jp   label_3BAA                               ; $6D38: $C3 $AA $3B

jr_007_6D3B:
    ld   a, $08                                   ; $6D3B: $3E $08
    call label_3BAA                               ; $6D3D: $CD $AA $3B
    call func_007_4005                            ; $6D40: $CD $05 $40
    ld   [hl], $F0                                ; $6D43: $36 $F0
    ret                                           ; $6D45: $C9

label_007_6D46:
jr_007_6D46:
    ld   a, [$D20E]                               ; $6D46: $FA $0E $D2
    add  $02                                      ; $6D49: $C6 $02
    ld   [$D20E], a                               ; $6D4B: $EA $0E $D2
    ld   a, [$D20B]                               ; $6D4E: $FA $0B $D2
    add  $02                                      ; $6D51: $C6 $02
    ld   [$D20B], a                               ; $6D53: $EA $0B $D2
    ld   a, [$D20D]                               ; $6D56: $FA $0D $D2
    add  $02                                      ; $6D59: $C6 $02
    ld   [$D20D], a                               ; $6D5B: $EA $0D $D2
    ret                                           ; $6D5E: $C9

    call GetEntityTransitionCountdown                 ; $6D5F: $CD $05 $0C
    jr   z, jr_007_6D70                           ; $6D62: $28 $0C

    dec  a                                        ; $6D64: $3D
    jr   nz, jr_007_6D6A                          ; $6D65: $20 $03

    call func_007_6C3E                            ; $6D67: $CD $3E $6C

jr_007_6D6A:
    call func_007_6BE7                            ; $6D6A: $CD $E7 $6B
    jp   label_007_6D46                           ; $6D6D: $C3 $46 $6D

jr_007_6D70:
    call func_007_6C33                            ; $6D70: $CD $33 $6C
    ldh  a, [hFFE8]                               ; $6D73: $F0 $E8
    and  a                                        ; $6D75: $A7
    ret  z                                        ; $6D76: $C8

    call GetEntityTransitionCountdown                 ; $6D77: $CD $05 $0C
    ld   [hl], $10                                ; $6D7A: $36 $10
    jp   label_007_6B15                           ; $6D7C: $C3 $15 $6B

    ldh  a, [hFFE8]                               ; $6D7F: $F0 $E8
    and  a                                        ; $6D81: $A7
    jr   z, jr_007_6D9C                           ; $6D82: $28 $18

    call IncrementEntityWalkingAttr               ; $6D84: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $6D87: $CD $05 $0C
    ld   [hl], $20                                ; $6D8A: $36 $20
    ld   hl, $C350                                ; $6D8C: $21 $50 $C3
    add  hl, bc                                   ; $6D8F: $09
    res  7, [hl]                                  ; $6D90: $CB $BE
    ld   hl, $C430                                ; $6D92: $21 $30 $C4
    add  hl, bc                                   ; $6D95: $09
    set  6, [hl]                                  ; $6D96: $CB $F6
    ld   a, $28                                   ; $6D98: $3E $28
    ldh  [hJingle], a                             ; $6D9A: $E0 $F2

jr_007_6D9C:
    jp   label_007_6C33                           ; $6D9C: $C3 $33 $6C

    call GetEntityTransitionCountdown                 ; $6D9F: $CD $05 $0C
    jr   nz, jr_007_6DA9                          ; $6DA2: $20 $05

    ld   [hl], $C0                                ; $6DA4: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $6DA6: $C3 $12 $3B

jr_007_6DA9:
    ld   hl, $D20B                                ; $6DA9: $21 $0B $D2
    ld   a, [hl]                                  ; $6DAC: $7E
    sub  $03                                      ; $6DAD: $D6 $03
    jr   z, jr_007_6DB8                           ; $6DAF: $28 $07

    bit  7, a                                     ; $6DB1: $CB $7F
    jr   z, jr_007_6DB7                           ; $6DB3: $28 $02

    inc  [hl]                                     ; $6DB5: $34
    inc  [hl]                                     ; $6DB6: $34

jr_007_6DB7:
    dec  [hl]                                     ; $6DB7: $35

jr_007_6DB8:
    ld   hl, $D20D                                ; $6DB8: $21 $0D $D2
    ld   a, [hl]                                  ; $6DBB: $7E
    sub  $03                                      ; $6DBC: $D6 $03
    jr   z, jr_007_6DC7                           ; $6DBE: $28 $07

    bit  7, a                                     ; $6DC0: $CB $7F
    jr   z, jr_007_6DC6                           ; $6DC2: $28 $02

    inc  [hl]                                     ; $6DC4: $34
    inc  [hl]                                     ; $6DC5: $34

jr_007_6DC6:
    dec  [hl]                                     ; $6DC6: $35

jr_007_6DC7:
    call GetEntityTransitionCountdown                 ; $6DC7: $CD $05 $0C
    cp   $14                                      ; $6DCA: $FE $14
    jr   nc, jr_007_6DD8                          ; $6DCC: $30 $0A

    ld   a, [$D20E]                               ; $6DCE: $FA $0E $D2
    and  a                                        ; $6DD1: $A7
    jr   z, jr_007_6DD8                           ; $6DD2: $28 $04

    inc  a                                        ; $6DD4: $3C
    ld   [$D20E], a                               ; $6DD5: $EA $0E $D2

jr_007_6DD8:
    ret                                           ; $6DD8: $C9

    call GetEntityTransitionCountdown                 ; $6DD9: $CD $05 $0C
    jr   nz, jr_007_6DE3                          ; $6DDC: $20 $05

    ld   [hl], $30                                ; $6DDE: $36 $30
    jp   IncrementEntityWalkingAttr               ; $6DE0: $C3 $12 $3B

jr_007_6DE3:
    cp   $30                                      ; $6DE3: $FE $30
    jr   nc, jr_007_6DF5                          ; $6DE5: $30 $0E

    and  $03                                      ; $6DE7: $E6 $03
    jr   nz, jr_007_6DF5                          ; $6DE9: $20 $0A

    ld   a, [$D20E]                               ; $6DEB: $FA $0E $D2
    add  $02                                      ; $6DEE: $C6 $02
    cpl                                           ; $6DF0: $2F
    inc  a                                        ; $6DF1: $3C
    ld   [$D20E], a                               ; $6DF2: $EA $0E $D2

jr_007_6DF5:
    ret                                           ; $6DF5: $C9

    ld   a, [$D20E]                               ; $6DF6: $FA $0E $D2
    cp   $F0                                      ; $6DF9: $FE $F0
    jr   z, jr_007_6E01                           ; $6DFB: $28 $04

    dec  a                                        ; $6DFD: $3D
    ld   [$D20E], a                               ; $6DFE: $EA $0E $D2

jr_007_6E01:
    call GetEntityTransitionCountdown                 ; $6E01: $CD $05 $0C
    jr   nz, jr_007_6E35                          ; $6E04: $20 $2F

    ld   e, $FF                                   ; $6E06: $1E $FF
    ldh  a, [hMapRoom]                            ; $6E08: $F0 $F6
    cp   $80                                      ; $6E0A: $FE $80
    jr   z, jr_007_6E16                           ; $6E0C: $28 $08

    ld   e, $03                                   ; $6E0E: $1E $03
    cp   $95                                      ; $6E10: $FE $95
    jr   z, jr_007_6E16                           ; $6E12: $28 $02

    ld   e, $02                                   ; $6E14: $1E $02

jr_007_6E16:
    ld   hl, $C3D0                                ; $6E16: $21 $D0 $C3
    add  hl, bc                                   ; $6E19: $09
    ld   a, [hl]                                  ; $6E1A: $7E
    cp   e                                        ; $6E1B: $BB
    jr   c, jr_007_6E32                           ; $6E1C: $38 $14

    ld   hl, $C350                                ; $6E1E: $21 $50 $C3
    add  hl, bc                                   ; $6E21: $09
    set  7, [hl]                                  ; $6E22: $CB $FE
    call IncrementEntityWalkingAttr               ; $6E24: $CD $12 $3B
    ld   a, $13                                   ; $6E27: $3E $13
    call OpenDialogInTable1                       ; $6E29: $CD $73 $23
    call GetEntityTransitionCountdown                 ; $6E2C: $CD $05 $0C
    ld   [hl], $04                                ; $6E2F: $36 $04
    ret                                           ; $6E31: $C9

jr_007_6E32:
    jp   label_007_6C3E                           ; $6E32: $C3 $3E $6C

jr_007_6E35:
    cp   $24                                      ; $6E35: $FE $24
    jr   nc, jr_007_6E57                          ; $6E37: $30 $1E

    ld   hl, $D20B                                ; $6E39: $21 $0B $D2
    ld   a, [hl]                                  ; $6E3C: $7E
    sub  $F8                                      ; $6E3D: $D6 $F8
    jr   z, jr_007_6E48                           ; $6E3F: $28 $07

    bit  7, a                                     ; $6E41: $CB $7F
    jr   z, jr_007_6E47                           ; $6E43: $28 $02

    inc  [hl]                                     ; $6E45: $34
    inc  [hl]                                     ; $6E46: $34

jr_007_6E47:
    dec  [hl]                                     ; $6E47: $35

jr_007_6E48:
    ld   hl, $D20D                                ; $6E48: $21 $0D $D2
    ld   a, [hl]                                  ; $6E4B: $7E
    sub  $F0                                      ; $6E4C: $D6 $F0
    jr   z, jr_007_6E57                           ; $6E4E: $28 $07

    bit  7, a                                     ; $6E50: $CB $7F
    jr   z, jr_007_6E56                           ; $6E52: $28 $02

    inc  [hl]                                     ; $6E54: $34
    inc  [hl]                                     ; $6E55: $34

jr_007_6E56:
    dec  [hl]                                     ; $6E56: $35

jr_007_6E57:
    ret                                           ; $6E57: $C9

    call func_007_6BE7                            ; $6E58: $CD $E7 $6B
    call GetEntityTransitionCountdown                 ; $6E5B: $CD $05 $0C
    jr   z, jr_007_6E6A                           ; $6E5E: $28 $0A

    dec  a                                        ; $6E60: $3D
    jr   nz, jr_007_6E67                          ; $6E61: $20 $04

    ld   a, $3F                                   ; $6E63: $3E $3F
    ldh  [hNoiseSfx], a                            ; $6E65: $E0 $F4

jr_007_6E67:
    jp   label_007_6D46                           ; $6E67: $C3 $46 $6D

jr_007_6E6A:
    ld   hl, wEntitiesSpeedZTable                                ; $6E6A: $21 $20 $C3
    add  hl, bc                                   ; $6E6D: $09
    ld   [hl], $30                                ; $6E6E: $36 $30
    ld   hl, wEntitiesPosZTable                                ; $6E70: $21 $10 $C3
    add  hl, bc                                   ; $6E73: $09
    ld   a, [hl]                                  ; $6E74: $7E
    cp   $78                                      ; $6E75: $FE $78
    jr   c, jr_007_6EA1                           ; $6E77: $38 $28

    call label_27DD                               ; $6E79: $CD $DD $27
    call func_007_7EA4                            ; $6E7C: $CD $A4 $7E

func_007_6E7F:
    ld   hl, wIndoorARoomStatus                   ; $6E7F: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6E82: $F0 $F6
    cp   $FF                                      ; $6E84: $FE $FF
    jr   nz, jr_007_6E8D                          ; $6E86: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6E88: $21 $E0 $DD
    jr   jr_007_6E9A                              ; $6E8B: $18 $0D

jr_007_6E8D:
    ld   e, a                                     ; $6E8D: $5F
    ld   d, b                                     ; $6E8E: $50
    ldh  a, [hMapId]                              ; $6E8F: $F0 $F7
    cp   $1A                                      ; $6E91: $FE $1A
    jr   nc, jr_007_6E9A                          ; $6E93: $30 $05

    cp   $06                                      ; $6E95: $FE $06
    jr   c, jr_007_6E9A                           ; $6E97: $38 $01

    inc  d                                        ; $6E99: $14

jr_007_6E9A:
    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    or   $20                                      ; $6E9C: $F6 $20
    ld   [hl], a                                  ; $6E9E: $77
    ldh  [hRoomStatus], a                         ; $6E9F: $E0 $F8

jr_007_6EA1:
    ret                                           ; $6EA1: $C9

func_007_6EA2:
    ld   hl, wEntitiesUnknownTableB               ; $6EA2: $21 $B0 $C2
    add  hl, bc                                   ; $6EA5: $09
    ld   [hl], b                                  ; $6EA6: $70
    call func_007_7E5D                            ; $6EA7: $CD $5D $7E
    add  $30                                      ; $6EAA: $C6 $30
    cp   $60                                      ; $6EAC: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EAE: $30 $13

    call func_007_7E6D                            ; $6EB0: $CD $6D $7E
    add  $30                                      ; $6EB3: $C6 $30
    cp   $60                                      ; $6EB5: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EB7: $30 $0A

    ld   a, e                                     ; $6EB9: $7B
    cp   $02                                      ; $6EBA: $FE $02
    ret  nz                                       ; $6EBC: $C0

    ld   hl, wEntitiesUnknownTableB               ; $6EBD: $21 $B0 $C2
    add  hl, bc                                   ; $6EC0: $09
    ld   [hl], $01                                ; $6EC1: $36 $01

jr_007_6EC3:
    call IncrementEntityWalkingAttr               ; $6EC3: $CD $12 $3B
    ld   [hl], $07                                ; $6EC6: $36 $07
    call GetEntityTransitionCountdown                 ; $6EC8: $CD $05 $0C
    ld   [hl], $20                                ; $6ECB: $36 $20
    jp   label_007_6BDF                           ; $6ECD: $C3 $DF $6B

func_007_6ED0:
    ld   hl, wEntitiesPosZTable                                ; $6ED0: $21 $10 $C3
    add  hl, bc                                   ; $6ED3: $09
    ld   [hl], $7F                                ; $6ED4: $36 $7F
    call GetEntityTransitionCountdown                 ; $6ED6: $CD $05 $0C
    ld   [hl], $80                                ; $6ED9: $36 $80
    ldh  a, [hMusicTrack]                         ; $6EDB: $F0 $B0
    ld   hl, $C390                                ; $6EDD: $21 $90 $C3
    add  hl, bc                                   ; $6EE0: $09
    ld   [hl], a                                  ; $6EE1: $77
    ld   hl, wEntitiesHealthTable                                ; $6EE2: $21 $60 $C3
    add  hl, bc                                   ; $6EE5: $09
    ld   [hl], $FF                                ; $6EE6: $36 $FF
    ldh  a, [hMapRoom]                            ; $6EE8: $F0 $F6
    cp   $80                                      ; $6EEA: $FE $80
    jr   nz, jr_007_6EF0                          ; $6EEC: $20 $02

    ld   [hl], $C0                                ; $6EEE: $36 $C0

func_007_6EF0:
jr_007_6EF0:
    ld   a, $F8                                   ; $6EF0: $3E $F8
    ld   [$D20A], a                               ; $6EF2: $EA $0A $D2
    ld   a, $F8                                   ; $6EF5: $3E $F8
    ld   [$D20B], a                               ; $6EF7: $EA $0B $D2
    ld   a, $F0                                   ; $6EFA: $3E $F0
    ld   [$D20E], a                               ; $6EFC: $EA $0E $D2
    ld   a, $00                                   ; $6EFF: $3E $00
    ld   [$D207], a                               ; $6F01: $EA $07 $D2
    ld   [$D208], a                               ; $6F04: $EA $08 $D2
    ld   [$D209], a                               ; $6F07: $EA $09 $D2
    ld   a, $10                                   ; $6F0A: $3E $10
    ld   [$D20C], a                               ; $6F0C: $EA $0C $D2
    ld   a, $F0                                   ; $6F0F: $3E $F0
    ld   [$D20D], a                               ; $6F11: $EA $0D $D2
    ret                                           ; $6F14: $C9

    ld   [hl], b                                  ; $6F15: $70
    ld   bc, $2170                                ; $6F16: $01 $70 $21
    nop                                           ; $6F19: $00
    ld   hl, sp+$60                               ; $6F1A: $F8 $60
    nop                                           ; $6F1C: $00
    nop                                           ; $6F1D: $00
    nop                                           ; $6F1E: $00
    ld   h, d                                     ; $6F1F: $62
    nop                                           ; $6F20: $00
    nop                                           ; $6F21: $00
    ld   [$0064], sp                              ; $6F22: $08 $64 $00
    nop                                           ; $6F25: $00
    db   $10                                      ; $6F26: $10
    ld   h, [hl]                                  ; $6F27: $66
    nop                                           ; $6F28: $00
    nop                                           ; $6F29: $00
    ld   hl, sp+$66                               ; $6F2A: $F8 $66
    jr   nz, jr_007_6F2E                          ; $6F2C: $20 $00

jr_007_6F2E:
    nop                                           ; $6F2E: $00
    ld   h, h                                     ; $6F2F: $64
    jr   nz, jr_007_6F32                          ; $6F30: $20 $00

jr_007_6F32:
    ld   [$2062], sp                              ; $6F32: $08 $62 $20
    nop                                           ; $6F35: $00
    db   $10                                      ; $6F36: $10
    ld   h, b                                     ; $6F37: $60
    jr   nz, jr_007_6F3A                          ; $6F38: $20 $00

jr_007_6F3A:
    ld   hl, sp+$68                               ; $6F3A: $F8 $68
    nop                                           ; $6F3C: $00
    nop                                           ; $6F3D: $00
    nop                                           ; $6F3E: $00
    ld   l, d                                     ; $6F3F: $6A
    nop                                           ; $6F40: $00
    nop                                           ; $6F41: $00
    ld   [$006C], sp                              ; $6F42: $08 $6C $00
    nop                                           ; $6F45: $00
    db   $10                                      ; $6F46: $10
    ld   l, [hl]                                  ; $6F47: $6E
    nop                                           ; $6F48: $00
    nop                                           ; $6F49: $00
    ld   hl, sp+$6E                               ; $6F4A: $F8 $6E
    jr   nz, jr_007_6F4E                          ; $6F4C: $20 $00

jr_007_6F4E:
    nop                                           ; $6F4E: $00
    ld   l, h                                     ; $6F4F: $6C
    jr   nz, jr_007_6F52                          ; $6F50: $20 $00

jr_007_6F52:
    ld   [$206A], sp                              ; $6F52: $08 $6A $20
    nop                                           ; $6F55: $00
    db   $10                                      ; $6F56: $10
    ld   l, b                                     ; $6F57: $68
    jr   nz, jr_007_6F5A                          ; $6F58: $20 $00

jr_007_6F5A:
    nop                                           ; $6F5A: $00
    ld   [hl], d                                  ; $6F5B: $72
    inc  bc                                       ; $6F5C: $03
    ld   hl, sp+$08                               ; $6F5D: $F8 $08
    ld   [hl], h                                  ; $6F5F: $74
    inc  bc                                       ; $6F60: $03
    ld   hl, sp+$00                               ; $6F61: $F8 $00
    ld   [hl], h                                  ; $6F63: $74
    inc  hl                                       ; $6F64: $23
    nop                                           ; $6F65: $00
    ld   [$2372], sp                              ; $6F66: $08 $72 $23
    nop                                           ; $6F69: $00
    nop                                           ; $6F6A: $00
    ld   [hl], d                                  ; $6F6B: $72
    ld   b, e                                     ; $6F6C: $43
    ld   [$7408], sp                              ; $6F6D: $08 $08 $74
    ld   b, e                                     ; $6F70: $43
    ld   [$7400], sp                              ; $6F71: $08 $00 $74
    ld   h, e                                     ; $6F74: $63
    nop                                           ; $6F75: $00
    ld   [$6372], sp                              ; $6F76: $08 $72 $63
    stop                                          ; $6F79: $10 $00
    halt                                          ; $6F7B: $76 $00
    db   $10                                      ; $6F7D: $10
    ld   [$0078], sp                              ; $6F7E: $08 $78 $00
    db   $10                                      ; $6F81: $10
    db   $10                                      ; $6F82: $10
    ld   a, d                                     ; $6F83: $7A
    nop                                           ; $6F84: $00
    ld   [$7C18], sp                              ; $6F85: $08 $18 $7C
    nop                                           ; $6F88: $00
    ld   hl, sp+$18                               ; $6F89: $F8 $18
    ld   a, [hl]                                  ; $6F8B: $7E
    nop                                           ; $6F8C: $00
    db   $10                                      ; $6F8D: $10
    ld   [$2076], sp                              ; $6F8E: $08 $76 $20
    stop                                          ; $6F91: $10 $00
    ld   a, b                                     ; $6F93: $78
    jr   nz, jr_007_6FA6                          ; $6F94: $20 $10

jr_007_6F96:
    ld   hl, sp+$7A                               ; $6F96: $F8 $7A
    jr   nz, jr_007_6FA2                          ; $6F98: $20 $08

    ldh  a, [$FF7C]                               ; $6F9A: $F0 $7C
    jr   nz, jr_007_6F96                          ; $6F9C: $20 $F8

    ldh  a, [$FF7E]                               ; $6F9E: $F0 $7E
    jr   nz, jr_007_6FAE                          ; $6FA0: $20 $0C

jr_007_6FA2:
    ei                                            ; $6FA2: $FB
    ld   h, $00                                   ; $6FA3: $26 $00
    inc  c                                        ; $6FA5: $0C

jr_007_6FA6:
    ld   bc, $0026                                ; $6FA6: $01 $26 $00
    inc  c                                        ; $6FA9: $0C
    rlca                                          ; $6FAA: $07
    ld   h, $00                                   ; $6FAB: $26 $00
    inc  c                                        ; $6FAD: $0C

jr_007_6FAE:
    dec  c                                        ; $6FAE: $0D
    ld   h, $00                                   ; $6FAF: $26 $00

func_007_6FB1:
    ld   hl, wEntitiesPosZTable                                ; $6FB1: $21 $10 $C3
    add  hl, bc                                   ; $6FB4: $09
    ld   a, [hl]                                  ; $6FB5: $7E
    cp   $70                                      ; $6FB6: $FE $70
    ret  nc                                       ; $6FB8: $D0

    call func_007_6FE6                            ; $6FB9: $CD $E6 $6F
    call func_007_7015                            ; $6FBC: $CD $15 $70
    call func_007_703A                            ; $6FBF: $CD $3A $70
    call func_007_706F                            ; $6FC2: $CD $6F $70
    call func_007_7090                            ; $6FC5: $CD $90 $70
    ld   hl, wEntitiesPosZTable                                ; $6FC8: $21 $10 $C3
    add  hl, bc                                   ; $6FCB: $09
    ld   a, [hl]                                  ; $6FCC: $7E
    and  a                                        ; $6FCD: $A7
    jr   z, jr_007_6FE3                           ; $6FCE: $28 $13

    ldh  a, [$FFEF]                               ; $6FD0: $F0 $EF
    sub  $02                                      ; $6FD2: $D6 $02
    ldh  [wActiveEntityPosY], a                   ; $6FD4: $E0 $EC
    ld   hl, $6FA1                                ; $6FD6: $21 $A1 $6F
    ld   c, $04                                   ; $6FD9: $0E $04
    call label_3CE6                               ; $6FDB: $CD $E6 $3C
    ld   a, $04                                   ; $6FDE: $3E $04
    call label_3DA0                               ; $6FE0: $CD $A0 $3D

jr_007_6FE3:
    jp   label_3D8A                               ; $6FE3: $C3 $8A $3D

func_007_6FE6:
    ld   a, [$D20C]                               ; $6FE6: $FA $0C $D2
    ld   hl, wActiveEntityPosX                    ; $6FE9: $21 $EE $FF
    add  [hl]                                     ; $6FEC: $86
    ld   [hl], a                                  ; $6FED: $77
    ld   a, [$D20D]                               ; $6FEE: $FA $0D $D2
    ld   hl, wActiveEntityPosY                    ; $6FF1: $21 $EC $FF
    add  [hl]                                     ; $6FF4: $86
    ld   [hl], a                                  ; $6FF5: $77
    ld   a, [$D207]                               ; $6FF6: $FA $07 $D2
    cp   $FF                                      ; $6FF9: $FE $FF
    jr   z, jr_007_7012                           ; $6FFB: $28 $15

    rla                                           ; $6FFD: $17
    rla                                           ; $6FFE: $17
    rla                                           ; $6FFF: $17
    and  $F8                                      ; $7000: $E6 $F8
    ld   e, a                                     ; $7002: $5F
    ld   d, b                                     ; $7003: $50
    ld   hl, $6F59                                ; $7004: $21 $59 $6F
    add  hl, de                                   ; $7007: $19
    ld   c, $02                                   ; $7008: $0E $02
    call label_3CE6                               ; $700A: $CD $E6 $3C
    ld   a, $02                                   ; $700D: $3E $02
    jp   label_007_7034                           ; $700F: $C3 $34 $70

jr_007_7012:
    jp   label_3D8A                               ; $7012: $C3 $8A $3D

func_007_7015:
    ld   hl, $C300                                ; $7015: $21 $00 $C3
    add  hl, bc                                   ; $7018: $09
    ld   a, [hl]                                  ; $7019: $7E
    and  a                                        ; $701A: $A7
    ret  z                                        ; $701B: $C8

    call func_007_70B7                            ; $701C: $CD $B7 $70
    ld   hl, $C380                                ; $701F: $21 $80 $C3
    add  hl, bc                                   ; $7022: $09
    ld   a, [hl]                                  ; $7023: $7E
    ld   hl, $6F79                                ; $7024: $21 $79 $6F
    and  a                                        ; $7027: $A7
    jr   z, jr_007_702D                           ; $7028: $28 $03

    ld   hl, $6F8D                                ; $702A: $21 $8D $6F

jr_007_702D:
    ld   c, $05                                   ; $702D: $0E $05
    call label_3CE6                               ; $702F: $CD $E6 $3C
    ld   a, $05                                   ; $7032: $3E $05

label_007_7034:
    call label_3DA0                               ; $7034: $CD $A0 $3D
    jp   label_3D8A                               ; $7037: $C3 $8A $3D

func_007_703A:
    ld   a, [$D20A]                               ; $703A: $FA $0A $D2
    ld   hl, wActiveEntityPosX                    ; $703D: $21 $EE $FF
    add  [hl]                                     ; $7040: $86
    ld   [hl], a                                  ; $7041: $77
    ld   a, [$D20A]                               ; $7042: $FA $0A $D2
    add  $0C                                      ; $7045: $C6 $0C
    ld   [$D5C0], a                               ; $7047: $EA $C0 $D5
    ld   a, [$D20B]                               ; $704A: $FA $0B $D2
    ld   hl, wActiveEntityPosY                    ; $704D: $21 $EC $FF
    add  [hl]                                     ; $7050: $86
    ld   [hl], a                                  ; $7051: $77
    ld   a, [$D20B]                               ; $7052: $FA $0B $D2
    add  $08                                      ; $7055: $C6 $08
    ld   [$D5C2], a                               ; $7057: $EA $C2 $D5
    ld   a, $08                                   ; $705A: $3E $08
    ld   [$D5C1], a                               ; $705C: $EA $C1 $D5
    ld   a, $06                                   ; $705F: $3E $06
    ld   [$D5C3], a                               ; $7061: $EA $C3 $D5
    ld   de, $6F15                                ; $7064: $11 $15 $6F
    call RenderAnimatedActiveEntity                               ; $7067: $CD $C0 $3B
    ld   a, $02                                   ; $706A: $3E $02
    jp   label_007_7034                           ; $706C: $C3 $34 $70

func_007_706F:
    ld   a, [$D20E]                               ; $706F: $FA $0E $D2
    ld   hl, wActiveEntityPosY                    ; $7072: $21 $EC $FF
    add  [hl]                                     ; $7075: $86
    ld   [hl], a                                  ; $7076: $77
    ld   a, [$D208]                               ; $7077: $FA $08 $D2
    rla                                           ; $707A: $17
    rla                                           ; $707B: $17
    rla                                           ; $707C: $17
    rla                                           ; $707D: $17
    and  $F0                                      ; $707E: $E6 $F0
    ld   e, a                                     ; $7080: $5F
    ld   d, b                                     ; $7081: $50
    ld   hl, $6F19                                ; $7082: $21 $19 $6F
    add  hl, de                                   ; $7085: $19
    ld   c, $04                                   ; $7086: $0E $04
    call label_3CE6                               ; $7088: $CD $E6 $3C
    ld   a, $04                                   ; $708B: $3E $04
    jp   label_007_7034                           ; $708D: $C3 $34 $70

func_007_7090:
    ld   a, [$D20E]                               ; $7090: $FA $0E $D2
    cp   $00                                      ; $7093: $FE $00
    ret  z                                        ; $7095: $C8

    ld   a, [$D20F]                               ; $7096: $FA $0F $D2
    ld   hl, wActiveEntityPosY                    ; $7099: $21 $EC $FF
    add  [hl]                                     ; $709C: $86
    ld   [hl], a                                  ; $709D: $77
    ld   a, [$D209]                               ; $709E: $FA $09 $D2
    rla                                           ; $70A1: $17
    rla                                           ; $70A2: $17
    rla                                           ; $70A3: $17
    rla                                           ; $70A4: $17
    and  $F0                                      ; $70A5: $E6 $F0
    ld   e, a                                     ; $70A7: $5F
    ld   d, b                                     ; $70A8: $50
    ld   hl, $6F39                                ; $70A9: $21 $39 $6F
    add  hl, de                                   ; $70AC: $19
    ld   c, $04                                   ; $70AD: $0E $04
    call label_3CE6                               ; $70AF: $CD $E6 $3C
    ld   a, $04                                   ; $70B2: $3E $04
    jp   label_007_7034                           ; $70B4: $C3 $34 $70

func_007_70B7:
    ld   hl, $C146                                ; $70B7: $21 $46 $C1
    ld   a, [$DBC7]                               ; $70BA: $FA $C7 $DB
    or   [hl]                                     ; $70BD: $B6
    jr   nz, jr_007_7111                          ; $70BE: $20 $51

    ldh  a, [wActiveEntityPosY]                   ; $70C0: $F0 $EC
    add  $18                                      ; $70C2: $C6 $18
    ld   e, a                                     ; $70C4: $5F
    ldh  a, [hLinkPositionY]                      ; $70C5: $F0 $99
    ld   hl, $FFA2                                ; $70C7: $21 $A2 $FF
    sub  [hl]                                     ; $70CA: $96
    add  $08                                      ; $70CB: $C6 $08
    sub  e                                        ; $70CD: $93
    add  $0C                                      ; $70CE: $C6 $0C
    cp   $18                                      ; $70D0: $FE $18
    jr   nc, jr_007_7111                          ; $70D2: $30 $3D

    ld   hl, $C380                                ; $70D4: $21 $80 $C3
    add  hl, bc                                   ; $70D7: $09
    ld   e, $08                                   ; $70D8: $1E $08
    ld   a, [hl]                                  ; $70DA: $7E
    and  a                                        ; $70DB: $A7
    jr   z, jr_007_70E0                           ; $70DC: $28 $02

    ld   e, $F8                                   ; $70DE: $1E $F8

jr_007_70E0:
    ldh  a, [wActiveEntityPosX]                   ; $70E0: $F0 $EE
    add  e                                        ; $70E2: $83
    ld   hl, hLinkPositionX                       ; $70E3: $21 $98 $FF
    sub  [hl]                                     ; $70E6: $96
    add  $1A                                      ; $70E7: $C6 $1A
    cp   $34                                      ; $70E9: $FE $34
    jr   nc, jr_007_7111                          ; $70EB: $30 $24

    ld   a, $28                                   ; $70ED: $3E $28
    call label_3BB5                               ; $70EF: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $70F2: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $70F4: $E0 $9B
    ldh  a, [hScratchB]                           ; $70F6: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $70F8: $E0 $9A
    ld   a, $02                                   ; $70FA: $3E $02
    ld   [$C146], a                               ; $70FC: $EA $46 $C1
    ld   a, $13                                   ; $70FF: $3E $13
    ldh  [$FFA3], a                               ; $7101: $E0 $A3
    ld   a, $08                                   ; $7103: $3E $08
    ld   [wDB94], a                               ; $7105: $EA $94 $DB
    ld   a, $20                                   ; $7108: $3E $20
    ld   [$DBC7], a                               ; $710A: $EA $C7 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ; $710D: $3E $03
    ldh  [hWaveSfx], a                            ; $710F: $E0 $F3

jr_007_7111:
    ret                                           ; $7111: $C9

    ld   [de], a                                  ; $7112: $12
    inc  d                                        ; $7113: $14
    ld   d, $18                                   ; $7114: $16 $18
    add  hl, de                                   ; $7116: $19
    ld   a, [de]                                  ; $7117: $1A
    ld   a, [de]                                  ; $7118: $1A
    ld   a, [de]                                  ; $7119: $1A
    ld   a, [de]                                  ; $711A: $1A
    ld   a, [de]                                  ; $711B: $1A
    call func_007_7D96                            ; $711C: $CD $96 $7D
    call func_007_7E5D                            ; $711F: $CD $5D $7E
    add  $20                                      ; $7122: $C6 $20
    cp   $40                                      ; $7124: $FE $40
    jr   nc, jr_007_7131                          ; $7126: $30 $09

    call func_007_7E6D                            ; $7128: $CD $6D $7E
    add  $20                                      ; $712B: $C6 $20
    cp   $40                                      ; $712D: $FE $40
    jr   c, jr_007_7197                           ; $712F: $38 $66

jr_007_7131:
    ld   hl, wEntitiesUnknownTableG               ; $7131: $21 $B0 $C3
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    inc  a                                        ; $7136: $3C
    ld   [hl], a                                  ; $7137: $77
    and  $7F                                      ; $7138: $E6 $7F
    ret  nz                                       ; $713A: $C0

    ld   e, $0F                                   ; $713B: $1E $0F
    ld   d, b                                     ; $713D: $50

jr_007_713E:
    ld   hl, wEntitiesTypeTable                   ; $713E: $21 $A0 $C3
    add  hl, de                                   ; $7141: $19
    ld   a, [hl]                                  ; $7142: $7E
    cp   $82                                      ; $7143: $FE $82
    jr   z, jr_007_7161                           ; $7145: $28 $1A

    cp   $9E                                      ; $7147: $FE $9E
    jr   z, jr_007_7161                           ; $7149: $28 $16

    cp   $7D                                      ; $714B: $FE $7D
    jr   z, jr_007_7161                           ; $714D: $28 $12

    ld   hl, $C340                                ; $714F: $21 $40 $C3
    add  hl, de                                   ; $7152: $19
    ld   a, [hl]                                  ; $7153: $7E
    and  $80                                      ; $7154: $E6 $80
    jr   nz, jr_007_7161                          ; $7156: $20 $09

    ld   hl, wEntity0State                         ; $7158: $21 $80 $C2
    add  hl, de                                   ; $715B: $19
    ld   a, [hl]                                  ; $715C: $7E
    cp   $05                                      ; $715D: $FE $05
    jr   z, jr_007_7168                           ; $715F: $28 $07

jr_007_7161:
    dec  e                                        ; $7161: $1D
    ld   a, e                                     ; $7162: $7B
    cp   $FF                                      ; $7163: $FE $FF
    jr   nz, jr_007_713E                          ; $7165: $20 $D7

    ret                                           ; $7167: $C9

jr_007_7168:
    ld   a, [$C18F]                               ; $7168: $FA $8F $C1
    and  a                                        ; $716B: $A7
    ret  nz                                       ; $716C: $C0

    ld   a, $7D                                   ; $716D: $3E $7D
    call label_3B86                               ; $716F: $CD $86 $3B
    jr   c, jr_007_7197                           ; $7172: $38 $23

    ldh  a, [hScratchA]                           ; $7174: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7176: $21 $00 $C2
    add  hl, de                                   ; $7179: $19
    ld   [hl], a                                  ; $717A: $77
    ldh  a, [hScratchB]                           ; $717B: $F0 $D8
    ld   hl, wEntity0PosY                         ; $717D: $21 $10 $C2
    add  hl, de                                   ; $7180: $19
    ld   [hl], a                                  ; $7181: $77
    push bc                                       ; $7182: $C5
    ld   c, e                                     ; $7183: $4B
    ld   b, d                                     ; $7184: $42
    ldh  a, [hMapId]                              ; $7185: $F0 $F7
    ld   e, a                                     ; $7187: $5F
    ld   a, $14                                   ; $7188: $3E $14
    cp   $0A                                      ; $718A: $FE $0A
    jr   nc, jr_007_7193                          ; $718C: $30 $05

    ld   hl, $7112                                ; $718E: $21 $12 $71
    add  hl, de                                   ; $7191: $19
    ld   a, [hl]                                  ; $7192: $7E

jr_007_7193:
    call label_3BAA                               ; $7193: $CD $AA $3B
    pop  bc                                       ; $7196: $C1

jr_007_7197:
    ret                                           ; $7197: $C9

    ld   hl, $C460                                ; $7198: $21 $60 $C4
    add  hl, bc                                   ; $719B: $09
    ld   a, [hl]                                  ; $719C: $7E
    cp   $00                                      ; $719D: $FE $00
    jr   nz, jr_007_71B4                          ; $719F: $20 $13

    ldh  a, [hRoomStatus]                         ; $71A1: $F0 $F8
    and  $10                                      ; $71A3: $E6 $10
    jp   nz, label_007_7EA4                       ; $71A5: $C2 $A4 $7E

    ld   hl, $C460                                ; $71A8: $21 $60 $C4
    add  hl, bc                                   ; $71AB: $09
    ld   [hl], $FF                                ; $71AC: $36 $FF
    ld   hl, $C4E0                                ; $71AE: $21 $E0 $C4
    add  hl, bc                                   ; $71B1: $09
    ld   [hl], $3C                                ; $71B2: $36 $3C

jr_007_71B4:
    call func_007_7D96                            ; $71B4: $CD $96 $7D
    ld   hl, wEntitiesUnknownTableG               ; $71B7: $21 $B0 $C3
    add  hl, bc                                   ; $71BA: $09
    ld   [hl], b                                  ; $71BB: $70
    ld   hl, $C410                                ; $71BC: $21 $10 $C4
    add  hl, bc                                   ; $71BF: $09
    ld   a, [hl]                                  ; $71C0: $7E
    and  a                                        ; $71C1: $A7
    jp   z, label_007_7246                        ; $71C2: $CA $46 $72

    ld   a, $14                                   ; $71C5: $3E $14
    call label_3B86                               ; $71C7: $CD $86 $3B
    jr   c, jr_007_7246                           ; $71CA: $38 $7A

    ld   hl, $C4E0                                ; $71CC: $21 $E0 $C4
    add  hl, bc                                   ; $71CF: $09
    ld   a, [hl]                                  ; $71D0: $7E
    ld   hl, $C4E0                                ; $71D1: $21 $E0 $C4
    add  hl, de                                   ; $71D4: $19
    ld   [hl], a                                  ; $71D5: $77
    ldh  a, [hScratchA]                           ; $71D6: $F0 $D7
    ld   hl, wEntity0PosX                         ; $71D8: $21 $00 $C2
    add  hl, de                                   ; $71DB: $19
    ld   [hl], a                                  ; $71DC: $77
    ldh  a, [hScratchB]                           ; $71DD: $F0 $D8
    ld   hl, wEntity0PosY                         ; $71DF: $21 $10 $C2
    add  hl, de                                   ; $71E2: $19
    add  $08                                      ; $71E3: $C6 $08
    ld   [hl], a                                  ; $71E5: $77
    call label_3E34                               ; $71E6: $CD $34 $3E
    ldh  a, [wActiveEntityPosX]                   ; $71E9: $F0 $EE
    sub  $08                                      ; $71EB: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $71ED: $E0 $CE
    ldh  a, [$FFEF]                               ; $71EF: $F0 $EF
    sub  $10                                      ; $71F1: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $71F3: $E0 $CD
    ldh  a, [hSwordIntersectedAreaX]              ; $71F5: $F0 $CE
    swap a                                        ; $71F7: $CB $37
    and  $0F                                      ; $71F9: $E6 $0F
    ld   e, a                                     ; $71FB: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $71FC: $F0 $CD
    and  $F0                                      ; $71FE: $E6 $F0
    or   e                                        ; $7200: $B3
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, wRoomObjects                         ; $7203: $21 $11 $D7
    add  hl, de                                   ; $7206: $19
    ld   [hl], $91                                ; $7207: $36 $91
    call label_2887                               ; $7209: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $720C: $F0 $FE
    and  a                                        ; $720E: $A7
    jr   z, jr_007_721D                           ; $720F: $28 $0C

    push bc                                       ; $7211: $C5
    ld   a, $91                                   ; $7212: $3E $91
    ld   [$DDD8], a                               ; $7214: $EA $D8 $DD
    ld   a, $07                                   ; $7217: $3E $07
    call label_91D                                ; $7219: $CD $1D $09
    pop  bc                                       ; $721C: $C1

jr_007_721D:
    ld   a, [wRequests]                           ; $721D: $FA $00 $D6
    ld   e, a                                     ; $7220: $5F
    ld   d, $00                                   ; $7221: $16 $00
    ld   hl, wRequestDestinationHigh              ; $7223: $21 $01 $D6
    add  hl, de                                   ; $7226: $19
    add  $0A                                      ; $7227: $C6 $0A
    ld   [wRequests], a                           ; $7229: $EA $00 $D6
    ld   e, $08                                   ; $722C: $1E $08
    call func_007_7233                            ; $722E: $CD $33 $72
    ld   e, $09                                   ; $7231: $1E $09

func_007_7233:
    ldh  a, [$FFCF]                               ; $7233: $F0 $CF
    ld   [hl+], a                                 ; $7235: $22
    ldh  a, [$FFD0]                               ; $7236: $F0 $D0
    ld   [hl+], a                                 ; $7238: $22
    inc  a                                        ; $7239: $3C
    ldh  [$FFD0], a                               ; $723A: $E0 $D0
    ld   a, $81                                   ; $723C: $3E $81
    ld   [hl+], a                                 ; $723E: $22
    ld   a, e                                     ; $723F: $7B
    ld   [hl+], a                                 ; $7240: $22
    inc  a                                        ; $7241: $3C
    inc  a                                        ; $7242: $3C
    ld   [hl+], a                                 ; $7243: $22
    xor  a                                        ; $7244: $AF
    ld   [hl], a                                  ; $7245: $77

label_007_7246:
jr_007_7246:
    ret                                           ; $7246: $C9

    ld   [hl], h                                  ; $7247: $74
    ld   bc, $2174                                ; $7248: $01 $74 $21
    db   $76                                      ; $724B: $76
    ld   bc, $0178                                ; $724C: $01 $78 $01
    ld   a, d                                     ; $724F: $7A
    ld   bc, $217A                                ; $7250: $01 $7A $21
    ld   a, b                                     ; $7253: $78
    ld   hl, $2176                                ; $7254: $21 $76 $21
    ld   a, h                                     ; $7257: $7C
    ld   bc, $017C                                ; $7258: $01 $7C $01
    ld   de, $7247                                ; $725B: $11 $47 $72
    call RenderAnimatedActiveEntity                               ; $725E: $CD $C0 $3B
    call func_007_7D96                            ; $7261: $CD $96 $7D
    call func_007_7DC3                            ; $7264: $CD $C3 $7D
    call label_3B39                               ; $7267: $CD $39 $3B
    call func_007_7E0A                            ; $726A: $CD $0A $7E
    call label_3B23                               ; $726D: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7270: $21 $A0 $C2
    add  hl, bc                                   ; $7273: $09
    ld   a, [hl]                                  ; $7274: $7E
    and  $03                                      ; $7275: $E6 $03
    jr   nz, jr_007_7280                          ; $7277: $20 $07

    ld   a, [hl]                                  ; $7279: $7E
    and  $0C                                      ; $727A: $E6 $0C
    jr   nz, jr_007_728A                          ; $727C: $20 $0C

    jr   jr_007_7291                              ; $727E: $18 $11

jr_007_7280:
    ld   hl, wEntity0SpeedX                       ; $7280: $21 $40 $C2
    add  hl, bc                                   ; $7283: $09
    ld   a, [hl]                                  ; $7284: $7E
    cpl                                           ; $7285: $2F
    inc  a                                        ; $7286: $3C
    ld   [hl], a                                  ; $7287: $77
    jr   jr_007_7291                              ; $7288: $18 $07

jr_007_728A:
    call func_007_4005                            ; $728A: $CD $05 $40
    ld   a, [hl]                                  ; $728D: $7E
    cpl                                           ; $728E: $2F
    inc  a                                        ; $728F: $3C
    ld   [hl], a                                  ; $7290: $77

jr_007_7291:
    ldh  a, [hFrameCounter]                       ; $7291: $F0 $E7
    rra                                           ; $7293: $1F
    rra                                           ; $7294: $1F
    rra                                           ; $7295: $1F
    and  $03                                      ; $7296: $E6 $03
    jp   label_3B0C                               ; $7298: $C3 $0C $3B

    rst  $38                                      ; $729B: $FF
    rst  $38                                      ; $729C: $FF
    rst  $38                                      ; $729D: $FF
    rst  $38                                      ; $729E: $FF
    rst  $38                                      ; $729F: $FF
    rst  $38                                      ; $72A0: $FF
    rst  $38                                      ; $72A1: $FF
    rst  $38                                      ; $72A2: $FF
    ld   d, h                                     ; $72A3: $54
    nop                                           ; $72A4: $00
    ld   d, h                                     ; $72A5: $54
    jr   nz, @+$54                                ; $72A6: $20 $52

    nop                                           ; $72A8: $00
    ld   d, d                                     ; $72A9: $52
    jr   nz, jr_007_7302                          ; $72AA: $20 $56

    nop                                           ; $72AC: $00
    ld   d, [hl]                                  ; $72AD: $56
    nop                                           ; $72AE: $00
    ldh  a, [hActiveEntityUnknownG]               ; $72AF: $F0 $F1
    cp   $01                                      ; $72B1: $FE $01
    jr   nz, jr_007_72BD                          ; $72B3: $20 $08

    ld   de, $72AB                                ; $72B5: $11 $AB $72
    call label_3C77                               ; $72B8: $CD $77 $3C
    jr   jr_007_72C3                              ; $72BB: $18 $06

jr_007_72BD:
    ld   de, $729B                                ; $72BD: $11 $9B $72
    call RenderAnimatedActiveEntity                               ; $72C0: $CD $C0 $3B

jr_007_72C3:
    call func_007_7D96                            ; $72C3: $CD $96 $7D
    call func_007_7DC3                            ; $72C6: $CD $C3 $7D
    call func_007_7E43                            ; $72C9: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                                ; $72CC: $21 $20 $C3
    add  hl, bc                                   ; $72CF: $09
    dec  [hl]                                     ; $72D0: $35
    dec  [hl]                                     ; $72D1: $35
    ld   hl, wEntitiesPosZTable                                ; $72D2: $21 $10 $C3
    add  hl, bc                                   ; $72D5: $09
    ld   a, [hl]                                  ; $72D6: $7E
    and  $80                                      ; $72D7: $E6 $80
    ldh  [hFFE8], a                               ; $72D9: $E0 $E8
    jr   z, jr_007_72E3                           ; $72DB: $28 $06

    ld   [hl], b                                  ; $72DD: $70
    ld   hl, wEntitiesSpeedZTable                                ; $72DE: $21 $20 $C3
    add  hl, bc                                   ; $72E1: $09
    ld   [hl], b                                  ; $72E2: $70

jr_007_72E3:
    ldh  a, [hActiveEntityWalking]                ; $72E3: $F0 $F0
    rst  $00                                      ; $72E5: $C7
    db   $F4                                      ; $72E6: $F4
    ld   [hl], d                                  ; $72E7: $72
    jr   nz, @+$75                                ; $72E8: $20 $73

    ld   d, b                                     ; $72EA: $50
    ld   [hl], e                                  ; $72EB: $73
    ld   e, h                                     ; $72EC: $5C
    ld   [hl], e                                  ; $72ED: $73
    ld   a, h                                     ; $72EE: $7C
    ld   [hl], e                                  ; $72EF: $73
    and  b                                        ; $72F0: $A0
    ld   [hl], e                                  ; $72F1: $73
    rst  $10                                      ; $72F2: $D7
    ld   [hl], e                                  ; $72F3: $73
    call GetEntityTransitionCountdown                 ; $72F4: $CD $05 $0C
    jr   nz, jr_007_731F                          ; $72F7: $20 $26

    call func_007_7E5D                            ; $72F9: $CD $5D $7E
    add  $20                                      ; $72FC: $C6 $20
    cp   $40                                      ; $72FE: $FE $40
    jr   nc, jr_007_731F                          ; $7300: $30 $1D

jr_007_7302:
    call func_007_7E6D                            ; $7302: $CD $6D $7E
    add  $20                                      ; $7305: $C6 $20
    cp   $40                                      ; $7307: $FE $40
    jr   nc, jr_007_731F                          ; $7309: $30 $14

    call IncrementEntityWalkingAttr               ; $730B: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $730E: $CD $05 $0C
    ld   [hl], $20                                ; $7311: $36 $20
    call GetRandomByte                            ; $7313: $CD $0D $28
    and  $03                                      ; $7316: $E6 $03
    add  $03                                      ; $7318: $C6 $03
    ld   hl, wEntitiesUnknownTableB               ; $731A: $21 $B0 $C2
    add  hl, bc                                   ; $731D: $09
    ld   [hl], a                                  ; $731E: $77

jr_007_731F:
    ret                                           ; $731F: $C9

    call GetEntityTransitionCountdown                 ; $7320: $CD $05 $0C
    jr   nz, jr_007_7344                          ; $7323: $20 $1F

    ld   hl, wEntitiesPosZTable                                ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   [hl], $08                                ; $7329: $36 $08
    ld   hl, wEntitiesSpeedZTable                                ; $732B: $21 $20 $C3
    add  hl, bc                                   ; $732E: $09
    ld   [hl], $08                                ; $732F: $36 $08
    ld   hl, $C340                                ; $7331: $21 $40 $C3
    add  hl, bc                                   ; $7334: $09
    ld   [hl], $12                                ; $7335: $36 $12
    ld   a, $03                                   ; $7337: $3E $03
    call label_3B0C                               ; $7339: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $733C: $CD $12 $3B

func_007_733F:
label_007_733F:
    ld   a, $24                                   ; $733F: $3E $24
    ldh  [hJingle], a                             ; $7341: $E0 $F2
    ret                                           ; $7343: $C9

jr_007_7344:
    ld   e, $01                                   ; $7344: $1E $01
    cp   $10                                      ; $7346: $FE $10
    jr   nc, jr_007_734C                          ; $7348: $30 $02

    ld   e, $02                                   ; $734A: $1E $02

jr_007_734C:
    ld   a, e                                     ; $734C: $7B
    jp   label_3B0C                               ; $734D: $C3 $0C $3B

    ldh  a, [hFFE8]                               ; $7350: $F0 $E8
    and  a                                        ; $7352: $A7
    ret  z                                        ; $7353: $C8

    call GetEntityTransitionCountdown                 ; $7354: $CD $05 $0C
    ld   [hl], $20                                ; $7357: $36 $20
    jp   IncrementEntityWalkingAttr               ; $7359: $C3 $12 $3B

    call label_3B70                               ; $735C: $CD $70 $3B
    call GetEntityTransitionCountdown                 ; $735F: $CD $05 $0C
    jr   nz, jr_007_736C                          ; $7362: $20 $08

    ld   [hl], $10                                ; $7364: $36 $10
    call label_3D7F                               ; $7366: $CD $7F $3D
    jp   IncrementEntityWalkingAttr               ; $7369: $C3 $12 $3B

jr_007_736C:
    ld   e, $08                                   ; $736C: $1E $08
    and  $04                                      ; $736E: $E6 $04
    jr   z, jr_007_7374                           ; $7370: $28 $02

    ld   e, $F8                                   ; $7372: $1E $F8

jr_007_7374:
    ld   hl, wEntity0SpeedX                       ; $7374: $21 $40 $C2
    add  hl, bc                                   ; $7377: $09
    ld   [hl], e                                  ; $7378: $73
    jp   label_007_7E17                           ; $7379: $C3 $17 $7E

    call label_3B39                               ; $737C: $CD $39 $3B
    call func_007_7E0A                            ; $737F: $CD $0A $7E
    call func_007_73F7                            ; $7382: $CD $F7 $73
    call GetEntityTransitionCountdown                 ; $7385: $CD $05 $0C
    jr   nz, jr_007_739B                          ; $7388: $20 $11

    ld   a, $0C                                   ; $738A: $3E $0C
    call label_3BAA                               ; $738C: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                                ; $738F: $21 $20 $C3
    add  hl, bc                                   ; $7392: $09
    ld   [hl], $18                                ; $7393: $36 $18
    call func_007_733F                            ; $7395: $CD $3F $73
    call IncrementEntityWalkingAttr               ; $7398: $CD $12 $3B

jr_007_739B:
    ld   a, $03                                   ; $739B: $3E $03
    jp   label_3B0C                               ; $739D: $C3 $0C $3B

    call label_3B39                               ; $73A0: $CD $39 $3B
    call func_007_7E0A                            ; $73A3: $CD $0A $7E
    call func_007_73F7                            ; $73A6: $CD $F7 $73
    ldh  a, [hFFE8]                               ; $73A9: $F0 $E8
    and  a                                        ; $73AB: $A7
    jr   z, jr_007_73D2                           ; $73AC: $28 $24

    call label_3D7F                               ; $73AE: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $73B1: $CD $12 $3B
    ld   [hl], $04                                ; $73B4: $36 $04
    call GetEntityTransitionCountdown                 ; $73B6: $CD $05 $0C
    ld   [hl], $20                                ; $73B9: $36 $20
    ld   hl, wEntitiesUnknownTableB               ; $73BB: $21 $B0 $C2
    add  hl, bc                                   ; $73BE: $09
    dec  [hl]                                     ; $73BF: $35
    jr   nz, jr_007_73D2                          ; $73C0: $20 $10

    call IncrementEntityWalkingAttr               ; $73C2: $CD $12 $3B
    ld   [hl], $06                                ; $73C5: $36 $06
    call GetEntityTransitionCountdown                 ; $73C7: $CD $05 $0C
    ld   [hl], $30                                ; $73CA: $36 $30
    ld   hl, $C340                                ; $73CC: $21 $40 $C3
    add  hl, bc                                   ; $73CF: $09
    ld   [hl], $D2                                ; $73D0: $36 $D2

jr_007_73D2:
    ld   a, $02                                   ; $73D2: $3E $02
    jp   label_3B0C                               ; $73D4: $C3 $0C $3B

    call GetEntityTransitionCountdown                 ; $73D7: $CD $05 $0C
    jr   nz, jr_007_73E6                          ; $73DA: $20 $0A

    ld   [hl], $50                                ; $73DC: $36 $50
    call IncrementEntityWalkingAttr               ; $73DE: $CD $12 $3B
    ld   [hl], b                                  ; $73E1: $70
    xor  a                                        ; $73E2: $AF
    jp   label_3B0C                               ; $73E3: $C3 $0C $3B

jr_007_73E6:
    ld   e, $03                                   ; $73E6: $1E $03
    cp   $20                                      ; $73E8: $FE $20
    jr   nc, jr_007_73F3                          ; $73EA: $30 $07

    ld   e, $01                                   ; $73EC: $1E $01
    cp   $10                                      ; $73EE: $FE $10
    jr   c, jr_007_73F3                           ; $73F0: $38 $01

    inc  e                                        ; $73F2: $1C

jr_007_73F3:
    ld   a, e                                     ; $73F3: $7B
    jp   label_3B0C                               ; $73F4: $C3 $0C $3B

func_007_73F7:
    ld   hl, $C410                                ; $73F7: $21 $10 $C4
    add  hl, bc                                   ; $73FA: $09
    ld   [hl], $03                                ; $73FB: $36 $03
    call label_3B23                               ; $73FD: $CD $23 $3B
    ld   hl, $C410                                ; $7400: $21 $10 $C4
    add  hl, bc                                   ; $7403: $09
    ld   [hl], b                                  ; $7404: $70
    ret                                           ; $7405: $C9

    call func_007_7D96                            ; $7406: $CD $96 $7D
    ldh  a, [hActiveEntityWalking]                ; $7409: $F0 $F0
    rst  $00                                      ; $740B: $C7
    db   $10                                      ; $740C: $10
    ld   [hl], h                                  ; $740D: $74
    xor  b                                        ; $740E: $A8
    ld   [hl], h                                  ; $740F: $74
    ldh  a, [wActiveEntityPosX]                   ; $7410: $F0 $EE
    and  $70                                      ; $7412: $E6 $70
    ld   [$D201], a                               ; $7414: $EA $01 $D2
    call GetEntityTransitionCountdown                 ; $7417: $CD $05 $0C
    ld   [hl], $80                                ; $741A: $36 $80
    jp   IncrementEntityWalkingAttr               ; $741C: $C3 $12 $3B

    inc  hl                                       ; $741F: $23
    ld   d, [hl]                                  ; $7420: $56
    ld   h, $53                                   ; $7421: $26 $53
    ld   [hl-], a                                 ; $7423: $32
    ld   b, a                                     ; $7424: $47
    ld   b, d                                     ; $7425: $42
    scf                                           ; $7426: $37
    inc  sp                                       ; $7427: $33
    ld   b, [hl]                                  ; $7428: $46
    ld   b, e                                     ; $7429: $43
    ld   [hl], $24                                ; $742A: $36 $24
    ld   d, l                                     ; $742C: $55
    dec  h                                        ; $742D: $25
    ld   d, h                                     ; $742E: $54
    ld   hl, $5328                                ; $742F: $21 $28 $53
    ld   d, [hl]                                  ; $7432: $56
    inc  [hl]                                     ; $7433: $34
    ld   b, l                                     ; $7434: $45
    dec  [hl]                                     ; $7435: $35
    ld   b, h                                     ; $7436: $44
    ld   sp, $3848                                ; $7437: $31 $48 $38
    ld   b, c                                     ; $743A: $41
    inc  d                                        ; $743B: $14
    ld   h, [hl]                                  ; $743C: $66
    dec  d                                        ; $743D: $15
    ld   h, e                                     ; $743E: $63
    ld   sp, $3845                                ; $743F: $31 $45 $38
    ld   b, h                                     ; $7442: $44
    inc  de                                       ; $7443: $13
    ld   d, [hl]                                  ; $7444: $56
    ld   d, $53                                   ; $7445: $16 $53
    daa                                           ; $7447: $27
    ld   b, d                                     ; $7448: $42
    ld   b, a                                     ; $7449: $47
    ld   [hl+], a                                 ; $744A: $22
    ld   h, l                                     ; $744B: $65
    inc  sp                                       ; $744C: $33
    ld   h, h                                     ; $744D: $64
    ld   [hl], $23                                ; $744E: $36 $23
    ld   d, [hl]                                  ; $7450: $56
    ld   h, $53                                   ; $7451: $26 $53
    ld   [hl-], a                                 ; $7453: $32
    ld   b, a                                     ; $7454: $47
    ld   b, d                                     ; $7455: $42
    scf                                           ; $7456: $37
    inc  sp                                       ; $7457: $33
    ld   b, [hl]                                  ; $7458: $46
    ld   b, e                                     ; $7459: $43
    ld   [hl], $24                                ; $745A: $36 $24
    ld   d, l                                     ; $745C: $55
    dec  h                                        ; $745D: $25
    ld   d, h                                     ; $745E: $54
    inc  hl                                       ; $745F: $23
    ld   d, [hl]                                  ; $7460: $56
    ld   h, $53                                   ; $7461: $26 $53
    ld   [hl-], a                                 ; $7463: $32
    ld   b, a                                     ; $7464: $47
    ld   b, d                                     ; $7465: $42
    scf                                           ; $7466: $37
    inc  sp                                       ; $7467: $33
    ld   b, [hl]                                  ; $7468: $46
    ld   b, e                                     ; $7469: $43
    ld   [hl], $24                                ; $746A: $36 $24
    ld   d, l                                     ; $746C: $55
    dec  h                                        ; $746D: $25
    ld   d, h                                     ; $746E: $54
    inc  hl                                       ; $746F: $23
    ld   d, [hl]                                  ; $7470: $56
    ld   h, $53                                   ; $7471: $26 $53
    ld   [hl-], a                                 ; $7473: $32
    ld   b, a                                     ; $7474: $47
    ld   b, d                                     ; $7475: $42
    scf                                           ; $7476: $37
    inc  sp                                       ; $7477: $33
    ld   b, [hl]                                  ; $7478: $46
    ld   b, e                                     ; $7479: $43
    ld   [hl], $24                                ; $747A: $36 $24
    ld   d, l                                     ; $747C: $55
    dec  h                                        ; $747D: $25
    ld   d, h                                     ; $747E: $54
    inc  hl                                       ; $747F: $23
    ld   d, [hl]                                  ; $7480: $56
    ld   h, $53                                   ; $7481: $26 $53
    ld   [hl-], a                                 ; $7483: $32
    ld   b, a                                     ; $7484: $47
    ld   b, d                                     ; $7485: $42
    scf                                           ; $7486: $37
    inc  sp                                       ; $7487: $33
    ld   b, [hl]                                  ; $7488: $46
    ld   b, e                                     ; $7489: $43
    ld   [hl], $24                                ; $748A: $36 $24
    ld   d, l                                     ; $748C: $55
    dec  h                                        ; $748D: $25
    ld   d, h                                     ; $748E: $54
    inc  hl                                       ; $748F: $23
    ld   d, [hl]                                  ; $7490: $56
    ld   h, $53                                   ; $7491: $26 $53
    ld   [hl-], a                                 ; $7493: $32
    ld   b, a                                     ; $7494: $47
    ld   b, d                                     ; $7495: $42
    scf                                           ; $7496: $37
    inc  sp                                       ; $7497: $33
    ld   b, [hl]                                  ; $7498: $46
    ld   b, e                                     ; $7499: $43
    ld   [hl], $24                                ; $749A: $36 $24
    ld   d, l                                     ; $749C: $55
    dec  h                                        ; $749D: $25
    ld   d, h                                     ; $749E: $54
    jr   nc, jr_007_74D1                          ; $749F: $30 $30

    jr   nc, @+$32                                ; $74A1: $30 $30

    jr   nc, @+$32                                ; $74A3: $30 $30

    jr   nc, @+$2A                                ; $74A5: $30 $28

    jr   z, jr_007_74CA                           ; $74A7: $28 $21

    ret  nc                                       ; $74A9: $D0

    jp   label_007_7E09                           ; $74AA: $C3 $09 $7E

    cp   $10                                      ; $74AD: $FE $10
    jp   z, label_007_7EA4                        ; $74AF: $CA $A4 $7E

    call GetEntityTransitionCountdown                 ; $74B2: $CD $05 $0C
    jr   nz, jr_007_752C                          ; $74B5: $20 $75

    push hl                                       ; $74B7: $E5
    ldh  a, [hMapId]                              ; $74B8: $F0 $F7
    ld   e, a                                     ; $74BA: $5F
    ld   d, b                                     ; $74BB: $50
    ld   hl, $749F                                ; $74BC: $21 $9F $74
    add  hl, de                                   ; $74BF: $19
    ld   a, [hl]                                  ; $74C0: $7E
    pop  hl                                       ; $74C1: $E1
    ld   [hl], a                                  ; $74C2: $77
    ld   a, $5A                                   ; $74C3: $3E $5A
    call label_3B86                               ; $74C5: $CD $86 $3B
    jr   c, jr_007_752C                           ; $74C8: $38 $62

jr_007_74CA:
    ld   hl, wEntitiesUnknownTableB               ; $74CA: $21 $B0 $C2
    add  hl, de                                   ; $74CD: $19
    ld   [hl], $02                                ; $74CE: $36 $02
    push bc                                       ; $74D0: $C5

jr_007_74D1:
    ld   a, [$D201]                               ; $74D1: $FA $01 $D2
    ld   hl, $C3D0                                ; $74D4: $21 $D0 $C3
    add  hl, bc                                   ; $74D7: $09
    add  [hl]                                     ; $74D8: $86
    inc  [hl]                                     ; $74D9: $34
    ld   c, a                                     ; $74DA: $4F
    ld   hl, $C440                                ; $74DB: $21 $40 $C4
    add  hl, de                                   ; $74DE: $19
    ldh  a, [$FFEF]                               ; $74DF: $F0 $EF
    sub  $10                                      ; $74E1: $D6 $10
    and  $F0                                      ; $74E3: $E6 $F0
    jr   z, jr_007_74E8                           ; $74E5: $28 $01

    ld   [hl], a                                  ; $74E7: $77

jr_007_74E8:
    ld   a, c                                     ; $74E8: $79
    cp   $0F                                      ; $74E9: $FE $0F
    jr   nz, jr_007_74F8                          ; $74EB: $20 $0B

    ld   a, [$C18E]                               ; $74ED: $FA $8E $C1
    and  $1F                                      ; $74F0: $E6 $1F
    cp   $03                                      ; $74F2: $FE $03
    jr   nz, jr_007_74F8                          ; $74F4: $20 $02

    ld   [hl], $01                                ; $74F6: $36 $01

jr_007_74F8:
    ld   hl, $741F                                ; $74F8: $21 $1F $74
    add  hl, bc                                   ; $74FB: $09
    ld   a, [hl]                                  ; $74FC: $7E
    push af                                       ; $74FD: $F5
    swap a                                        ; $74FE: $CB $37
    and  $F0                                      ; $7500: $E6 $F0
    or   $08                                      ; $7502: $F6 $08
    ld   hl, wEntity0PosX                         ; $7504: $21 $00 $C2
    add  hl, de                                   ; $7507: $19
    ld   [hl], a                                  ; $7508: $77
    pop  af                                       ; $7509: $F1
    and  $F0                                      ; $750A: $E6 $F0
    add  $10                                      ; $750C: $C6 $10
    ld   hl, wEntity0PosY                         ; $750E: $21 $10 $C2
    add  hl, de                                   ; $7511: $19
    ld   [hl], a                                  ; $7512: $77
    ld   hl, $C340                                ; $7513: $21 $40 $C3
    add  hl, de                                   ; $7516: $19
    ld   [hl], $12                                ; $7517: $36 $12
    ld   hl, $C350                                ; $7519: $21 $50 $C3
    add  hl, de                                   ; $751C: $19
    ld   [hl], $00                                ; $751D: $36 $00
    ld   hl, $C430                                ; $751F: $21 $30 $C4
    add  hl, de                                   ; $7522: $19
    ld   [hl], $00                                ; $7523: $36 $00
    ld   hl, $C4D0                                ; $7525: $21 $D0 $C4
    add  hl, de                                   ; $7528: $19
    ld   [hl], $00                                ; $7529: $36 $00
    pop  bc                                       ; $752B: $C1

jr_007_752C:
    ret                                           ; $752C: $C9

    ld   [hl], b                                  ; $752D: $70
    nop                                           ; $752E: $00
    ld   [hl], b                                  ; $752F: $70
    jr   nz, jr_007_75A4                          ; $7530: $20 $72

    nop                                           ; $7532: $00
    ld   [hl], d                                  ; $7533: $72
    jr   nz, jr_007_7547                          ; $7534: $20 $11

    dec  l                                        ; $7536: $2D
    ld   [hl], l                                  ; $7537: $75
    call RenderAnimatedActiveEntity                               ; $7538: $CD $C0 $3B
    call func_007_7D96                            ; $753B: $CD $96 $7D
    call func_007_7DC3                            ; $753E: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $7541: $F0 $E7
    rra                                           ; $7543: $1F
    rra                                           ; $7544: $1F
    rra                                           ; $7545: $1F
    rra                                           ; $7546: $1F

jr_007_7547:
    and  $01                                      ; $7547: $E6 $01
    call label_3B0C                               ; $7549: $CD $0C $3B
    call func_007_7E0A                            ; $754C: $CD $0A $7E
    call label_3B23                               ; $754F: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7552: $21 $A0 $C2
    add  hl, bc                                   ; $7555: $09
    ld   a, [hl]                                  ; $7556: $7E
    and  $0F                                      ; $7557: $E6 $0F
    jr   z, jr_007_756A                           ; $7559: $28 $0F

    call GetEntityTransitionCountdown                 ; $755B: $CD $05 $0C
    ld   [hl], $10                                ; $755E: $36 $10
    call label_3D7F                               ; $7560: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $7563: $CD $12 $3B
    xor  a                                        ; $7566: $AF
    ld   [hl], a                                  ; $7567: $77
    ldh  [hActiveEntityWalking], a                ; $7568: $E0 $F0

jr_007_756A:
    call label_3B39                               ; $756A: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                ; $756D: $F0 $F0
    rst  $00                                      ; $756F: $C7
    db   $76                                      ; $7570: $76
    ld   [hl], l                                  ; $7571: $75
    sub  a                                        ; $7572: $97
    ld   [hl], l                                  ; $7573: $75
    or   a                                        ; $7574: $B7
    ld   [hl], l                                  ; $7575: $75
    call GetEntityTransitionCountdown                 ; $7576: $CD $05 $0C
    jr   nz, jr_007_7596                          ; $7579: $20 $1B

    ld   [hl], $20                                ; $757B: $36 $20
    call IncrementEntityWalkingAttr               ; $757D: $CD $12 $3B
    call GetRandomByte                            ; $7580: $CD $0D $28
    and  $02                                      ; $7583: $E6 $02
    dec  a                                        ; $7585: $3D
    ld   hl, wEntitiesUnknownTableB               ; $7586: $21 $B0 $C2
    add  hl, bc                                   ; $7589: $09
    ld   [hl], a                                  ; $758A: $77
    call GetRandomByte                            ; $758B: $CD $0D $28
    and  $02                                      ; $758E: $E6 $02
    dec  a                                        ; $7590: $3D
    ld   hl, wEntitiesUnknownTableC               ; $7591: $21 $C0 $C2
    add  hl, bc                                   ; $7594: $09
    ld   [hl], a                                  ; $7595: $77

jr_007_7596:
    ret                                           ; $7596: $C9

    call GetEntityTransitionCountdown                 ; $7597: $CD $05 $0C
    jp   z, IncrementEntityWalkingAttr            ; $759A: $CA $12 $3B

    and  $01                                      ; $759D: $E6 $01
    jr   nz, jr_007_75B6                          ; $759F: $20 $15

    ld   hl, wEntitiesUnknownTableB               ; $75A1: $21 $B0 $C2

jr_007_75A4:
    add  hl, bc                                   ; $75A4: $09
    ld   a, [hl]                                  ; $75A5: $7E
    ld   hl, wEntity0SpeedX                       ; $75A6: $21 $40 $C2
    add  hl, bc                                   ; $75A9: $09
    add  [hl]                                     ; $75AA: $86
    ld   [hl], a                                  ; $75AB: $77
    ld   hl, wEntitiesUnknownTableC               ; $75AC: $21 $C0 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   a, [hl]                                  ; $75B0: $7E
    call func_007_4005                            ; $75B1: $CD $05 $40
    add  [hl]                                     ; $75B4: $86
    ld   [hl], a                                  ; $75B5: $77

jr_007_75B6:
    ret                                           ; $75B6: $C9

    ldh  a, [hFrameCounter]                       ; $75B7: $F0 $E7
    and  $01                                      ; $75B9: $E6 $01
    jr   nz, jr_007_75DD                          ; $75BB: $20 $20

    ld   hl, wEntity0SpeedX                       ; $75BD: $21 $40 $C2
    add  hl, bc                                   ; $75C0: $09
    ld   a, [hl]                                  ; $75C1: $7E
    and  a                                        ; $75C2: $A7
    jr   nz, jr_007_75CF                          ; $75C3: $20 $0A

    call IncrementEntityWalkingAttr               ; $75C5: $CD $12 $3B
    ld   [hl], b                                  ; $75C8: $70
    call GetEntityTransitionCountdown                 ; $75C9: $CD $05 $0C
    ld   [hl], $10                                ; $75CC: $36 $10
    ret                                           ; $75CE: $C9

jr_007_75CF:
    call func_007_75D6                            ; $75CF: $CD $D6 $75
    call func_007_4005                            ; $75D2: $CD $05 $40
    ld   a, [hl]                                  ; $75D5: $7E

func_007_75D6:
    bit  7, a                                     ; $75D6: $CB $7F
    jr   z, jr_007_75DC                           ; $75D8: $28 $02

    inc  [hl]                                     ; $75DA: $34
    inc  [hl]                                     ; $75DB: $34

jr_007_75DC:
    dec  [hl]                                     ; $75DC: $35

jr_007_75DD:
    ret                                           ; $75DD: $C9

    ld   h, b                                     ; $75DE: $60
    inc  bc                                       ; $75DF: $03
    ld   h, d                                     ; $75E0: $62
    inc  bc                                       ; $75E1: $03
    ld   h, h                                     ; $75E2: $64
    inc  bc                                       ; $75E3: $03
    ld   h, [hl]                                  ; $75E4: $66
    inc  bc                                       ; $75E5: $03
    ld   h, d                                     ; $75E6: $62
    ld   h, e                                     ; $75E7: $63
    ld   h, b                                     ; $75E8: $60
    ld   h, e                                     ; $75E9: $63
    ld   h, [hl]                                  ; $75EA: $66
    ld   h, e                                     ; $75EB: $63
    ld   h, h                                     ; $75EC: $64
    ld   h, e                                     ; $75ED: $63
    ld   h, [hl]                                  ; $75EE: $66
    inc  hl                                       ; $75EF: $23
    ld   h, h                                     ; $75F0: $64
    inc  hl                                       ; $75F1: $23
    ld   hl, $C460                                ; $75F2: $21 $60 $C4
    add  hl, bc                                   ; $75F5: $09
    ld   a, [hl]                                  ; $75F6: $7E
    and  a                                        ; $75F7: $A7
    jr   z, jr_007_75FE                           ; $75F8: $28 $04

    ld   a, c                                     ; $75FA: $79
    ld   [$D201], a                               ; $75FB: $EA $01 $D2

jr_007_75FE:
    ld   de, $75DE                                ; $75FE: $11 $DE $75
    call RenderAnimatedActiveEntity                               ; $7601: $CD $C0 $3B
    call func_007_7D96                            ; $7604: $CD $96 $7D
    call func_007_7E0A                            ; $7607: $CD $0A $7E
    call func_007_7E43                            ; $760A: $CD $43 $7E
    call label_3B23                               ; $760D: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                                ; $7610: $21 $20 $C3
    add  hl, bc                                   ; $7613: $09
    dec  [hl]                                     ; $7614: $35
    dec  [hl]                                     ; $7615: $35
    ld   hl, wEntitiesPosZTable                                ; $7616: $21 $10 $C3
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    ldh  [hFFE8], a                               ; $761B: $E0 $E8
    dec  a                                        ; $761D: $3D
    and  $80                                      ; $761E: $E6 $80
    jr   z, jr_007_7633                           ; $7620: $28 $11

    ld   [hl], b                                  ; $7622: $70
    ld   hl, wEntitiesSpeedZTable                                ; $7623: $21 $20 $C3
    add  hl, bc                                   ; $7626: $09
    ld   a, [hl]                                  ; $7627: $7E
    ldh  [hFFE9], a                               ; $7628: $E0 $E9
    sra  a                                        ; $762A: $CB $2F
    cpl                                           ; $762C: $2F
    cp   $07                                      ; $762D: $FE $07
    jr   nc, jr_007_7632                          ; $762F: $30 $01

    xor  a                                        ; $7631: $AF

jr_007_7632:
    ld   [hl], a                                  ; $7632: $77

jr_007_7633:
    ldh  a, [hActiveEntityWalking]                ; $7633: $F0 $F0
    rst  $00                                      ; $7635: $C7
    ld   b, b                                     ; $7636: $40
    db   $76                                      ; $7637: $76
    ld   b, b                                     ; $7638: $40
    db   $76                                      ; $7639: $76
    ld   d, a                                     ; $763A: $57
    db   $76                                      ; $763B: $76
    xor  $76                                      ; $763C: $EE $76
    inc  h                                        ; $763E: $24
    ld   [hl], a                                  ; $763F: $77
    jp   label_007_7733                           ; $7640: $C3 $33 $77

    nop                                           ; $7643: $00
    inc  c                                        ; $7644: $0C
    db   $10                                      ; $7645: $10
    inc  c                                        ; $7646: $0C
    nop                                           ; $7647: $00
    db   $F4                                      ; $7648: $F4
    ldh  a, [hNoiseSfx]                            ; $7649: $F0 $F4
    ldh  a, [hNoiseSfx]                            ; $764B: $F0 $F4
    nop                                           ; $764D: $00
    inc  c                                        ; $764E: $0C
    db   $10                                      ; $764F: $10
    inc  c                                        ; $7650: $0C
    nop                                           ; $7651: $00
    db   $F4                                      ; $7652: $F4
    nop                                           ; $7653: $00
    ld   bc, $0004                                ; $7654: $01 $04 $00
    call GetEntityTransitionCountdown                 ; $7657: $CD $05 $0C
    jr   nz, jr_007_7671                          ; $765A: $20 $15

    call label_3D7F                               ; $765C: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $765F: $CD $12 $3B
    call GetRandomByte                            ; $7662: $CD $0D $28
    and  $03                                      ; $7665: $E6 $03
    ld   e, a                                     ; $7667: $5F
    ld   d, b                                     ; $7668: $50
    ld   hl, $7653                                ; $7669: $21 $53 $76
    add  hl, de                                   ; $766C: $19
    ld   a, [hl]                                  ; $766D: $7E
    jp   label_3B0C                               ; $766E: $C3 $0C $3B

jr_007_7671:
    and  $07                                      ; $7671: $E6 $07
    jr   nz, jr_007_767E                          ; $7673: $20 $09

    ld   hl, wEntitiesUnknownTableG               ; $7675: $21 $B0 $C3
    add  hl, bc                                   ; $7678: $09
    ld   a, [hl]                                  ; $7679: $7E
    inc  a                                        ; $767A: $3C
    and  $03                                      ; $767B: $E6 $03
    ld   [hl], a                                  ; $767D: $77

jr_007_767E:
    ldh  a, [hFFE8]                               ; $767E: $F0 $E8
    dec  a                                        ; $7680: $3D
    and  $80                                      ; $7681: $E6 $80
    jr   z, jr_007_76C2                           ; $7683: $28 $3D

    call func_007_76E7                            ; $7685: $CD $E7 $76
    ldh  a, [hFFE9]                               ; $7688: $F0 $E9
    sub  $FC                                      ; $768A: $D6 $FC
    and  $80                                      ; $768C: $E6 $80
    jr   nz, jr_007_7696                          ; $768E: $20 $06

    ldh  a, [hFrameCounter]                       ; $7690: $F0 $E7
    and  $07                                      ; $7692: $E6 $07
    jr   nz, jr_007_76C2                          ; $7694: $20 $2C

jr_007_7696:
    call GetRandomByte                            ; $7696: $CD $0D $28
    and  $01                                      ; $7699: $E6 $01
    ld   e, $01                                   ; $769B: $1E $01
    jr   z, jr_007_76A1                           ; $769D: $28 $02

    ld   e, $FF                                   ; $769F: $1E $FF

jr_007_76A1:
    ld   hl, $C380                                ; $76A1: $21 $80 $C3
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    add  e                                        ; $76A6: $83
    and  $07                                      ; $76A7: $E6 $07
    ld   [hl], a                                  ; $76A9: $77
    ld   e, a                                     ; $76AA: $5F
    ld   d, b                                     ; $76AB: $50
    ld   hl, $7643                                ; $76AC: $21 $43 $76
    add  hl, de                                   ; $76AF: $19
    ld   a, [hl]                                  ; $76B0: $7E
    ld   hl, wEntity0SpeedX                       ; $76B1: $21 $40 $C2
    add  hl, bc                                   ; $76B4: $09
    ld   [hl], a                                  ; $76B5: $77
    ld   hl, $764B                                ; $76B6: $21 $4B $76
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    call func_007_4005                            ; $76BB: $CD $05 $40
    ld   [hl], a                                  ; $76BE: $77
    call func_007_76E7                            ; $76BF: $CD $E7 $76

jr_007_76C2:
    ld   hl, wEntitiesCollisionsTable             ; $76C2: $21 $A0 $C2
    add  hl, bc                                   ; $76C5: $09
    ld   a, [hl]                                  ; $76C6: $7E
    and  a                                        ; $76C7: $A7
    jr   z, jr_007_76ED                           ; $76C8: $28 $23

    ld   hl, $C380                                ; $76CA: $21 $80 $C3
    add  hl, bc                                   ; $76CD: $09
    ld   a, [hl]                                  ; $76CE: $7E
    xor  $04                                      ; $76CF: $EE $04
    ld   [hl], a                                  ; $76D1: $77
    call GetEntityTransitionCountdown                 ; $76D2: $CD $05 $0C
    srl  [hl]                                     ; $76D5: $CB $3E
    ld   hl, wEntity0SpeedX                       ; $76D7: $21 $40 $C2
    call func_007_76E0                            ; $76DA: $CD $E0 $76
    ld   hl, wEntity0SpeedY                       ; $76DD: $21 $50 $C2

func_007_76E0:
    add  hl, bc                                   ; $76E0: $09
    ld   a, [hl]                                  ; $76E1: $7E
    cpl                                           ; $76E2: $2F
    sra  a                                        ; $76E3: $CB $2F
    inc  a                                        ; $76E5: $3C
    ld   [hl], a                                  ; $76E6: $77

func_007_76E7:
    ld   hl, $C5D0                                ; $76E7: $21 $D0 $C5
    add  hl, bc                                   ; $76EA: $09
    ld   [hl], $FF                                ; $76EB: $36 $FF

jr_007_76ED:
    ret                                           ; $76ED: $C9

    ld   hl, $C460                                ; $76EE: $21 $60 $C4
    add  hl, bc                                   ; $76F1: $09
    ld   a, [hl]                                  ; $76F2: $7E
    and  a                                        ; $76F3: $A7
    ret  nz                                       ; $76F4: $C0

    ld   a, [$D201]                               ; $76F5: $FA $01 $D2
    ld   e, a                                     ; $76F8: $5F
    ld   d, b                                     ; $76F9: $50
    ld   hl, wEntitiesWalkingTable                ; $76FA: $21 $90 $C2
    add  hl, de                                   ; $76FD: $19
    ld   a, [hl]                                  ; $76FE: $7E
    cp   $03                                      ; $76FF: $FE $03
    ret  nz                                       ; $7701: $C0

    inc  [hl]                                     ; $7702: $34
    call IncrementEntityWalkingAttr               ; $7703: $CD $12 $3B
    ldh  a, [hActiveEntityUnknownG]               ; $7706: $F0 $F1
    cp   $00                                      ; $7708: $FE $00
    jr   nz, jr_007_7716                          ; $770A: $20 $0A

    ld   hl, wEntitiesUnknownTableG               ; $770C: $21 $B0 $C3
    add  hl, de                                   ; $770F: $19
    ld   a, [hl]                                  ; $7710: $7E
    cp   $00                                      ; $7711: $FE $00
    jp   z, label_C60                             ; $7713: $CA $60 $0C

jr_007_7716:
    ld   hl, wEntitiesTransitionCountdownTable           ; $7716: $21 $E0 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], $40                                ; $771A: $36 $40
    call GetEntityTransitionCountdown                 ; $771C: $CD $05 $0C
    ld   [hl], $40                                ; $771F: $36 $40
    jp   label_C20                                ; $7721: $C3 $20 $0C

    call GetEntityTransitionCountdown                 ; $7724: $CD $05 $0C
    cp   $01                                      ; $7727: $FE $01
    jr   nz, jr_007_7730                          ; $7729: $20 $05

    ld   a, $01                                   ; $772B: $3E $01
    call label_3B0C                               ; $772D: $CD $0C $3B

jr_007_7730:
    jp   label_007_7733                           ; $7730: $C3 $33 $77

label_007_7733:
    call label_3B5A                               ; $7733: $CD $5A $3B
    jr   nc, jr_007_7783                          ; $7736: $30 $4B

    ld   a, [$C19B]                               ; $7738: $FA $9B $C1
    and  a                                        ; $773B: $A7
    jr   nz, jr_007_7783                          ; $773C: $20 $45

    ld   a, [wAButtonSlot]                        ; $773E: $FA $00 $DB
    cp   $03                                      ; $7741: $FE $03
    jr   nz, jr_007_774D                          ; $7743: $20 $08

    ldh  a, [hJoypadState]                               ; $7745: $F0 $CC
    and  $20                                      ; $7747: $E6 $20
    jr   nz, jr_007_775A                          ; $7749: $20 $0F

    jr   jr_007_7783                              ; $774B: $18 $36

jr_007_774D:
    ld   a, [wBButtonSlot]                        ; $774D: $FA $01 $DB
    cp   $03                                      ; $7750: $FE $03
    jr   nz, jr_007_7783                          ; $7752: $20 $2F

    ldh  a, [hJoypadState]                               ; $7754: $F0 $CC
    and  $10                                      ; $7756: $E6 $10
    jr   z, jr_007_7783                           ; $7758: $28 $29

jr_007_775A:
    ld   a, [$C3CF]                               ; $775A: $FA $CF $C3
    and  a                                        ; $775D: $A7
    jr   nz, jr_007_7783                          ; $775E: $20 $23

    inc  a                                        ; $7760: $3C
    ld   [$C3CF], a                               ; $7761: $EA $CF $C3
    call IncrementEntityWalkingAttr               ; $7764: $CD $12 $3B
    ld   [hl], $02                                ; $7767: $36 $02
    ld   hl, wEntity0State                         ; $7769: $21 $80 $C2
    add  hl, bc                                   ; $776C: $09
    ld   [hl], $07                                ; $776D: $36 $07
    ld   hl, $C490                                ; $776F: $21 $90 $C4
    add  hl, bc                                   ; $7772: $09
    ld   [hl], b                                  ; $7773: $70
    ldh  a, [hLinkDirection]                      ; $7774: $F0 $9E
    ld   [wC15D], a                               ; $7776: $EA $5D $C1
    call GetEntityTransitionCountdown                 ; $7779: $CD $05 $0C
    ld   [hl], $02                                ; $777C: $36 $02
    ld   hl, hWaveSfx                                 ; $777E: $21 $F3 $FF
    ld   [hl], $02                                ; $7781: $36 $02

jr_007_7783:
    ret                                           ; $7783: $C9

    ld   [hl], b                                  ; $7784: $70
    nop                                           ; $7785: $00
    ld   [hl], b                                  ; $7786: $70
    jr   nz, jr_007_77FB                          ; $7787: $20 $72

    nop                                           ; $7789: $00
    ld   [hl], d                                  ; $778A: $72
    jr   nz, @+$76                                ; $778B: $20 $74

    nop                                           ; $778D: $00
    ld   [hl], h                                  ; $778E: $74
    jr   nz, @+$78                                ; $778F: $20 $76

    nop                                           ; $7791: $00
    db   $76                                      ; $7792: $76
    jr   nz, @+$62                                ; $7793: $20 $60

    nop                                           ; $7795: $00
    ld   h, b                                     ; $7796: $60
    jr   nz, jr_007_77FB                          ; $7797: $20 $62

    nop                                           ; $7799: $00
    ld   h, d                                     ; $779A: $62
    jr   nz, @+$66                                ; $779B: $20 $64

    nop                                           ; $779D: $00
    ld   h, h                                     ; $779E: $64
    jr   nz, @+$68                                ; $779F: $20 $66

    nop                                           ; $77A1: $00
    ld   h, [hl]                                  ; $77A2: $66
    jr   nz, jr_007_77B6                          ; $77A3: $20 $11

    add  h                                        ; $77A5: $84
    ld   [hl], a                                  ; $77A6: $77
    ldh  a, [hMapId]                              ; $77A7: $F0 $F7
    cp   $03                                      ; $77A9: $FE $03
    jr   nz, jr_007_77B0                          ; $77AB: $20 $03

    ld   de, $7794                                ; $77AD: $11 $94 $77

jr_007_77B0:
    call RenderAnimatedActiveEntity                               ; $77B0: $CD $C0 $3B
    call func_007_7D96                            ; $77B3: $CD $96 $7D

jr_007_77B6:
    ld   hl, $C410                                ; $77B6: $21 $10 $C4
    add  hl, bc                                   ; $77B9: $09
    ld   a, [hl]                                  ; $77BA: $7E
    and  a                                        ; $77BB: $A7
    jr   z, jr_007_77C1                           ; $77BC: $28 $03

    call label_3D7F                               ; $77BE: $CD $7F $3D

jr_007_77C1:
    call func_007_7DC3                            ; $77C1: $CD $C3 $7D
    call label_3B39                               ; $77C4: $CD $39 $3B
    call func_007_7E0A                            ; $77C7: $CD $0A $7E
    call func_007_7E43                            ; $77CA: $CD $43 $7E
    call label_3B23                               ; $77CD: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                                ; $77D0: $21 $20 $C3
    add  hl, bc                                   ; $77D3: $09
    dec  [hl]                                     ; $77D4: $35
    dec  [hl]                                     ; $77D5: $35
    ld   hl, wEntitiesPosZTable                                ; $77D6: $21 $10 $C3
    add  hl, bc                                   ; $77D9: $09
    ld   a, [hl]                                  ; $77DA: $7E
    bit  7, a                                     ; $77DB: $CB $7F
    jr   nz, jr_007_77E2                          ; $77DD: $20 $03

    and  a                                        ; $77DF: $A7
    jr   nz, jr_007_780D                          ; $77E0: $20 $2B

jr_007_77E2:
    ld   [hl], b                                  ; $77E2: $70
    ldh  a, [hActiveEntityWalking]                ; $77E3: $F0 $F0
    cp   $03                                      ; $77E5: $FE $03
    jr   nz, jr_007_7808                          ; $77E7: $20 $1F

    ld   hl, wEntity0SpeedX                       ; $77E9: $21 $40 $C2
    add  hl, bc                                   ; $77EC: $09
    sra  [hl]                                     ; $77ED: $CB $2E
    call func_007_4005                            ; $77EF: $CD $05 $40
    sra  [hl]                                     ; $77F2: $CB $2E
    ld   hl, wEntitiesSpeedZTable                                ; $77F4: $21 $20 $C3
    add  hl, bc                                   ; $77F7: $09
    ld   a, [hl]                                  ; $77F8: $7E
    sra  a                                        ; $77F9: $CB $2F

jr_007_77FB:
    cpl                                           ; $77FB: $2F
    ld   [hl], a                                  ; $77FC: $77
    cp   $07                                      ; $77FD: $FE $07
    jp   nc, label_007_780D                       ; $77FF: $D2 $0D $78

    ld   [hl], b                                  ; $7802: $70
    call label_3D7F                               ; $7803: $CD $7F $3D
    jr   jr_007_780D                              ; $7806: $18 $05

jr_007_7808:
    ld   hl, wEntitiesSpeedZTable                                ; $7808: $21 $20 $C3
    add  hl, bc                                   ; $780B: $09
    ld   [hl], b                                  ; $780C: $70

label_007_780D:
jr_007_780D:
    ldh  a, [hActiveEntityWalking]                ; $780D: $F0 $F0
    cp   $04                                      ; $780F: $FE $04
    jr   c, jr_007_7814                           ; $7811: $38 $01

    ret                                           ; $7813: $C9

jr_007_7814:
    rst  $00                                      ; $7814: $C7
    dec  h                                        ; $7815: $25
    ld   a, b                                     ; $7816: $78
    ld   h, b                                     ; $7817: $60
    ld   a, b                                     ; $7818: $78
    and  l                                        ; $7819: $A5
    ld   a, b                                     ; $781A: $78
    db   $EC                                      ; $781B: $EC
    ld   a, b                                     ; $781C: $78
    ld   b, $FA                                   ; $781D: $06 $FA
    nop                                           ; $781F: $00
    nop                                           ; $7820: $00
    nop                                           ; $7821: $00
    nop                                           ; $7822: $00
    ld   a, [$CD06]                               ; $7823: $FA $06 $CD
    ld   a, a                                     ; $7826: $7F
    dec  a                                        ; $7827: $3D
    call GetEntityTransitionCountdown                 ; $7828: $CD $05 $0C
    jr   nz, jr_007_785E                          ; $782B: $20 $31

    call GetRandomByte                            ; $782D: $CD $0D $28
    and  $1F                                      ; $7830: $E6 $1F
    add  $30                                      ; $7832: $C6 $30
    ld   [hl], a                                  ; $7834: $77
    call IncrementEntityWalkingAttr               ; $7835: $CD $12 $3B
    call GetRandomByte                            ; $7838: $CD $0D $28
    and  $06                                      ; $783B: $E6 $06
    jr   nz, jr_007_7844                          ; $783D: $20 $05

    call func_007_7E7D                            ; $783F: $CD $7D $7E
    jr   jr_007_784A                              ; $7842: $18 $06

jr_007_7844:
    call GetRandomByte                            ; $7844: $CD $0D $28
    and  $03                                      ; $7847: $E6 $03
    ld   e, a                                     ; $7849: $5F

jr_007_784A:
    ld   d, b                                     ; $784A: $50
    ld   hl, $781D                                ; $784B: $21 $1D $78
    add  hl, de                                   ; $784E: $19
    ld   a, [hl]                                  ; $784F: $7E
    ld   hl, wEntity0SpeedX                       ; $7850: $21 $40 $C2
    add  hl, bc                                   ; $7853: $09
    ld   [hl], a                                  ; $7854: $77
    ld   hl, $7821                                ; $7855: $21 $21 $78
    add  hl, de                                   ; $7858: $19
    ld   a, [hl]                                  ; $7859: $7E
    call func_007_4005                            ; $785A: $CD $05 $40
    ld   [hl], a                                  ; $785D: $77

jr_007_785E:
    jr   jr_007_786E                              ; $785E: $18 $0E

    call GetEntityTransitionCountdown                 ; $7860: $CD $05 $0C
    jr   nz, jr_007_786B                          ; $7863: $20 $06

    ld   [hl], $18                                ; $7865: $36 $18
    call IncrementEntityWalkingAttr               ; $7867: $CD $12 $3B
    ld   [hl], b                                  ; $786A: $70

jr_007_786B:
    call func_007_78E1                            ; $786B: $CD $E1 $78

jr_007_786E:
    ld   hl, $C350                                ; $786E: $21 $50 $C3
    add  hl, bc                                   ; $7871: $09
    ld   [hl], $80                                ; $7872: $36 $80
    ld   hl, $C430                                ; $7874: $21 $30 $C4
    add  hl, bc                                   ; $7877: $09
    ld   [hl], $48                                ; $7878: $36 $48
    call func_007_7E5D                            ; $787A: $CD $5D $7E
    add  $06                                      ; $787D: $C6 $06
    cp   $0A                                      ; $787F: $FE $0A
    jr   c, jr_007_788C                           ; $7881: $38 $09

    call func_007_7E6D                            ; $7883: $CD $6D $7E
    add  $06                                      ; $7886: $C6 $06
    cp   $0A                                      ; $7888: $FE $0A
    jr   nc, jr_007_789C                          ; $788A: $30 $10

jr_007_788C:
    call func_007_7E7D                            ; $788C: $CD $7D $7E
    ld   hl, $C380                                ; $788F: $21 $80 $C3
    add  hl, bc                                   ; $7892: $09
    ld   [hl], e                                  ; $7893: $73
    call IncrementEntityWalkingAttr               ; $7894: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $7897: $CD $05 $0C
    ld   [hl], $FF                                ; $789A: $36 $FF

jr_007_789C:
    ret                                           ; $789C: $C9

    jr   @-$16                                    ; $789D: $18 $E8

    nop                                           ; $789F: $00
    nop                                           ; $78A0: $00
    nop                                           ; $78A1: $00
    nop                                           ; $78A2: $00
    add  sp, $18                                  ; $78A3: $E8 $18
    call GetEntityTransitionCountdown                 ; $78A5: $CD $05 $0C
    jr   z, jr_007_78DD                           ; $78A8: $28 $33

    ld   hl, $C380                                ; $78AA: $21 $80 $C3
    add  hl, bc                                   ; $78AD: $09
    ld   e, [hl]                                  ; $78AE: $5E
    ld   d, b                                     ; $78AF: $50
    ld   hl, $789D                                ; $78B0: $21 $9D $78
    add  hl, de                                   ; $78B3: $19
    ld   a, [hl]                                  ; $78B4: $7E
    ld   hl, wEntity0SpeedX                       ; $78B5: $21 $40 $C2
    add  hl, bc                                   ; $78B8: $09
    sub  [hl]                                     ; $78B9: $96
    jr   z, jr_007_78C3                           ; $78BA: $28 $07

    and  $80                                      ; $78BC: $E6 $80
    jr   nz, jr_007_78C2                          ; $78BE: $20 $02

    inc  [hl]                                     ; $78C0: $34
    inc  [hl]                                     ; $78C1: $34

jr_007_78C2:
    dec  [hl]                                     ; $78C2: $35

jr_007_78C3:
    ld   hl, $78A1                                ; $78C3: $21 $A1 $78
    add  hl, de                                   ; $78C6: $19
    ld   a, [hl]                                  ; $78C7: $7E
    call func_007_4005                            ; $78C8: $CD $05 $40
    sub  [hl]                                     ; $78CB: $96
    jr   z, jr_007_78D5                           ; $78CC: $28 $07

    and  $80                                      ; $78CE: $E6 $80
    jr   nz, jr_007_78D4                          ; $78D0: $20 $02

    inc  [hl]                                     ; $78D2: $34
    inc  [hl]                                     ; $78D3: $34

jr_007_78D4:
    dec  [hl]                                     ; $78D4: $35

jr_007_78D5:
    ld   hl, wEntitiesCollisionsTable             ; $78D5: $21 $A0 $C2
    add  hl, bc                                   ; $78D8: $09
    ld   a, [hl]                                  ; $78D9: $7E
    and  a                                        ; $78DA: $A7
    jr   z, jr_007_78E1                           ; $78DB: $28 $04

jr_007_78DD:
    call IncrementEntityWalkingAttr               ; $78DD: $CD $12 $3B
    ld   [hl], b                                  ; $78E0: $70

func_007_78E1:
jr_007_78E1:
    ldh  a, [hFrameCounter]                       ; $78E1: $F0 $E7
    rra                                           ; $78E3: $1F
    rra                                           ; $78E4: $1F
    rra                                           ; $78E5: $1F
    rra                                           ; $78E6: $1F
    and  $01                                      ; $78E7: $E6 $01
    jp   label_3B0C                               ; $78E9: $C3 $0C $3B

    ld   hl, $C430                                ; $78EC: $21 $30 $C4
    add  hl, bc                                   ; $78EF: $09
    ld   [hl], $08                                ; $78F0: $36 $08
    ld   hl, $C350                                ; $78F2: $21 $50 $C3
    add  hl, bc                                   ; $78F5: $09
    ld   [hl], $00                                ; $78F6: $36 $00
    ldh  a, [hFrameCounter]                       ; $78F8: $F0 $E7
    rra                                           ; $78FA: $1F
    rra                                           ; $78FB: $1F
    rra                                           ; $78FC: $1F
    rra                                           ; $78FD: $1F
    and  $01                                      ; $78FE: $E6 $01
    inc  a                                        ; $7900: $3C
    inc  a                                        ; $7901: $3C
    call label_3B0C                               ; $7902: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $7905: $CD $05 $0C
    jr   nz, jr_007_791A                          ; $7908: $20 $10

    call IncrementEntityWalkingAttr               ; $790A: $CD $12 $3B
    ld   [hl], b                                  ; $790D: $70
    ld   hl, wEntitiesSpeedZTable                                ; $790E: $21 $20 $C3
    add  hl, bc                                   ; $7911: $09
    ld   [hl], $18                                ; $7912: $36 $18
    ld   hl, wEntity0SpeedX                       ; $7914: $21 $40 $C2
    add  hl, bc                                   ; $7917: $09
    ld   [hl], b                                  ; $7918: $70
    ret                                           ; $7919: $C9

jr_007_791A:
    cp   $60                                      ; $791A: $FE $60
    jr   nc, jr_007_792B                          ; $791C: $30 $0D

    and  $04                                      ; $791E: $E6 $04
    ld   a, $08                                   ; $7920: $3E $08
    jr   nz, jr_007_7926                          ; $7922: $20 $02

    ld   a, $F8                                   ; $7924: $3E $F8

jr_007_7926:
    ld   hl, wEntity0SpeedX                       ; $7926: $21 $40 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77

jr_007_792B:
    ld   hl, $C410                                ; $792B: $21 $10 $C4
    add  hl, bc                                   ; $792E: $09
    ld   a, [hl]                                  ; $792F: $7E
    push af                                       ; $7930: $F5
    ld   [hl], $01                                ; $7931: $36 $01
    call label_3B23                               ; $7933: $CD $23 $3B
    pop  af                                       ; $7936: $F1
    ld   hl, $C410                                ; $7937: $21 $10 $C4
    add  hl, bc                                   ; $793A: $09
    ld   [hl], a                                  ; $793B: $77
    ret                                           ; $793C: $C9

    ld   b, $04                                   ; $793D: $06 $04
    ld   [bc], a                                  ; $793F: $02
    nop                                           ; $7940: $00
    ldh  a, [hMapId]                              ; $7941: $F0 $F7
    cp   $15                                      ; $7943: $FE $15
    jr   nz, jr_007_794F                          ; $7945: $20 $08

    ld   a, [wIsBowWowFollowingLink]              ; $7947: $FA $56 $DB
    cp   $80                                      ; $794A: $FE $80
    jp   nz, label_007_7EA4                       ; $794C: $C2 $A4 $7E

jr_007_794F:
    call func_007_7AB5                            ; $794F: $CD $B5 $7A
    call func_007_7D96                            ; $7952: $CD $96 $7D
    ldh  a, [hMapId]                              ; $7955: $F0 $F7
    cp   $15                                      ; $7957: $FE $15
    jr   z, jr_007_7963                           ; $7959: $28 $08

    ld   hl, $C410                                ; $795B: $21 $10 $C4
    add  hl, bc                                   ; $795E: $09
    ld   a, [hl]                                  ; $795F: $7E
    and  a                                        ; $7960: $A7
    jr   z, jr_007_7966                           ; $7961: $28 $03

jr_007_7963:
    call func_007_7A55                            ; $7963: $CD $55 $7A

jr_007_7966:
    call func_007_7DC3                            ; $7966: $CD $C3 $7D
    call label_3B65                               ; $7969: $CD $65 $3B
    call label_3B39                               ; $796C: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                ; $796F: $F0 $F0
    rst  $00                                      ; $7971: $C7
    add  b                                        ; $7972: $80
    ld   a, c                                     ; $7973: $79
    or   h                                        ; $7974: $B4
    ld   a, c                                     ; $7975: $79
    rst  $10                                      ; $7976: $D7
    ld   a, c                                     ; $7977: $79
    ld   b, $FA                                   ; $7978: $06 $FA
    nop                                           ; $797A: $00
    nop                                           ; $797B: $00
    nop                                           ; $797C: $00
    nop                                           ; $797D: $00
    ld   a, [$CD06]                               ; $797E: $FA $06 $CD
    inc  hl                                       ; $7981: $23
    dec  sp                                       ; $7982: $3B
    ld   hl, $C3D0                                ; $7983: $21 $D0 $C3
    add  hl, bc                                   ; $7986: $09
    ld   [hl], $00                                ; $7987: $36 $00
    call func_007_7A2D                            ; $7989: $CD $2D $7A
    call GetEntityTransitionCountdown                 ; $798C: $CD $05 $0C
    jr   nz, jr_007_79B3                          ; $798F: $20 $22

    ld   [hl], $80                                ; $7991: $36 $80
    call IncrementEntityWalkingAttr               ; $7993: $CD $12 $3B

func_007_7996:
    ld   hl, $C380                                ; $7996: $21 $80 $C3
    add  hl, bc                                   ; $7999: $09
    ld   a, [hl]                                  ; $799A: $7E
    xor  $01                                      ; $799B: $EE $01
    ld   [hl], a                                  ; $799D: $77
    ld   e, a                                     ; $799E: $5F
    ld   d, b                                     ; $799F: $50
    ld   hl, $7978                                ; $79A0: $21 $78 $79
    add  hl, de                                   ; $79A3: $19
    ld   a, [hl]                                  ; $79A4: $7E
    ld   hl, wEntity0SpeedX                       ; $79A5: $21 $40 $C2
    add  hl, bc                                   ; $79A8: $09
    ld   [hl], a                                  ; $79A9: $77
    ld   hl, $797C                                ; $79AA: $21 $7C $79
    add  hl, de                                   ; $79AD: $19
    ld   a, [hl]                                  ; $79AE: $7E
    call func_007_4005                            ; $79AF: $CD $05 $40
    ld   [hl], a                                  ; $79B2: $77

jr_007_79B3:
    ret                                           ; $79B3: $C9

    call func_007_7A2D                            ; $79B4: $CD $2D $7A
    ld   hl, wEntitiesCollisionsTable             ; $79B7: $21 $A0 $C2
    add  hl, bc                                   ; $79BA: $09
    ld   a, [hl]                                  ; $79BB: $7E
    and  a                                        ; $79BC: $A7
    jr   z, jr_007_79C2                           ; $79BD: $28 $03

    call func_007_7996                            ; $79BF: $CD $96 $79

jr_007_79C2:
    call func_007_7E0A                            ; $79C2: $CD $0A $7E
    call label_3B23                               ; $79C5: $CD $23 $3B
    call func_007_7D1A                            ; $79C8: $CD $1A $7D
    call GetEntityTransitionCountdown                 ; $79CB: $CD $05 $0C
    jr   nz, jr_007_79D6                          ; $79CE: $20 $06

    ld   [hl], $30                                ; $79D0: $36 $30

func_007_79D2:
    call IncrementEntityWalkingAttr               ; $79D2: $CD $12 $3B
    ld   [hl], b                                  ; $79D5: $70

jr_007_79D6:
    ret                                           ; $79D6: $C9

    call IsEntityUnknownFZero                                ; $79D7: $CD $00 $0C
    jr   z, jr_007_79F9                           ; $79DA: $28 $1D

    ld   a, [wTransitionSequenceCounter]          ; $79DC: $FA $6B $C1
    cp   $04                                      ; $79DF: $FE $04
    jr   nz, jr_007_79F9                          ; $79E1: $20 $16

    ldh  a, [hMapId]                              ; $79E3: $F0 $F7
    cp   $15                                      ; $79E5: $FE $15
    jr   nz, jr_007_79F9                          ; $79E7: $20 $10

    ld   hl, wEntitiesUnknownTableD               ; $79E9: $21 $D0 $C2
    add  hl, bc                                   ; $79EC: $09
    ld   a, [hl]                                  ; $79ED: $7E
    and  a                                        ; $79EE: $A7
    jr   nz, jr_007_7A1E                          ; $79EF: $20 $2D

    inc  [hl]                                     ; $79F1: $34
    ld   a, $90                                   ; $79F2: $3E $90
    call OpenDialogInTable1                       ; $79F4: $CD $73 $23
    jr   jr_007_7A1E                              ; $79F7: $18 $25

jr_007_79F9:
    ld   a, [hl]                                  ; $79F9: $7E
    and  a                                        ; $79FA: $A7
    jr   nz, jr_007_7A1E                          ; $79FB: $20 $21

    call GetEntityTransitionCountdown                 ; $79FD: $CD $05 $0C
    jr   nz, jr_007_7A07                          ; $7A00: $20 $05

    ld   [hl], $18                                ; $7A02: $36 $18
    call func_007_79D2                            ; $7A04: $CD $D2 $79

jr_007_7A07:
    call func_007_7D1A                            ; $7A07: $CD $1A $7D
    call func_007_7D1A                            ; $7A0A: $CD $1A $7D
    call func_007_7E0A                            ; $7A0D: $CD $0A $7E
    call label_3B23                               ; $7A10: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7A13: $F0 $E7
    xor  c                                        ; $7A15: $A9
    and  $0F                                      ; $7A16: $E6 $0F
    ret  nz                                       ; $7A18: $C0

    ld   a, $0A                                   ; $7A19: $3E $0A
    call label_3BAA                               ; $7A1B: $CD $AA $3B

jr_007_7A1E:
    call func_007_7E7D                            ; $7A1E: $CD $7D $7E
    ld   hl, $C380                                ; $7A21: $21 $80 $C3
    add  hl, bc                                   ; $7A24: $09
    ld   [hl], a                                  ; $7A25: $77
    jp   label_007_7D1A                           ; $7A26: $C3 $1A $7D

    ld   bc, $0300                                ; $7A29: $01 $00 $03
    ld   [bc], a                                  ; $7A2C: $02

func_007_7A2D:
    ld   a, [$C502]                               ; $7A2D: $FA $02 $C5
    and  a                                        ; $7A30: $A7
    jr   nz, jr_007_7A55                          ; $7A31: $20 $22

    call func_007_7E5D                            ; $7A33: $CD $5D $7E
    add  $30                                      ; $7A36: $C6 $30
    cp   $60                                      ; $7A38: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A3A: $30 $30

    call func_007_7E6D                            ; $7A3C: $CD $6D $7E
    add  $30                                      ; $7A3F: $C6 $30
    cp   $60                                      ; $7A41: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A43: $30 $27

    call func_007_7E7D                            ; $7A45: $CD $7D $7E
    ld   d, b                                     ; $7A48: $50
    ld   hl, $7A29                                ; $7A49: $21 $29 $7A
    add  hl, de                                   ; $7A4C: $19
    ld   a, [hl]                                  ; $7A4D: $7E
    ld   hl, $C380                                ; $7A4E: $21 $80 $C3
    add  hl, bc                                   ; $7A51: $09
    cp   [hl]                                     ; $7A52: $BE
    jr   z, jr_007_7A6C                           ; $7A53: $28 $17

func_007_7A55:
jr_007_7A55:
    ld   hl, wEntitiesWalkingTable                ; $7A55: $21 $90 $C2
    add  hl, bc                                   ; $7A58: $09
    ld   a, [hl]                                  ; $7A59: $7E
    cp   $02                                      ; $7A5A: $FE $02
    jr   z, jr_007_7A65                           ; $7A5C: $28 $07

    push hl                                       ; $7A5E: $E5
    call IsEntityUnknownFZero                                ; $7A5F: $CD $00 $0C
    ld   [hl], $10                                ; $7A62: $36 $10
    pop  hl                                       ; $7A64: $E1

jr_007_7A65:
    ld   [hl], $02                                ; $7A65: $36 $02
    call GetEntityTransitionCountdown                 ; $7A67: $CD $05 $0C
    ld   [hl], $80                                ; $7A6A: $36 $80

jr_007_7A6C:
    ret                                           ; $7A6C: $C9

    nop                                           ; $7A6D: $00
    nop                                           ; $7A6E: $00
    ld   sp, hl                                   ; $7A6F: $F9
    ld   sp, hl                                   ; $7A70: $F9
    ld   hl, sp-$0E                               ; $7A71: $F8 $F2
    ld   [$080E], sp                              ; $7A73: $08 $0E $08
    ld   c, $F8                                   ; $7A76: $0E $F8
    ld   a, [c]                                   ; $7A78: $F2
    nop                                           ; $7A79: $00
    nop                                           ; $7A7A: $00
    nop                                           ; $7A7B: $00
    nop                                           ; $7A7C: $00
    ld   [bc], a                                  ; $7A7D: $02
    ld   [bc], a                                  ; $7A7E: $02
    ld   b, $06                                   ; $7A7F: $06 $06
    inc  b                                        ; $7A81: $04
    inc  b                                        ; $7A82: $04
    nop                                           ; $7A83: $00
    nop                                           ; $7A84: $00
    inc  c                                        ; $7A85: $0C
    inc  c                                        ; $7A86: $0C
    inc  b                                        ; $7A87: $04
    inc  b                                        ; $7A88: $04
    db   $FC                                      ; $7A89: $FC
    db   $FC                                      ; $7A8A: $FC
    inc  d                                        ; $7A8B: $14
    inc  d                                        ; $7A8C: $14
    inc  d                                        ; $7A8D: $14
    inc  d                                        ; $7A8E: $14
    db   $FC                                      ; $7A8F: $FC
    db   $FC                                      ; $7A90: $FC
    inc  c                                        ; $7A91: $0C
    inc  c                                        ; $7A92: $0C
    inc  c                                        ; $7A93: $0C
    inc  c                                        ; $7A94: $0C
    ld   h, b                                     ; $7A95: $60
    inc  bc                                       ; $7A96: $03
    ld   h, d                                     ; $7A97: $62
    inc  bc                                       ; $7A98: $03
    ld   h, d                                     ; $7A99: $62
    inc  hl                                       ; $7A9A: $23
    ld   h, b                                     ; $7A9B: $60
    inc  hl                                       ; $7A9C: $23
    ld   h, h                                     ; $7A9D: $64
    inc  bc                                       ; $7A9E: $03
    ld   h, [hl]                                  ; $7A9F: $66
    inc  bc                                       ; $7AA0: $03
    ld   h, [hl]                                  ; $7AA1: $66
    inc  hl                                       ; $7AA2: $23
    ld   h, h                                     ; $7AA3: $64
    inc  hl                                       ; $7AA4: $23
    ld   l, b                                     ; $7AA5: $68
    inc  bc                                       ; $7AA6: $03
    ld   l, d                                     ; $7AA7: $6A
    inc  bc                                       ; $7AA8: $03
    ld   l, h                                     ; $7AA9: $6C
    inc  bc                                       ; $7AAA: $03
    ld   l, [hl]                                  ; $7AAB: $6E
    inc  bc                                       ; $7AAC: $03
    ld   l, d                                     ; $7AAD: $6A
    inc  hl                                       ; $7AAE: $23
    ld   l, b                                     ; $7AAF: $68
    inc  hl                                       ; $7AB0: $23
    ld   l, [hl]                                  ; $7AB1: $6E
    inc  hl                                       ; $7AB2: $23
    ld   l, h                                     ; $7AB3: $6C
    inc  hl                                       ; $7AB4: $23

func_007_7AB5:
    call SkipDisabledEntityDuringRoomTransition ; $7AB5: $CD $57 $3D
    ldh  a, [hActiveEntityUnknownG]               ; $7AB8: $F0 $F1
    cp   $02                                      ; $7ABA: $FE $02
    jr   nc, jr_007_7AC1                          ; $7ABC: $30 $03

    call func_007_7B30                            ; $7ABE: $CD $30 $7B

jr_007_7AC1:
    ldh  a, [hActiveEntityUnknownG]               ; $7AC1: $F0 $F1
    cp   $02                                      ; $7AC3: $FE $02
    jr   z, jr_007_7ACB                           ; $7AC5: $28 $04

    cp   $03                                      ; $7AC7: $FE $03
    jr   nz, jr_007_7AD1                          ; $7AC9: $20 $06

jr_007_7ACB:
    ld   de, $7A95                                ; $7ACB: $11 $95 $7A
    call RenderAnimatedActiveEntity                               ; $7ACE: $CD $C0 $3B

jr_007_7AD1:
    push bc                                       ; $7AD1: $C5
    ldh  a, [wActiveEntityPosY]                   ; $7AD2: $F0 $EC
    ldh  [hScratchA], a                           ; $7AD4: $E0 $D7
    ldh  a, [wActiveEntityPosX]                   ; $7AD6: $F0 $EE
    ldh  [hScratchB], a                           ; $7AD8: $E0 $D8
    ldh  a, [hActiveEntityUnknownG]               ; $7ADA: $F0 $F1
    ld   e, a                                     ; $7ADC: $5F
    ld   d, b                                     ; $7ADD: $50
    ld   hl, $7A85                                ; $7ADE: $21 $85 $7A
    add  hl, de                                   ; $7AE1: $19
    ld   a, [hl]                                  ; $7AE2: $7E
    ld   [$D5C0], a                               ; $7AE3: $EA $C0 $D5
    ld   hl, $7A8D                                ; $7AE6: $21 $8D $7A
    add  hl, de                                   ; $7AE9: $19
    ld   a, [hl]                                  ; $7AEA: $7E
    ld   [$D5C2], a                               ; $7AEB: $EA $C2 $D5
    ld   a, $02                                   ; $7AEE: $3E $02
    ld   [$D5C1], a                               ; $7AF0: $EA $C1 $D5
    ld   [$D5C3], a                               ; $7AF3: $EA $C3 $D5
    ld   hl, $7A7D                                ; $7AF6: $21 $7D $7A
    add  hl, de                                   ; $7AF9: $19
    ld   a, [hl]                                  ; $7AFA: $7E
    ldh  [hScratchC], a                           ; $7AFB: $E0 $D9
    ld   hl, $7A75                                ; $7AFD: $21 $75 $7A
    add  hl, de                                   ; $7B00: $19
    ld   a, [hl]                                  ; $7B01: $7E
    ld   hl, $7A6D                                ; $7B02: $21 $6D $7A
    add  hl, de                                   ; $7B05: $19
    ld   l, [hl]                                  ; $7B06: $6E
    ld   h, a                                     ; $7B07: $67
    push hl                                       ; $7B08: $E5
    ld   a, [$C3C0]                               ; $7B09: $FA $C0 $C3
    ld   e, a                                     ; $7B0C: $5F
    ld   d, $00                                   ; $7B0D: $16 $00
    ld   hl, $C030                                ; $7B0F: $21 $30 $C0
    add  hl, de                                   ; $7B12: $19
    ld   c, l                                     ; $7B13: $4D
    ld   b, h                                     ; $7B14: $44
    xor  a                                        ; $7B15: $AF
    ldh  [hScratchD], a                           ; $7B16: $E0 $DA
    pop  hl                                       ; $7B18: $E1
    call label_1819                               ; $7B19: $CD $19 $18
    ld   a, $02                                   ; $7B1C: $3E $02
    call label_3DA0                               ; $7B1E: $CD $A0 $3D
    pop  bc                                       ; $7B21: $C1
    ldh  a, [hActiveEntityUnknownG]               ; $7B22: $F0 $F1
    cp   $02                                      ; $7B24: $FE $02
    ret  z                                        ; $7B26: $C8

    cp   $03                                      ; $7B27: $FE $03
    ret  z                                        ; $7B29: $C8

    ld   de, $7A95                                ; $7B2A: $11 $95 $7A
    jp   RenderAnimatedActiveEntity                               ; $7B2D: $C3 $C0 $3B

func_007_7B30:
    xor  $01                                      ; $7B30: $EE $01
    push af                                       ; $7B32: $F5
    ld   a, [$C3C0]                               ; $7B33: $FA $C0 $C3
    ld   l, a                                     ; $7B36: $6F
    ld   h, $00                                   ; $7B37: $26 $00
    ld   de, $C030                                ; $7B39: $11 $30 $C0
    add  hl, de                                   ; $7B3C: $19
    pop  de                                       ; $7B3D: $D1
    ldh  a, [wActiveEntityPosY]                   ; $7B3E: $F0 $EC
    add  d                                        ; $7B40: $82
    add  $04                                      ; $7B41: $C6 $04
    ld   [hl+], a                                 ; $7B43: $22
    ldh  a, [wActiveEntityPosX]                   ; $7B44: $F0 $EE
    add  $FE                                      ; $7B46: $C6 $FE
    ld   [hl+], a                                 ; $7B48: $22
    ld   a, $86                                   ; $7B49: $3E $86
    ld   [hl+], a                                 ; $7B4B: $22
    ld   [hl], $16                                ; $7B4C: $36 $16
    ld   a, $01                                   ; $7B4E: $3E $01
    jp   label_3DA0                               ; $7B50: $C3 $A0 $3D

; Chest OAM data? (7B97 contains seashell tile info)
data_007_7B53::
    db $82, $17, $86, $14, $82, $15, $86, $15
    db $88, $10, $8A, $10, $8C, $14, $98, $16
    db $90, $17, $92, $16, $96, $10, $8E, $10
    db $80, $15, $84, $10, $94, $15, $9A, $10
    db $AE, $10, $9C, $10, $A0, $14, $C0, $14
    db $C2, $14, $C4, $14, $C6, $14, $CA, $14
    db $C0, $14, $C2, $15, $C4, $14, $C6, $14
    db $CA, $17, $A6, $15, $A6, $15, $A6, $15
    db $A6, $15, $A6, $15, $9E, $14

SpitObjectDialog::
    db $90 ; Dialog144
    db $91 ; Dialog145
    db $92 ; Dialog146
    db $93 ; Dialog147
    db $94, $95, $96, $97, $98, $99
    db $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1
    db $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9
    db $AA, $AC, $AB, $AD, $AE, $AE, $EF, $06
    db $10, $10, $10, $10, $10, $10, $10, $10
    db $10, $01, $01, $10, $10, $10, $10, $10
    db $01, $10, $10, $10, $10, $10, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $00

; Used when an object is spit out after a Like-like ate it
ChestWithItemEntityHandler::
    ld   a, $02                                   ; $7BDD: $3E $02
    ldh  [$FFA1], a                               ; $7BDF: $E0 $A1
    xor  a                                        ; $7BE1: $AF
    ld   [wSwordAnimationState], a                ; $7BE2: $EA $37 $C1
    ld   [wC16A], a                               ; $7BE5: $EA $6A $C1
    ldh  a, [hActiveEntityUnknownG]               ; $7BE8: $F0 $F1
    cp   $22                                      ; $7BEA: $FE $22
    jr   nz, jr_007_7C29                          ; $7BEC: $20 $3B

    ld   a, $1B                                   ; $7BEE: $3E $1B
    call label_3B86                               ; $7BF0: $CD $86 $3B
    jp   c, label_007_7EA4                        ; $7BF3: $DA $A4 $7E

    ldh  a, [hScratchA]                           ; $7BF6: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7BF8: $21 $00 $C2
    add  hl, de                                   ; $7BFB: $19
    ld   [hl], a                                  ; $7BFC: $77
    ldh  a, [hScratchB]                           ; $7BFD: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7BFF: $21 $10 $C2
    add  hl, de                                   ; $7C02: $19
    ld   [hl], a                                  ; $7C03: $77
    ld   hl, wEntitiesSpeedZTable                                ; $7C04: $21 $20 $C3
    add  hl, de                                   ; $7C07: $19
    ld   [hl], $18                                ; $7C08: $36 $18
    ld   hl, wEntitiesPosZTable                                ; $7C0A: $21 $10 $C3
    add  hl, de                                   ; $7C0D: $19
    ld   [hl], $06                                ; $7C0E: $36 $06
    ld   hl, wEntitiesUnknowTableF                ; $7C10: $21 $F0 $C2
    add  hl, de                                   ; $7C13: $19
    ld   [hl], $50                                ; $7C14: $36 $50
    ld   hl, wEntity0SpeedX                       ; $7C16: $21 $40 $C2
    add  hl, de                                   ; $7C19: $19
    ld   [hl], $08                                ; $7C1A: $36 $08
    ld   hl, wEntitiesWalkingTable                ; $7C1C: $21 $90 $C2
    add  hl, de                                   ; $7C1F: $19
    ld   [hl], $03                                ; $7C20: $36 $03
    ld   a, $1D                                   ; $7C22: $3E $1D
    ldh  [hJingle], a                             ; $7C24: $E0 $F2
    jp   label_007_7EA4                           ; $7C26: $C3 $A4 $7E

jr_007_7C29:
    cp   $21                                      ; $7C29: $FE $21
    jr   z, jr_007_7C5E                           ; $7C2B: $28 $31

    cp   $10                                      ; $7C2D: $FE $10
    jr   nz, jr_007_7C36                          ; $7C2F: $20 $05

    ld   a, $01                                   ; $7C31: $3E $01
    ld   [wHasMedicine], a                        ; $7C33: $EA $0D $DB

jr_007_7C36:
    ldh  a, [hIsGBC]                              ; $7C36: $F0 $FE
    and  a                                        ; $7C38: $A7
    jr   z, jr_007_7C58                           ; $7C39: $28 $1D

    ldh  a, [hMapId]                              ; $7C3B: $F0 $F7
    cp   $05                                      ; $7C3D: $FE $05
    jr   nz, jr_007_7C49                          ; $7C3F: $20 $08

    ldh  a, [hMapRoom]                            ; $7C41: $F0 $F6
    cp   $CE                                      ; $7C43: $FE $CE
    jr   nz, jr_007_7C58                          ; $7C45: $20 $11

    jr   jr_007_7C53                              ; $7C47: $18 $0A

jr_007_7C49:
    cp   $06                                      ; $7C49: $FE $06
    jr   nz, jr_007_7C58                          ; $7C4B: $20 $0B

    ldh  a, [hMapRoom]                            ; $7C4D: $F0 $F6
    cp   $1A                                      ; $7C4F: $FE $1A
    jr   nz, jr_007_7C58                          ; $7C51: $20 $05

jr_007_7C53:
    ld   de, $7B53                                ; $7C53: $11 $53 $7B
    jr   jr_007_7C5B                              ; $7C56: $18 $03

jr_007_7C58:
    ld   de, $7B57                                ; $7C58: $11 $57 $7B

jr_007_7C5B:
    call label_3C77                               ; $7C5B: $CD $77 $3C

jr_007_7C5E:
    ld   a, [wDialogState]                        ; $7C5E: $FA $9F $C1
    and  a                                        ; $7C61: $A7
    ret  nz                                       ; $7C62: $C0

    call func_007_7E0A                            ; $7C63: $CD $0A $7E
    ld   hl, $C3D0                                ; $7C66: $21 $D0 $C3
    add  hl, bc                                   ; $7C69: $09
    ld   a, [hl]                                  ; $7C6A: $7E
    inc  a                                        ; $7C6B: $3C
    ld   [hl], a                                  ; $7C6C: $77
    cp   $10                                      ; $7C6D: $FE $10
    jr   nz, jr_007_7C76                          ; $7C6F: $20 $05

    call func_007_4005                            ; $7C71: $CD $05 $40
    ld   [hl], $00                                ; $7C74: $36 $00

jr_007_7C76:
    cp   $08                                      ; $7C76: $FE $08
    jr   nz, jr_007_7C93                          ; $7C78: $20 $19

    ldh  a, [hActiveEntityUnknownG]               ; $7C7A: $F0 $F1
    ld   e, a                                     ; $7C7C: $5F
    ld   d, b                                     ; $7C7D: $50
    ld   hl, $7BBB                                ; $7C7E: $21 $BB $7B
    add  hl, de                                   ; $7C81: $19
    ld   a, [hl]                                  ; $7C82: $7E
    and  a                                        ; $7C83: $A7
    jr   z, jr_007_7C93                           ; $7C84: $28 $0D

    cp   $01                                      ; $7C86: $FE $01
    jr   nz, jr_007_7C90                          ; $7C88: $20 $06

    ld   a, $01                                   ; $7C8A: $3E $01
    ldh  [hJingle], a                             ; $7C8C: $E0 $F2
    jr   jr_007_7C93                              ; $7C8E: $18 $03

jr_007_7C90:
    ld   [wActiveMusicTrack], a                   ; $7C90: $EA $68 $D3

jr_007_7C93:
    ld   hl, $C3D0                                ; $7C93: $21 $D0 $C3
    add  hl, bc                                   ; $7C96: $09
    ld   a, [hl]                                  ; $7C97: $7E
    cp   $26                                      ; $7C98: $FE $26
    jr   nz, jr_007_7CEA                          ; $7C9A: $20 $4E

    ldh  a, [hActiveEntityUnknownG]               ; $7C9C: $F0 $F1
    ld   e, a                                     ; $7C9E: $5F
    ld   d, b                                     ; $7C9F: $50
    cp   $21                                      ; $7CA0: $FE $21
    jr   nz, jr_007_7CB1                          ; $7CA2: $20 $0D

    ldh  a, [hMapRoom]                            ; $7CA4: $F0 $F6
    cp   $96                                      ; $7CA6: $FE $96
    jr   nz, jr_007_7CB1                          ; $7CA8: $20 $07

    ld   a, $11                                   ; $7CAA: $3E $11
    call OpenDialogInTable1                       ; $7CAC: $CD $73 $23
    jr   jr_007_7CE9                              ; $7CAF: $18 $38

jr_007_7CB1:
    ld   a, e                                     ; $7CB1: $7B
    cp   $01                                      ; $7CB2: $FE $01
    jr   nz, jr_007_7CC1                          ; $7CB4: $20 $0B

    ld   a, [wShieldLevel]                        ; $7CB6: $FA $44 $DB
    cp   $02                                      ; $7CB9: $FE $02
    jr   nz, jr_007_7CC1                          ; $7CBB: $20 $04

    ld   a, $ED                                   ; $7CBD: $3E $ED
    jr   jr_007_7CE6                              ; $7CBF: $18 $25

jr_007_7CC1:
    ld   a, e                                     ; $7CC1: $7B
    cp   $0B                                      ; $7CC2: $FE $0B
    jr   nz, jr_007_7CD1                          ; $7CC4: $20 $0B

    ld   a, [wSwordLevel]                         ; $7CC6: $FA $4E $DB
    cp   $02                                      ; $7CC9: $FE $02
    jr   nz, jr_007_7CD1                          ; $7CCB: $20 $04

    ld   a, $9F                                   ; $7CCD: $3E $9F
    jr   jr_007_7CE6                              ; $7CCF: $18 $15

jr_007_7CD1:
    ld   a, e                                     ; $7CD1: $7B
    cp   $00                                      ; $7CD2: $FE $00
    jr   nz, jr_007_7CE1                          ; $7CD4: $20 $0B

    ld   a, [wPowerBraceletLevel]                 ; $7CD6: $FA $43 $DB
    cp   $02                                      ; $7CD9: $FE $02
    jr   nz, jr_007_7CE1                          ; $7CDB: $20 $04

    ld   a, $EE                                   ; $7CDD: $3E $EE
    jr   jr_007_7CE6                              ; $7CDF: $18 $05

jr_007_7CE1:
    ld   hl, SpitObjectDialog                     ; $7CE1: $21 $99 $7B
    add  hl, de                                   ; $7CE4: $19
    ld   a, [hl]                                  ; $7CE5: $7E

jr_007_7CE6:
    call OpenDialog                               ; $7CE6: $CD $85 $23

jr_007_7CE9:
    xor  a                                        ; $7CE9: $AF

jr_007_7CEA:
    cp   $28                                      ; $7CEA: $FE $28
    ret  nz                                       ; $7CEC: $C0

    jp   label_007_7EA4                           ; $7CED: $C3 $A4 $7E

func_007_7CF0:
    call label_3B5A                               ; $7CF0: $CD $5A $3B
    jr   nc, jr_007_7D14                          ; $7CF3: $30 $1F

    call CopyLinkFinalPositionToPosition          ; $7CF5: $CD $BE $0C
    call ResetPegasusBoots                                ; $7CF8: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $7CFB: $FA $A6 $C1
    and  a                                        ; $7CFE: $A7
    jr   z, jr_007_7D12                           ; $7CFF: $28 $11

    ld   e, a                                     ; $7D01: $5F
    ld   d, b                                     ; $7D02: $50
    ld   hl, $C39F                                ; $7D03: $21 $9F $C3
    add  hl, de                                   ; $7D06: $19
    ld   a, [hl]                                  ; $7D07: $7E
    cp   $03                                      ; $7D08: $FE $03
    jr   nz, jr_007_7D12                          ; $7D0A: $20 $06

    ld   hl, wEntityFState                         ; $7D0C: $21 $8F $C2
    add  hl, de                                   ; $7D0F: $19
    ld   [hl], $00                                ; $7D10: $36 $00

jr_007_7D12:
    scf                                           ; $7D12: $37
    ret                                           ; $7D13: $C9

jr_007_7D14:
    and  a                                        ; $7D14: $A7
    ret                                           ; $7D15: $C9

    ld   b, $04                                   ; $7D16: $06 $04
    ld   [bc], a                                  ; $7D18: $02
    nop                                           ; $7D19: $00

func_007_7D1A:
label_007_7D1A:
    ld   hl, $C380                                ; $7D1A: $21 $80 $C3
    add  hl, bc                                   ; $7D1D: $09
    ld   e, [hl]                                  ; $7D1E: $5E
    ld   d, b                                     ; $7D1F: $50
    ld   hl, $7D16                                ; $7D20: $21 $16 $7D
    add  hl, de                                   ; $7D23: $19
    push hl                                       ; $7D24: $E5
    ld   hl, $C3D0                                ; $7D25: $21 $D0 $C3
    add  hl, bc                                   ; $7D28: $09
    inc  [hl]                                     ; $7D29: $34
    ld   a, [hl]                                  ; $7D2A: $7E
    rra                                           ; $7D2B: $1F
    rra                                           ; $7D2C: $1F
    rra                                           ; $7D2D: $1F
    rra                                           ; $7D2E: $1F
    pop  hl                                       ; $7D2F: $E1
    and  $01                                      ; $7D30: $E6 $01
    or   [hl]                                     ; $7D32: $B6
    jp   label_3B0C                               ; $7D33: $C3 $0C $3B

func_007_7D36:
    ld   e, b                                     ; $7D36: $58
    ldh  a, [hLinkPositionY]                      ; $7D37: $F0 $99
    ld   hl, $FFEF                                ; $7D39: $21 $EF $FF
    sub  [hl]                                     ; $7D3C: $96
    add  $14                                      ; $7D3D: $C6 $14
    cp   $38                                      ; $7D3F: $FE $38
    jr   jr_007_7D4E                              ; $7D41: $18 $0B

func_007_7D43:
    ld   e, b                                     ; $7D43: $58
    ldh  a, [hLinkPositionY]                      ; $7D44: $F0 $99
    ld   hl, $FFEF                                ; $7D46: $21 $EF $FF
    sub  [hl]                                     ; $7D49: $96
    add  $14                                      ; $7D4A: $C6 $14
    cp   $28                                      ; $7D4C: $FE $28

jr_007_7D4E:
    jr   nc, jr_007_7D94                          ; $7D4E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7D50: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $7D52: $21 $EE $FF
    sub  [hl]                                     ; $7D55: $96
    add  $10                                      ; $7D56: $C6 $10
    cp   $20                                      ; $7D58: $FE $20
    jr   nc, jr_007_7D94                          ; $7D5A: $30 $38

    inc  e                                        ; $7D5C: $1C
    ldh  a, [hActiveEntityType]                     ; $7D5D: $F0 $EB
    cp   $B5                                      ; $7D5F: $FE $B5
    jr   z, jr_007_7D6F                           ; $7D61: $28 $0C

    push de                                       ; $7D63: $D5
    call func_007_7E7D                            ; $7D64: $CD $7D $7E
    ldh  a, [hLinkDirection]                      ; $7D67: $F0 $9E
    xor  $01                                      ; $7D69: $EE $01
    cp   e                                        ; $7D6B: $BB
    pop  de                                       ; $7D6C: $D1
    jr   nz, jr_007_7D94                          ; $7D6D: $20 $25

jr_007_7D6F:
    ld   hl, $C1AD                                ; $7D6F: $21 $AD $C1
    ld   [hl], $01                                ; $7D72: $36 $01
    ld   a, [wDialogState]                        ; $7D74: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D77: $21 $4F $C1
    or   [hl]                                     ; $7D7A: $B6
    ld   hl, $C146                                ; $7D7B: $21 $46 $C1
    or   [hl]                                     ; $7D7E: $B6
    ld   hl, $C134                                ; $7D7F: $21 $34 $C1
    or   [hl]                                     ; $7D82: $B6
    jr   nz, jr_007_7D94                          ; $7D83: $20 $0F

    ld   a, [wWindowY]                            ; $7D85: $FA $9A $DB
    cp   $80                                      ; $7D88: $FE $80
    jr   nz, jr_007_7D94                          ; $7D8A: $20 $08

    ldh  a, [hJoypadState]                               ; $7D8C: $F0 $CC
    and  $10                                      ; $7D8E: $E6 $10
    jr   z, jr_007_7D94                           ; $7D90: $28 $02

    scf                                           ; $7D92: $37
    ret                                           ; $7D93: $C9

jr_007_7D94:
    and  a                                        ; $7D94: $A7
    ret                                           ; $7D95: $C9

func_007_7D96:
    ldh  a, [hActiveEntityState]                   ; $7D96: $F0 $EA
    cp   $05                                      ; $7D98: $FE $05
    jr   nz, jr_007_7DC1                          ; $7D9A: $20 $25

func_007_7D9C:
    ld   a, [wGameplayType]                       ; $7D9C: $FA $95 $DB
    cp   $07                                      ; $7D9F: $FE $07
    jr   z, jr_007_7DC1                           ; $7DA1: $28 $1E

    cp   $0B                                      ; $7DA3: $FE $0B
    jr   nz, jr_007_7DC1                          ; $7DA5: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DA7: $FA $6B $C1
    cp   $04                                      ; $7DAA: $FE $04
    jr   nz, jr_007_7DC1                          ; $7DAC: $20 $13

    ld   a, [wDialogState]                        ; $7DAE: $FA $9F $C1
    ld   hl, $C1A8                                ; $7DB1: $21 $A8 $C1
    or   [hl]                                     ; $7DB4: $B6
    ld   hl, wInventoryAppearing                  ; $7DB5: $21 $4F $C1
    or   [hl]                                     ; $7DB8: $B6
    jr   nz, jr_007_7DC1                          ; $7DB9: $20 $06

    ld   a, [wRoomTransitionState]                ; $7DBB: $FA $24 $C1
    and  a                                        ; $7DBE: $A7
    jr   z, jr_007_7DC2                           ; $7DBF: $28 $01

jr_007_7DC1:
    pop  af                                       ; $7DC1: $F1

jr_007_7DC2:
    ret                                           ; $7DC2: $C9

func_007_7DC3:
    ld   hl, $C410                                ; $7DC3: $21 $10 $C4
    add  hl, bc                                   ; $7DC6: $09
    ld   a, [hl]                                  ; $7DC7: $7E
    and  a                                        ; $7DC8: $A7
    jr   z, jr_007_7E09                           ; $7DC9: $28 $3E

    dec  a                                        ; $7DCB: $3D
    ld   [hl], a                                  ; $7DCC: $77
    call label_3E8E                               ; $7DCD: $CD $8E $3E
    ld   hl, wEntity0SpeedX                       ; $7DD0: $21 $40 $C2
    add  hl, bc                                   ; $7DD3: $09
    ld   a, [hl]                                  ; $7DD4: $7E
    push af                                       ; $7DD5: $F5
    call func_007_4005                            ; $7DD6: $CD $05 $40
    ld   a, [hl]                                  ; $7DD9: $7E
    push af                                       ; $7DDA: $F5
    ld   hl, $C3F0                                ; $7DDB: $21 $F0 $C3
    add  hl, bc                                   ; $7DDE: $09
    ld   a, [hl]                                  ; $7DDF: $7E
    ld   hl, wEntity0SpeedX                       ; $7DE0: $21 $40 $C2
    add  hl, bc                                   ; $7DE3: $09
    ld   [hl], a                                  ; $7DE4: $77
    ld   hl, $C400                                ; $7DE5: $21 $00 $C4
    add  hl, bc                                   ; $7DE8: $09
    ld   a, [hl]                                  ; $7DE9: $7E
    call func_007_4005                            ; $7DEA: $CD $05 $40
    ld   [hl], a                                  ; $7DED: $77
    call func_007_7E0A                            ; $7DEE: $CD $0A $7E
    ld   hl, $C430                                ; $7DF1: $21 $30 $C4
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  $20                                      ; $7DF6: $E6 $20
    jr   nz, jr_007_7DFD                          ; $7DF8: $20 $03

    call label_3B23                               ; $7DFA: $CD $23 $3B

jr_007_7DFD:
    call func_007_4005                            ; $7DFD: $CD $05 $40
    pop  af                                       ; $7E00: $F1
    ld   [hl], a                                  ; $7E01: $77
    ld   hl, wEntity0SpeedX                       ; $7E02: $21 $40 $C2
    add  hl, bc                                   ; $7E05: $09
    pop  af                                       ; $7E06: $F1
    ld   [hl], a                                  ; $7E07: $77
    pop  af                                       ; $7E08: $F1

label_007_7E09:
jr_007_7E09:
    ret                                           ; $7E09: $C9

func_007_7E0A:
label_007_7E0A:
    call func_007_7E17                            ; $7E0A: $CD $17 $7E
    push bc                                       ; $7E0D: $C5
    ld   a, c                                     ; $7E0E: $79
    add  $10                                      ; $7E0F: $C6 $10
    ld   c, a                                     ; $7E11: $4F
    call func_007_7E17                            ; $7E12: $CD $17 $7E
    pop  bc                                       ; $7E15: $C1
    ret                                           ; $7E16: $C9

func_007_7E17:
label_007_7E17:
    ld   hl, wEntity0SpeedX                       ; $7E17: $21 $40 $C2
    add  hl, bc                                   ; $7E1A: $09
    ld   a, [hl]                                  ; $7E1B: $7E
    and  a                                        ; $7E1C: $A7
    jr   z, jr_007_7E42                           ; $7E1D: $28 $23

    push af                                       ; $7E1F: $F5
    swap a                                        ; $7E20: $CB $37
    and  $F0                                      ; $7E22: $E6 $F0
    ld   hl, $C260                                ; $7E24: $21 $60 $C2
    add  hl, bc                                   ; $7E27: $09
    add  [hl]                                     ; $7E28: $86
    ld   [hl], a                                  ; $7E29: $77
    rl   d                                        ; $7E2A: $CB $12
    ld   hl, wEntity0PosX                         ; $7E2C: $21 $00 $C2

jr_007_7E2F:
    add  hl, bc                                   ; $7E2F: $09
    pop  af                                       ; $7E30: $F1
    ld   e, $00                                   ; $7E31: $1E $00
    bit  7, a                                     ; $7E33: $CB $7F
    jr   z, jr_007_7E39                           ; $7E35: $28 $02

    ld   e, $F0                                   ; $7E37: $1E $F0

jr_007_7E39:
    swap a                                        ; $7E39: $CB $37
    and  $0F                                      ; $7E3B: $E6 $0F
    or   e                                        ; $7E3D: $B3
    rr   d                                        ; $7E3E: $CB $1A
    adc  [hl]                                     ; $7E40: $8E
    ld   [hl], a                                  ; $7E41: $77

jr_007_7E42:
    ret                                           ; $7E42: $C9

func_007_7E43:
    ld   hl, wEntitiesSpeedZTable                                ; $7E43: $21 $20 $C3
    add  hl, bc                                   ; $7E46: $09
    ld   a, [hl]                                  ; $7E47: $7E
    and  a                                        ; $7E48: $A7
    jr   z, jr_007_7E42                           ; $7E49: $28 $F7

    push af                                       ; $7E4B: $F5
    swap a                                        ; $7E4C: $CB $37
    and  $F0                                      ; $7E4E: $E6 $F0
    ld   hl, $C330                                ; $7E50: $21 $30 $C3
    add  hl, bc                                   ; $7E53: $09
    add  [hl]                                     ; $7E54: $86
    ld   [hl], a                                  ; $7E55: $77
    rl   d                                        ; $7E56: $CB $12
    ld   hl, wEntitiesPosZTable                                ; $7E58: $21 $10 $C3
    jr   jr_007_7E2F                              ; $7E5B: $18 $D2

func_007_7E5D:
    ld   e, $00                                   ; $7E5D: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E5F: $F0 $98
    ld   hl, wEntity0PosX                         ; $7E61: $21 $00 $C2
    add  hl, bc                                   ; $7E64: $09
    sub  [hl]                                     ; $7E65: $96
    bit  7, a                                     ; $7E66: $CB $7F
    jr   z, jr_007_7E6B                           ; $7E68: $28 $01

    inc  e                                        ; $7E6A: $1C

jr_007_7E6B:
    ld   d, a                                     ; $7E6B: $57
    ret                                           ; $7E6C: $C9

func_007_7E6D:
    ld   e, $02                                   ; $7E6D: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E6F: $F0 $99
    ld   hl, wEntity0PosY                         ; $7E71: $21 $10 $C2
    add  hl, bc                                   ; $7E74: $09
    sub  [hl]                                     ; $7E75: $96
    bit  7, a                                     ; $7E76: $CB $7F
    jr   nz, jr_007_7E7B                          ; $7E78: $20 $01

    inc  e                                        ; $7E7A: $1C

jr_007_7E7B:
    ld   d, a                                     ; $7E7B: $57
    ret                                           ; $7E7C: $C9

func_007_7E7D:
    call func_007_7E5D                            ; $7E7D: $CD $5D $7E
    ld   a, e                                     ; $7E80: $7B
    ldh  [hScratchA], a                           ; $7E81: $E0 $D7
    ld   a, d                                     ; $7E83: $7A
    bit  7, a                                     ; $7E84: $CB $7F
    jr   z, jr_007_7E8A                           ; $7E86: $28 $02

    cpl                                           ; $7E88: $2F
    inc  a                                        ; $7E89: $3C

jr_007_7E8A:
    push af                                       ; $7E8A: $F5
    call func_007_7E6D                            ; $7E8B: $CD $6D $7E
    ld   a, e                                     ; $7E8E: $7B
    ldh  [hScratchB], a                           ; $7E8F: $E0 $D8
    ld   a, d                                     ; $7E91: $7A
    bit  7, a                                     ; $7E92: $CB $7F
    jr   z, jr_007_7E98                           ; $7E94: $28 $02

    cpl                                           ; $7E96: $2F
    inc  a                                        ; $7E97: $3C

jr_007_7E98:
    pop  de                                       ; $7E98: $D1
    cp   d                                        ; $7E99: $BA
    jr   nc, jr_007_7EA0                          ; $7E9A: $30 $04

    ldh  a, [hScratchA]                           ; $7E9C: $F0 $D7
    jr   jr_007_7EA2                              ; $7E9E: $18 $02

jr_007_7EA0:
    ldh  a, [hScratchB]                           ; $7EA0: $F0 $D8

jr_007_7EA2:
    ld   e, a                                     ; $7EA2: $5F
    ret                                           ; $7EA3: $C9

func_007_7EA4:
label_007_7EA4:
    ld   hl, wEntity0State                         ; $7EA4: $21 $80 $C2
    add  hl, bc                                   ; $7EA7: $09
    ld   [hl], b                                  ; $7EA8: $70
    ret                                           ; $7EA9: $C9

label_007_7EAA:
    ld   hl, wEntitiesUnknownTableC               ; $7EAA: $21 $C0 $C2
    add  hl, bc                                   ; $7EAD: $09
    ld   a, [hl]                                  ; $7EAE: $7E
    rst  $00                                      ; $7EAF: $C7
    or   [hl]                                     ; $7EB0: $B6
    ld   a, [hl]                                  ; $7EB1: $7E
    rst  $00                                      ; $7EB2: $C7
    ld   a, [hl]                                  ; $7EB3: $7E
    sub  $7E                                      ; $7EB4: $D6 $7E
    call GetEntityTransitionCountdown                 ; $7EB6: $CD $05 $0C
    ld   [hl], $A0                                ; $7EB9: $36 $A0
    ld   hl, $C420                                ; $7EBB: $21 $20 $C4
    add  hl, bc                                   ; $7EBE: $09
    ld   [hl], $FF                                ; $7EBF: $36 $FF

label_007_7EC1:
    ld   hl, wEntitiesUnknownTableC               ; $7EC1: $21 $C0 $C2
    add  hl, bc                                   ; $7EC4: $09
    inc  [hl]                                     ; $7EC5: $34
    ret                                           ; $7EC6: $C9

    call GetEntityTransitionCountdown                 ; $7EC7: $CD $05 $0C
    ret  nz                                       ; $7ECA: $C0

    ld   [hl], $C0                                ; $7ECB: $36 $C0
    ld   hl, $C420                                ; $7ECD: $21 $20 $C4
    add  hl, bc                                   ; $7ED0: $09
    ld   [hl], $FF                                ; $7ED1: $36 $FF
    jp   label_007_7EC1                           ; $7ED3: $C3 $C1 $7E

    call GetEntityTransitionCountdown                 ; $7ED6: $CD $05 $0C
    jr   nz, jr_007_7F13                          ; $7ED9: $20 $38

    ldh  a, [hActiveEntityType]                     ; $7EDB: $F0 $EB
    cp   $5F                                      ; $7EDD: $FE $5F
    jr   nz, jr_007_7F0A                          ; $7EDF: $20 $29

    ld   a, $30                                   ; $7EE1: $3E $30
    call label_3B86                               ; $7EE3: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $7EE6: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7EE8: $21 $00 $C2
    add  hl, de                                   ; $7EEB: $19
    ld   [hl], a                                  ; $7EEC: $77
    ldh  a, [hScratchB]                           ; $7EED: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7EEF: $21 $10 $C2
    add  hl, de                                   ; $7EF2: $19
    ld   [hl], a                                  ; $7EF3: $77
    ld   hl, wEntitiesSpeedZTable                                ; $7EF4: $21 $20 $C3
    add  hl, de                                   ; $7EF7: $19
    ld   [hl], $18                                ; $7EF8: $36 $18
    ld   hl, wEntitiesUnknowTableF                ; $7EFA: $21 $F0 $C2
    add  hl, de                                   ; $7EFD: $19
    ld   [hl], $20                                ; $7EFE: $36 $20
    ld   hl, $C390                                ; $7F00: $21 $90 $C3
    add  hl, bc                                   ; $7F03: $09
    ld   a, [hl]                                  ; $7F04: $7E
    ldh  [hMusicTrack], a                         ; $7F05: $E0 $B0
    jp   label_007_7F76                           ; $7F07: $C3 $76 $7F

jr_007_7F0A:
    call PlayBombExplosionSfx                                ; $7F0A: $CD $4B $0C
    call label_27DD                               ; $7F0D: $CD $DD $27
    jp   label_3F50                               ; $7F10: $C3 $50 $3F

jr_007_7F13:
    jp   label_007_7F16                           ; $7F13: $C3 $16 $7F

label_007_7F16:
    and  $07                                      ; $7F16: $E6 $07
    ret  nz                                       ; $7F18: $C0

    call GetRandomByte                            ; $7F19: $CD $0D $28
    and  $1F                                      ; $7F1C: $E6 $1F
    sub  $10                                      ; $7F1E: $D6 $10
    ld   e, a                                     ; $7F20: $5F
    ld   hl, wActiveEntityPosX                    ; $7F21: $21 $EE $FF
    add  [hl]                                     ; $7F24: $86
    ld   [hl], a                                  ; $7F25: $77
    call GetRandomByte                            ; $7F26: $CD $0D $28
    and  $1F                                      ; $7F29: $E6 $1F
    sub  $14                                      ; $7F2B: $D6 $14
    ld   e, a                                     ; $7F2D: $5F
    ld   hl, wActiveEntityPosY                    ; $7F2E: $21 $EC $FF
    add  [hl]                                     ; $7F31: $86
    ld   [hl], a                                  ; $7F32: $77
    jp   label_007_7F36                           ; $7F33: $C3 $36 $7F

label_007_7F36:
    call func_007_7D9C                            ; $7F36: $CD $9C $7D
    ldh  a, [wActiveEntityPosX]                   ; $7F39: $F0 $EE
    ldh  [hScratchA], a                           ; $7F3B: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7F3D: $F0 $EC
    ldh  [hScratchB], a                           ; $7F3F: $E0 $D8
    ld   a, $02                                   ; $7F41: $3E $02
    call label_CC7                                ; $7F43: $CD $C7 $0C
    ld   a, $13                                   ; $7F46: $3E $13
    ldh  [hNoiseSfx], a                            ; $7F48: $E0 $F4
    ret                                           ; $7F4A: $C9

    ld   a, $36                                   ; $7F4B: $3E $36
    call label_3B86                               ; $7F4D: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $7F50: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7F52: $21 $00 $C2
    add  hl, de                                   ; $7F55: $19
    ld   [hl], a                                  ; $7F56: $77
    ldh  a, [hScratchB]                           ; $7F57: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7F59: $21 $10 $C2
    add  hl, de                                   ; $7F5C: $19
    ld   [hl], a                                  ; $7F5D: $77
    ldh  a, [hIsSideScrolling]                    ; $7F5E: $F0 $F9
    and  a                                        ; $7F60: $A7
    jr   z, jr_007_7F6A                           ; $7F61: $28 $07

    call func_007_4005                            ; $7F63: $CD $05 $40
    ld   [hl], $F0                                ; $7F66: $36 $F0
    jr   jr_007_7F76                              ; $7F68: $18 $0C

jr_007_7F6A:
    ld   hl, wEntitiesSpeedZTable                                ; $7F6A: $21 $20 $C3
    add  hl, de                                   ; $7F6D: $19
    ld   [hl], $10                                ; $7F6E: $36 $10
    ld   hl, wEntitiesPosZTable                                ; $7F70: $21 $10 $C3
    add  hl, de                                   ; $7F73: $19
    ld   [hl], $08                                ; $7F74: $36 $08

label_007_7F76:
jr_007_7F76:
    call func_007_7EA4                            ; $7F76: $CD $A4 $7E
    ld   hl, hNoiseSfx                             ; $7F79: $21 $F4 $FF
    ld   [hl], $1A                                ; $7F7C: $36 $1A
    ret                                           ; $7F7E: $C9
