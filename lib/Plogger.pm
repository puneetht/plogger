#!/usr/bin/perl
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
	"Welcome to Plogger";
};
