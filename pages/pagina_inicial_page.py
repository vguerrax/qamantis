from pages.base_page import BasePage
from page_objects import PageElement

class PaginaInicialPage(BasePage):

    usuario_logado_label = PageElement(css = 'span.user-info')
    menu_lateral_list = PageElement(id_ = 'sidebar')
    sair_button = PageElement(css = 'a[href="/logout_page.php"]')

    menu_gerenciar_button = PageElement(css = 'a[href="/manage_overview_page.php"]')

    def retorna_usuario_logado(self):
        return self.usuario_logado_label.text

    def retorna_texto_menu(self):
        return self.menu_lateral_list.text

    def acessar_menu_gerenciar(self):
        self.menu_gerenciar_button.click()

    def clicar_usuario_logado(self):
        self.usuario_logado_label.click()

    def clicar_em_sair(self):
        self.sair_button.click()