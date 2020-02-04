from page_objects import PageObject, PageElement
from qamantis import get_args

class BasePage(PageObject):

    def acessar_pagina_inicial(self):
        self.get(get_args().url)