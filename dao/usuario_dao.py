from commons.file_utils import conteudo_arquivo
from commons.connect import Connect
from dto.usuario_dto import UsuarioDTO

perfis_acesso = {
    'visualizador': 10,
    'relator': 25,
    'atualizador': 40,
    'desenvolvedor': 55,
    'gerente': 70,
    'administrador': 90
}

perfis_acesso_cod = {
    10: 'visualizador',
    25: 'relator',
    40: 'atualizador',
    55: 'desenvolvedor',
    70: 'gerente',
    90: 'administrador'
}

class UsuarioDAO(Connect):

    def deletar_usuario(self, usuario):
        query = conteudo_arquivo(self.scripts_path + 'deletar_usuario.sql')
        self.execute_statement(query, (usuario,))

    def deletar_usuario_email(self, email):
        query = conteudo_arquivo(self.scripts_path + 'deletar_usuario_email.sql')
        self.execute_statement(query, (email,))

    def criar_usuario(self, usuario, senha, nivel_acesso, nome = '', email = ''):
        query = conteudo_arquivo(self.scripts_path + 'criar_usuario.sql')
        if email == '':
            email = usuario + "@email.com.br"
        if nome == '':
            nome = usuario
        params = (usuario, nome, email, senha, perfis_acesso[nivel_acesso])
        self.execute_statement(query, params)
        
    def atualizar_senha(self, usuario, senha):
        query = conteudo_arquivo(self.scripts_path + 'atualizar_senha_usuario.sql')
        self.execute_statement(query, (usuario, senha))

    def obtem_usuario_por_login(self, login):
        usuarioDTO = UsuarioDTO()
        query = conteudo_arquivo(self.scripts_path + 'usuario.sql')
        resultados = self.execute_query(query, (login,))
        if resultados == []:
            return None
        resultado = resultados[0]
        usuarioDTO.usuario = resultado[0]
        usuarioDTO.nome = resultado[1]
        usuarioDTO.email = resultado[2]
        usuarioDTO.senha = resultado[3]
        usuarioDTO.nivel_acesso = perfis_acesso_cod[resultado[4]]
        return usuarioDTO

