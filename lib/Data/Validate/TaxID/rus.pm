package Data::Validate::TaxID::rus;

use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

use base qw(Data::Validate::TaxID::base);

sub check {
    my ( $self, $tax_id ) = @_;

    if( looks_like_number( $tax_id ) ) {
        if( _is_individual( $tax_id ) ) {
            return _validate_individual_inn( $tax_id );
        }
        elsif( _is_company( $tax_id ) ) {
            return _validate_company_inn( $tax_id );
        }
    }

    return;
}

sub is_company {
    my ( $self, $tax_id ) = @_;

    return $self -> validate_inn( $tax_id ) ? _is_company( $tax_id ) : undef;
}

sub is_individual {
    my ( $self, $tax_id ) = @_;

    return $self -> validate_inn( $tax_id ) ? _is_individual( $tax_id ) : undef;
}

sub _is_individual {
    my ( $tax_id ) = @_;

    return length $tax_id == 12;
}

sub _is_company {
    my ( $tax_id ) = @_;

    return length $tax_id  == 10;
}

sub _validate_company_inn {
    my ( $tax_id ) = @_;

    my @weights = qw(2 4 10 3 5 9 4 6 8 0);

    my $result = 0;

    for( my $i = 0; $i < 10; $i++ ) {
        $result += substr( $tax_id, $i, 1 ) * $weights[ $i ];
    }

    return substr( $tax_id, 9, 1 ) == ($result % 11 % 10);
}

sub _validate_individual_inn {
    my ( $tax_id ) = @_;

    my @weights = qw(3 7 2 4 10 3 5 9 4 6 8 0);

    my $result_11 = 0;
    for( my $i = 0; $i < 11; $i++ ) {
        $result_11 += substr( $tax_id, $i, 1 ) * $weights[ $i + 1 ];
    }

    my $result_12 = 0;
    for( my $i = 0;  $i < 12; $i++ ) {
        $result_12 += substr( $tax_id, $i, 1 ) * $weights[ $i ];
    }

    return
        substr( $tax_id, 10, 1 ) == ( $result_11 % 11 % 10 ) &&
        substr( $tax_id, 11, 1 ) == ( $result_12 % 11 % 10 );
}

1;

__END__