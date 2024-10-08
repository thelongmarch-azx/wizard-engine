;; Check that continuations can be made from all reference and simple GC types
(module
  (type $func1 (func (param anyref)))
  (type $func2 (func (param externref)))
  (type $func3 (func (param funcref)))
  (type $func4 (func (param structref)))
  (type $func5 (func (param arrayref)))
  (type $func6 (func (param i31ref)))
  (type $cont1 (cont $func1))
  (type $cont2 (cont $func2))
  (type $cont3 (cont $func3))
  (type $cont4 (cont $func4))
  (type $cont5 (cont $func5))
  (type $cont6 (cont $func6))
)
