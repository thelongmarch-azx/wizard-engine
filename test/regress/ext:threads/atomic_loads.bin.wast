(module binary
  "\00\61\73\6d\01\00\00\00\01\8c\80\80\80\00\03\60"
  "\00\00\60\00\01\7f\60\00\01\7e\03\89\80\80\80\00"
  "\08\00\01\02\01\01\02\02\02\05\83\80\80\80\00\01"
  "\00\01\07\bb\81\80\80\00\08\04\6d\61\69\6e\00\00"
  "\14\74\65\73\74\5f\69\33\32\5f\61\74\6f\6d\69\63"
  "\5f\6c\6f\61\64\00\01\14\74\65\73\74\5f\69\36\34"
  "\5f\61\74\6f\6d\69\63\5f\6c\6f\61\64\00\02\17\74"
  "\65\73\74\5f\69\33\32\5f\61\74\6f\6d\69\63\5f\6c"
  "\6f\61\64\38\5f\75\00\03\18\74\65\73\74\5f\69\33"
  "\32\5f\61\74\6f\6d\69\63\5f\6c\6f\61\64\31\36\5f"
  "\75\00\04\17\74\65\73\74\5f\69\36\34\5f\61\74\6f"
  "\6d\69\63\5f\6c\6f\61\64\38\5f\75\00\05\18\74\65"
  "\73\74\5f\69\36\34\5f\61\74\6f\6d\69\63\5f\6c\6f"
  "\61\64\31\36\5f\75\00\06\18\74\65\73\74\5f\69\36"
  "\34\5f\61\74\6f\6d\69\63\5f\6c\6f\61\64\33\32\5f"
  "\75\00\07\0a\94\81\80\80\00\08\b3\80\80\80\00\00"
  "\41\00\fe\10\02\00\1a\41\00\fe\11\03\00\1a\41\00"
  "\fe\12\00\00\1a\41\00\fe\13\01\00\1a\41\00\fe\14"
  "\00\00\1a\41\00\fe\15\01\00\1a\41\00\fe\16\02\00"
  "\1a\0b\88\80\80\80\00\00\41\00\fe\10\02\00\0b\88"
  "\80\80\80\00\00\41\00\fe\11\03\00\0b\88\80\80\80"
  "\00\00\41\00\fe\12\00\00\0b\88\80\80\80\00\00\41"
  "\00\fe\13\01\00\0b\88\80\80\80\00\00\41\00\fe\14"
  "\00\00\0b\88\80\80\80\00\00\41\00\fe\15\01\00\0b"
  "\88\80\80\80\00\00\41\00\fe\16\02\00\0b"
)
(assert_return (invoke "test_i32_atomic_load") (i32.const 0x0))
(assert_return (invoke "test_i64_atomic_load") (i64.const 0x0))
(assert_return (invoke "test_i32_atomic_load8_u") (i32.const 0x0))
(assert_return (invoke "test_i32_atomic_load16_u") (i32.const 0x0))
(assert_return (invoke "test_i64_atomic_load8_u") (i64.const 0x0))
(assert_return (invoke "test_i64_atomic_load16_u") (i64.const 0x0))
(assert_return (invoke "test_i64_atomic_load32_u") (i64.const 0x0))
(assert_return (invoke "main"))
