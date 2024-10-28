(module
  (type $f1 (func (param i32 i32 i32 i32) (result i32 i32 i32 i32)))
  (type $c1 (cont $f1))
  (func $add (param i32 i32 i32 i32) (result i32 i32 i32 i32)
    (i32.add (local.get 0) (i32.const 11))
    (i32.add (local.get 1) (i32.const 22))
    (i32.add (local.get 2) (i32.const 33))
    (i32.add (local.get 3) (i32.const 44))
  )
  (elem declare func $add)
  (func (export "main") (param i32 i32 i32 i32) (result i32 i32 i32 i32)
    (resume $c1 (local.get 0) (local.get 1) (local.get 2) (local.get 3)
      (cont.new $c1 (ref.func $add)))
  )
)

(assert_return (invoke "main" (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 0))
  (i32.const 11) (i32.const 22) (i32.const 33) (i32.const 44))
(assert_return (invoke "main" (i32.const 10) (i32.const -20) (i32.const 40) (i32.const -50))
  (i32.const 21) (i32.const 2) (i32.const 73) (i32.const -6))
