from pages.base_page import BasePage
from page_objects import PageElement

class GerenciarUsuariosPage(BasePage):

    criar_usuario_button = PageElement(css = '#manage-user-div a[href="manage_user_create_page.php"]')

    def cadastrar_novo_usuario(self):
        print(self.criar_usuario_button.text)
        self.criar_usuario_button.click()