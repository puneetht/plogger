package Plogger::Storage::Plugin::Git;

use Moose::Role;

use Carp qw ( croak );
use Git::Repository;
use Git::Repository::Command;

with 'Plogger::Storage::Plugin::Git::Role::Config';


# @TODO : read book's repo called perl secrets on github.com

has _git_repository => (
	is		=> 'ro',
	isa		=> 'Git::Repository',
	builder	=> '_fetch_git_repository',
	lazy	=> 1,
);

sub _fetch_git_repository {
	my ($self) = @_;
	my $git_dir = $self->get_config('git_dir');

	croak "$git_dir does not exist"  unless ( -d "$git_dir");

	croak "Not  a git repo" unless ( -e "$git_dir/.git" );

	return Git::Repository->new({ git_dir		=> $self->get_config('git_dir'),
								   work_tree 	=> $self->get_config('work_tree'),
								   fatal		=> '!0',
							 	});
	
}

sub find {
	my ($self, $commit_sha)  = @_;
	my $git_cmd = Git::Repository::Command::->new( { log => $commit_sha });
	my @output = $self->_git_repository->run($git_cmd);
	return @output;
}


sub save {
	my ($self) = @_;
	
#	@TODO: write code for save
	return 1;	
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

Plogger::Storage::Plugin::Git

=head1 SYNOPSIS

use MooseX::Object::Pluggable;
# From Storage.pm

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


