[![Actions Status](https://github.com/raku-community-modules/Format-Lisp/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Format-Lisp/actions) [![Actions Status](https://github.com/raku-community-modules/Format-Lisp/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Format-Lisp/actions) [![Actions Status](https://github.com/raku-community-modules/Format-Lisp/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Format-Lisp/actions)

NAME
====

Format::Lisp - Common Lisp formatter

SYNOPSIS
========

```raku
my $fl = Format::Lisp.new;
say $fl.format( "~~,,'~c:~c", ',', 'X' );
my $func = $fl.formatter( "x~ax" );
```

DESCRIPTION
===========

Implements the Common Lisp (format) function.

SPEC_DIFFERENCES
================

In Lisp, `~&` only adds a newline if there wasn't a newline on STDOUT previously.

METHODS
=======

format( Str $format-string, *@args )
------------------------------------

Given a format string and the appropriate (if any) args, return the formatted output

AUTHOR
======

Jeffrey Goff

COPYRIGHT AND LICENSE
=====================

Copyright 2017 Jeffrey Goff

Copyright 2020 - 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

