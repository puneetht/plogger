package Plogger::Storage::Git;

use Moose;

use Git::Repository;

has git_repostory => {
	is		=> 'ro',
	isa		=> 'Git::Repository',
	builder	=> '_fetch_git_repository',
	lazy	=> 1,
};


sub _fetch_git_repository {
	my ($self) = @_;

	return Git::Repository->new( git_dir	=> $self->get_config('git_dir') );
	
}

sub save {
	my ($self) = @_;
	
#	@TODO: write code for save
	return 1;	
}

sub find {
#	@TODO: 	figure out the schema for how the we write to git.
#			How we find out what parametesr are going to be used to decide
}

sub show {
#	@TODO : figure what to show. and how to return.
#	@TODO : Might require a template.
}

sub show_list {
# @TODO: How to find the list the display
#	@TODO: what format to send it out in. 
}

