import pytest
from commons.screenshot import anexa_resultado
from driver_factory.driver_factory import get_driver
from dao.usuario_dao import UsuarioDAO

@pytest.fixture(scope='function')
def setup_and_teardown():
    webdriver = get_driver()
    yield {"webdriver": webdriver}
    anexa_resultado(webdriver)
    webdriver.quit()

@pytest.fixture(scope='function')
def garantir_usuario_existe():

    def _garantir_usuario(usuario, senha, nivel_acesso):
        usuarioDAO = UsuarioDAO()
        usuarioDAO.deletar_usuario(usuario)
        usuarioDAO.criar_usuario(usuario, senha, nivel_acesso)
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
