from pages.base_page import BasePage
from page_objects import PageElement, MultiPageElement

class GerenciarUsuariosPage(BasePage):

    criar_usuario_button = PageElement(css = '#manage-user-div a[href="manage_user_create_page.php"]')
    usuarios_listados = MultiPageElement(xpath = '//td/a[contains(@href, "manage_user_edit_page.php?user_id=")]')

    def cadastrar_novo_usuario(self):
        self.criar_usuario_button.click()

    def selecionar_usuario(self, usuario):
        for usuario_label in self.usuarios_listados:
            if usuario_label.text == usuario:
                usuario_label.click()
                return True
        return False