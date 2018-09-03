use Test::More tests => 3;

use strict;
use warnings;

use Test::Exception;

use_ok( 'Data::Validate::TaxID' );

{
    my @available = qw(rus);

    foreach my $country ( @available ) {
        my $validator = Data::Validate::TaxID -> new( country => $country );
        isa_ok $validator, 'Data::Validate::TaxID::rus';
    }
}

{
    dies_ok { Data::Validate::TaxID -> new( country => 'Far_Far_Away' ) } 'Place of hopes, dreams, and spirit wilds.';
}
