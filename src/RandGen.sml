(* RandGen.sml -- instantiate functiors to Basis types in Poly/ML
 * Copyright ©2007 Christopher League <league@contrapunctus.net>
 * 
 * This library is free software; you may redistribute and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; see the file COPYING. 
 *)

functor GeneratorFn(R : APPLICATIVE_RNG) : GENERATOR_SIG =
struct
  local 
    structure Gen = BaseGeneratorFn(R)
    structure Gen = GenText(structure Gen=Gen structure Text=Text)
  in
    structure Int       = GenInt (open Gen structure Int = Int)
    structure LargeInt  = GenInt (open Gen structure Int = LargeInt)
    structure Position  = GenInt (open Gen structure Int = Position)
    structure IntInf    = GenInt (open Gen structure Int = IntInf)

    structure Real      = GenReal(open Gen structure Real = Real)
    structure LargeReal = GenReal(open Gen structure Real = LargeReal)

    structure Word      = GenWord(open Gen structure Word = Word)
    structure Word8     = GenWord(open Gen structure Word = Word8)
    structure LargeWord = GenWord(open Gen structure Word = LargeWord)
    structure SysWord   = GenWord(open Gen structure Word = SysWord)

    structure DateTime = GenDateTime(Gen)

    open Gen
    val stream = start (R.new())
  end
    type rand = R.rand
    type 'a gen = rand -> 'a * rand
    type ('a, 'b) co = 'a -> 'b gen -> 'b gen
end

structure RandGen = GeneratorFn(Rand)
