package Plogger::Storage::Plugin::Git::Role::Config;

use Moose::Role;

use Carp qw ( croak );

use YAML;

has _config_hash	=> (
			is	=> 'ro',
			builder	=>	'_fetch_config_hash' ,
);

sub _fetch_config_hash {
	my $self = @_;
	
	my ($hashref) = Load( <<'YAML' ) ;
git_dir: /Users/matt/storage/git_repos
YAML


	return $hashref;
}

sub save_config {
	my ($self) = @_;
	
	#some code to save to a file
	return 1;
}

sub get_config {
	my ( $self,$conf_param ) = @_;
	
	$conf_param or 
		croak "$conf_param does not exist in the git config hash";
	
	exists($self->_config_hash->{$conf_param}) or
		croak "$conf_param does not exist in the git config hash";
	
	return $self->_config_hash->{$conf_param};
}

sub set_config {
	my ($self,$args) ;

	$args->{conf_param} or 
		croak "Please specify conf_param";

	$args->{value} or
		croak "Please specify new value";

	$self->_config_hash->{ $args->{conf_param} } = $args->{value};

	return 1;
}

1;

__END__

