import mysql.connector
from commons.config import get_connect_configs

class Connect():

    conn = None
    scripts_path = 'resources/scripts/'

    def get_connection(self):
        connect_configs = get_connect_configs()
        self.conn = mysql.connector.connect(user=connect_configs['user'],
                                    password=connect_configs['password'],
                                    host=connect_configs['host'],
                                    port=connect_configs['port'],
                                    database=connect_configs['db'])

    def execute_query(self, query, params = ()):
        resultados = []
        if self.conn == None:
            self.get_connection()
        cursor = self.conn.cursor()
        cursor.execute(query, params)
        for r in cursor:
            resultados.append(r)
        cursor.close()
        return resultados

    def execute_statement(self, query, params = ()):
        if self.conn == None:
            self.get_connection()
        cursor = self.conn.cursor()
        cursor.execute(query, params)
        cursor.close()
        self.conn.commit()

    def close_connection(self):
        if self.conn != None:
            self.conn.close()