#!/usr/bin/env perl


my $id = $ARGV[0];

my $dir = "./";

my $file = $dir . $id . ".mp3";

if (-f $file){
    &play_file($id);
}else{
    die("file not found, $file, \n");
}


sub play_file {
    print system("pkill mpg123");
    print "now start playing \n";
    system("mpg123 -q $file &") == 0 or die "failed to player $?";
}

0;
