package Table2Array;
=pod
    HTML table parser.
    v1 16072014
=cut

use strict;
use Data::Dumper;

sub new {
    my ($class, %self) = @_;
    bless \%self, $class;
    return \%self;
}

sub get_data($) {
    # returns data in cells
    my($self) = @_;
    my $string = $self->{'string'};

    my @table_array;
    my $row_counter = 0;

    $string =~ s/\n//igm;

    # Getting data inside tbody
    $string =~ m{<tbody>(.+)</tbody>}igm;
    $string = $1;

    my @rows = split(/<\/tr>/,$string);


    foreach my $row (@rows) {
        $row =~ s{<tr>}{}igm;
        my @rows = split(/<\/td>/,$row);
        my @table_array_tmp;

        foreach my $tmp (@rows) {

            # Splitting for cells
            my @cells = split(/<\/td>/, $tmp);
            my $value_counter = 0;
            my @rows_data;

            foreach my $cell (@cells) {
                $cell =~ s{<td.*>}{}igm;
                push (@rows_data, $cell);
                print STDERR "$cell\n";;
            };
            push (@table_array_tmp, \@rows_data);
        };
        push (@table_array, \@table_array_tmp);
    };
    return \@table_array;
}

sub get_info($) {
    my($self) = @_;
    my $string = $self->{'string'};

    # Getting data inside tbody
    $string =~ m{<tbody>(.+)</tbody>}igm;
    $string = $1;
    $string =~ s{<tr>}{}igm;

    # Splitting for strings
    my @tmps = split (/<\/tr>/, $string);

    my @result;

    foreach my $tmp (@tmps) {
        # Splitting for cells
        my @cells = split(/<\/td>/, $tmp);
        foreach my $tmp1 (@cells) {
            # Inside cell
            my %cell; # Cell prp result will be here
            $tmp1 =~ m{<td(.+)>}igm;
            my @cells_data = split(/['|"] /,$1);

            foreach my $cell_data (@cells_data) {
                # Inside cell prop
                my ($name, $value) = split(/=/, $cell_data);
                $value =~ s{['|"]}{}igm;
                $name =~ s{ }{}igm;
                $cell{$name} = $value;
            };

            push (@result, \%cell);
        };

    };
    use Data::Dumper;
    return \@result;
};

sub get_all() {
    # returns tags data and data in cells
    my($self) = @_;
    my $string = $self->{'string'};

    my %table_hash = (
        'data' => get_data($self),
        'info' => get_info($self)
    );
    return \%table_hash;
}

1;


__END__


=head NAME
Table2Array - HTML table parser

=head1 SYNOPSIS

use Table2Array;

my $html_table = 'html table code here';

my $table_data = Table2Array::get_data($html_table); # returns array ref to all data in cells of $html_table between <td> or <th> and </td> or </th>

my $table_tags = Table2Array::get_info($html_table); # return array ref to all tags info

my $table_all = Table2Array::get_all($html_table); #return all data from table.

=head1 DESCRIPTION

Table2Array simple HTML table parser which return a data in cells and cell properties.

=item
