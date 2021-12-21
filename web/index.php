<?php
echo file_put_contents('/mnt/gcs/demo.txt', date('c'));
$result = file_get_contents('/mnt/gcs/demo.txt');
var_dump($result);
var_dump(date('c'));
phpinfo();