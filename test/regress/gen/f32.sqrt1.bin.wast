(module binary
  "\00\61\73\6d\01\00\00\00\01\85\80\80\80\00\01\60"
  "\00\01\7d\03\83\80\80\80\00\02\00\00\07\8b\80\80"
  "\80\00\02\02\6d\30\00\00\02\6d\31\00\01\0a\9b\80"
  "\80\80\00\02\88\80\80\80\00\00\43\00\00\00\00\91"
  "\0b\88\80\80\80\00\00\43\00\00\80\40\91\0b"
)
(assert_return (invoke "m0") (f32.const 0x0p+0))
(assert_return (invoke "m1") (f32.const 0x1p+1))