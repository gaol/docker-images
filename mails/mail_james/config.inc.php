<?php
/* Local configuration for Roundcube Webmail */
// ----------------------------------
// SQL DATABASE
// ----------------------------------
// Database connection string (DSN) for read+write operations
// Format (compatible with PEAR MDB2): db_provider://user:password@host/database
// Currently supported db_providers: mysql, pgsql, sqlite, mssql, sqlsrv, oracle
// For examples see http://pear.php.net/manual/en/package.database.mdb2.intro-dsn.php
// NOTE: for SQLite use absolute path (Linux): 'sqlite:////full/path/to/sqlite.db?mode=0646'
//       or (Windows): 'sqlite:///C:/full/path/to/sqlite.db'

$config = array();

$config['db_dsnw'] = 'sqlite:////mnt/sqlite/roundcube/roundcube.sqlite?mode=0646';

$config['timezone'] = 'Asia/Shanghai';
date_default_timezone_set("Asia/Shanghai");

// ----------------------------------
// IMAP
// ----------------------------------
// The IMAP host chosen to perform the log-in.
// Leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// To use SSL/TLS connection, enter hostname with prefix ssl:// or tls://
// Supported replacement variables:
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %s - domain name after the '@' from e-mail address provided at login screen
// For example %n = mail.domain.tld, %t = domain.tld
// WARNING: After hostname change update of mail_host column in users table is
//          required to match old user data records with the new host.
$config['default_host'] = '127.0.0.1';
$config['default_port'] = 993;

$config['imap_debug'] = true;

$config['imap_conn_options'] = array(
  'ssl' => array(
     'verify_peer'  => true,
     'verify_peer_name' => false,
     'allow_self_signed' => true,
   ),
  );

// ----------------------------------
// SMTP
// ----------------------------------
// SMTP server host (for sending mails).
// Enter hostname with prefix tls:// to use STARTTLS, or use
// prefix ssl:// to use the deprecated SSL over SMTP (aka SMTPS)
// Supported replacement variables:
// %h - user's IMAP hostname
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %z - IMAP domain (IMAP hostname without the first part)
// For example %n = mail.domain.tld, %t = domain.tld
$config['smtp_server'] = '127.0.0.1';
$config['smtp_port'] = 465;
$config['smtp_debug'] = true;

$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['smtp_conn_options'] = array(
  'ssl' => array(
     'verify_peer'  => true,
     'verify_peer_name' => false,
     'allow_self_signed' => true,
   ),
  );

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
$config['support_url'] = '';

// this key is used to encrypt the users imap password which is stored
// in the session record (and the client cookie if remember password is enabled).
// please provide a string of exactly 24 chars.
// YOUR KEY MUST BE DIFFERENT THAN THE SAMPLE VALUE FOR SECURITY REASONS
//$config['des_key'] = 'rcmail-!24ByteDESkey*Str';
$config['des_key'] = 'Vertx-Mail-Client-testP!';

// Name your service. This is displayed on the login screen and in the window title
$config['product_name'] = 'Roundcube Webmail - for Test';
// ----------------------------------
// PLUGINS
// ----------------------------------
// List of active plugins (in plugins/ directory)
$config['plugins'] = array(
    'archive',
    'zipdownload',
);

// skin name: folder from skins/
$config['skin'] = 'elastic';

#$config['drafts_mbox'] = 'INBOX.Drafts';
#$config['junk_mbox'] = 'INBOX.Junk';
#$config['sent_mbox'] = 'INBOX.Sent';
#$config['trash_mbox'] = 'INBOX.Trash';
#$config['create_default_folders'] = true;
