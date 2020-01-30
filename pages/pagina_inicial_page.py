from pages.base_page import BasePage
from page_objects import PageElement

class PaginaInicialPage(BasePage):

    usuario_logado_label = PageElement(css = 'span.user-info')

    def retorna_usuario_logado(self):
        return self.usuario_logado_label.text