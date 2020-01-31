import pytest
from allure import title, description
from pages.login_page import LoginPage
from pages.pagina_inicial_page import PaginaInicialPage
from driver_factory.driver_factory import get_driver
from base_test import setup_and_teardown

@pytest.fixture(scope='function')
def garantir_usuario_existe(usuario, senha):
    pass

@title('Login')
class TestLogin():
    webdriver = None
    login_page = None
    pagina_inicial_page = None

    @title('Login válido')
    @description('Realizar o login com usuário e senhas válidos')
    def test_login_valido(self, setup_and_teardown, garantir_usuario_existe):
        garantir_usuario_existe('admin', 'admin')
        self.webdriver = setup_and_teardown['webdriver']
        self.login_page = LoginPage(self.webdriver)
        self.login_page.acessarPaginaInicial()
        self.login_page.informar_usuario('admin')
        self.login_page.clicar_em_entrar()
        self.login_page.informar_senha('admin')
        self.login_page.clicar_em_entrar()

        self.pagina_inicial_page = PaginaInicialPage(self.webdriver)
        assert self.pagina_inicial_page.retorna_usuario_logado() == 'admin'