import pytest
from allure import title, description
from pages.login_page import LoginPage
from pages.criar_conta_page import CriarContaPage
from driver_factory.driver_factory import get_driver
from dao.usuario_dao import UsuarioDAO
from dto.usuario_dto import UsuarioDTO
from commons import read_csv
from base_test import setup_and_teardown, garantir_usuario_existe, garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe

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