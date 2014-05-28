#!/usr/bin/perl

# Donald R. Kasper <donald.kasper@revol.com>
# Script is used to create a new logfile of full mailboxes on the MMSC

use utf8;
use POSIX;

my $logfile = '/mmsc/revol/MMSC/MMSC/log/recv_server.log';
my $Alertfile = '/root/scripts/mmsc_log.txt';
# my $Span = POSIX::strftime( "%d-%m-%Y %H:%M:%S", localtime());
my $Alerts = `cat $logfile | grep 'full' | grep 'Message discarded' | awk '{print \$1, \$2 "; " \$8}'`;

open(LOG, ">$Alertfile");

foreach($Alerts)
{ print LOG "$_\n";}

close(Alerts);
