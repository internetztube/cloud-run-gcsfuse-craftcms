<?php
echo file_put_contents('../storage/demo.txt', date('c'));
$result = file_get_contents('../storage/demo.txt');
var_dump($result);
var_dump(date('c'));
phpinfo();