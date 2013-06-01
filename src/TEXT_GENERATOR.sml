
signature TEXT_GENERATOR =
sig
	(*
	include PRETEXT_GENERATOR
			where type char = char
				and type string = string
				and type substring = substring
	*)
	include PREGEN_SIG
				
	type char   = char
	type string = string
	type substring = substring
	val char : char gen
	val charRange : char * char -> char gen
	val charFrom : string -> char gen
	val charByType : (char -> bool) -> char gen
	val string : (int gen * char gen) -> string gen
	val substring : string gen -> substring gen
	val cochar : (char, 'b) co
	val costring : (string, 'b) co
	val cosubstring : (substring, 'b) co
end

