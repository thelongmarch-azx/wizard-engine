(module binary
  "\00\61\73\6d\01\00\00\00\01\85\80\80\80\00\01\60"
  "\00\01\7b\03\82\80\80\80\00\01\00\07\88\80\80\80"
  "\00\01\04\6d\61\69\6e\00\00\0a\9a\80\80\80\00\01"
  "\94\80\80\80\00\00\fd\0c\00\01\02\03\04\05\06\07"
  "\08\09\0a\0b\0c\0d\0e\0f\0b"
)
(assert_return
  (invoke "main")
  (v128.const i8x16
    0x0
    0x1
    0x2
    0x3
    0x4
    0x5
    0x6
    0x7
    0x8
    0x9
    0xa
    0xb
    0xc
    0xd
    0xe
    0xf
  )
)
