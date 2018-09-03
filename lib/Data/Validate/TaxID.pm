package Data::Validate::TaxID;

use strict;
use warnings;

our $VERSION = '0.1';

use Module::Load;

sub new {
    my ( $class, %params ) = @_;

    return $class -> _load( $params{ 'country' } );
}

sub _load {
    my ( $class, $country ) = @_;

    my $package = sprintf "Data::Validate::TaxID::%s", lc( $country );

    load $package;

    return $package -> new();
}

1;

__END__