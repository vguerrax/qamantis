from pages.base_page import BasePage
from page_objects import PageElement
from selenium.webdriver.support.ui import Select

class CadastroUsuarioPage(BasePage):

    usuario_field = PageElement(id_ = 'user-username')
    nome_field = PageElement(id_ = 'user-realname')
    email_field = PageElement(id_ ='email-field')
    nivel_acesso_select = PageElement(id_ = 'user-access-level')
    usuario_habilitado_checkbox_span = PageElement(css = '#user-enabled + span')
    usuario_habilitado_checkbox = PageElement(id_ = 'user-enabled')
    usuario_protegido_checkbox_span = PageElement(css = '#user-protected + span')
    usuario_protegido_checkbox = PageElement(id_ = 'user-protected')
    criar_usuario_button = PageElement(css = 'input[type="submit"]')

    def informar_usuario(self, usuario):
        self.usuario_field = usuario

    def informar_nome(self, nome):
        self.nome_field = nome

    def informar_email(self, email):
        self.email_field = email

    def selecionar_nivel_acesso(self, nivel_acesso):
        Select(self.nivel_acesso_select).select_by_visible_text(nivel_acesso)

    def marcar_usuario_habilitado(self):
        if self.usuario_habilitado_checkbox.checked != 'checked':
            self.usuario_habilitado_checkbox_span.click()

    def marcar_usuario_protegido(self):
        if self.usuario_protegido_checkbox.checked != 'checked':
            self.usuario_protegido_checkbox_span.click()

    def clicar_em_criar_usuario(self):
        self.criar_usuario_button.click()