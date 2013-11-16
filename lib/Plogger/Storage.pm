package Plogger::Storage;
use Moose;
use Carp qw (croak);

with 'Plogger::Storage::Git';



@TODO: Figure out how to make the module pluggable
has _plugin => {
	is		=> 'ro',
	isa		=> 'Int',
	builder	=> '_fetch_storage_plugin',
	lazy	=> 1,
};

sub _fetch_storage_plugin {
	my ($self) = @_;
	
	
	return 1;
	
}




1;
