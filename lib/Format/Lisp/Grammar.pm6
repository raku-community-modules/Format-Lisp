=begin pod

=begin NAME

Format::Lisp::Grammar - Grammar for Common Lisp format strings

=end NAME

=begin DESCRIPTION

=end DESCRIPTION

=end pod

grammar Format::Lisp::Grammar {
	token tilde-Tilde {
	|	'~~'
	}

	token tilde-A {
	|	'~#@a'
	|	'~#a'
	|	'~@a'
	|	'~:a'
	|	'~a'
	|	'~#A'
	|	'~@A'
	|	'~:A'
	|	'~A'
	}

	token tilde-B {
	|	'~#b'
	|	'~@b'
	|	'~:b'
	|	'~b'
	|	'~#B'
	|	'~@B'
	|	'~:B'
	|	'~B'
	}

	token tilde-C {
	|	'~@:c'
	|	'~@c'
	|	'~:c'
	|	'~c'
	|	'~:C'
	|	'~C'
	}

	token tilde-D {
	|	'~#d'
	|	'~:d'
	|	'~d'
	|	'~#D'
	|	'~:D'
	|	'~D'
	}

	token tilde-Caret {
	|	'~^'
	}

	token tilde-Ques {
	|	'~?'
	}

	token tilde-Star {
	|	'~:*'
	|	'~*'
	}

	token TOP {
	| '#\\\\' <tilde-C>
	| '\'' <tilde-C>
	| '~#,#@A'
	| '~#,#A'
	| '~#@A'
	| '~+10@B'
	| '~+10@d'
	| '~+10b'
	| '~+10d'
	| '~,,,#:@d'
	| '~,,,#:B'
	| '~,,,#:D'
	| '~,,,#:b'
	| '~,,,#:d'
	| '~,,,#@:B'
	| '~,,,#@:D'
	| '~,,V,V:b'
	| '~,,V,V@:B'
	| '~,,\'*,v:B'
	| '~,,\'*,v:d'
	| '~,,v,v:@D'
	| '~,,v,v:@b'
	| '~,,v,v:@d'
	| '~,,v,v:B'
	| '~,,v,v:D'
	| '~,,v,v:d'
	| '~,,v:B'
	| '~,,v:b'
	| '~,,v:d'
	| '~-100000000000000000000a'
	| '~-1000000000000000000B'
	| '~-1000000000000000000d'
	| '~-100A'
	| '~-1b'
	| '~-1d'
	| '~10,,,v@A'
	| '~10,,,v@a'
	| '~10,,,vA'
	| '~10,,,va'
	| '~3,,+2A'
	| '~3,,-1A'
	| '~3,,0A'
	| '~3,,v@A'
	| '~3,,vA'
	| '~3,1a'
	| '~3,3@a'
	| '~4,#@A'
	| '~4,#A'
	| '~4,,,@A'
	| '~4,,,\'X@a'
	| '~4,,,\'XA'
	| '~4,,,a'
	| '~4,,va'
	| '~4,3a'
	| '~4,4@a'
	| '~5,#@A'
	| '~5,#a'
	| '~5,3@a'
	| '~5,3A'
	| '~5,v@A'
	| '~5,vA'
	| '~6,vB'
	| '~6,vD'
	| '~7,3@a'
	| '~7,3A'
	| '~:@C'
	| '~:@b'
	| '~@:B'
	| '~@:C'
	| '~@:d'
	| '~@?' ' ' <tilde-A>
	| '~@C'
	| '~@D'
	| '~@[' 'X' '~]' 'Y' <tilde-A>
	| '~@d'
	| '~@{' '~2,#^' <tilde-A> '~}' 'X' <tilde-A>
	| '~V,V,V,VB'
	| '~V:@A'
	| '~V:@a'
	| '~V:A'
	| '~V:a'
	| '~V@:A'
	| '~V@:a'
	| '~V@A'
	| '~V@a'
	| '~VA'
	| '~Va'
	| '~v,,2A'
	| '~v,v,v,vD'
	| '~v,v,v,vb'
	| '~v,v,v,vd'
	| '~v,v@D'
	| '~v,v@d'
	| '~v,vB'
	| '~v,vD'
	| '~v,vb'
	| '~v,vd'
	| '~v:@A'
	| '~v:@a'
	| '~v:A'
	| '~v:a'
	| '~v@:A'
	| '~v@:a'
	| '~v@A'
	| '~v@a'
	| '~vA'
	| '~vD'
	| '~va'
	| '~vb'
	| '~vd'
	| '~{' '~2,#^' <tilde-A> '~}' <tilde-A>
	| <tilde-A>
	| <tilde-A>
	| <tilde-A> 'Y' '~@?' 'X' <tilde-A>
	| <tilde-A> 'Y' <tilde-Ques> 'X' <tilde-A>
	| <tilde-A> '~0*' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> '~0*' <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> <tilde-A> '~v@*' <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> <tilde-A> <tilde-A> '~2:*' <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> <tilde-A> <tilde-A> <tilde-Star> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> <tilde-Star> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~1{' <tilde-A> <tilde-Star> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~@?' 'X' <tilde-A>
	| <tilde-A> '~v*' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> '~0@*' <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> '~1@*' <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> '~@*' <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> <tilde-A> '~3:*' <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~4:*' <tilde-Caret> <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~v*' <tilde-Caret> <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-A> <tilde-A> <tilde-A> '~v:*' <tilde-Caret> <tilde-A> '~}' <tilde-A>
	| <tilde-A> '~{' <tilde-A> <tilde-Star> <tilde-A> '~}' <tilde-A>
	| <tilde-A> <tilde-A> '~0:*' <tilde-A>
	| <tilde-A> <tilde-A> '~1@*' <tilde-A> <tilde-A>
	| <tilde-A> <tilde-A> '~2:*' <tilde-A>
	| <tilde-A> <tilde-A> '~2@*' <tilde-A> <tilde-A>
	| <tilde-A> <tilde-A> '~3@*' <tilde-A> <tilde-A>
	| <tilde-A> <tilde-A> '~@*' <tilde-A> <tilde-A>
	| <tilde-A> <tilde-A> '~v:*' <tilde-A>
	| <tilde-A> <tilde-A> '~v@*' <tilde-A> <tilde-A>
	| <tilde-A> <tilde-A> <tilde-Star> <tilde-A>
	| <tilde-A> <tilde-Ques> 'X' <tilde-A>
	| <tilde-A> <tilde-Star> <tilde-A>
	| <tilde-A> <tilde-Star> <tilde-A>
	| <tilde-B>
	| <tilde-C>
	| <tilde-D>
	| <tilde-D> 'b'
	| <tilde-D> 'd'
	| <tilde-Ques> ' ' <tilde-A>
	| <tilde-Tilde> ',,\'' <tilde-C> ':' <tilde-C>
	| <tilde-Tilde> ',,\'' <tilde-C> ':d'
	| <tilde-Tilde> <tilde-D> ',\'' <tilde-C> 'd'
	| <tilde-Tilde> <tilde-D> ',\'' <tilde-C> <tilde-C>
	| <tilde-Tilde> <tilde-D> ':a'
	| <tilde-Tilde> <tilde-D> '@' <tilde-C>
	| <tilde-Tilde> <tilde-D> '@:A'
	| <tilde-Tilde> <tilde-D> '@a'
	| <tilde-Tilde> <tilde-D> '@b'
	| <tilde-Tilde> <tilde-D> '@d'
	| <tilde-Tilde> <tilde-D> 'a'
	| <tilde-Tilde> <tilde-D> 'b'
	| <tilde-Tilde> <tilde-D> 'd'
	| <tilde-Tilde> <tilde-D> <tilde-C>
	}
}
