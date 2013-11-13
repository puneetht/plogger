#!/usr/bin/perl
BEGIN {
	push @INC, "lib" ;
}
#make the script a webapp
use Dancer;	
use Plogger;
Dancer->dance;
