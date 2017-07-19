use v6;

use Test;
use lib 't/lib';
use Utils;
use Format::Lisp;

# We're just checking odds and ends here, so no need to rigorously check
# the object tree.

my $fl = Format::Lisp.new;

done-testing; # Because we're going to be adding tests quite often.

# vim: ft=perl6
