Table2Array
=================

HTML &lt;table> parser with a simple result output.

With this Perl module You can easy parse table and get the result suitable for understanding.

What You get:
-------------
* Array of arrays with data between td's;
* Array of hashes with data inside <td> for 'get_info' method;
* Hash of hashes with results of 'get_info' and 'get_data' methods.


How to use #1:
--------------

    use Table2Array;

    my $html_table = 'html table code here';

    my $table_data = Table2Array::get_data($html_table); # returns array ref to all data in cells of $html_table between <td> or <th> and </td> or </th>

    my $table_tags = Table2Array::get_info($html_table); # return array ref to all tags info

    my $table_all = Table2Array::get_all($html_table); #return all data from table.


How to use #2:
--------------

    use Table2Array;

    my $test_table = "<table><thead><tr><th class='head cell1'>head cell1</th><th class='class head cell1' id='id head cell1'>head cell2</th></tr></thead><tbody><tr><td class='class row1 cell1'>row1 cell1</td><td>row1 cell2</td><td class='class row1 cell3'>row1 cell3</td></tr><tr><td class='class row2 cell1'>row2 cell1</td><td class='class row2 cell2' another_data = \"adata\">row2 cell1</td></tr></tbody>";

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

Contact:
--------

Feel free to contact with me:
* twitter: @dcromster
* e-mail: dcromster@gmail.com
