import pytest
from allure import title, description
from pages.login_page import LoginPage
from pages.criar_conta_page import CriarContaPage
from pages.erro_page import ErroPage
from pages.sucesso_page import SucessoPage
from pages.gerenciar.gerenciar_page import GerenciarPage
from pages.gerenciar.gerenciar_usuarios_page import GerenciarUsuariosPage
from pages.gerenciar.cadastro_usuario_page import CadastroUsuarioPage, AlteracaoUsuarioPage
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
    alteracaoUsuarioPage = None
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

        sucessoPage = SucessoPage(self.webdriver)
        assert 'Operação realizada com sucesso.' in sucessoPage.retornar_mensagem()

        usuarioDTO = UsuarioDAO().obtem_usuario_por_login(usuario)
        assert usuarioDTO.usuario == usuario
        assert usuarioDTO.nome == nome
        assert usuarioDTO.email == email
        assert usuarioDTO.nivel_acesso == nivel_acesso

    @title('Criar conta de usuário com dados inválidos')
    @description('Validar a criação de usuário através do menu "Gerenciar" informando dados inválidos')
    @pytest.mark.parametrize('usuario,nome,email,nivel_acesso,mensagem', read_csv.get_csv_data_in_tuples('resources/test_data/cadastrar_usuario_dados_invalidos.csv', delimiter=';'))
    def test_cadastrar_usuario_dados_invalidos(self, setup_and_teardown,
        garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe, logar_com_usuario,
        usuario, nome, email, nivel_acesso, mensagem):

        if usuario != '':
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

        erroPage = ErroPage(self.webdriver)
        assert mensagem in erroPage.retornar_erro()

    @title('Alterar cadastro de usuário')
    @description('Validar a alteração dos dados do usuário')
    def test_alterar_usuario(self, setup_and_teardown,
        garantir_usuario_existe, garantir_usuario_nao_existe, garantir_usuario_com_email_nao_existe,
        logar_com_usuario):
        usuario = 'alteracao.conta'
        nome = 'Alteracao Conta'
        email = 'alteracao.conta@email.com'
        nivel_acesso = 'relator'
        garantir_usuario_existe(usuario, usuario, nivel_acesso, nome=nome, email=email)

        usuario_novo = 'conta.alterada'
        nome_novo = 'Conta Alterada'
        email_novo = 'conta.alterada@email.com'
        nivel_acesso_novo = 'visualizador'

        garantir_usuario_nao_existe(usuario_novo)
        garantir_usuario_com_email_nao_existe(email_novo)

        self.webdriver = setup_and_teardown['webdriver']
        logar_com_usuario(self.webdriver, 'admin', 'admin')

        self.gerenciarPage = GerenciarPage(self.webdriver)
        self.gerenciarPage.acessar_menu_gerenciar()
        self.gerenciarPage.acessar_aba_gerenciar_usuarios()

        self.gerenciarUsuariosPage = GerenciarUsuariosPage(self.webdriver)
        assert self.gerenciarUsuariosPage.selecionar_usuario(usuario)

        self.alteracaoUsuarioPage = AlteracaoUsuarioPage(self.webdriver)
        self.alteracaoUsuarioPage.alterar_usuario(usuario_novo)
        self.alteracaoUsuarioPage.alterar_nome(nome_novo)
        self.alteracaoUsuarioPage.alterar_email(email_novo)
        self.alteracaoUsuarioPage.selecionar_nivel_acesso(nivel_acesso_novo)
        self.alteracaoUsuarioPage.clicar_em_atualizar_usuario()

        sucessoPage = SucessoPage(self.webdriver)
        assert 'Operação realizada com sucesso.' in sucessoPage.retornar_mensagem()

        usuarioDTO = UsuarioDAO().obtem_usuario_por_login(usuario_novo)
        assert usuarioDTO != None
        assert usuarioDTO.usuario == usuario_novo
        assert usuarioDTO.nome == nome_novo
        assert usuarioDTO.email == email_novo
        assert usuarioDTO.nivel_acesso == nivel_acesso_novo

    @title('Alterar conta de usuário com dados inválidos')
    @description('Validar a alteração de usuário através do menu "Gerenciar" informando dados inválidos')
    @pytest.mark.parametrize('usuario_novo,nome_novo,email_novo,nivel_acesso_novo,mensagem', read_csv.get_csv_data_in_tuples('resources/test_data/cadastrar_usuario_dados_invalidos.csv', delimiter=';'))
    def test_alterar_usuario_dados_invalidos(self, setup_and_teardown,
        garantir_usuario_existe, logar_com_usuario,
        usuario_novo, nome_novo, email_novo, nivel_acesso_novo, mensagem):

        usuario_busca = 'alteracao.conta'
        nome_busca = 'Alteracao Conta'
        email_busca = 'alteracao.conta@email.com'
        nivel_acesso_busca = 'relator'
        garantir_usuario_existe(usuario_busca, usuario_busca, nivel_acesso_busca, nome=nome_busca, email=email_busca)

        self.webdriver = setup_and_teardown['webdriver']
        logar_com_usuario(self.webdriver, 'admin', 'admin')

        self.gerenciarPage = GerenciarPage(self.webdriver)
        self.gerenciarPage.acessar_menu_gerenciar()
        self.gerenciarPage.acessar_aba_gerenciar_usuarios()

        self.gerenciarUsuariosPage = GerenciarUsuariosPage(self.webdriver)
        assert self.gerenciarUsuariosPage.selecionar_usuario(usuario_busca)

        self.alteracaoUsuarioPage = AlteracaoUsuarioPage(self.webdriver)
        self.alteracaoUsuarioPage.alterar_usuario(usuario_novo)
        self.alteracaoUsuarioPage.alterar_nome(nome_novo)
        self.alteracaoUsuarioPage.alterar_email(email_novo)
        self.alteracaoUsuarioPage.selecionar_nivel_acesso(nivel_acesso_novo)
        self.alteracaoUsuarioPage.clicar_em_atualizar_usuario()

        erroPage = ErroPage(self.webdriver)
        assert mensagem in erroPage.retornar_erro()

    @title('Desabilitar Usuário')
    @description('Validar a opção de desabilitar o usuário na alteração')
    def test_desabilitar_usuario(self, setup_and_teardown, garantir_usuario_existe, logar_com_usuario):
        usuario_busca = 'alteracao.conta'
        nome_busca = 'Alteracao Conta'
        email_busca = 'alteracao.conta@email.com'
        nivel_acesso_busca = 'relator'
        garantir_usuario_existe(usuario_busca, usuario_busca, nivel_acesso_busca, nome=nome_busca, email=email_busca, habilitado=True)
        
        self.webdriver = setup_and_teardown['webdriver']
        logar_com_usuario(self.webdriver, 'admin', 'admin')

        self.gerenciarPage = GerenciarPage(self.webdriver)
        self.gerenciarPage.acessar_menu_gerenciar()
        self.gerenciarPage.acessar_aba_gerenciar_usuarios()

        self.gerenciarUsuariosPage = GerenciarUsuariosPage(self.webdriver)
        assert self.gerenciarUsuariosPage.selecionar_usuario(usuario_busca)

        self.alteracaoUsuarioPage = AlteracaoUsuarioPage(self.webdriver)
        self.alteracaoUsuarioPage.desmarcar_usuario_habilitado()
        self.alteracaoUsuarioPage.clicar_em_atualizar_usuario()

        sucessoPage = SucessoPage(self.webdriver)
        assert 'Operação realizada com sucesso.' in sucessoPage.retornar_mensagem()

        usuarioDTO = UsuarioDAO().obtem_usuario_por_login(usuario_busca)
        assert usuarioDTO != None
        assert not usuarioDTO.habilitado

        self.gerenciarPage.clicar_usuario_logado()
        self.gerenciarPage.clicar_em_sair()

        loginPage = LoginPage(self.webdriver)
        loginPage.informar_usuario(usuario_busca)
        loginPage.clicar_em_entrar()
        loginPage.informar_senha(usuario_busca)
        loginPage.clicar_em_entrar()
        assert 'Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos.' == loginPage.retorna_mensagem_alerta()

    @title('Habilitar Usuário')
    @description('Validar a opção de habilitar o usuário na alteração')
    def test_habilitar_usuario(self, setup_and_teardown, garantir_usuario_existe, logar_com_usuario):
        usuario_busca = 'alteracao.conta'
        nome_busca = 'Alteracao Conta'
        email_busca = 'alteracao.conta@email.com'
        nivel_acesso_busca = 'relator'
        garantir_usuario_existe(usuario_busca, usuario_busca, nivel_acesso_busca, nome=nome_busca, email=email_busca, habilitado=False)
        
        self.webdriver = setup_and_teardown['webdriver']
        logar_com_usuario(self.webdriver, 'admin', 'admin')

        self.gerenciarPage = GerenciarPage(self.webdriver)
        self.gerenciarPage.acessar_menu_gerenciar()
        self.gerenciarPage.acessar_aba_gerenciar_usuarios()

        self.gerenciarUsuariosPage = GerenciarUsuariosPage(self.webdriver)
        self.gerenciarUsuariosPage.marcar_mostrar_desativados()
        self.gerenciarUsuariosPage.clicar_em_aplicar_filtros()
        assert self.gerenciarUsuariosPage.selecionar_usuario(usuario_busca)

        self.alteracaoUsuarioPage = AlteracaoUsuarioPage(self.webdriver)
        self.alteracaoUsuarioPage.marcar_usuario_habilitado()
        self.alteracaoUsuarioPage.clicar_em_atualizar_usuario()

        sucessoPage = SucessoPage(self.webdriver)
        assert 'Operação realizada com sucesso.' in sucessoPage.retornar_mensagem()

        usuarioDTO = UsuarioDAO().obtem_usuario_por_login(usuario_busca)
        assert usuarioDTO != None
        assert usuarioDTO.habilitado

        self.gerenciarPage.clicar_usuario_logado()
        self.gerenciarPage.clicar_em_sair()

        loginPage = LoginPage(self.webdriver)
        loginPage.informar_usuario(usuario_busca)
        loginPage.clicar_em_entrar()
        loginPage.informar_senha(usuario_busca)
        loginPage.clicar_em_entrar()
        assert usuario_busca == self.gerenciarPage.retorna_usuario_logado()