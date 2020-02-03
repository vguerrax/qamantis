import pytest
from commons.screenshot import anexa_resultado
from driver_factory.driver_factory import get_driver

@pytest.fixture(scope='function')
def setup_and_teardown():
    webdriver = get_driver()
    yield {"webdriver": webdriver}
    anexa_resultado(webdriver)
    webdriver.quit()