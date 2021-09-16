use strict;
use warnings;
package Alien::PortMidi;

# ABSTRACT: Install the Mixxx fork of PortMidi

our $VERSION = '0.00';

use parent qw/ Alien::Base /;

BEGIN {
    # On *nix we can set RPATH to $ORIGIN so portmidi can find porttime
    # in the same dir. Windows DLL search path does not offer similar.
    # Explicitly loading porttime before portmidi obviates the need to
    # worry about the Windows search path.
    if ( $^O eq 'MSWin32' ) {
        require DynaLoader;
        DynaLoader::dl_load_file($_)
          for grep { /porttime/ } __PACKAGE__->dynamic_libs;
    }
}

# ALIEN SYNOPSIS
# ALIEN DESCRIPTION
# ALIEN SEE ALSO

1;
