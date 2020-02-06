from pages.base_page import BasePage
from page_objects import PageElement

class SucessoPage(BasePage):

    mensagem_sucesso_label = PageElement(css = 'div.alert-success')

    def retornar_mensagem(self):
        return self.mensagem_sucesso_label.text