Format::Lisp [![Tests on source](https://github.com/raku-community-modules/Format-Lisp/actions/workflows/test.yaml/badge.svg)](https://github.com/raku-community-modules/Format-Lisp/actions/workflows/test.yaml)
============

Implementing Common Lisp's (format) language for Perl 6 - Mostly because it's
an interesting challenge, but partially because it offers much more powerful
options than any `sprintf`-style formatter, including Python and Ruby's. 
Check out [source](lib/Format/Lisp.pm6) for the instructions, or [this 
reference manual](https://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node200.html).


Installation
============

* Using zef (a module management tool bundled with Rakudo Star):

```
    zef update && zef install Format::Lisp
```

## Testing

To run tests:

```
zef test .
```

# Synopsis

```raku
use Format::Lisp;

my $fl = Format::Lisp.new;
say $fl.format( "~~,,'~c:~c", ',', 'X' );
my $func = $fl.formatter( "x~ax" );

```

## Author

Originally: late Jeffrey Goff, DrForr on #perl6, https://github.com/drforr/

## License

Artistic License 2.0
