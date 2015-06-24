#!/usr/bin/env perl


my $id = $ARGV[0];

my $dir = "./music/";


my $file = $dir . $id . ".mp3";

if (-f $file){
    &play_file($id);
}else{
    # file not found
    return -1;
}


sub play_file {
    system("pkill mpg123");
    system("mpg123 -q '$file' &") == 0 or die "failed to player $?";
}

0;
