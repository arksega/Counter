<?php
$dbconn = pg_connect("host=localhost dbname=counter user=counter password=counter")
    or die('No se pudo conectar' . pg_last_error());

//Performing SQL query
$query = 'SELECT * FROM users';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

    
