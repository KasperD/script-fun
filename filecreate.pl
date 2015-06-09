#!/usr/bin/perl -w

use strict;
use utf8;
use warnings;

my $counter = 0;
my $cname = 0;

while($counter<=1000)
{
    # Add one zero to a all numbers less then 10
    my $cname = $counter;
    if ($counter<10)
    {
        $cname = "0$cname";
    }
    # Add one zero to all numbers less then 100
    if ($counter<100)
    {
        $cname = "0$cname";
    }

    # Add one zero to all numbers less then 1000
    if ($counter<1000)
    {
        $cname = "0$cname";
    }

    my $file = "$cname - filename$cname.txt";

    unless(open FILE, ">".$file)
    {
        die "Unable to create $file";
    }

    print FILE "File creating for test\n";
    print FILE "File Name: $file\n";
    print FILE "date()";
    close FILE;

    $counter = $counter + 1;
    
    print "creating file ... $file\n";
}
