(module
  (memory (export "memory") 1)
  (func (export "main")
    i32.const 0        
    i32.const 5        
    i32.store
    i32.const 0        
    i32.const 3      
    i32.atomic.rmw.add offset=0 align=4 drop
  )
  (func (export "test_i32_atomic_add") (result i32)
    i32.const 0        
    i32.const 5        
    i32.store
    i32.const 0        
    i32.const 3      
    i32.atomic.rmw.add offset=0 align=4
  )
  (func (export "test_i32_atomic_add_8") (result i32)
    i32.const 0        
    i32.const 5        
    i32.store
    i32.const 0        
    i32.const 3      
    i32.atomic.rmw8.add_u offset=0 align=1
  )
  (func (export "test_i32_atomic_add_16") (result i32)
    i32.const 0        
    i32.const 5        
    i32.store
    i32.const 0        
    i32.const 3      
    i32.atomic.rmw16.add_u offset=0 align=2
  )
)

(assert_return (invoke "test_i32_atomic_add") (i32.const 5))
(assert_return (invoke "test_i32_atomic_add_8") (i32.const 5))
(assert_return (invoke "test_i32_atomic_add_16") (i32.const 5))
(assert_return (invoke "main"))
