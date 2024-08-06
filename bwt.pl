#!/usr/bin/perl
use strict;
use warnings;

# Function to perform Burrows-Wheeler Transform
sub bwt {
    my $text = shift;
    $text .= "\$"; # Append a customized end-of-string character "$"

    # Generate all rotations of the text
    my @rotations;
    for my $i (0..length($text)-1) {
        push @rotations, substr($text, $i) . substr($text, 0, $i);
    }

    # Sort the rotations lexicographically
    my @sorted_rotations = sort @rotations;

    # Extract the last column from the sorted rotations
    my $bwt_result = join('', map { substr($_, -1) } @sorted_rotations);

    return $bwt_result;
}

# Example usage
my $input_string = "ATCGCTCGACG";
my $bwt_result = bwt($input_string);
print "BWT of '$input_string' is: $bwt_result\n";
