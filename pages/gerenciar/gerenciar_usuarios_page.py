from pages.base_page import BasePage
from page_objects import PageElement, MultiPageElement

class GerenciarUsuariosPage(BasePage):

    criar_usuario_button = PageElement(css = '#manage-user-div a[href="manage_user_create_page.php"]')
    usuarios_listados = MultiPageElement(xpath = '//td/a[contains(@href, "manage_user_edit_page.php?user_id=")]')
    mostrar_desativados_checkbox = PageElement(css = 'input[name="showdisabled"]')
    mostrar_desativados_checkbox_span = PageElement(css = 'input[name="showdisabled"] + span')
    aplicar_filtros_button = PageElement(css = 'input[type="submit"]')

    def cadastrar_novo_usuario(self):
        self.criar_usuario_button.click()

    def selecionar_usuario(self, usuario):
        for usuario_label in self.usuarios_listados:
            if usuario_label.text == usuario:
                usuario_label.click()
                return True
        return False

    def marcar_mostrar_desativados(self):
        if not self.mostrar_desativados_checkbox.get_attribute('checked'):
            self.mostrar_desativados_checkbox_span.click()

    def clicar_em_aplicar_filtros(self):
        self.aplicar_filtros_button.click()