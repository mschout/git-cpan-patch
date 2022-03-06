package Git::CPAN::Patch::Command::Squash;
our $AUTHORITY = 'cpan:YANICK';
#ABSTRACT: Combine multiple commits into one patch
$Git::CPAN::Patch::Command::Squash::VERSION = '2.5.0';
use 5.10.0;

use strict;
use warnings;

use Git::Repository;

use MooseX::App::Command;

with 'Git::CPAN::Patch::Role::Git';

use experimental qw/
    signatures
    postderef
/;

has first_arg => (
    is => 'ro',
    isa => 'Str',
    required => 0,
);

has branch => (
    is => 'ro',
    isa => 'Str',
    lazy => 1,
    default => sub ($self) {
        $self->first_arg || 'patch';
    },
);

sub run ($self) {
    my $head = $self->git_run("rev-parse", "--verify", "HEAD");

    say for $self->git_run("checkout", "-b", $self->branch, "cpan/master");

    say for $self->git_run("merge", "--squash", $head);

    say "";

    say "Changes squashed onto working directory, commit and run git-cpan send_patch";
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Git::CPAN::Patch::Command::Squash - Combine multiple commits into one patch

=head1 VERSION

version 2.5.0

=head1 SYNOPSIS

    % git-cpan squash temp_submit_branch

    % git commit -m "This is my message"

    % git-cpan send-patch --compose

    # delete the branch now that we're done
    % git checkout master
    % git branch -D temp_submit_branch

=head1 DESCRIPTION

This command creates a new branch from C<cpan/master> runs
C<git merge --squash> against your head revision. This stages all the files for
the branch and allows you to create a combined commit in order to send a single
patch easily.

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2022, 2021, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
