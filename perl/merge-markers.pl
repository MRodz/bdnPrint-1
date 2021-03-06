#!/usr/bin/env perl

use autodie;
use strict;
use utf8;
use warnings;

use File::Slurp;
use List::MoreUtils qw(uniq);

my $tmp1 = read_file("tmp/tmp-1.tex");

while ($tmp1 =~ /(\\high\{\/[a-i]{0,8}\}[^~ ]*\\high\{\/[a-i]{0,8}\})/g) {
  my $search = $1;
  my $replace = $1;

  my $wits1 = $1;
  my $wits2 = $1;

  $wits1 =~ s/.*?\\high\{\/([a-i]{0,8})\}.*/$1/;
  $wits2 =~ s/.*\\high\{\/([a-i]{0,8})\}.*?/$1/;

  my $wits = $wits1 . $wits2;
  my @wits = split("", $wits);
  @wits = sort(uniq(@wits));
  $wits = join("", @wits);

  $replace =~ s/\\high\{\/[a-i]{0,8}\}/\\high\{\/$wits\}/;
  $replace =~ s/(.*)\\high\{\/[a-i]{0,8}\}/$1\\hbox\{\}/;

  $search = quotemeta($search);
  $tmp1 =~ s/$search/$replace/;
}

while ($tmp1 =~ /(\\high\{[a-i]{0,8}\\bs\}[^~ ]*\\high\{[a-i]{0,8}\\bs\})/g) {
  my $search = $1;
  my $replace = $1;

  my $wits1 = $1;
  my $wits2 = $1;

  $wits1 =~ s/.*?\\high\{([a-i]{0,8})\\bs\}.*/$1/;
  $wits2 =~ s/.*\\high\{([a-i]{0,8})\\bs\}.*?/$1/;

  my $wits = $wits1 . $wits2;
  my @wits = split("", $wits);
  @wits = sort(uniq(@wits));
  $wits = join("", @wits);

  $replace =~ s/\\high\{[a-i]{0,8}\\bs\}/\\high\{$wits\\bs\}/;
  $replace =~ s/(.*)\\high\{[a-i]{0,8}\\bs\}/$1\\hbox\{\}/;

  $search = quotemeta($search);
  $tmp1 =~ s/$search/$replace/;
}

print $tmp1;
