import pytest
from allure import title, description
from pages.login_page import LoginPage
from pages.pagina_inicial_page import PaginaInicialPage
from driver_factory.driver_factory import get_driver
from commons import read_csv
from base_test import setup_and_teardown, garantir_usuario_existe, garantir_usuario_nao_existe

@title('Login')
class TestLogin():
    webdriver = None
    login_page = None
    pagina_inicial_page = None

    @title('Login válido')
    @description('Realizar o login com usuário e senhas válidos')
    def test_login_valido(self, setup_and_teardown, garantir_usuario_existe):
        garantir_usuario_existe('admin1', 'admin', 'administrador')
        self.webdriver = setup_and_teardown['webdriver']
        self.login_page = LoginPage(self.webdriver)
        self.login_page.acessar_pagina_inicial()
        self.login_page.informar_usuario('admin1')
        self.login_page.clicar_em_entrar()
        self.login_page.informar_senha('admin')
        self.login_page.clicar_em_entrar()

        self.pagina_inicial_page = PaginaInicialPage(self.webdriver)
        assert self.pagina_inicial_page.retorna_usuario_logado() == 'admin1'

    @title('Realizar login com dados inválidos')
    @description('Realizar o login com dados inválidos')
    @pytest.mark.parametrize('usuario,senha,tipo_validacao,mensagem', read_csv.get_csv_data_in_tuples('resources/test_data/usuarios_invalidos.csv', delimiter=';'))
    def test_login_invalido(self, setup_and_teardown, 
            garantir_usuario_existe,
            garantir_usuario_nao_existe,
            usuario, senha, tipo_validacao, mensagem):

        if tipo_validacao == 'UI':
            garantir_usuario_nao_existe(usuario)
        elif tipo_validacao == 'SI':
            senha_valida = senha[::-1]
            garantir_usuario_existe(usuario, senha_valida, 'administrador')
        
        self.webdriver = setup_and_teardown['webdriver']
        self.login_page = LoginPage(self.webdriver)
        self.login_page.acessar_pagina_inicial()
        if len(usuario):
            self.login_page.informar_usuario(usuario)
        self.login_page.clicar_em_entrar()
        if len(senha):
            self.login_page.informar_senha(senha)
        if tipo_validacao != 'UV':
            self.login_page.clicar_em_entrar()
        assert self.login_page.retorna_mensagem_alerta() == mensagem

    @title('Validar perfil de acesso')
    @description('Validar os menus exibidos para os perfis de acesso')
    @pytest.mark.parametrize('usuario,senha,perfil,menus', read_csv.get_csv_data_in_tuples('resources/test_data/usuarios_perfil_acesso.csv', delimiter=';'))
    def test_validar_perfis_acesso(self, setup_and_teardown, garantir_usuario_existe,
            usuario, senha, perfil, menus):
        garantir_usuario_existe(usuario, senha, perfil)
        self.webdriver = setup_and_teardown['webdriver']
        self.login_page = LoginPage(self.webdriver)
        self.login_page.acessar_pagina_inicial()
        self.login_page.informar_usuario(usuario)
        self.login_page.clicar_em_entrar()
        self.login_page.informar_senha(senha)
        self.login_page.clicar_em_entrar()

        self.pagina_inicial_page = PaginaInicialPage(self.webdriver)
        assert self.pagina_inicial_page.retorna_texto_menu().split('\n') == menus.split(',')