use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Data::Validate::TaxID',
    AUTHOR        => q{German Semenkov <german.semenkov@gmail.com>},
    VERSION_FROM  => 'lib/Data/Validate/TaxID.pm',
    (
        ( defined( $ExtUtils::MakeMaker::VERSION ) && ( $ExtUtils::MakeMaker::VERSION >= 6.3002 ) )
        ? ('LICENSE'=> 'GPL')
        : ()
    ),
    PL_FILES       => {},
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        "Carp"         => "1.22",
        "Class::Load"  => "0.09",
        "Scalar::Util" => "0",
        "strict"       => "1.03",
        "warnings"     => "1.03",
    },
    TEST_REQUIRES => {
        "Test::More"      => "0.96",
        "Test::Exception" => "0.05"
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Data-Validate-TaxID-*' },
    META_MERGE      => {
        'meta-spec' => {
            version => 2
        },
        resources => {
            repository => {
                type => 'git',
                url  => 'git://github.com/GermanS/Data-Validate-TaxID.git',
                web  => 'https://github.com/GermanS/Data-Validate-TaxID',
            },
        },
    },
    MIN_PERL_VERSION => '5.6.2'  # Probably would work
);