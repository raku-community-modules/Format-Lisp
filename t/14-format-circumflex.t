use v6;

use Test;
use lib 't/lib';
use Utils;
use Format::Lisp;

my $*fl = Format::Lisp.new;

subtest {
	1;
	#`(
	# (def-format-test format.^.{.1
	#   "~{X ~A~^ Y ~A~^ ~}" ('(1 2 3 4 5)) "X 1 Y 2 X 3 Y 4 X 5")
	# 
	ok def-format-test(
		Q{~{X ~A~^ Y ~A~^ ~}},
		( [ 1, 2, 3, 4, 5 ] ),
		Q{X 1 Y 2 X 3 Y 4 X 5},
	), Q[format.^.{.1];
	)

	#`(
	# (def-format-test format.^.{.2
	#   "~{X ~A~^ Y ~A~^ ~}" ('(1 2 3 4)) "X 1 Y 2 X 3 Y 4")
	# 
	ok def-format-test(
		Q{~{X ~A~^ Y ~A~^ ~}}, ( [ 1, 2, 3, 4 ] ), Q{X 1 Y 2 X 3 Y 4}
	), Q[format.^.{.2];
	)

	#`(
	# (def-format-test format.^.{.3
	#   "~1{~A~^~A~}" ('(1)) "1")
	# 
	ok def-format-test( Q{~1{~A~^~A~}}, ( [ 1 ] ), Q{1} ), Q[format.^.{.3];
	)

	#`(
	# (def-format-test format.^.{.4
	#   "~0{~A~^~A~}" ('(1)) "")
	# 
	ok def-format-test( Q{~0{~A~^~A~}}, ( [ 1 ] ), Q{} ), Q[format.^.{.4];
	)

	#`(
	# (def-format-test format.^.{.5
	#   "~1{~A~^~A~}" ('(1 2 3)) "12")
	# 
	ok def-format-test(
		Q{~1{~A~^~A~}}, ( [ 1, 2, 3 ] ), Q{12}
	), Q[format.^.{.5];
	)

	#`(
	# (def-format-test format.^.{.6
	#   "~{~A~A~0^~A~}" ('(1 2 3 4 5 6)) "12")
	# 
	ok def-format-test(
		Q{~{~A~A~0^~A~}}, ( [ 1, 2, 3, 4, 5, 6 ] ), Q{12}
	), Q[format.^.{.6];
	)

	#`(
	# (def-format-test format.^.{.7
	#   "~{~A~A~v^~A~}" ('(1 2 3 4 5 6 0 7 8 9 10 11 12)) "12456")
	# 
	ok def-format-test(
		Q{~{~A~A~v^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 0, 7, 8, 9, 10, 11, 12 ] ),
		Q{12456}
	), Q[format.^.{.7];
	)

	#`(
	# (def-format-test format.^.{.8
	#   "~{~#,3^~A~}" ('(1 2 3 4 5 6 7 8 9 10)) "1234567")
	# 
	ok def-format-test(
		Q{~{~#,3^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ),
		Q{1234567}
	), Q[format.^.{.8];
	)

	#`(
	# (def-format-test format.^.{.9
	#   "~{~2,#^~A~}~A" ('(1 2 3 4 5 6 7 8 9 10) 0) "123456780")
	# 
	ok def-format-test(
		Q{~{~2,#^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ], 0 ),
		Q{123456780}
	), Q[format.^.{.9];
	)

	#`(
	# (def-format-test format.^.{.10
	#   "~{~#,#^~A~}" ('(1 2 3 4 5 6 7 8 9 10)) "")
	# 
	ok def-format-test(
		Q{~{~#,#^~A~}}, ( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ), Q{}
	), Q[format.^.{.10];
	)

	#`(
	# (def-format-test format.^.{.11
	#   "~{~#,#,#^~A~}" ('(1 2 3 4 5 6 7 8 9 10)) "")
	# 
	ok def-format-test(
		Q{~{~#,#,#^~A~}}, ( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ), Q{}
	), Q[format.^.{.11];
	)

	#`(
	# (def-format-test format.^.{.12
	#   "~{~#,1,2^~A~}" ('(1 2 3 4 5 6 7 8 9 10)) "123456789")
	# 
	ok def-format-test(
		Q{~{~#,1,2^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ),
		Q{123456789}
	), Q[format.^.{.12];
	)

	#`(
	# (def-format-test format.^.{.13
	#   "~{~#,#,v^~A~}" ('(1 2 3 4 5 6 7 8 9 10)) "246")
	# 
	ok def-format-test(
		Q{~{~#,#,v^~A~}}, ( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ), Q{246}
	), Q[format.^.{.13];
	)

	#`(
	# (def-format-test format.^.{.14
	#   "~{~#,#,v^~A~}" ('(1 2 3 4 5 6 7 8 9 10 11)) "246")
	# 
	ok def-format-test(
		Q{~{~#,#,v^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ] ),
		Q{246}
	), Q[format.^.{.14];
	)

	#`(
	# (def-format-test format.^.{.15
	#   "~{~#,#,v^~A~}" ('(1 2 3 4 5 6 7 8 9 10 11 12)) "246")
	# 
	ok def-format-test(
		Q{~{~#,#,v^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ] ),
		Q{246}
	), Q[format.^.{.15];
	)

	#`(
	# (def-format-test format.^.{.16
	#   "~{~#,#,v^~A~}" ('(1 2 3 4 5 6 7 8 9 10 11 12 13)) "246")
	# 
	ok def-format-test(
		Q{~{~#,#,v^~A~}},
		[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ]
		Q{246}
	), Q[format.^.{.16];
	)

	#`(
	# (def-format-test format.^.{.17
	#   "~{~#,#,v^~A~}" ('(1 2 3 4 5 6 7 8 9 10 11 12 13 14)) "2468")
	# 
	ok def-format-test(
		Q{~{~#,#,v^~A~}},
		( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ] ),
		Q{2468}
	), Q[format.^.{.17];
	)

	# (def-format-test format.^.{.18
	#   "~{~v,v^~A~}" ((list (1+ most-positive-fixnum)
	#                        (1+ most-positive-fixnum)
	#                        1))
	#   "")
	# 
	# XXX Don't think it's applicable?

	# (def-format-test format.^.{.19
	#   "~{~0,v,v^~A~}" ((list (1+ most-positive-fixnum)
	#                          (1+ most-positive-fixnum)
	#                          1))
	#   "")
	# 
	# XXX Don't think it's applicable?

	# (def-format-test format.^.{.20
	#   "~{~0,v,v^~A~}" ((list (1+ most-positive-fixnum)
	#                          most-positive-fixnum
	#                          1))
	#   "1")
	# 
	# XXX Don't think it's applicable?

	#`(
	# (def-format-test format.^.{.21
	#   "~{~1,v^~A~}" ('(nil 8 nil 7 0 6 1 5)) "876")
	# 
	ok def-format-test(
		Q{~{~1,v^~A~}}, ( [ Nil, 8, Nil, 7, 0, 6, 1, 5 ] ), Q{876}
	), Q[format.^.{.21];
	)

	#`(
	# (def-format-test format.^.{.22
	#   "~{~0,v^~A~}" ('(3 8 1 7 3 6 nil 5)) "876")
	# 
	ok def-format-test(
		Q{~{~0,v^~A~}}, ( [ 3, 8, 1, 7, 3, 6, Nil, 5 ] ), Q{876}
	), Q[format.^.{.22];
	)

	#`(
	# (def-format-test format.^.{.23
	#   "~{~1,2,v^~A~}" ('(0 1 0 2 0 3 3 4)) "123")
	# 
	ok def-format-test(
		Q{~{~1,2,v^~A~}}, ( [ 0, 1, 0, 2, 0, 3, 3, 4 ] ), Q{123}
	), Q[format.^.{.23];
	)

	#`(
	# (def-format-test format.^.{.24
	#   "~{~1,2,v^~A~}" ('(0 1 0 2 0 3 nil 4)) "1234")
	# 
	ok def-format-test(
		Q{~{~1,2,v^~A~}}, ( [ 0, 1, 0, 2, 0, 3, Nil, 4 ] ), Q{1234}
	), Q[format.^.{.24];
	)

	#`(
	# (def-format-test format.^.{.25
	#   "~{~1,1,v^~A~}" ('(0 1 0 2 0 3 nil 4)) "123")
	# 
	ok def-format-test(
		Q{~{~1,1,v^~A~}}, ( [ 0, 1, 0, 2, 0, 3, Nil, 4 ] ), Q{123}
	), Q[format.^.{.25];
	)

	#`(
	# (def-format-test format.^.{.26
	#   "~{~'X^~A~}" ('(1 2 3)) "123")
	# 
	ok def-format-test(
		Q{~{~'X^~A~}}, ( [ 1, 2, 3 ] ), Q{123}
	), Q[format.^.{.26];
	)

	#`(
	# (def-format-test format.^.{.27
	#   "~{~v,'X^~A~}" ('(0 1 #\x 2 nil 3 #\X 4 0 5)) "123")
	# 
	ok def-format-test(
		Q{~{~v,'X^~A~}}, 
		( [ 0, 1, Q{X}, 2, Nil, 3, Q{X}, 4, 0, 5 ] ), Q{123}
	), Q[format.^.{.27];
	)

	#`(
	# (def-format-test format.^.{.28
	#   "~{~'X,v^~A~}" ('(0 1 #\x 2 nil 3 #\X 4 0 5)) "123")
	# 
	ok def-format-test(
		Q{~{~'X,v^~A~}}, 
		( [ 0, 1, Q{X}, 2, Nil, 3, Q{X}, 4, 0, 5 ] ),
		Q{123}
	), Q[format.^.{.28];
	)

	#`(
	# (def-format-test format.^.{.29
	#   "~{~v,v^~A~}" ('(0 2 1 #\x #\X 2 5 #\X 3 #\y #\y 4 1 2 5)) "123")
	# 
	ok def-format-test(
		Q{~{~v,v^~A~}}, 
		( [ 0, 2, 1, Q{x}, Q{X}, 2, 5, Q{X},
		    3, Q{y}, Q{y}, 4, 1, 2, 5 ] ),
		Q{123}
	), Q[format.^.{.29];
	)

	#`(
	# (def-format-test format.^.{.30
	#   "~{~',,',^~A~}" ('(1 2 3)) "")
	# 
	ok def-format-test(
		Q{~{~',,',^~A~}}, ( [ 1, 2, 3 ] ), Q{}
	), Q[format.^.{.30];
	)

	#`(
	# (def-format-test format.^.{.31
	#   "~{~1,v,v^~A~}" ('(#\a nil 0)) "0")
	# 
	ok def-format-test(
		Q{~{~1,v,v^~A~}}, ( [ Q{a}, Nil, 0 ] ), Q{0}
	), Q[format.^.{.31];
	)

	#`(
	# (def-format-test format.^.{.32
	#   "~{~v,1,v^~A~}" ('(#\a nil 0)) "0")
	# 
	ok def-format-test(
		Q{~{~v,1,v^~A~}}, ( [ Q{a}, Nil, 0 ] ), Q{0}
	), Q[format.^.{.32];
	)

	#`(
	# (def-format-test format.^.{.33
	#   "~{~v,v,v^~A~}" ('(#\a #\a nil 0)) "")
	# 
	ok def-format-test(
		Q{~{~v,v,v^~A~}}, ( [ Q{a}, Q{a}, Nil, 0 ] ), Q{}
	), Q[format.^.{.33];
	)
}, Q[Tests of ~^ inside ~{ ... ~}];

subtest {
	1;
	#`(
	# (def-format-test format.^.\:{.1
	#   "~:{~A~^~A~A~}" ('((1)(2 3 4)(5 6 7 8))) "1234567")
	# 
	ok def-format-test(
		Q{~{~A~^~A~A~}}, 
		( [ [ 1 ], [ 2, 3, 4 ], [ 5, 6, 7, 8 ] ] ),
		Q{1234567}
	), Q[format.^.:{.1];
	)

	#`(
	# (def-format-test format.^.\:{.2
	#   "~:{~A~0^~A~A~}" ('((1)(2 3 4)(5 6 7 8))) "125")
	# 
	ok def-format-test(
		Q{~:{~A~0^~A~A~}}, 
		( [ [ 1 ], [ 2, 3, 4 ], [ 5, 6, 7, 8 ] ] ),
		Q{125}
	), Q[format.^.:{.2];
	)

	#`(
	# (def-format-test format.^.\:{.3
	#   "~:{~#^~A~}" ('((1)(2 3 4)()(5 6 7 8))()) "125" 1)
	# 
	ok def-format-test(
		Q{~:{~#^~A~}}, 
		( [ [ 1 ], [ 2, 3, 4 ], [ ], [ 5, 6, 7, 8 ] ], [ ] ),
		Q{125},
		1
	), Q[format.^.:{.3];
	)

	#`(
	# (def-format-test format.^.\:{.4
	#   "~:{~#^~A~#^~A~#^~A~#^~A~}" ('((1)(2 3 4)()(5 6 7 8))()) "12345678" 1)
	# 
	ok def-format-test(
		Q{~:{~#^~A~#^~A~#^~A~#^~A~}},
		( [ [ 1 ], [ 2, 3, 4 ], [ ], [ 5, 6, 7, 8 ] ], [ ] ),
		Q{12345678},
		1
	), Q[format.^.:{.4];
	)

	#`(
	# (def-format-test format.^.\:{.5
	#   "~:{~v^~A~}" ('((1 2 3)(0)(2 4)(0 5)(1 6 7 8))) "246")
	# 
	ok def-format-test(
		Q{~:{~v^~A~}},
		( [ [ 1, 2, 3 ], [ 0 ], [ 2, 4 ], [ 0, 5 ], [ 1, 6, 7, 8 ] ] ),
		Q{246}
	), Q[format.^.:{.5];
	)

	#`(
	# (def-format-test format.^.\:{.6
	#   "~:{~v^~A~}" ('((nil)(nil 1)(1 2))) "12")
	# 
	ok def-format-test(
		Q{~:{~v^~A~}}, ( [ [ Nil ], [ Nil, 1 ], [ 1, 2 ] ] ), Q{12}
	), Q[format.^.:{.6];
	)

	#`(
	# (def-format-test format.^.\:{.7
	#   "~:{~v^~A~}" ('((#\x 1)(#\y 2)(0 3)(1 4))) "124")
	# 
	ok def-format-test(
		Q{~:{~v^~A~}},
		( [ [ Q{x}, 1 ], [ Q{y}, 2 ], [ 0, 3 ], [ 1, 4 ] ] ),
		Q{124}
	), Q[format.^.:{.7];
	)

	#`(
	# (def-format-test format.^.\:{.8
	#   "~:{~v,3^~A~}" ('((1 1)(2 0)(3 4)(5 6))) "106")
	# 
	ok def-format-test(
		Q{~:{~v,3^~A~}},
		( [ [ 1, 2 ], [ 2, 0 ], [ 3, 4 ], [ 5, 6 ] ] ),
		Q{106}
	), Q[format.^.:{.8];
	)

	#`(
	# (def-format-test format.^.\:{.9
	#   "~:{~3,v^~A~}" ('((1 1)(2 0)(3 4)(5 6))) "106")
	# 
	ok def-format-test(
		Q{~:{~3,v^~A~}},
		( [ [ 1, 1 ], [ 2, 0 ], [ 3, 4 ], [ 5, 6 ] ] ),
		Q{106}
	), Q[format.^.:{.9];
	)

	#`(
	# (def-format-test format.^.\:{.10
	#   "~:{~v,3^~A~}" ('((#\x 1))) "1")
	# 
	ok def-format-test(
		Q{~:{~v,3^~A~}}, ( [ [ Q{x}, 1 ] ]), Q{1}
	), Q[format.^.:{.10];
	)

	#`(
	# (def-format-test format.^.\:{.11
	#   "~:{~2,v^~A~}" ('((#\x 1))) "1")
	# 
	ok def-format-test(
		Q{~:{~2,v^~A~}}, ( [ [ Q{x}, 1 ] ]), Q{1}
	), Q[format.^.:{.11];
	)

	#`(
	# (def-format-test format.^.\:{.12
	#   "~:{~v,v^~A~}" ('((1 2 0) (0 1 1) (1 0 2) (3 3 5) (4 5 6))) "0126")
	# 
	ok def-format-test(
		Q{~:{~v,v^~A~}},
		( [ [ 1, 2, 0 ], [ 0, 1, 1 ], [ 1, 0, 2 ],
		    [ 3, 3, 5 ], [ 4, 5, 6 ] ] ),
		Q{0126}
	), Q[format.^.:{.12];
	)

	#`(
	# (def-format-test format.^.\:{.13
	#   "~:{~v,v^~A~}" ('((1 2 0) (#\a #\A 1) (#\A #\A 2) (1 2 3))) "013")
	# 
	ok def-format-test(
		Q{~:{~v,v^~A~}},
		( [ [ 1, 2, 0 ], [ Q{a}, Q{A}, 1 ],
		    [ Q{A}, Q{A}, 2 ], [ 1, 2, 3 ] ] ),
		Q{013}
	), Q[format.^.:{.13];
	)

	#`(
	# (def-format-test format.^.\:{.14
	#   "~:{~'x,3^~A~}" ('((1))) "1")
	# 
	ok def-format-test(
		Q{~:{~'x,3^~A~}}, ( [ [ 1 ] ] ), Q{1}
	), Q[format.^.:{.14];
	)

	#`(
	# (def-format-test format.^.\:{.15
	#   "~:{~3,'x^~A~}" ('((1))) "1")
	# 
	ok def-format-test(
		Q{~:{~3,'x^~A~}}, ( [ [ 1 ] ] ), Q{1}
	), Q[format.^.:{.15];
	)

	#`(
	# (def-format-test format.^.\:{.16
	#   "~:{~'x,'x^~A~}" ('((1))) "")
	# 
	ok def-format-test(
		Q{~:{~'x,'x^~A~}}, ( [ [ 1 ] ] ), Q{}
	), Q[format.^.:{.16];
	)

	#`(
	# (def-format-test format.^.\:{.17
	#   "~:{~#,1^~A~}" ('((1)(2 10)(3 a b)(4)(5 x)(6)(7 8))) "2357")
	# 
	ok def-format-test(
		Q{~:{~#,1^~A~}},
		( [ [ 1 ], [ 2, 10 ], [ 3, Q{a}, Q{b} ], [ 4 ],
		    [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ] ),
		Q{2357}
	), Q[format.^.:{.17];
	)

	#`(
	# (def-format-test format.^.\:{.18
	#   "~:{~1,#^~A~}" ('((1)(2 10)(3 a b)(4)(5 x)(6)(7 8))) "2357")
	# 
	ok def-format-test(
		Q{~:{~1,#^~A~}},
		( [ [ 1 ], [ 2, 10 ], [ 3, Q{a}, Q{b} ], [ 4 ],
		    [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ] ),
		Q{2357}
	), Q[format.^.:{.18];
	)

	#`(
	# (def-format-test format.^.\:{.19
	#   "~:{~#,#^~A~}" ('((1)()(2 10)(3 a b)(4)(5 x)(6)(7 8))) "")
	# 
	ok def-format-test(
		Q{~:{~#,#^~A~}},
		( [ [ 1 ], [ ], [ 2, 10 ], [ 3, Q{a}, Q{b} ], [ 4 ],
		    [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ] ),
		Q{}
	), Q[format.^.:{.19];
	)

	#`(
	# (def-format-test format.^.\:{.20
	#   "~:{~0,v^~A~}" ('((0 1)(1 2)(nil 3)(2 4))) "24")
	# 
	ok def-format-test(
		Q{~:{~0,v^~A~}},
		( [ [ 0, 1 ], [ 1, 2 ], [ Nil, 3 ], [ 2, 4 ] ] ),
		Q{24}
	), Q[format.^.:{.20];
	)

	#`(
	# (def-format-test format.^.\:{.21
	#   "~:{~1,v^~A~}" ('((0 1)(1 2)(nil 3)(2 4))) "134")
	# 
	ok def-format-test(
		Q{~:{~1,v^~A~}},
		( [ [ 0, 1 ], [ 1, 2 ], [ Nil, 3 ], [ 2, 4 ] ] ),
		Q{134}
	), Q[format.^.:{.21];
	)

	#`(
	# (def-format-test format.^.\:{.22
	#   "~:{~1,1,1^~A~}" ('((1)(2 3)(4 5 6)(7 8 9 0))) "")
	# 
	ok def-format-test(
		Q{~:{~1,1,1^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ] ),
		Q{}
	), Q[format.^.:{.22];
	)

	#`(
	# (def-format-test format.^.\:{.23
	#   "~:{~1,2,3^~A~}" ('((1)(2 3)(4 5 6)(7 8 9 0))) "")
	# 
	ok def-format-test(
		Q{~:{~1,2,3^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ] ),
		Q{}
	), Q[format.^.:{.23];
	)

	#`(
	# (def-format-test format.^.\:{.24
	#   "~:{~1,2,1^~A~}" ('((1)(2 3)(4 5 6)(7 8 9 0))) "1247")
	# 
	ok def-format-test(
		Q{~:{~1,2,1^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ] ),
		Q{1247}
	), Q[format.^.:{.24];
	)

	#`(
	# (def-format-test format.^.\:{.25
	#   "~:{~1,0,1^~A~}" ('((1)(2 3)(4 5 6)(7 8 9 0))) "1247")
	# 
	ok def-format-test(
		Q{~:{~1,0,1^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ] ),
		Q{1247}
	), Q[format.^.:{.25];
	)

	#`(
	# (def-format-test format.^.\:{.26
	#   "~:{~3,2,1^~A~}" ('((1)(2 3)(4 5 6)(7 8 9 0))) "1247")
	# 
	ok def-format-test(
		Q{~:{~3,2,1^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ] ),
		Q{1247}
	), Q[format.^.:{.26];
	)

	#`(
	# (def-format-test format.^.\:{.27
	#   "~:{~v,2,3^~A~}" ('((1 10)(2 20)(3 30)(4 40))) "3040")
	# 
	ok def-format-test(
		Q{~:{~v,2,3^~A~}},
		( [ [ 1, 10 ], [ 2, 20 ], [ 3, 30 ], [ 4, 40 ] ] ),
		Q{3049}
	), Q[format.^.:{.27];
	)

	#`(
	# (def-format-test format.^.\:{.28
	#   "~:{~1,v,3^~A~}" ('((0 7)(1 10)(2 20)(3 30)(4 40))) "740")
	# 
	ok def-format-test(
		Q{~:{~1,v,3^~A~}},
		( [ [ 0, 7 ], [ 1, 10 ], [ 2, 20 ], [ 3, 30 ], [ 4, 40 ] ] ),
		Q{740}
	), Q[format.^.:{.28];
	)

	#`(
	# (def-format-test format.^.\:{.29
	#   "~:{~1,2,v^~A~}" ('((0 0)(1 10)(2 20)(3 30)(4 40)(0 50))) "01050")
	# 
	ok def-format-test(
		Q{~:{~1,2,v^~A~}},
		( [ [ 0, 0 ], [ 1, 10 ], [ 2, 20 ],
		    [ 3, 30 ], [ 4, 40 ], [ 0, 50 ] ] ),
		Q{01050}
	), Q[format.^.:{.29];
	)

	#`(
	# (def-format-test format.^.\:{.30
	#   "~:{~1,2,v^~A~}" ('((nil 0))) "0")
	# 
	ok def-format-test(
		Q{~:{~1,2,v^~A~}}, ( [ [ Nil, 0 ] ] ), Q{0}
	), Q[format.^.:{.30];
	)

	#`(
	# (def-format-test format.^.\:{.31
	#   "~:{~#,3,3^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "45")
	# 
	ok def-format-test(
		Q{~:{~#,3,3^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ],
		    [ 4, 3, 2, 1 ], [ 5, 4, 3, 2, 1 ] ] ),
		Q{45}
	), Q[format.^.:{.31];
	)

	#`(
	# (def-format-test format.^.\:{.32
	#   "~:{~2,#,3^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "145")
	# 
	ok def-format-test(
		Q{~:{~2,#,3^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		    [ 5, 4, 3, 2, 1 ] ] ),
		Q{145}
	), Q[format.^.:{.32];
	)

	#`(
	# (def-format-test format.^.\:{.33
	#   "~:{~0,3,#^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "12")
	# 
	ok def-format-test(
		Q{~:{~0,3,#^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ],
		    [ 4, 3, 2, 1 ], [ 5, 4, 3, 2, 1 ] ] ),
		Q{12}
	), Q[format.^.:{.33];
	)

	#`(
	# (def-format-test format.^.\:{.34
	#   "~:{~#,#,3^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "45")
	# 
	ok def-format-test(
		Q{~:{~#,#,3^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		    [ 5, 4, 3, 2, 1 ] ] ),
		Q{45}
	), Q[format.^.:{.34];
	)

	#`(
	# (def-format-test format.^.\:{.35
	#   "~:{~3,#,#^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "12")
	# 
	ok def-format-test(
		Q{~:{~3,#,#^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		    [ 5, 4, 3, 2, 1 ] ] ),
		Q{12}
	), Q[format.^.:{.35];
	)

	#`(
	# (def-format-test format.^.\:{.36
	#   "~:{~#,3,#^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "1245")
	# 
	ok def-format-test(
		Q{~:{~#,3,#^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ],
		    [ 4, 3, 2, 1 ], [ 5, 4, 3, 2, 1 ] ] ),
		Q{1245}
	), Q[format.^.:{.36];
	)

	#`(
	# (def-format-test format.^.\:{.37
	#   "~:{~#,#,#^~A~}" ('((1) (2 1) (3 2 1) (4 3 2 1) (5 4 3 2 1))) "")
	# 
	ok def-format-test(
		Q{~:{~#,#,#^~A~}},
		( [ [ 1 ], [ 2, 1 ], [ 3, 2, 1 ],
		    [ 4, 3, 2, 1 ], [ 5, 4, 3, 2, 1 ] ] ),
		Q{}
	), Q[format.^.:{.37];
	)

	#`(
	# (def-format-test format.^.\:{.38
	#   "~:{~1,v,v^~A~}" ('((#\a nil 0))) "0")
	# 
	ok def-format-test(
		Q{~:{~1,v,v^~A~}}, ( [ [ Q{a}, Nil, 0 ] ] ), Q{}
	), Q[format.^.:{.38];
	)

	#`(
	# (def-format-test format.^.\:{.39
	#   "~:{~v,1,v^~A~}" ('((#\a nil 0))) "0")
	# 
	ok def-format-test(
		Q{~:{~v,1,v^~A~}}, ( [ [ Q{a}, Nil, 0 ] ] ), Q{0}
	), Q[format.^.:{.39];
	)
}, Q[~^ with ~:{];

subtest {
	1;
	#`(
	# (def-format-test format.^.@{.1
	#   "~@{X ~A~^ Y ~A~^ ~}" (1 2 3 4 5) "X 1 Y 2 X 3 Y 4 X 5")
	# 
	ok def-format-test(
		Q{~@{X ~A~^ Y ~A~^ ~}},
		( [ 1, 2, 3, 4, 5 ] ),
		Q{X 1 Y 2 X 3 Y 4 X 5}
	), Q[format.^.@{.1];
	)

	#`(
	# (def-format-test format.^.@{.2
	#   "~@{X ~A~^ Y ~A~^ ~}" (1 2 3 4) "X 1 Y 2 X 3 Y 4")
	# 
	ok def-format-test(
		Q{~@{X ~A~^ Y ~A~^ ~}}, ( [ 1, 2, 3, 4 ] ), Q{X 1 Y 2 X 3 Y 4}
	), Q[format.^.@{.2];
	)

	#`(
	# (def-format-test format.^.@{.3
	#   "~1@{~A~^~A~}" (1) "1")
	# 
	ok def-format-test( Q{~1@{~A~^~A~}}, ( 1 ), Q{1} ), Q[format.^@{.3];
	)

	#`(
	# (def-format-test format.^.@{.4
	#   "~0@{~A~^~A~}" (1) "" 1)
	# 
	ok def-format-test( Q{~0@{~A~^~A~}}, ( 1 ), Q{}, 1 ), Q[format.^@{.4];
	)

	#`(
	# (def-format-test format.^.@{.5
	#   "~1@{~A~^~A~}" (1 2 3) "12" 1)
	# 
	ok def-format-test(
		Q{~1@{~A~^~A~}}, ( 1, 2, 3 ), Q{12}, 1
	), Q[format.^@{.5];
	)

	#`(
	# (def-format-test format.^.@{.6
	#   "~@{~A~A~0^~A~}" (1 2 3 4 5 6) "12" 4)
	# 
	ok def-format-test(
		Q{~@{~A~A~0^~A~}}, ( 1, 2, 3, 4, 5, 6 ), Q{12}, 4
	), Q[format.^@{.6];
	)

	#`(
	# (def-format-test format.^.@{.7
	#   "~@{~A~A~v^~A~}" (1 2 3 4 5 6 0 7 8 9 10 11 12) "12456" 6)
	# 
	ok def-format-test(
		Q{~@{~A~A~v^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ),
		Q{12456},
		6
	), Q[format.^.@{.7];
	)

	#`(
	# (def-format-test format.^.@{.8
	#   "~@{~#,3^~A~}" (1 2 3 4 5 6 7 8 9 10) "1234567" 3)
	# 
	ok def-format-test(
		Q{~@{~#,3^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ),
		Q{1234567},
		3
	), Q[format.^.@{.8];
	)

	#`(
	# (def-format-test format.^.@{.9
	#   "~@{~2,#^~A~}X~A" (1 2 3 4 5 6 7 8 9 10) "12345678X9" 1)
	# 
	ok def-format-test(
		Q{~@{~2,#^~A~}X~A},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ),
		Q{12345678X9},
		1
	), Q[format.^.@{.9];
	)

	#`(
	# (def-format-test format.^.@{.10
	#   "~@{~#,#^~A~}" (1 2 3 4 5 6 7 8 9 10) "" 10)
	# 
	ok def-format-test(
		Q{~@{~#,#^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ),
		Q{1234567},
		10
	), Q[format.^.@{.10];
	)

	#`(
	# (def-format-test format.^.@{.11
	#   "~@{~#,#,#^~A~}" (1 2 3 4 5 6 7 8 9 10) "" 10)
	# 
	ok def-format-test(
		Q{~@{~#,#,#^~A~}}, ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ), Q{}, 10
	), Q[format.^.@{.11];
	)

	#`(
	# (def-format-test format.^.@{.12
	#   "~@{~#,1,2^~A~}" (1 2 3 4 5 6 7 8 9 10) "123456789" 1)
	# 
	ok def-format-test(
		Q{~@{~#,1,2^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ),
		Q{123456789},
		1
	), Q[format.^.@{.12];
	)

	#`(
	# (def-format-test format.^.@{.13
	#   "~@{~#,#,v^~A~}" (1 2 3 4 5 6 7 8 9 10) "246" 3)
	# 
	ok def-format-test(
		Q{~@{~#,#,v^~A~}}, ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ), Q{246}, 3
	), Q[format.^.@{.13];
	)

	#`(
	# (def-format-test format.^.@{.14
	#   "~@{~#,#,v^~A~}" (1 2 3 4 5 6 7 8 9 10 11) "246" 4)
	# 
	ok def-format-test(
		Q{~@{~#,#,v^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ),
		Q{246},
		4
	), Q[format.^.@{.14];
	)

	#`(
	# (def-format-test format.^.@{.15
	#   "~@{~#,#,v^~A~}" (1 2 3 4 5 6 7 8 9 10 11 12) "246" 5)
	# 
	ok def-format-test(
		Q{~@{~#,#,v^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ),
		Q{246},
		5
	), Q[format.^.@{.15];
	)

	#`(
	# (def-format-test format.^.@{.16
	#   "~@{~#,#,v^~A~}" (1 2 3 4 5 6 7 8 9 10 11 12 13) "246" 6)
	# 
	ok def-format-test(
		Q{~@{~#,#,v^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ),
		Q{246},
		6
	), Q[format.^.@{.16];
	)

	#`(
	# (def-format-test format.^.@{.17
	#   "~@{~#,#,v^~A~}" (1 2 3 4 5 6 7 8 9 10 11 12 13 14) "2468" 5)
	# 
	ok def-format-test(
		Q{~@{~#,#,v^~A~}},
		( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ),
		Q{2468},
		5
	), Q[format.^.@{.17];
	)

	# (def-format-test format.^.@{.18
	#   "~@{~v,v^~A~}"
	#   ((1+ most-positive-fixnum)
	#    (1+ most-positive-fixnum)
	#    1)
	#   "" 1)
	# 
	# XXX Don't think it's applicable?

	# (def-format-test format.^.@{.19
	#   "~@{~0,v,v^~A~}"
	#   ((1+ most-positive-fixnum)
	#    (1+ most-positive-fixnum)
	#    1)
	#   "" 1)
	# 
	# XXX Don't think it's applicable?

	# (def-format-test format.^.@{.20
	#   "~@{~0,v,v^~A~}"
	#   ((1+ most-positive-fixnum)
	#    most-positive-fixnum
	#    1)
	#   "1")
	# 
	# XXX Don't think it's applicable?

	#`(
	# (def-format-test format.^.@{.21
	#   "~@{~1,v^~A~}" (nil 8 nil 7 0 6 1 5) "876" 1)
	# 
	ok def-format-test(
		Q{~@{~1,v^~A~}}, ( Nil, 8, Nil, 7, 0, 6, 1, 5 ), Q{876}, 1
	), Q[format.^.@{.21];
	)

	#`(
	# (def-format-test format.^.@{.22
	#   "~@{~0,v^~A~}" (3 8 1 7 3 6 nil 5) "876" 1)
	# 
	ok def-format-test(
		Q{~@{~0,v^~A~}}, ( 3, 8, 1, 7, 3, 6, Nil, 5 ), Q{876}, 1
	), Q[format.^.@{.22];
	)

	#`(
	# (def-format-test format.^.@{.23
	#   "~@{~1,2,v^~A~}" (0 1 0 2 0 3 3 4) "123" 1)
	# 
	ok def-format-test(
		Q{~@{~1,2,v^~A~}}, ( 0, 1, 0, 2, 0, 3, 3, 4 ), Q{123}, 1
	), Q[format.^.@{.23];
	)

	#`(
	# (def-format-test format.^.@{.24
	#   "~@{~1,2,v^~A~}" (0 1 0 2 0 3 nil 4) "1234")
	# 
	ok def-format-test(
		Q{~@{~1,2,v^~A~}}, ( 0, 1, 0, 2, 0, 3, Nil, 4 ), Q{1234}
	), Q[format.^.@{.24];
	)

	#`(
	# (def-format-test format.^.@{.25
	#   "~@{~1,1,v^~A~}" (0 1 0 2 0 3 nil 4) "123" 1)
	# 
	ok def-format-test(
		Q{~@{~1,1,v^~A~}}, ( 0, 1, 0, 2, 0, 3, Nil, 4 ), Q{123}, 1
	), Q[format.^.@{.25];
	)

	#`(
	# (def-format-test format.^.@{.26
	#   "~@{~'X^~A~}" (1 2 3) "123")
	# 
	ok def-format-test(
		Q{~@{~'X^~A~}}, ( 1, 2, 3 ), Q{123}
	), Q[format.^.@{.26];
	)

	#`(
	# (def-format-test format.^.@{.27
	#   "~@{~v,'X^~A~}" (0 1 #\x 2 nil 3 #\X 4 0 5) "123" 3)
	# 
	ok def-format-test(
		Q{~@{~v,'X^~A~}},
		( 0, 1, Q{x}, 2, Nil, 3, Q{X}, 4, 0, 5 ),
		Q{123},
		3
	), Q[format.^.@{.27];
	)

	#`(
	# (def-format-test format.^.@{.28
	#   "~@{~'X,v^~A~}" (0 1 #\x 2 nil 3 #\X 4 0 5) "123" 3)
	# 
	ok def-format-test(
		Q{~@{~'X,v^~A~}},
		( 0, 1, Q{x}, 2, Nil, 3, Q{X}, 4, 0, 5 ),
		Q{123},
		3
	), Q[format.^.@{.28];
	)

	#`(
	# (def-format-test format.^.@{.29
	#   "~@{~v,v^~A~}" (0 2 1 #\x #\X 2 5 #\X 3 #\y #\y 4 1 2 5) "123" 4) 
	# 
	ok def-format-test(
		Q{~@{~v,v^~A~}},
		( 0, 2, 1, Q{x}, Q{X}, 2, 5, Q{X}, 3, Q{y}, Q{y}, 4, 1, 2, 5 ),
		Q{123},
		4
	), Q[format.^.@{.29];
	)

	#`(
	# (def-format-test format.^.@{.30
	#   "~@{~',,',^~A~}" (1 2 3) "" 3)
	# 
	ok def-format-test(
		Q{~@{~',,',^~A~}}, ( 1, 2, 3 ), Q{}, 3
	), Q[format.^.@{.30];
	)

	#`(
	# (def-format-test format.^.@{.31
	#   "~@{~1,v,v^~A~}" (#\a nil 0) "0")
	# 
	ok def-format-test(
		Q{~@{~1,v,v^~A~}}, ( Q{a}, Nil, 0 ), Q{0}
	), Q[format.^.@{.31];
	)

	#`(
	# (def-format-test format.^.@{.32
	#   "~@{~v,1,v^~A~}" (#\a nil 0) "0")
	# 
	ok def-format-test(
		Q{~@{~v,1,v^~A~}}, ( Q{a}, Nil, 0 ), Q{0}
	), Q[format.^.@{.32];
	)

	#`(
	# (def-format-test format.^.@{.33
	#   "~@{~v,v,v^~A~}" (#\a #\a nil 0) "" 1)
	# 
	ok def-format-test(
		Q{~@{~v,v,v^~A~}}, ( Q{a}, Q{a}, Nil, 0 ), Q{}, 1
	), Q[format.^.@{.33];
	)
}, Q[Tests of ~^ inside ~@{ ... ~}];

subtest {
	1;
	#`(
	# (def-format-test format.^.\:@{.1
	#   "~:@{~A~^~A~A~}" ('(1) '(2 3 4) '(5 6 7 8)) "1234567")
	# 
	ok def-format-test(
		Q{~:@{~A~^~A~A~}},
		( [ 1 ], [ 2, 3, 4 ], [ 5, 6, 7, 8 ] ),
		Q{1234567}
	), Q[format.^.:@{.1];
	)

	#`(
	# (def-format-test format.^.\:@{.2
	#   "~@:{~A~0^~A~A~}" ('(1) '(2 3 4) '(5 6 7 8)) "125")
	# 
	ok def-format-test(
		Q{~:@{~A~0^~A~A~}},
		( [ 1 ], [ 2, 3, 4 ], [ 5, 6, 7, 8 ] ),
		Q{125}
	), Q[format.^.:@{.2];
	)

	#`(
	# (def-format-test format.^.\:@{.3
	#   "~:@{~#^~A~}" ('(1) '(2 3 4) () '(5 6 7 8) ()) "125")
	# 
	ok def-format-test(
		Q{~:@{~#^~A~}},
		( [ 1 ], [ 2, 3, 4 ], [ ], [ 5, 6, 7, 8 ], [ ] ),
	), Q{125}, Q[format.^.:@{.3];
	)

	#`(
	# (def-format-test format.^.\:@{.4
	#   "~@:{~#^~A~#^~A~#^~A~#^~A~}" ('(1) '(2 3 4) () '(5 6 7 8) ()) "12345678")
	# 
	ok def-format-test(
		Q{~@:{~#^~A~#^~A~#^~A~#^~A~}},
		( [ 1 ], [ 2, 3, 4 ], [ ], [ 5, 6, 7, 8 ], [ ] ),
		Q{12345678}
	), Q[format.^.:@{.4];
	)

	#`(
	# (def-format-test format.^.\:@{.5
	#   "~:@{~v^~A~}" ('(1 2 3) '(0) '(2 4) '(0 5) '(1 6 7 8)) "246")
	# 
	ok def-format-test(
		Q{~:@{~v^~A~}},
		( [ 1, 2, 3 ], [ 0 ], [ 2, 4 ], [ 0, 5 ], [ 1, 6, 7, 8 ] ),
		Q{246}
	), Q[format.^.:@{.5];
	)

	#`(
	# (def-format-test format.^.\:@{.6
	#   "~:@{~v^~A~}" ('(nil) '(nil 1) '(1 2)) "12")
	# 
	ok def-format-test(
		Q{~:@{~v^~A~}}, ( [ Nil ], [ Nil, 1 ], [ 1, 2 ] ), Q{12}
	), Q[format.^.:@{.6];
	)

	#`(
	# (def-format-test format.^.\:@{.7
	#   "~:@{~v^~A~}" ('(#\x 1) '(#\y 2) '(0 3) '(1 4)) "124")
	# 
	ok def-format-test(
		Q{~:@{~v^~A~}},
		( [ Q{x}, 1 ], [ Q{y}, 2 ], [ 0, 3 ], [ 1, 4 ] ),
		Q{124}
	), Q[format.^.:@{.7];
	)

	#`(
	# (def-format-test format.^.\:@{.8
	#   "~:@{~v,3^~A~}" ('(1 1) '(2 0) '(3 4) '(5 6)) "106")
	# 
	ok def-format-test(
		Q{~:@{~v,3^~A~}},
		( [ 1, 1 ], [ 2, 0 ], [ 3, 4 ], [ 5, 6 ] ),
		Q{106}
	), Q[format.^.:@{.8];
	)

	#`(
	# (def-format-test format.^.\:@{.9
	#   "~@:{~3,v^~A~}" ('(1 1) '(2 0) '(3 4) '(5 6)) "106")
	# 
	ok def-format-test(
		Q{~@:{~3,v^~A~}},
		( [ 1, 1 ], [ 2, 0 ], [ 3, 4 ], [ 5, 6 ] ),
		Q{106}
	), Q[format.^.:@{.9];
	)

	#`(
	# (def-format-test format.^.\:@{.10
	#   "~:@{~v,3^~A~}" ('(#\x 1)) "1")
	# 
	ok def-format-test(
		Q{~:@{~v,3^~A~}}, ( [ Q{x}, 1 ] ), Q{1}
	), Q[format.^.:@{.10];
	)

	#`(
	# (def-format-test format.^.\:@{.11
	#   "~:@{~2,v^~A~}" ('(#\x 1)) "1")
	# 
	ok def-format-test(
		Q{~:@{~2,v^~A~}}, ( [ Q{x}, 1 ] ), Q{1}
	), Q[format.^.:@{.11];
	)

	#`(
	# (def-format-test format.^.\:@{.12
	#   "~:@{~v,v^~A~}" ('(1 2 0) '(0 1 1) '(1 0 2) '(3 3 5) '(4 5 6)) "0126")
	# 
	ok def-format-test(
		Q{~:@{~v,v^~A~}},
		( [ 1, 2, 0 ], [ 0, 1, 1 ], [ 1, 0, 2 ],
		  [ 3, 3, 5 ], [ 4, 5, 6 ] ),
		Q{0126}
	), Q[format.^.:@{.12];
	)

	#`(
	# (def-format-test format.^.\:@{.13
	#   "~:@{~v,v^~A~}" ('(1 2 0) '(#\a #\A 1) '(#\A #\A 2) '(1 2 3)) "013")
	# 
	ok def-format-test(
		Q{~:@{~v,v^~A~}},
		( [ 1, 2, 0 ], [ Q{a}, Q{A}, 1 ],
		  [ Q{A}, Q{A}, 2 ], [ 1, 2, 3 ] ),
		Q{013}
	), Q[format.^.:@{.13];
	)

	#`(
	# (def-format-test format.^.\:@{.14
	#   "~:@{~'x,3^~A~}" ('(1)) "1")
	# 
	ok def-format-test(
		Q{~:@{~'x,3^~A~}}, ( [ 1 ] ), Q{1}
	), Q[format.^.:@{.14];
	)

	#`(
	# (def-format-test format.^.\:@{.15
	#   "~:@{~3,'x^~A~}" ('(1)) "1")
	# 
	ok def-format-test(
		Q{~:@{~3,'x^~A~}}, ( [ 1 ] ), Q{1}
	), Q[format.^.:@{.15];
	)

	#`(
	# (def-format-test format.^.\:@{.16
	#   "~:@{~'x,'x^~A~}" ('(1)) "")
	# 
	ok def-format-test(
		Q{~:@{~'x,'x^~A~}}, ( [ 1 ] ), Q{}
	), Q[format.^.:@{.16];
	)

	#`(
	# (def-format-test format.^.\:@{.17
	#   "~:@{~#,1^~A~}" ('(1) '(2 10) '(3 a b) '(4) '(5 x) '(6) '(7 8)) "2357")
	# 
	ok def-format-test(
		Q{~:@{~#,1^~A~}},
		( [ 1 ], [ 2, 10 ], [ 3, Q{a}, Q{b} ],
		  [ 4 ], [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ),
		Q{2357}
	), Q[format.^.:@{.17];
	)

	#`(
	# (def-format-test format.^.\:@{.18
	#   "~:@{~1,#^~A~}" ('(1) '(2 10) '(3 a b) '(4) '(5 x) '(6) '(7 8)) "2357")
	# 
	ok def-format-test(
		Q{~:@{~1,#^~A~}},
		( [ 1 ], [ 2, 10 ], [ 3, Q{a}, Q{b} ],
		  [ 4 ], [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ),
		Q{2357}
	), Q[format.^.:@{.18];
	)

	#`(
	# (def-format-test format.^.\:@{.19
	#   "~:@{~#,#^~A~}" ('(1) '() '(2 10) '(3 a b) '(4) '(5 x) '(6) '(7 8)) "")
	# 
	ok def-format-test(
		Q{~:@{~#,#^~A~}},
		( [ 1 ], [ ], [ 2, 10 ], [ 3, Q{a}, Q{b} ], [ 4 ],
		  [ 5, Q{x} ], [ 6 ], [ 7, 8 ] ),
		Q{}
	), Q[format.^.:@{.19];
	)

	#`(
	# (def-format-test format.^.\:@{.20
	#   "~:@{~0,v^~A~}" ('(0 1) '(1 2) '(nil 3) '(2 4)) "24")
	# 
	ok def-format-test(
		Q{~:@{~0,v^~A~}},
		( [ 0, 1 ], [ 1, 2 ], [ Nil, 3 ], [ 2, 4 ] ),
		Q{24}
	), Q[format.^.:@{.20];
	)

	#`(
	# (def-format-test format.^.\:@{.21
	#   "~:@{~1,v^~A~}" ('(0 1) '(1 2) '(nil 3) '(2 4)) "134")
	# 
	ok def-format-test(
		Q{~:@{~1,v^~A~}},
		( [ 0, 1 ], [ 1, 2 ], [ Nil, 3 ], [ 2, 4 ] ),
		Q{134}
	), Q[format.^.:@{.21];
	)

	#`(
	# (def-format-test format.^.\:@{.22
	#   "~:@{~1,1,1^~A~}" ('(1) '(2 3) '(4 5 6) '(7 8 9 0)) "")
	# 
	ok def-format-test(
		Q{~:@{~1,1,1^~A~}},
		( [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ),
		Q{}
	), Q[format.^.:@{.22];
	)

	#`(
	# (def-format-test format.^.\:@{.23
	#   "~:@{~1,2,3^~A~}" ('(1) '(2 3) '(4 5 6) '(7 8 9 0)) "")
	# 
	ok def-format-test(
		Q{~:@{~1,2,3^~A~}},
		( [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ),
		Q{}
	), Q[format.^.:@{.23];
	)

	#`(
	# (def-format-test format.^.\:@{.24
	#   "~:@{~1,2,1^~A~}" ('(1) '(2 3) '(4 5 6) '(7 8 9 0)) "1247")
	# 
	ok def-format-test(
		Q{~:@{~1,2,1^~A~}},
		( [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ),
		Q{1247}
	), Q[format.^.:@{.24];
	)

	#`(
	# (def-format-test format.^.\:@{.25
	#   "~:@{~1,0,1^~A~}" ('(1) '(2 3) '(4 5 6) '(7 8 9 0)) "1247")
	# 
	ok def-format-test(
		Q{~:@{~1,0,1^~A~}},
		( [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ),
		Q{1247}
	), Q[format.^.:@{.25];
	)

	#`(
	# (def-format-test format.^.\:@{.26
	#   "~:@{~3,2,1^~A~}" ('(1) '(2 3) '(4 5 6) '(7 8 9 0)) "1247")
	# 
	ok def-format-test(
		Q{~:@{~3,2,1^~A~}},
		( [ 1 ], [ 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] ),
		Q{1247}
	), Q[format.^.:@{.26];
	)

	#`(
	# (def-format-test format.^.\:@{.27
	#   "~:@{~v,2,3^~A~}" ('(1 10) '(2 20) '(3 30) '(4 40)) "3040")
	# 
	ok def-format-test(
		Q{~:@{~v,2,3^~A~}},
		( [ 1, 10 ], [ 2, 20 ], [ 3, 30 ], [ 4, 40 ] ),
		Q{3040}
	), Q[format.^.:@{.27];
	)

	#`(
	# (def-format-test format.^.\:@{.28
	#   "~:@{~1,v,3^~A~}" ('(0 7) '(1 10) '(2 20) '(3 30) '(4 40)) "740")
	# 
	ok def-format-test(
		Q{~:@{~1,v,3^~A~}},
		( [ 0, 7 ], [ 1, 10 ], [ 2, 20 ], [ 3, 30 ], [ 4, 40 ] ),
		Q{740}
	), Q[format.^.:@{.28];
	)

	#`(
	# (def-format-test format.^.\:@{.29
	#   "~:@{~1,2,v^~A~}" ('(0 0) '(1 10) '(2 20) '(3 30) '(4 40) '(0 50))
	#   "01050")
	# 
	ok def-format-test(
		Q{~:@{~1,2,v^~A~}},
		( [ 0, 0 ], [ 1, 10 ], [ 2, 20 ],
		  [ 3, 30 ], [ 4, 40 ], [ 0, 50 ] ),
		Q{01050}
	), Q[format.^.:@{.29];
	)

	#`(
	# (def-format-test format.^.\:@{.30
	#   "~:@{~1,2,v^~A~}" ('(nil 0)) "0")
	# 
	ok def-format-test(
		Q{~:@{~1,2,v^~A~}}, ( [ Nil, 0 ] ), Q{0}
	), Q[format.^.:@{.30];
	)

	#`(
	# (def-format-test format.^.\:@{.31
	#   "~:@{~#,3,3^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "45")
	# 
	ok def-format-test(
		Q{~:@{~#,3,3^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{45}
	), Q[format.^.:@{.31];
	)

	#`(
	# (def-format-test format.^.\:@{.32
	#   "~:@{~2,#,3^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "145")
	# 
	ok def-format-test(
		Q{~:@{~2,#,3^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{145}
	), Q[format.^.:@{.32];
	)

	#`(
	# (def-format-test format.^.\:@{.33
	#   "~:@{~0,3,#^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "12")
	# 
	ok def-format-test(
		Q{~:@{~0,3,#^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{12}
	), Q[format.^.:@{.33];
	)

	#`(
	# (def-format-test format.^.\:@{.34
	#   "~:@{~#,#,3^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "45")
	# 
	ok def-format-test(
		Q{~:@{~#,#,3^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{45}
	), Q[format.^.:@{.34];
	)

	#`(
	# (def-format-test format.^.\:@{.35
	#   "~:@{~3,#,#^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "12")
	# 
	ok def-format-test(
		Q{~:@{~3,#,#^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{12}
	), Q[format.^.:@{.35];
	)

	#`(
	# (def-format-test format.^.\:@{.36
	#   "~:@{~#,3,#^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "1245")
	# 
	ok def-format-test(
		Q{~:@{~#,3,#^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{1245}
	), Q[format.^.:@{.36];
	)

	#`(
	# (def-format-test format.^.\:@{.37
	#   "~:@{~#,#,#^~A~}" ('(1) '(2 1) '(3 2 1) '(4 3 2 1) '(5 4 3 2 1)) "")
	# 
	ok def-format-test(
		Q{~:@{~#,#,#^~A~}},
		( [ 1 ], [ 2, 1 ], [ 3, 2, 1 ], [ 4, 3, 2, 1 ],
		  [ 5, 4, 3, 2, 1 ] ),
		Q{}
	), Q[format.^.:@{.37];
	)

	#`(
	# (def-format-test format.^.\:@{.38
	#   "~:@{~1,v,v^~A~}" ('(#\a nil 0)) "0")
	# 
	ok def-format-test(
		Q{~:@{~1,v,v^~A~}}, ( [ Q{a}, Nil, 0 ] ), Q{0}
	), Q[format.^.:@{.38];
	)

	#`(
	# (def-format-test format.^.\:@{.39
	#   "~:@{~v,1,v^~A~}" ('(#\a nil 0)) "0")
	# 
	ok def-format-test(
		Q{~:@{~v,1,v^~A~}}, ( [ Q{a}, Nil, 0 ] ), Q{0}
	), Q[format.^.:@{.39];
	)
}, Q[Inside ~:@{];

subtest {
	1;
	#`(
	# (def-format-test format.\:^.\:{.1
	#   "~:{~:^~A~}"  (nil) "")
	# 
	ok def-format-test( Q{~:{~:^~A~}}, ( Nil ), Q{} ), Q[format.:^.:{.1];
	)

	#`(
	# (def-format-test format.\:^.\:{.2
	#   "(~:{~A~:^,~})"  ('((1)(2)(3))) "(1,2,3)")
	# 
	ok def-format-test(
		Q{~:{~A~:^,~}}, ( [ [ 1 ], [ 2 ], [ 3 ] ] ), Q{(1,2,3)}
	), Q[format.:^.:{.2];
	)

	#`(
	# (def-format-test format.\:^.\:{.3
	#   "~:{~:^~A~}"  ('((1)(2)(3)(4))) "123")
	# 
	ok def-format-test(
		Q{~:{~:^~A~}}, ( [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] ), Q{123}
	), Q[format.:^.:{.3];
	)
}, Q[~:^ in ~:{];

subtest {
	1;
	#`(
	# (def-format-test format.\:^.\:{.4
	#   "~:{~0:^~A~}" ('((1)(2))) "")
	# 
	ok def-format-test(
		Q{~:{~0:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{}
	), Q[format.:^.:{.4];
	)

	#`(
	# (def-format-test format.\:^.\:{.5
	#   "~:{~1:^~A~}" ('((1)(2))) "12")
	# 
	ok def-format-test(
		Q{~:{~1:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{12}
	), Q[format.:^.:{.5];
	)

	#`(
	# (def-format-test format.\:^.\:{.6
	#   "~:{~'X:^~A~}" ('((1)(2))) "12")
	# 
	ok def-format-test(
		Q{~:{~'X:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{12}
	), Q[format.:^.:{.6];
	)

	#`(
	# (def-format-test format.\:^.\:{.7
	#   "~:{~v:^~A~}" ('((1 8)(2 3 4)(3 1)(0)(6 7)(8 10))) "831")
	# 
	ok def-format-test(
		Q{~:{~v:^~A~}},
		( [ [ 1, 8 ], [ 2, 3, 4 ], [ 3, 1 ],
		    [ 0 ], [ 6, 7 ], [ 8, 10 ] ] ),
		Q{831}
	), Q[format.:^.:{.7];
	)

	#`(
	# (def-format-test format.\:^.\:{.8
	#   "~:{~V:^~A~}" ('((#\X 1)(0 2))) "1")
	# 
	ok def-format-test(
		Q{~:{~V:^~A~}}, ( [ [ Q{X}, 1 ], [ 0, 2 ] ] ), Q{1}
	), Q[format.:^.:{.8];
	)

	#`(
	# (def-format-test format.\:^.\:{.9
	#   "~:{~#:^~A~}" ('((1)(2)(3 4)(5 6 7)()(8 9 10))) "1235")
	# 
	ok def-format-test(
		Q{~:{~#:^~A~}},
		( [ [ 1 ], [ 2 ], [ 3, 4 ], [ 5, 6, 7 ], [ ], [ 8, 9, 10 ] ] ),
		Q{1}
	), Q[format.:^.:{.9];)

	#`(
	# (def-format-test format.\:^.\:{.10
	#   "~:{~1,1:^~A~}" ('(()(1)(2 3))) "")
	# 
	ok def-format-test(
		Q{~:{~1,1:^~A~}}, ( [ [ ], [ 1 ] , [ 2, 3 ] ] ), Q{}
	), Q[format.:^.:{.10];
	)

	#`(
	# (def-format-test format.\:^.\:{.11
	#   "~:{~0,1:^~A~}" ('((1)(2 3))) "12")
	# 
	ok def-format-test(
		Q{~:{~0,1:^~A~}}, ( [ [ 1 ], [ 2, 3 ] ] ), Q{12}
	), Q[format.:^.:{.11];
	)

	#`(
	# (def-format-test format.\:^.\:{.12
	#   "~:{~v,1:^~A~}" ('((2 3)(4 5 6)(0 2)(1 7)(9 10))) "352")
	# 
	ok def-format-test(
		Q{~:{~v,1:^~A~}},
		( [ [ 2, 3 ], [ 4, 5, 6 ], [ 0, 2 ], [ 1, 7 ], [ 9, 10 ] ] ),
		Q{352}
	), Q[format.:^.:{.12];
	)

	#`(
	# (def-format-test format.\:^.\:{.13
	#   "~:{~1,V:^~A~}" ('((2 3)(4 5 6)(0 2)(1 7)(9 10))) "352")
	# 
	ok def-format-test(
		Q{~:{~1,V:^~A~}},
		( [ [ 2, 3 ], [ 4, 5, 6 ], [ 0, 2 ], [ 1, 7 ], [ 9, 10 ] ] ),
		Q{352}
	), Q[format.:^.:{.13];
	)

	#`(
	# (def-format-test format.\:^.\:{.14
	#   "~:{~V,v:^~A~}" ('((0 1 2) (1 0 3) (4 4) () (5 6 7))) "23")
	# 
	ok def-format-test(
		Q{~:{~V,v:^~A~}},
		( [ [ 0, 1, 2 ], [ 1, 0, 3 ], [ 4, 4 ], [ ], [ 5, 6, 7 ] ] ),
		Q{352}
	), Q[format.:^.:{.14];
	)

	#`(
	# (def-format-test format.\:^.\:{.15
	#   "~:{~#,1:^~A~}" ('((2 3 4)(4 5)(0)(1 7)(9 10)))
	#   "24")
	# 
	ok def-format-test(
		Q{~:{~#,1:^~A~}},
		( [ [ 2, 3, 4 ], [ 4, 5 ], [ 0 ], [ 1, 7 ], [ 9, 10 ] ] ),
		Q{24}
	), Q[format.:^.:{.15];
	)

	#`(
	# (def-format-test format.\:^.\:{.16
	#   "~:{~1,#:^~A~}" ('((2 3 4)(4 5)(0)(1 7)(9 10)))
	#   "24")
	# 
	ok def-format-test(
		Q{~:{~1,#:^~A~}},
		( [ [ 2, 3, 4 ], [ 4, 5 ], [ 0 ], [ 1, 7 ], [ 9, 10 ] ] ),
		Q{24}
	), Q[format.:^.:{.16];
	)

	#`(
	# (def-format-test format.\:^.\:{.17
	#   "~:{~#,#:^~A~}" ('(nil))
	#   "")
	# 
	ok def-format-test(
		Q{~:{~#,#:^~A~}}, ( [ Nil ] ), Q{24}
	), Q[format.:^.:{.17];
	)

	#`(
	# (def-format-test format.\:^.\:{.18
	#   "~:{~#,#:^~A~}" ('((1)))
	#   "")
	# 
	ok def-format-test(
		Q{~:{~#,#:^~A~}}, ( [ [ 1 ] ] ), Q{}
	), Q[format.:^.:{.18];
	)

	#`(
	# (def-format-test format.\:^.\:{.19
	#   "~:{~#,v:^~A~}" ('((1 2)(3 4)(2 5 6)(1)(2)))
	#   "245")
	# 
	ok def-format-test(
		Q{~:{~#,v:^~A~}},
		( [ [ 1, 2 ], [ 3, 4 ], [ 2, 5, 6 ], [ 1 ], [ 2 ] ] ),
		Q{24}
	), Q[format.:^.:{.19];
	)

	#`(
	# (def-format-test format.\:^.\:{.20
	#   "~:{~V,#:^~A~}" ('((0 2)(1 3 4)(1 3)()(0 7)))
	#   "23")
	# 
	ok def-format-test(
		Q{~:{~V,#:^~A~}},
		( [ [ 0, 2 ], [ 1, 3, 4 ], [ 1, 3 ], [ ], [ 0, 7 ] ] ),
		Q{23}
	), Q[format.:^.:{.20];
	)

	#`(
	# (def-format-test format.\:^.\:{.21
	#   "~:{~'X,'Y:^~A~}" ('((1)(2)))
	#   "12")
	# 
	ok def-format-test(
		Q{~:{~'X,'Y:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{23}
	), Q[format.:^.:{.21];
	)

	#`(
	# (def-format-test format.\:^.\:{.22
	#   "~:{~'X,'X:^~A~}" ('((1)(2)))
	#   "")
	# 
	ok def-format-test(
		Q{~:{~'X,'X:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{}
	), Q[format.:^.:{.22];
	)

	#`(
	# (def-format-test  format.\:^.\:{.23
	#   "~:{~1,2,3:^~A~}" ('((1)(2)))
	#   "")
	# 
	ok def-format-test(
		Q{~:{~1,2,3:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{}
	), Q[format.:^.:{.23];
	)

	#`(
	# (def-format-test  format.\:^.\:{.24
	#   "~:{~1,2,1:^~A~}" ('((1)(2)))
	#   "12")
	# 
	ok def-format-test(
		Q{~:{~1,2,2:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{12}
	), Q[format.:^.:{.24];
	)

	#`(
	# (def-format-test  format.\:^.\:{.25
	#   "~:{~2,1,3:^~A~}" ('((1)(2)))
	#   "12")
	# 
	ok def-format-test(
		Q{~:{~2,1,3:^~A~}}, ( [ [ 1 ], [ 2 ] ] ), Q{12}
	), Q[format.:^.:{.25];
	)

	#`(
	# (def-format-test  format.\:^.\:{.26
	#   "~:{~1,1,v:^~A~}" ('((0 4)(nil 1)(0 5)))
	#   "4")
	# 
	ok def-format-test(
		Q{~:{~1,1,v:^~A~}},
		( [ [ 0, 4 ], [ Nil, 1 ], [ 0, 5 ] ] ),
		Q{4}
	), Q[format.:^.:{.26];
	)

	#`(
	# (def-format-test  format.\:^.\:{.27
	#   "~:{~v,2,2:^~A~}" ('((3 4)(1 1)(4 5)))
	#   "4")
	# 
	ok def-format-test(
		Q{~:{~v,2,2:^~A~}}, ( [ [ 3, 4 ], [ 1, 1 ], [ 4, 5 ] ] ), Q{4}
	), Q[format.:^.:{.27];
	)

	#`(
	# (def-format-test  format.\:^.\:{.28
	#   "~:{~1,v,2:^~A~}" ('((0 2)(3 4)(1 1)(4 5)))
	#   "24")
	# 
	ok def-format-test(
		Q{~:{~1,v,2:^~A~}},
		( [ [ 0, 2 ], [ 3, 4 ], [ 1, 1 ], [ 4, 5 ] ] ),
		Q{24}
	), Q[format.:^.:{.28];
	)

	#`(
	# (def-format-test  format.\:^.\:{.29
	#   "~:{~V,v,3:^~A~}" ('((1 4 0)(2 1 7)(4 4 8 0)(1 2 6)(9 8 0)))
	#   "078")
	# 
	ok def-format-test(
		Q{~:{~V,v,3:^~A~}},
		( [ [ 1, 4, 0 ], [ 2, 1, 7 ], [ 4, 4, 8, 0 ],
		    [ 1, 2, 6 ], [ 9, 8, 0 ] ] ),
		Q{078}
	), Q[format.:^.:{.29];
	)

	#`(
	# (def-format-test  format.\:^.\:{.30
	#   "~:{~v,2,v:^~A~}" ('((1 1 0)(3 2 5)(2 1 6)(1 2 0)(10 11 13)))
	#   "056")
	# 
	ok def-format-test(
		Q{~:{~v,2,v:^~A~}},
		( [ [ 1, 1, 0 ], [ 3, 2, 5 ], [ 2, 1, 6 ],
		    [ 1, 2, 0 ], [ 10, 11, 13 ] ] ),
		Q{056}
	), Q[format.:^.:{.30];
	)

	#`(
	# (def-format-test  format.\:^.\:{.31
	#   "~:{~2,V,v:^~A~}" ('((1 1 0)(3 2 5)(2 1 6)(10 11 13)(0 1 0)))
	#   "056")
	# 
	ok def-format-test(
		Q{~:{~2,V,v:^~A~}},
		( [ [ 1, 1, 0 ], [ 3, 2, 5 ], [ 2, 1, 6 ],
		    [ 10, 11, 13 ], [ 0, 1, 0 ] ] ),
		Q{056}
	), Q[format.:^.:{.31];
	)

	#`(
	# (def-format-test  format.\:^.\:{.32
	#   "~:{~v,v,V:^~A~}" ('((1 2 1 0)(2 1 1 4)(2 3 1 6)(1 2 3)(0 1 0 8)))
	#   "046")
	# 
	ok def-format-test(
		Q{~:{~v,v,V:^~A~}},
		( [ [ 1, 2, 1, 0 ], [ 2, 1, 1, 4 ], [ 2, 3, 1, 6 ],
		    [ 1, 2, 3 ], [ 0, 1, 0, 8 ] ] ),
		Q{046}
	), Q[format.:^.:{.32];
	)

	#`(
	# (def-format-test  format.\:^.\:{.33
	#   "~:{~#,2,2:^~A~}" ('((1 2 3)(2 X X)(0 A B C D)(4 5)(5 7 8 9)))
	#   "120")
	# 
	ok def-format-test(
		Q{~:{~#,2,2:^~A~}},
		( [ [ 1, 2, 3 ], [ 2, Q{X}, Q{X} ],
		    [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		    [ 4, 5 ], [ 5, 7, 8, 9 ] ] ),
		Q{120}
	), Q[format.:^.:{.33];
	)
#`(
	# (def-format-test  format.\:^.\:{.34
	#   "~:{~2,#,3:^~A~}" ('((1)(2 3 4 5)(3 4)(4 5 6 7 8)()))
	#   "12")
	# 
	ok def-format-test(
		Q{~:{~2,#,3:^~A~}},
		( [ [ 1 ], [ 2, 3, 4, 5 ], [ 3, 4 ], [ 4, 5, 6, 7, 8 ], [ ] ] ),
		Q{12}
	), Q[format.:^.:{.34];
	)

	#`(
	# (def-format-test  format.\:^.\:{.35
	#   "~:{~1,3,#:^~A~}" ('((1)(2 3)(3 4)(4 5 6)(5)))
	#   "123")
	# 
	ok def-format-test(
		Q{~:{~1,3,#:^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5, 6 ], [ 5 ] ] ),
		Q{123}
	), Q[format.:^.:{.35];
	)

	#`(
	# (def-format-test  format.\:^.\:{.36
	#   "~:{~#,#,2:^~A~}" ('((1 2 3)(2 X X)(0 A B C D)(4 5)(5 7 8 9)))
	#   "120")
	# 
	ok def-format-test(
		Q{~:{~#,#,2:^~A~}},
		( [ [ 1, 2, 3 ], [ 2, Q{X}, Q{X} ],
		    [ 1, Q{A}, Q{B}, Q{C}, Q{D} ],
		    [ 4, 5 ], [ 5, 7, 8, 9 ] ] ),
		Q{120}
	), Q[format.:^.:{.36];
	)

	#`(
	# (def-format-test  format.\:^.\:{.37
	#   "~:{~3,#,#:^~A~}" ('((1)(2 3)(3 4)(4 5 6)(5)))
	#   "123")
	# 
	ok def-format-test(
		Q{~:{~3,#,#:^~A~}},
		( [ [ 1 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5, 6 ], [ 5 ] ] ),
		Q{123}
	), Q[format.:^.:{.37];
	)

	#`(
	# (def-format-test  format.\:^.\:{.38
	#   "~:{~#,2,#:^~A~}" ('((1 2 3)(2)(0 A B C D)(4 5)(5 7 8 9)))
	#   "120")
	#  
	ok def-format-test(
		Q{~:{~#,2,#:^~A~}},
		( [ [ 1, 2, 3 ], [ 2 ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		    [ 4, 5 ], [ 5, 7, 8, 9 ] ] ),
		Q{120}
	), Q[format.:^.:{.38];
	)

	#`(
	# (def-format-test  format.\:^.\:{.39
	#   "~:{~#,#,#:^~A~}" ('((1 2 3)(2)(0 A B C D)(4 5)(5 7 8 9)))
	#   "")
	# 
	ok def-format-test(
		Q{~:{~#,#,#:^~A~}},
		( [ [ 1, 2, 3 ], [ 2 ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		    [ 4, 5 ], [ 5, 7, 8, 9 ] ] ),
		Q{}
	), Q[format.:^.:{.38];
	)
}, Q[arguments];

subtest {
	#`(
	# (def-format-test format.\:^.\:@{.1
	#   "~:@{~:^~A~}" nil "")
	# 
	ok def-format-test( Q{~:@{~:^~A~}}, ( ), Q{} ), Q[format.:^.:@{.1];
	)

	#`(
	# (def-format-test format.\:^.\:@{.2
	#   "(~:@{~A~:^,~})" ('(1) '(2) '(3))
	#   "(1,2,3)")
	# 
	ok def-format-test(
		Q{(~:@{~A~:^,~})}, ( [ 1 ], [ 2 ], [ 3 ] ), Q{(1,2,3)}
	), Q[format.:^.:@{.2];
	)

	#`(
	# (def-format-test format.\:^.\:@{.3
	#   "~:@{~:^~A~}" ('(1) '(2) '(3) '(4))
	#   "123")
	#
	ok def-format-test(
		Q{(~:@{~:^~A~})}, ( [ 1 ], [ 2 ], [ 3 ], [ 4 ] ), Q{123}
	), Q[format.:^.:@{.3];
	)

	#`(
	# (def-format-test format.\:^.\:@{.4
	#   "~:@{~0:^~A~}" ('(1) '(2))
	#   "" 1)
	# 
	ok def-format-test(
		Q{~:@{~0:^~A~}}, ( [ 1 ], [ 2 ] ), Q{}, 1
	), Q[format.:^.:@{.4];
	)

	#`(
	# (def-format-test format.\:^.\:@{.5
	#   "~:@{~1:^~A~}" ('(1) '(2))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~1:^~A~}}, ( [ 1 ], [ 2 ] ), Q{12}
	), Q[format.:^.:@{.5];
	)

	#`(
	# (def-format-test format.\:^.\:@{.6
	#   "~:@{~'X:^~A~}" ('(1) '(2))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~'X:^~A~}}, ( [ 1 ], [ 2 ] ), Q{12}
	), Q[format.:^.:@{.6];
	)

	#`(
	# (def-format-test format.\:^.\:@{.7
	#   "~:@{~v:^~A~}" ('(1 8) '(2 3 4) '(3 1) '(0) '(6 7) '(8 10))
	#   "831" 2)
	# 
	ok def-format-test(
		Q{~:@{~v:^~A~}},
		( [ 1, 8 ], [ 2, 3, 4 ], [ 3, 1 ], [ 0 ], [ 6, 7 ], [ 8, 10 ] ),
		Q{831},
		2
	), Q[format.:^.:@{.7];
	)

	#`(
	# (def-format-test format.\:^.\:@{.8
	#   "~:@{~V:^~A~}" ('(#\X 1) '(0 2))
	#   "1")
	# 
	ok def-format-test(
		Q{~:@{~V:^~A~}}, ( [ Q{X}, 1 ], [ 0, 2 ] ), Q{1}
	), Q[format.:^.:@{.8];
	)

	#`(
	# (def-format-test format.\:^.\:@{.9
	#   "~:@{~#:^~A~}" ('(1) '(2) '(3 4) '(5 6 7) () '(8 9 10))
	#   "1235" 1)
	# 
	ok def-format-test(
		Q{~:@{~#:^~A~}},
		( [ 1 ], [ 2 ], [ 3, 4 ], [ 5, 6, 7 ], [ ], [ 8, 9, 10 ] ),
		Q{1235},
		1
	), Q[format.:^.:@{.9];
	)

	# (def-format-test format.\:^.\:@{.10
	#   "~:@{~1,1:^~A~}" (() '(1) '(2 3))
	#   "" 2)
	# 
	ok def-format-test(
		Q{~:@{~1,1:^~A~}}, ( [ ], [ 1 ], [ 2, 3 ] ), Q{}, 2
	), Q[format.:^.:@{.10];

	#`(
	# (def-format-test format.\:^.\:@{.11
	#   "~:@{~0,1:^~A~}" ('(1) '(2 3))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~0,1:^~A~}}, ( [ 1 ], [ 2, 3 ] ), Q{12}
	), Q[format.:^.:@{.11];
	)

	#`(
	# (def-format-test format.\:^.\:@{.12
	#   "~:@{~v,1:^~A~}" ('(2 3) '(4 5 6) '(0 2) '(1 7) '(9 10))
	#   "352" 1)
	# 
	ok def-format-test(
		Q{~:@{~v,1:^~A~}},
		( [ 2, 3 ], [ 4, 5, 6 ], [ 0, 2 ], [ 1, 7 ], [ 9, 10 ] ),
		Q{12},
		1
	), Q[format.:^.:@{.12];
	)

	#`(
	# (def-format-test format.\:^.\:@{.13
	#   "~:@{~1,V:^~A~}" ('(2 3) '(4 5 6) '(0 2) '(1 7) '(9 10))
	#   "352" 1)
	# 
	ok def-format-test(
		Q{~:@{~1,V:^~A~}},
		( [ 2, 3 ], [ 4, 5, 6 ], [ 0, 2 ], [ 1, 7 ], [ 9, 10 ] ),
		Q{352},
		1
	), Q[format.:^.:@{.13];
	)

	#`(
	# (def-format-test format.\:^.\:@{.14
	#   "~:@{~V,v:^~A~}" ('(0 1 2) '(1 0 3) '(4 4) () '(5 6 7))
	#   "23" 2)
	# 
	ok def-format-test(
		Q{~:@{~V,v:^~A~} },
		( [ 0, 1, 2 ], [ 1, 0, 3 ], [ 4, 4 ], [ ], [ 5, 6, 7 ] ),
		Q{352},
		2
	), Q[format.:^.:@{.14];
	)

	#`(
	# (def-format-test format.\:^.\:@{.15
	#   "~:@{~#,1:^~A~}" ('(2 3 4) '(4 5) '(0) '(1 7) '(9 10))
	#   "24" 2)
	# 
	ok def-format-test(
		Q{~:@{~#,1:^~A~}},
		( [ 2, 3, 4 ], [ 4, 5 ], [ 0 ], [ 1, 7 ], [ 9, 10 ] ),
		Q{24},
		2
	), Q[format.:^.:@{.15];
	)

	#`(
	# (def-format-test format.\:^.\:@{.16
	#   "~:@{~1,#:^~A~}" ('(2 3 4) '(4 5) '(0) '(1 7) '(9 10))
	#   "24" 2)
	# 
	ok def-format-test(
		Q{~:@{~1,#:^~A~}},
		( [ 2, 3, 4 ], [ 4, 5 ], [ 0 ], [ 1, 7 ], [ 9, 10 ] ),
		Q{24},
		2
	), Q[format.:^.:@{.16];
	)

	#`(
	# (def-format-test format.\:^.\:@{.17
	#   "~:@{~#,#:^~A~}" (nil)
	#   "")
	# 
	ok def-format-test(
		Q{~:@{~#,#:^~A~}}, ( Nil ), Q{}
	), Q[format.:^.:@{.17];
	)

	#`(
	# (def-format-test format.\:^.\:@{.18
	#   "~:@{~#,#:^~A~}" ('(1))
	#   "")
	# 
	ok def-format-test(
		Q{~:@{~#,#:^~A~}}, ( [ 1 ] ), Q{}
	), Q[format.:^.:@{.18];
	)

	#`(
	# (def-format-test format.\:^.\:@{.19
	#   "~:@{~#,v:^~A~}" ('(1 2) '(3 4) '(2 5 6) '(1) '(2))
	#   "245" 1)
	# 
	ok def-format-test(
		Q{~:@{~#,v:^~A~}},
		( [ 1, 2 ], [ 3, 4 ], [ 2, 5, 6 ], [ 1 ], [ 2 ] ),
		Q{245},
		1
	), Q[format.:^.:@{.19];
	)

	#`(
	# (def-format-test format.\:^.\:@{.20
	#   "~:@{~V,#:^~A~}" ('(0 2) '(1 3 4) '(1 3) () '(0 7))
	#   "23" 2)
	# 
	ok def-format-test(
		Q{~:@{~V,#:^~A~}},
		( [ 0, 2 ], [ 1, 3, 4 ], [ 1, 3 ], [ ], [ 0, 7 ] ),
		Q{23},
		2
	), Q[format.:^.:@{.20];
	)

	#`(
	# (def-format-test format.\:^.\:@{.21
	#   "~:@{~'X,'Y:^~A~}" ('(1) '(2))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~'X,'Y:^~A~}}, ( [ 1 ], [ 2 ] ), Q{12}
	), Q[format.:^.:@{.21];
	)

	#`(
	# (def-format-test format.\:^.\:@{.22
	#   "~:@{~'X,'X:^~A~}" ('(1) '(2))
	#   "" 1)
	# 
	ok def-format-test(
		Q{~:@{~'X,'X:^~A~}}, ( [ 1 ], [ 2 ] ), Q{}, 1
	), Q[format.:^.:@{.22];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.23
	#   "~:@{~1,2,3:^~A~}" ('(1) '(2))
	#   "" 1)
	# 
	ok def-format-test(
		Q{~:@{~1,2,3:^~A~}}, ( [ 1 ], [ 2 ] ), Q{}, 1
	), Q[format.:^.:@{.23];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.24
	#   "~:@{~1,2,1:^~A~}" ('(1) '(2))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~1,2,3:^~A~}}, ( [ 1 ], [ 2 ] ), Q{}
	), Q[format.:^.:@{.24];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.25
	#   "~:@{~2,1,3:^~A~}" ('(1) '(2))
	#   "12")
	# 
	ok def-format-test(
		Q{~:@{~2,1,3:^~A~}}, ( [ 1 ], [ 2 ] ), Q{12}
	), Q[format.:^.:@{.25];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.26
	#   "~:@{~1,1,v:^~A~}" ('(0 4) '(nil 1) '(0 5))
	#   "4" 1)
	# 
	ok def-format-test(
		Q{~:@{~1,1,v:^~A~}},
		( [ 0, 4 ], [ Nil, 1 ], [ 0, 5 ] ),
		Q{4},
		1
	), Q[format.:^.:@{.26];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.27
	#   "~:@{~v,2,2:^~A~}" ('(3 4) '(1 1) '(4 5))
	#   "4" 1)
	# 
	ok def-format-test(
		Q{~:@{~v,2,2:^~A~}}, ( [ 3, 4 ], [ 1, 1 ], [ 4, 5 ] ), Q{4}, 1
	), Q[format.:^.:@{.27];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.28
	#   "~:@{~1,v,2:^~A~}" ('(0 2) '(3 4) '(1 1) '(4 5))
	#   "24" 1)
	# 
	ok def-format-test(
		Q{~:@{~1,v,2:^~A~}},
		( [ 0, 2 ], [ 3, 4 ], [ 1, 1 ], [ 4, 5 ] ),
		Q{24},
		1
	), Q[format.:^.:@{.28];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.29
	#   "~:@{~V,v,3:^~A~}" ('(1 4 0) '(2 1 7) '(4 4 8 0) '(1 2 6) '(9 8 0))
	#   "078" 1)
	# 
	ok def-format-test(
		Q{~:@{~V,v,3:^~A~}},
		( [ 1, 4, 0 ], [ 2, 1, 7 ], [ 4, 4, 8, 0 ],
		  [ 1, 2, 6 ], [ 9, 8, 0 ] ),
		Q{078},
		1
	), Q[format.:^.:@{.29];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.30
	#   "~:@{~v,2,v:^~A~}" ('(1 1 0) '(3 2 5) '(2 1 6) '(1 2 0) '(10 11 13))
	#   "056" 1)
	# 
	ok def-format-test(
		Q{~:@{~v,2,v:^~A~}},
		( [ 1, 1, 0 ], [ 3, 2, 5 ], [ 2, 1, 6 ],
		  [ 1, 2, 0 ], [ 10, 11, 13 ] ),
		Q{056},
		1
	), Q[format.:^.:@{.30];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.31
	#   "~:@{~2,V,v:^~A~}" ('(1 1 0) '(3 2 5) '(2 1 6) '(10 11 13) '(0 1 0))
	#   "056" 1)
	# 
	ok def-format-test(
		Q{~:@{~2,V,v:^~A~}},
		( [ 1, 1, 0 ], [ 3, 2, 5 ], [ 2, 1, 6 ],
		  [ 10, 11, 13 ], [ 0, 1, 0 ] ),
		Q{056},
		1
	), Q[format.:^.:@{.31];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.32
	#   "~:@{~v,v,V:^~A~}" ('(1 2 1 0) '(2 1 1 4) '(2 3 1 6) '(1 2 3) '(0 1 0 8))
	#   "046" 1)
	# 
	ok def-format-test(
		Q{~:@{~v,v,V:^~A~}},
		( [ 1, 2, 1, 0 ], [ 2, 1, 1, 4 ], [ 2, 3, 1, 6 ],
		  [ 1, 2, 3 ], [ 0, 1, 0, 8 ] ),
		Q{046},
		1
	), Q[format.:^.:@{.32];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.33
	#   "~:@{~#,2,2:^~A~}" ('(1 2 3) '(2 X X) '(0 A B C D) '(4 5) '(5 7 8 9))
	#   "120" 1)
	# 
	ok def-format-test(
		Q{~:@{~#,2,2:^~A~}},
		( [ 1, 2, 3 ], [ 2, Q{X}, Q{X} ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		  [ 4, 5 ], [ 5, 7, 8, 9 ] ),
		Q{120},
		1
	), Q[format.:^.:@{.33];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.34
	#   "~:@{~2,#,3:^~A~}" ('(1) '(2 3 4 5) '(3 4) '(4 5 6 7 8) ())
	#   "12" 2)
	# 
	ok def-format-test(
		Q{~:@{~2,#,3:^~A~}},
		( [ 1 ], [ 2, 3, 4, 5 ], [ 3, 4 ], [ 4, 5, 6, 7, 8 ], [ ] ),
		Q{12},
		2
	), Q[format.:^.:@{.34];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.35
	#   "~:@{~1,3,#:^~A~}" ('(1) '(2 3) '(3 4) '(4 5 6) '(5))
	#   "123" 1)
	# 
	ok def-format-test(
		Q{~:@{~1,3,#:^~A~}},
		( [ 1 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5, 6 ], [ 5 ] ),
		Q{123},
		1
	), Q[format.:^.:@{.35];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.36
	#   "~:@{~#,#,2:^~A~}" ('(1 2 3) '(2 X X) '(0 A B C D) '(4 5) '(5 7 8 9))
	#   "120" 1)
	# 
	ok def-format-test(
		Q{~:@{~#,#,2:^~A~}},
		( [ 1, 2, 3 ], [ 2, Q{X}, Q{X} ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		  [ 4, 5 ], [ 5, 7, 8, 9 ] ),
		Q{120},
		1
	), Q[format.:^.:@{.36];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.37
	#   "~:@{~3,#,#:^~A~}" ('(1) '(2 3) '(3 4) '(4 5 6) '(5))
	#   "123" 1)
	# 
	ok def-format-test(
		Q{~:@{~3,#,#:^~A~}},
		( [ 1 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5, 6 ], [ 5 ] ),
		Q{123},
		1
	), Q[format.:^.:@{.37];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.38
	#   "~:@{~#,2,#:^~A~}" ('(1 2 3) '(2) '(0 A B C D) '(4 5) '(5 7 8 9))
	#   "120" 1)
	# 
	ok def-format-test(
		Q{~:@{~#,2,#:^~A~}},
		( [ 1, 2, 3 ], [ 2 ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		  [ 4, 5 ], [ 5, 7, 8, 9 ] ),
		Q{120},
		1
	), Q[format.:^.:@{.38];
	)

	#`(
	# (def-format-test  format.\:^.\:@{.39
	#   "~:@{~#,#,#:^~A~}" ('(1 2 3) '(2) '(0 A B C D) '(4 5) '(5 7 8 9))
	#   "" 4)
	# 
	ok def-format-test(
		Q{~:@{~#,#,#:^~A~}},
		( [ 1, 2, 3 ], [ 2 ], [ 0, Q{A}, Q{B}, Q{C}, Q{D} ],
		  [ 4, 5 ], [ 5, 7, 8, 9 ] ),
		Q{},
		4
	), Q[format.:^.:@{.38];
	)
}, Q[~:^ in ~:@{];

# ;;; ~^ inside ~?, ~@?
# 
#`(
# (def-format-test format.^.?.1
#   "~AY~?X~A" (1 "~A~0^~A" '(2 4) 3)
#   "1Y2X3")
# 
ok def-format-test(
	Q{~AY~?X~A}, ( 1, Q{~A~0^~A}, [ 2, 4 ], 3 ), Q{1V2X3}
), Q[format.:^.?.1];
)

#`(
# (def-format-test format.^.?.2
#   "~AY~?X~A" (1 "~A~^~A" '(2) 3)
#   "1Y2X3")
# 
ok def-format-test(
	Q{~AY~?X~A}, ( 1, Q{~A~^~A}, [ 2 ], 3 ), Q{1V2X3}
), Q[format.:^.?.2];
)

#`(
# (def-format-test format.^.?.3
#   "~AY~?X~A" (1 "~A~^~A~^~A" '(2 4) 3)
#   "1Y24X3")
# 
ok def-format-test(
	Q{~AY~?X~A}, ( 1, Q{~A~^~A~^~A}, [ 2, 4 ], 3 ), Q{1V24X3}
), Q[format.:^.?.3];
)

#`(
# (def-format-test format.^.?.4
#   "~A~?X~A" (1 "~{~^~A~}~AY~A" '((2 3) 4 5) 6)
#   "1234Y5X6")
# 
ok def-format-test(
	Q{~AY~?X~A}, ( 1, Q{~A~^~A~^~A}, [ 2, 4 ], 3 ), Q{1V24X3}
), Q[format.:^.?.3];
)

#`(
# (def-format-test format.^.@?.1
#   "~AY~@?X~A" (1 "~A~0^~A" 2 3 4)
#   "1Y2X3" 1)
# 
ok def-format-test(
	Q{~AY~@?X~A}, ( 1, Q{~A~0^~A}, 2, 3, 4 ), Q{1V2X3}, 1
), Q[format.:^.@?.1];
)

#`(
# (def-format-test format.^.@?.2
#   "~A~@?X~A" (1 "~{~^~A~}~AY~A" '(2 3) 4 5 6)
#   "1234Y5X6")
# 
ok def-format-test(
	Q{~A~@?X~A}, ( 1, Q{~{~^~A~}~AY~A} [ 2, 3 ], 4, 5, 6 ), Q{1234Y5X6}
), Q[format.:^.@?.2];
)

subtest {
	1;
	#`(
	# (def-format-test format.^.\[.1
	#   "~{~[X~;Y~;Z~;~0^~]~}" ('(0 1 2 3 4))
	#   "XYZ")
	# 
	ok def-format-test(
		Q{~{~[X~;Y~;Z~;~0^~]~}}, ( [ 0, 1, 2, 3, 4 ] ), Q{XYZ}
	), Q{format.^.[.1};
	)

	#`(
	# (def-format-test format.^.\[.2
	#   "~{~[X~;Y~;Z~:;~0^~]~}" ('(1 0 2 8 9 10 0))
	#   "YXZ")
	# 
	ok def-format-test(
		Q{~{~[X~;Y~;Z~;;~0^~]~}}, ( [ 1, 0, 2, 8, 9, 10, 0 ] ), Q{YXZ}
	), Q{format.^.[.2};
	)

	#`(
	# (def-format-test format.^.\[.3
	#   "~{~[X~;Y~0^NO~;Z~;~^~]~}" ('(0 1 2 3 4))
	#   "XY")
	# 
	ok def-format-test(
		Q{~{~[X~;Y~0^NO~;Z~;~^~]~}}, ( [ 0, 1, 2, 3, 4 ] ), Q{XY}
	), Q{format.^.[.3};
	)
}, Q{~^ in ~[};

subtest {
	1;
	#`[
	# (def-format-test format.^.\(.1
	#   "~{~(~C~C~0^~C~)W~}" ('(#\X #\Y #\Z #\A))
	#   "xy")
	# 
	ok def-format-test(
		Q{~{~(~C~C~0^~C~)W~}}, ( [ Q{X}, Q{Y}, Q{Z}, Q{A} ] ), Q{xy}
	), Q[format.^.(.1];
	]

	#`[
	# (def-format-test format.^.\:\(.1
	#   "~{~:(~C~C~0^~C~)U~}" ('(#\X #\Y #\Z #\A))
	#   "Xy")
	# 
	ok def-format-test(
		Q{~{~:(~C~C~0^~C~)U~}}, ( [ Q{X}, Q{Y}, Q{Z}, Q{A} ] ), Q{Xy}
	), Q[format.^.:(.1];
	]

	#`[
	# (def-format-test format.^.@\(.1
	#   "~{~@(~CA ~Cb ~0^~C~)V~}" ('(#\x #\y #\Z #\A))
	#   "Xa yb ")
	# 
	ok def-format-test(
		Q{~{~@(~CA ~Cb ~0^~C~)V~}},
		( [ Q{x}, Q{y}, Q{Z}, Q{A} ] ),
		Q{Xa yb}
	), Q[format.^.@(.1];
	]

	#`[
	# (def-format-test format.^.@\:\(.1
	#   "~{~@:(~CA ~Cb ~0^~C~)W~}" ('(#\x #\Y #\Z #\A))
	#   "XA YB ")
	# 
	ok def-format-test(
		Q{~{~@:(~CA ~Cb ~0^~C~)W~}},
		( [ Q{x}, Q{Y}, Q{Z}, Q{A} ] ),
		Q{XA YB}
	), Q[format.^.@:(.1];
	]
}, Q{~^ in ~(};

done-testing;

# vim: ft=perl6
