use Test::More tests => 6;

use strict;
use warnings;

use_ok( 'Data::Validate::TaxID::rus' );

ok Data::Validate::TaxID::rus -> check( 7701833652 ),   'RUS. TaxID is valid ';
ok Data::Validate::TaxID::rus -> check( 673002363905 ), 'RUS. TaxID is valid ';

ok !Data::Validate::TaxID::rus -> check( 1234567 ),      'RUS. TaxID is invalid ';
ok !Data::Validate::TaxID::rus -> check( 504308599670 ), 'RUS. TaxID is invalid ';

ok !Data::Validate::TaxID::rus -> check( 'abcdefghij' ), 'RUS. TaxID is invalid ';

