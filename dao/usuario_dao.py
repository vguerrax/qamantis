from commons.file_utils import conteudo_arquivo
from commons.connect import Connect

class UsuarioDAO(Connect):

    def deletar_usuario(self, usuario):
        query = conteudo_arquivo(self.scripts_path + 'deletar_usuario.sql')
        self.execute_statement(query, (usuario))

    def criar_usuario(self, usuario, senha, nivel_acesso, nome = '', email = ''):
        query = conteudo_arquivo(self.scripts_path + 'criar_usuario.sql')
        if email == '':
            email = usuario + "@email.com.br"
        if nome == '':
            nome = usuario
        params = (usuario, nome, email, senha, nivel_acesso)
        self.execute_statement(query, params)
        