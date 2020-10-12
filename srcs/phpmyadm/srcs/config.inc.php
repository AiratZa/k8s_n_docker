<?php
	$cfg['blowfish_secret'] = 'The hallway smelt of boiled cabbage and old rag mats.';

	$i=0;
	$i++;
	$cfg['Servers'][$i]['auth_type'] = 'cookie';

	$cfg['Servers'][$i]['host'] = 'mysql-service:3306';
	$cfg['Servers'][$i]['compress'] = false;
	$cfg['Servers'][$i]['AllowNoPassword'] = false;

	$cfg['UploadDir'] = '';
	$cfg['SaveDir'] = '';

	$cfg ['TempDir'] = '/var/www/phpmyadmin/tempdir';
?>