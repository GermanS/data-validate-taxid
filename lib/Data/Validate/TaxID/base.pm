package Data::Validate::TaxID::base;

use strict;
use warnings;

use Carp qw(croak);

sub new {
    my ( $class ) = @_;

    my $self = bless {}, $class;

    return $self;
}

sub check {
    croak "Override in child";
}

1;

__END__