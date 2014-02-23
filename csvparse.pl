#!/usr/bin/env perl

use strict;
use utf8;
use Text::CSV_XS qw( csv );
use Data::Dumper;

binmode(STDOUT, ":utf8");

my $lc = 0;
open my $file, "<", $ARGV[0] or die($!);
$lc++ while <$file>;
close $file;

my $csv = Text::CSV_XS->new ({ binary => 1, auto_diag => 1 });
open my $fh, "<", $ARGV[0] or die $ARGV[0].": $!";
#while (my @row = $csv->getline ($fh)) {
    #print $row[0][0];
    #print "\n";
    #}

my $counter = 1;

my $c_name = 0;
my $c_CUI  = 0;
my $c_nameCUI = 0;

my @row = $csv->getline ($fh);
while (my @row = $csv->getline ($fh)) {

    my $output = "";
    my $date   = undef;

    $output .= '{ "index" : { "_id" : '.$counter.' } }';
    $output .= "\n";
    $output .= '{ "Castigator" : "'                     . $row[0][0]  . '", ';
    $output .= '"CastigatorCUI" : "'                    . $row[0][1]  . '", ';
    $output .= '"CastigatorTara" : "'                   . $row[0][2]  . '", ';
    $output .= '"CastigatorLocalitate" : "'             . $row[0][3]  . '", ';
    $output .= '"CastigatorAdresa" : "'                 . $row[0][4]  . '", ';
    $output .= '"Tip" : "'                              . $row[0][5]  . '", ';
    $output .= '"TipContract" : "'                      . $row[0][6]  . '", ';
    $output .= '"TipProcedura" : "'                     . $row[0][7]  . '", ';
    $output .= '"AutoritateContractanta" : "'           . $row[0][8]  . '", ';
    $output .= '"AutoritateContractantaCUI" : "'        . $row[0][9]  . '", ';
    $output .= '"TipAC" : "'                            . $row[0][10] . '", ';
    $output .= '"TipActivitateAC" : "'                  . $row[0][11] . '", ';
    $output .= '"NumarAnuntAtribuire" : "'              . $row[0][12] . '", ';
       $date = '"DataAnuntAtribuire" : "' . $row[0][13] . '", ';
       $date =~ s/([0-9]) ([0-9])/$1T$2/g;
    $output .= '"TipIncheiereContract" : "'             . $row[0][14] . '", ';
    $output .= '"TipCriteriiAtribuire" : "'             . $row[0][15] . '", ';
    $output .= '"CuLicitatieElectronica" : "'           . $row[0][16] . '", ';
    $output .= '"NumarOfertePrimite" : "'               . $row[0][17] . '", ';
    $output .= '"Subcontractat" : "'                    . $row[0][18] . '", ';
    $output .= '"NumarContract" : "'                    . $row[0][19] . '", ';
       $date = '"DataContract" : "' . $row[0][20] . '", ';
       $date =~ s/([0-9]) ([0-9])/$1T$2/g;
    $output .= $date;
    $output .= '"TitluContract" : "'                    . $row[0][21] . '", ';
    $output .= '"Valoare" : "'                          . $row[0][22] . '", ';
    $output .= '"Moneda" : "'                           . $row[0][23] . '", ';
    $output .= '"ValoareRON" : "'                       . $row[0][24] . '", ';
    $output .= '"ValoareEUR" : "'                       . $row[0][25] . '", ';
    $output .= '"CPVCodeID" : "'                        . $row[0][26] . '", ';
    $output .= '"CPVCode" : "'                          . $row[0][27] . '", ';
    $output .= '"NumarAnuntParticipare" : "'            . $row[0][28] . '", ';
       $date = '"DataAnuntParticipare" : "' . $row[0][29] . '", ';
       $date =~ s/([0-9]) ([0-9])/$1T$2/g;
    $output .= '"ValoareEstimataParticipare" : "'       . $row[0][30] . '", ';
    $output .= '"MonedaValoareEstimataParticipare" : "' . $row[0][31] . '", ';
    $output .= '"FonduriComunitare" : "'                . $row[0][32] . '", ';
    $output .= '"TipFinantare" : "'                     . $row[0][33] . '", ';
    $output .= '"TipLegislatieID" : "'                  . $row[0][34] . '", ';
    $output .= '"FondEuropean" : "'                     . $row[0][35] . '", ';
    $output .= '"ContractPeriodic" : "'                 . $row[0][36] . '", ';
    $output .= '"DepoziteGarantii" : "'                 . $row[0][37] . '", ';
    $output .= '"ModalitatiFinantare" : "'              . $row[0][38] . '"}';
    $output .= "\n";

    $counter++;

    my $valid = 1;

    if ($row[0][0] == '') { $c_name++; }
    if ($row[0][1] == '') { $c_CUI++; }
    if ($row[0][1] == '' && $row[0][0] == '') { $c_nameCUI++; $valid = 0; }

    print $output unless $valid == 0;

    die ("\nEOF reached!\nNo name: $c_name\nNo CUI: $c_CUI\nNo name && CUI (removed): $c_nameCUI\n") 
        unless $counter <= $lc;
}


close $fh or die "file.csv: $!";
