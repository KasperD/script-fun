#!/usr/bin/perl -w

use utf8;
use POSIX;
use strict;

my $Alertfile = '/root/scripts/mmsc_log.txt';
my @MDNlist = `cat $Alertfile | grep "+" | cut -d";" -f2 | cut -c4-14 | sort | uniq`;

my $MDNlist;
my $MDNcount;
my @MDNcount;

foreach $MDNlist(@MDNlist)
{
	chomp($MDNlist);
	$MDNcount = `cat $Alertfile | grep $MDNlist | wc -l`;
	chomp($MDNcount);
	push(@MDNcount, $MDNcount);
}

my %Clients;

@Clients{@MDNlist} = @MDNcount;

my $Clientkey;
my $Clientvalue;
my %Clientalarm;
my @Clientalarm;

while (($Clientkey, $Clientvalue) = each %Clients)
{
	if($Clientvalue >= "25")
	{
		push(@Clientalarm, $Clientkey ."\n");
	}
}


my $BODY = "The following mailboxes need to be investigated as they generating excessive email alerts.\n" ;
my $RECIPIENT = "netsysadmin\@revol.com";
my $FROM = "donald.kasper\@revol.com";
my $SUBJECT = "Full Mailbox Alerts";
my $CMD = qq(echo "$BODY \n @Clientalarm" | mailx -s "$SUBJECT" "$RECIPIENT");
exec($CMD);
