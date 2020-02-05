from pages.base_page import BasePage
from page_objects import PageElement

class ErroPage(BasePage):

    mensagem_erro_label = PageElement(css = 'div.alert-danger')

    def retornar_erro(self):
        return self.mensagem_erro_label.text