#!/usr/bin/env perl

use strict;
use warnings;
use experimental qw{ say signatures state fc };

use Carp;

my ( $file1, $file2 ) = @ARGV;

my @list1 = get_file($file1);
my @list2 = get_file($file2);

my %done;
my @first_only;
my @last_only;

my @list  = ( @list1, @list2 );
my %list1 = map { $_ => 1 } @list1;
my %list2 = map { $_ => 1 } @list2;

for my $entry (@list) {
    my $in_first  = $list1{$entry} ? 1 : 0;
    my $in_second = $list2{$entry} ? 1 : 0;
    if ( $in_first  && !$in_second ) { 
        push @first_only, $entry; 
        }
    if ( !$in_first && $in_second )  { 
        push @last_only,  $entry; 
        }
}

say scalar @first_only;
say scalar @last_only;
write_file( 'by_hand_first_only', \@first_only );
write_file( 'by_hand_last_only',  \@last_only );

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
