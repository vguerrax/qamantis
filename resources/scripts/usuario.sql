delete from mantis_user_table where username = '#username#';

insert into mantis_user_table (username, realname, email, password, enabled, access_level, cookie_string, last_visit, date_created)
values ('#username#', '#realname#', '#email#', md5('#password#'), 1, #access_level#, TO_BASE64(CONCAT('TESTEAUTOMATIZADOMANTIS', UNIX_TIMESTAMP())), UNIX_TIMESTAMP(), UNIX_TIMESTAMP());