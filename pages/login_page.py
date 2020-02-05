from pages.base_page import BasePage
from page_objects import PageElement

class LoginPage(BasePage):

    usuario_field = PageElement(id_ = 'username')
    senha_field = PageElement(id_ = 'password')
    entrar_button = PageElement(css = 'input[type="submit"]')
    criar_conta_button = PageElement(css = 'a[href="signup_page.php"]')
    mensagem_alerta_label = PageElement(css = 'div.alert p')

    def informar_usuario(self, usuario):
        self.usuario_field = usuario

    def informar_senha(self, senha):
        self.senha_field = senha

    def clicar_em_entrar(self):
        self.entrar_button.click()

    def retorna_mensagem_alerta(self):
        return self.mensagem_alerta_label.text

    def clicar_em_criar_conta(self):
        self.criar_conta_button.click()