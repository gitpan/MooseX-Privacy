package MooseX::Privacy::Meta::Attribute::Private;
BEGIN {
  $MooseX::Privacy::Meta::Attribute::Private::VERSION = '0.02';
}

use Moose::Role;
use Carp qw/confess/;

with 'MooseX::Privacy::Meta::Attribute::Privacy' => {level => 'private'};

sub _check_private {
    my ($meta, $caller, $attr_name, $package_name) = @_;
    confess "Attribute " . $attr_name . " is private"
        unless $caller eq $package_name;
}

1;

__END__
=pod

=head1 NAME

MooseX::Privacy::Meta::Attribute::Private

=head1 VERSION

version 0.02

=head1 AUTHOR

  franck cuny <franck@lumberjaph.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by franck cuny.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

