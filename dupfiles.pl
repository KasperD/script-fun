#!/usr/bin/perl

# use strict;
use warnings;
use POSIX;
use Digest::MD5;

## Setting Initial Directory to check

$result_file = "/tmp/dupfiles.dump";

my $Location;

if (!$ARGV[0]) 
{
	print "Location to Search? ";
	$Location = <STDIN>; 
	chomp($Location);	
}
else 
{	
	$Location = $ARGV[0];	
}

# copy/paste from
# http://rinkeshbansal.blogspot.com/2012/08/calculating-md5dum-of-all-files-in.html
sub md5sum_dir($)
{
    my $path = shift;

    opendir (DIR, $path) or die "Unable to open $path: $!";
    my @files = map {$path . '/' . $_ }grep { !/^\.{1,2}$/ } readdir (DIR);
    closedir (DIR);

    foreach my $file (@files) 
    {
        if (-d $file) 
        {
            &md5sum_dir ($file);
        } 
        else 
        { 
            my $md = &md5sum($file); # you can find this subroutine in my other blogs
            open (FO, ">>$result_file") or die ("Error :: Couldn't open file ($result_file) for writing\n");
            print FO "$file\t$md\n";
            close(FO);
        }
    }
}

# copy/paste from
# http://rinkeshbansal.blogspot.in/2012/08/calculating-md5sum-of-given-file.html
sub md5sum($)
{
    my $file = shift;
    die "Error::File ($file) does not exist!!!"    if (not -e $file);
    open (FO, $file);
    binmode(FO);
    my $md5 = Digest::MD5->new;
    while (<>) 
    {
        $md5->add($_);
    }
    close(FO);
    my $checksum = $md5->hexdigest;
    print "$checksum $file\n";
    return $checksum;
}

&md5sum_dir($Location);