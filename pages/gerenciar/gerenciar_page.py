from pages.pagina_inicial_page import PaginaInicialPage
from page_objects import PageElement

class GerenciarPage(PaginaInicialPage):

    gerenciar_usuarios_tab = PageElement(css = 'a[href="/manage_user_page.php"]')

    def acessar_aba_gerenciar_usuarios(self):
        self.gerenciar_usuarios_tab.click()