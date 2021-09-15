use Test2::V0;
use Test::Alien;
use Alien::PortMidi;

alien_ok 'Alien::PortMidi';
ffi_ok { symbols => [ 'Pt_Start', 'Pm_GetErrorText' ], api => 1 }, with_subtest {
    my($ffi) = @_;
    my $Pm_GetErrorText = $ffi->function( Pm_GetErrorText => [ 'int' ] => 'string' );
    is $Pm_GetErrorText->call(-10000), "PortMidi: `Host error'", 'Pm_GetErrorText works';
};

done_testing;
