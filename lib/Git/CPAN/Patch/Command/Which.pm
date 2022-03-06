package Git::CPAN::Patch::Command::Which;
our $AUTHORITY = 'cpan:YANICK';
#ABSTRACT: reports the repository's module
$Git::CPAN::Patch::Command::Which::VERSION = '2.5.0';
use 5.10.0;

use strict;
use warnings;

use MooseX::App::Command;

with 'Git::CPAN::Patch::Role::Git';
with 'Git::CPAN::Patch::Role::Patch';

sub run { say $_[0]->module_name }

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Git::CPAN::Patch::Command::Which - reports the repository's module

=head1 VERSION

version 2.5.0

=head1 SYNOPSIS

    % git-cpan which

=head1 DESCRIPTION

This command prints the name of the module tracked in C<cpan/master>.

=head1 AUTHORS

Yanick Champoux C<< <yanick@cpan.org> >>

Yuval Kogman C<< <nothingmuch@woobling.org> >>

=head1 SEE ALSO

L<Git::CPAN::Patch>

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2022, 2021, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
