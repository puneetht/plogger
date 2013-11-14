package Plogger::Storage;
use Moose;


# @TODO: Figure out how to use the P:S:Git class here
# 		Convert to Moose::Plugin?
has _plugin => {
	is		=> 'ro',
	isa		=> 'Int',
	builder => '_fetch_storage_plugin',
	lazy	=> 1,
	handles => [ qw ( find show show_list ) ],
};

# @TODO: change builder into a plugin builder
sub _fetch_storage_plugin {
	my ($self) = @_;
	
	
	return 1;
	
}




1;
