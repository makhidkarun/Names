#!/usr/bin/env perl
# getName.pl
# WORK IN PROGRESS!
#

use DBI;
use strict;

my $driver    = "SQLite";
my $database  = "data/names.db";
my $dsn       = "DBI:$driver:dbname=$database";
my $userid    = "";
my $password  = "";
my $dbh       = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;

my $stmt_last     = qq(SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1;);

my $gender = int(rand(2)) ? "F" : "M";
my $stmt_first = '';
if ($gender eq "M" ) {
  $stmt_first  = qq(SELECT * from humaniti_male_first ORDER BY RANDOM() LIMIT 1;);
} else {
  $stmt_first  = qq(SELECT * from humaniti_female_first ORDER BY RANDOM() LIMIT 1;);
}

my $sth_f     = $dbh->prepare( $stmt_first );
my $rv_f      = $sth_f->execute() or die $DBI::errstr;
my $sth_l     = $dbh->prepare( $stmt_last );
my $rv_l      = $sth_l->execute() or die $DBI::errstr;

if($rv_l < 0) {
  print $DBI::errstr;
}

my $first_name  = '';
my $last_name   = '';

while(my @row_f = $sth_f->fetchrow_array()) {
$first_name = $row_f[0];
}

while(my @row_l = $sth_l->fetchrow_array()) {
$last_name = $row_l[0];
}

$dbh->disconnect();
print $first_name ." ". $last_name ." [". $gender ."] \n";

