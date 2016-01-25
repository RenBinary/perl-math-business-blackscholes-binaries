#!/usr/bin/perl

use lib qw{ lib t/lib };
use Test::More tests => 25;
use Test::NoWarnings;
use Math::Business::BlackScholes::Binaries;
use Roundnear;

# These are compared with Bloomberg standards...
# except EXPIRYMISS and UPORDOWN which are computed as opposing
# EXPIRYRANGE and RANGE respectively.

my @test_cases = (
    {
        S           => 100,
        d_arith     => 20,
        t           => 1/(365*24), #One day
        r_q         => 0,
        mu          => 0,
        sigma       => 0.3172,
        prob        => 0.964803092987753,
    },
);

foreach my $test_case (@test_cases) {

    my $actual_prob = Math::Business::BlackScholes::Binaries::candle_in(
        $test_case->{S},
        $test_case->{d_arith},
        $test_case->{t},
        $test_case->{r_q},
        $test_case->{mu},
        $test_case->{sigma}
    );

    is( $actual_prob, $test_case->{prob});
}

