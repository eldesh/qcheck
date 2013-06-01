functor GeneratorFn(R : APPLICATIVE_RNG) : GENERATOR_SIG =
struct
local
  structure Gen = BaseGeneratorFn(R)
  structure Gen = GenText(structure Gen=Gen structure Text=Text)
in 
  structure Int = GenInt(open Gen structure Int = Int)
  structure Int32 = GenInt(open Gen structure Int = Int32)
  structure IntInf = GenInt(open Gen structure Int = IntInf)
  structure LargeInt = GenInt(open Gen structure Int = LargeInt)
  structure Position = GenInt(open Gen structure Int = Position)
  structure LargeReal = GenReal(open Gen structure Real = LargeReal)
  structure Real = GenReal(open Gen structure Real = Real)
  structure Real64 = GenReal(open Gen structure Real = Real64)
  structure LargeWord = GenWord(open Gen structure Word = LargeWord)
  structure Word = GenWord(open Gen structure Word = Word)
  structure Word8 = GenWord(open Gen structure Word = Word8)
  structure Word32 = GenWord(open Gen structure Word = Word32)
  structure DateTime = GenDateTime(Gen)
  open Gen
  val stream = start (R.new())
end (* local *)
  type rand = R.rand
  type 'a gen = rand -> 'a * rand
  type ('a, 'b) co = 'a -> 'b gen -> 'b gen
end
structure RandGen = GeneratorFn(Rand)

