(module
  (func $main (export "main")
    (call $start)
  )
  (func $start (export "_start")
    (call $foo (i32.const 0) (i32.const 1))
    (call $foo (i32.const 0) (i32.const 2))
  )
  (func $foo (param i32 i32)
  )
)