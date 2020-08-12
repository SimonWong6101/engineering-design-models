#!/gicl/projs/bin/perl -w
use File::Find;
if (@ARGV != 2){
    print "usage: $0 <startdir> <logfile>\n";
    exit(1);
}
$startdir = $ARGV[0];
open(ERRLOG, ">$ARGV[1]");

find(\&heal, $startdir);

close(ERRLOG);


sub heal{
    $file = $File::Find::name;
    $cmd = '/gicl/data5/repository/tools/healer/autoheal';
    if($file =~ m/\.sat$/ && $file !~ m/features\.sat$/ && $file !~ m/f\.sat/
       && $File::Find::dir !~ m/THESIS/ && $file !~ m/hh\.sat$/){
	$healedfile = $file;
	substr($healedfile,-3,3) = 'hh.sat';
#	print "$cmd $file $healedfile\n";
	system("$cmd $file $healedfile");
	my $exit_value  = $? >> 8;
	if($exit_value != 0){
	    print ERRLOG $File::Find::name."\n";
	}
    }
}
