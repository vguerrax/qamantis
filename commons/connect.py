import mysql.connector
from commons.config import get_connect_configs

def teste():
    connect_configs = get_connect_configs()
    conn = mysql.connector.connect(user=connect_configs['user'],
                                password=connect_configs['password'],
                                host=connect_configs['host'],
                                port=connect_configs['port'],
                                database=connect_configs['db'])

    cursor = conn.cursor()

    cursor.execute("select id, username, password from mantis_user_table")

    #for (id, username, password) in cursor:
    #    print("{}, {}, {}".format(id, username, password))
    for r in cursor:
        print(r)

    conn.close()