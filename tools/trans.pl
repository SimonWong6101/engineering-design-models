#!/gicl/projs/bin/perl -w
use File::Find;
if (@ARGV <1){
  print "Usage:$0 <startdir>\n";
  exit;
}
#$acisenv = '/gicl/projs4/ACIS/acis_environ';
$startdir = $ARGV[0];
find(\&wanted,$startdir);

sub wanted{
#    $steptrans ="Sat2Step";
#    $igestrans ="Sat2Iges";
    $vrmltrans ="/usr/remote/data5/repository/tools/Sat2Vrml.high";


    if ( -f $File::Find::name && ($_=~ /\.sat$/) && ($_ !~ /\.features\.sat$/)){
	$infile = $File::Find::name;

	#STEP
#	$stepfile1 = $_;
#	$stepfile2 = $_;
#	substr($stepfile1,-3,3) = 'stp';
#	substr($stepfile2,-3,3) = 'step';
#	opendir(THISDIR, ".");
#	@filelist = grep !/^\.\.?$/, readdir(THISDIR);
#	if(!(grep {$_ eq $stepfile1 || $_ eq $stepfile2} @filelist)){ #if feature file DNE
#	    $outfile = $infile;
#	    substr($outfile,-3,3) = 'stp';
#	    system "$steptrans $infile $outfile";
#	}
#
#	#IGES
#	$igesfile1 = $_;
#	$igesfile2 = $_;
#	substr($igesfile1,-3,3) = 'igs';
#	substr($igesfile2,-3,3) = 'iges';
#	opendir(THISDIR, ".");
#	@filelist = grep !/^\.\.?$/, readdir(THISDIR);
#	if(!(grep {$_ eq $igesfile1 || $_ eq $igesfile2} @filelist)){ #if feature file DNE
#	    $outfile = $infile;
#	    substr($outfile,-3,3) = 'igs';
#	    system "$igestrans $infile $outfile";
#	}

	#VRML
	$vrmlfile = $_;
	substr($vrmlfile,-3,3) = 'wrl';
	opendir(THISDIR, ".");
	@filelist = grep !/^\.\.?$/, readdir(THISDIR);
	if(!(grep {$_ eq $vrmlfile} @filelist)){ #if feature file DNE
	    $outfile = $infile;
	    substr($outfile,-3,3) = 'wrl';
	    print "$vrmltrans $infile $outfile\n";
	    system "$vrmltrans $infile $outfile";
	}
    }
}
