from pages.base_page import BasePage
from page_objects import PageElement

class PaginaInicialPage(BasePage):

    usuario_logado_label = PageElement(css = 'span.user-info')
    menu_lateral_list = PageElement(id_ = 'sidebar')

    def retorna_usuario_logado(self):
        return self.usuario_logado_label.text

    def retorna_texto_menu(self):
        return self.menu_lateral_list.text