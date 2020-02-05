from pages.base_page import BasePage
from page_objects import PageElement

class CriarContaPage(BasePage):

    usuario_field = PageElement(id_ = 'username')
    email_field = PageElement(id_ = 'email-field')
    criar_conta_button = PageElement(css = 'input[type="submit"]')
    mensagem_label = PageElement(css = 'div.center strong')

    def informar_usuario(self, usuario):
        self.usuario_field = usuario

    def informar_email(self, email):
        self.email_field = email

    def clicar_em_criar_conta(self):
        self.criar_conta_button.click()

    def retornar_mensagem(self):
        return self.mensagem_label.text
