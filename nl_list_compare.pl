#!/usr/bin/env perl

use strict;
use warnings;
use experimental qw{ say signatures state fc };

use Carp;
use List::Compare;

my ( $file1, $file2 ) = @ARGV;

my @list1 = get_file($file1);
my @list2 = get_file($file2);

my $lc         = List::Compare->new( \@list1, \@list2 );
my @first_only = $lc->get_unique;
my @last_only  = $lc->get_complement;

write_file( 'lc_first_only', \@first_only );
write_file( 'lc_last_only',  \@last_only );

sub write_file( $file, $array ) {
    open my $fh, '>', $file;
    say $fh join "\n", $array->@*;
}

sub get_file($file) {
    croak "No File entered" unless defined $file && length $file;
    if ( -f $file && open my $fh, '<', $file ) {
        my @output;
        while (<$fh>) {
            chomp;
            push @output, $_;
        }
        return @output;
    }
    else {
        croak qq{File "$file" doesn't exist};
    }
}
