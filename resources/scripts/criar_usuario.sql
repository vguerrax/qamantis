insert into mantis_user_table (username, realname, email, password, enabled, access_level, cookie_string, last_visit, date_created)
values (%s, %s, %s, md5(%s), 1, %s, TO_BASE64(CONCAT('TESTEAUTOMATIZADOMANTIS', UNIX_TIMESTAMP())), UNIX_TIMESTAMP(), UNIX_TIMESTAMP())