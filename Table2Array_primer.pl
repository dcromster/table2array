#!/usr/bin/perl

use strict;
use Data::Dumper;

use Table2Array;

my $test_table = "<table><thead><tr><th class='head cell1'>head cell1</th><th class='class head cell1' id='id head cell1'>head cell2</th></tr></thead><tbody><tr><td class='class row1 cell1'>row1 cell1</td><td>row1 cell2</td><td class='class row1 cell3'>row1 cell3</td></tr><tr><td class='class row2 cell1'>row2 cell1</td><td class='class row2 cell2' another_data = \"adata\">row2 cell2</td></tr></tbody>";

# getting data from cells
my $table = new Table2Array('string' => $test_table);
my $cells_data = $table->get_data();
print Dumper($cells_data);

#getting data from cells properties
my $table = new Table2Array('string' => $test_table);
my $tags_data = $table->get_info();
print Dumper($tags_data);

# Getting all data from table
my $table = new Table2Array('string' => $test_table);
my $tags_data = $table->get_all();
print Dumper($tags_data);
