package Plogger::Storage::Git;

use Moose::Role;

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

1;

__END__

=head1 NAME

Plogger::Storage::Git

=head1 SYNOPSIS

with 'Plogger::Storage::Git'

=head1 DESCRIPTION

Git Plugin for Plogger Storage

=head1 METHODS

=head2 find

find the object that is being searched for

=head2 show

get the content for the object that has been found

=head2 show_list

show a list of objects that have been asked for

=cut


