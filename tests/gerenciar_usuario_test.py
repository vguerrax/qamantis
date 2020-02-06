import pytest
from allure import title, description
from pages.login_page import LoginPage
from pages.criar_conta_page import CriarContaPage
from pages.erro_page import ErroPage
from pages.gerenciar.gerenciar_page import GerenciarPage
from pages.gerenciar.gerenciar_usuarios_page import GerenciarUsuariosPage
from pages.gerenciar.cadastro_usuario_page import CadastroUsuarioPage
from driver_factory.driver_factory import get_driver
from dao.usuario_dao import UsuarioDAO
from dto.usuario_dto import UsuarioDTO
from commons import read_csv
from base_test import setup_and_teardown, garantir_usuario_existe, garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe, logar_com_usuario

class TestCriarConta():
    webdriver = None
    loginPage = None
    criarContaPage = None

    @title('Criar conta através da tela de login')
    @description('Validar criação de usuários através da tela de login')
    def test_criar_conta_com_sucesso(self, setup_and_teardown,
        garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe):
        usuario = 'usuario_criar'
        email = 'usuario_criar@email.com'

        garantir_usuario_nao_existe(usuario)
        garantir_usuario_com_email_nao_existe(email)

        self.webdriver = setup_and_teardown['webdriver']
        
        self.loginPage = LoginPage(self.webdriver)
        self.loginPage.acessar_pagina_inicial()
        self.loginPage.clicar_em_criar_conta()

        self.criarContaPage = CriarContaPage(self.webdriver)
        self.criarContaPage.informar_usuario(usuario)
        self.criarContaPage.informar_email(email)
        self.criarContaPage.clicar_em_criar_conta()

        assert self.criarContaPage.retornar_mensagem() == 'Registro de conta processado'

        usuarioDAO = UsuarioDAO()
        usuarioDTO = usuarioDAO.obtem_usuario_por_login(usuario)

        assert usuarioDTO.usuario == usuario
        assert usuarioDTO.email == email

    @title('Criar conta através da tela de login com dados inválidos')
    @description('Validar criação de usuários através da tela de login informando dados inválidos')
    @pytest.mark.parametrize('usuario,email,mensagem', read_csv.get_csv_data_in_tuples('resources/test_data/criar_conta_dados_invalidos.csv', delimiter=';'))
    def test_criar_conta_com_dados_invalidos(self, setup_and_teardown,
        garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe,
        usuario, email, mensagem):
        if usuario != '':
            garantir_usuario_nao_existe(usuario)
        if email != '':
            garantir_usuario_com_email_nao_existe(email)
        
        self.webdriver = setup_and_teardown['webdriver']
        
        self.loginPage = LoginPage(self.webdriver)
        self.loginPage.acessar_pagina_inicial()
        self.loginPage.clicar_em_criar_conta()

        self.criarContaPage = CriarContaPage(self.webdriver)
        self.criarContaPage.informar_usuario(usuario)
        self.criarContaPage.informar_email(email)
        self.criarContaPage.clicar_em_criar_conta()

        erroPage = ErroPage(self.webdriver)
        assert mensagem in erroPage.retornar_erro()

class TestGerenciarUsuarios():

    webdriver = None
    cadastroUsuarioPage = None
    gerenciarPage = None
    gerenciarUsuariosPage = None
    
    @title('Criar conta de usuário')
    @description('Validar a criação de usuário através do menu "Gerenciar"')
    @pytest.mark.parametrize('usuario,nome,email,nivel_acesso', read_csv.get_csv_data_in_tuples('resources/test_data/cadastrar_usuario.csv', delimiter=';'))
    def test_cadastrar_usuario(self, setup_and_teardown,
        garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe, logar_com_usuario,
        usuario, nome, email, nivel_acesso):

        garantir_usuario_nao_existe(usuario)
        garantir_usuario_com_email_nao_existe(email)

        self.webdriver = setup_and_teardown['webdriver']
        logar_com_usuario(self.webdriver, 'admin', 'admin')

        self.gerenciarPage = GerenciarPage(self.webdriver)
        self.gerenciarPage.acessar_menu_gerenciar()
        self.gerenciarPage.acessar_aba_gerenciar_usuarios()

        self.gerenciarUsuariosPage = GerenciarUsuariosPage(self.webdriver)
        self.gerenciarUsuariosPage.cadastrar_novo_usuario()

        self.cadastroUsuarioPage = CadastroUsuarioPage(self.webdriver)
        self.cadastroUsuarioPage.informar_usuario(usuario)
        self.cadastroUsuarioPage.informar_nome(nome)
        self.cadastroUsuarioPage.informar_email(email)
        self.cadastroUsuarioPage.selecionar_nivel_acesso(nivel_acesso)
        self.cadastroUsuarioPage.clicar_em_criar_usuario()

        usuarioDTO = UsuarioDAO().obtem_usuario_por_login(usuario)
        assert usuarioDTO.usuario == usuario
        assert usuarioDTO.nome == nome
        assert usuarioDTO.email == email
        assert usuarioDTO.nivel_acesso == nivel_acesso
