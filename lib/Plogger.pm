#!/usr/bin/perl
use Dancer ':syntax';

our $VERSION = '0.1';

use Plogger::Storage;

get '/' => sub {
	"Welcome to Plogger";
};


sub load_storage_plugin {
	my $storage = Plogger::Storage->new();
	$storage->load_plugin('Git');
}
