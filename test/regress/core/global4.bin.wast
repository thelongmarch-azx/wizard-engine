(module binary
  "\00\61\73\6d\01\00\00\00\01\85\80\80\80\00\01\60"
  "\00\01\7f\03\82\80\80\80\00\01\00\06\86\80\80\80"
  "\00\01\7f\01\41\3e\0b\07\88\80\80\80\00\01\04\6d"
  "\61\69\6e\00\00\0a\96\80\80\80\00\01\90\80\80\80"
  "\00\00\41\0b\41\16\41\21\24\00\24\00\24\00\23\00"
  "\0b"
)
(assert_return (invoke "main") (i32.const 0xb))