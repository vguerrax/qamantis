import pytest
from commons.screenshot import anexa_resultado
from driver_factory.driver_factory import get_driver
from dao.usuario_dao import UsuarioDAO

@pytest.fixture(scope='function')
def setup_and_teardown():
    usuarioDAO = UsuarioDAO()
    usuarioDAO.deletar_usuario('admin')
    usuarioDAO.criar_usuario('admin', 'admin', 'administrador')
    usuarioDAO.close_connection()
    webdriver = get_driver()
    yield {"webdriver": webdriver}
    anexa_resultado(webdriver)
    webdriver.quit()

@pytest.fixture(scope='function')
def garantir_usuario_existe():

    def _garantir_usuario(usuario, senha, nivel_acesso, nome='', email=''):
        usuarioDAO = UsuarioDAO()
        usuarioDAO.deletar_usuario(usuario)
        usuarioDAO.criar_usuario(usuario, senha, nivel_acesso, nome=nome, email=email)
        usuarioDAO.close_connection()
        return True
    return _garantir_usuario

@pytest.fixture(scope='function')
def garantir_usuario_nao_existe():

    def _garantir_usuario_nao_existe(usuario):
        usuarioDAO = UsuarioDAO()
        usuarioDAO.deletar_usuario(usuario)
        usuarioDAO.close_connection()
        return True
    return _garantir_usuario_nao_existe

@pytest.fixture(scope='function')
def garantir_usuario_com_email_nao_existe():

    def _garantir_usuario_com_email_nao_existe(email):
        usuarioDAO = UsuarioDAO()
        usuarioDAO.deletar_usuario_email(email)
        usuarioDAO.close_connection()
        return True
    return _garantir_usuario_com_email_nao_existe

@pytest.fixture(scope='function')
def logar_com_usuario():
    from pages.login_page import LoginPage

    def _logar_com_usuario(webdriver, usuario, senha):
        loginPage = LoginPage(webdriver)
        loginPage.acessar_pagina_inicial()
        loginPage.informar_usuario(usuario)
        loginPage.clicar_em_entrar()
        loginPage.informar_senha(senha)
        loginPage.clicar_em_entrar()
        return True

    return _logar_com_usuario
