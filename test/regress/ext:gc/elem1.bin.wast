(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\03\82\80\80\80\00\01\00\04\8a\80\80\80\00"
    "\01\40\00\64\70\00\01\d2\00\0b\09\89\80\80\80\00"
    "\01\04\41\00\0b\01\d2\00\0b\0a\88\80\80\80\00\01"
    "\82\80\80\80\00\00\0b"
  )
  "type mismatch"
)
