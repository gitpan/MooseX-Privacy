package MooseX::Privacy::Meta::Attribute::Protected;

use Moose::Role;
use Carp qw/confess/;

sub _generate_accessor_method {
    my $self = shift;
    my $attr = $self->associated_attribute;

    my $package_name = $attr->associated_class->name;
    my $class = $attr->associated_class->name->meta;
    if ( $class->meta->has_attribute('local_protected_attributes') ) {
        $class->_push_protected_attribute( $attr->name );
    }

    return sub {
        my $self   = shift;
        my $caller = ( scalar caller() );
        confess "Attribute " . $attr->name . " is protected"
            unless $caller eq $self->meta->name
                or $caller->isa( $package_name );
        $attr->set_value( $self, $_[0] ) if scalar @_;
        $attr->get_value($self);
    };
}

1;

__END__

=head1 NAME

MooseX::Privacy::Meta::Attribute::Protected

=head1 SYNOPSIS

=head1 AUTHOR

franck cuny E<lt>franck@lumberjaph.netE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
