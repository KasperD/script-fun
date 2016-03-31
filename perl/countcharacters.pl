#!/usr/bin/perl
#
# Example of how to count characters in Perl
# easy in python, not so much in Perl -_-

my $var1 = "pewpasdfasdasfasdfasfasdsadfadf";

print $var1, "\n";

my $varcnt = $var1 =~ s/(.)/$1/sg;

print $varcnt, "\n";
