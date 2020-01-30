from allure import attach
from allure_commons.types import AttachmentType

def anexa_resultado(driver):
    attach(body=driver.get_screenshot_as_png(),
        name='Resultado',
        attachment_type=AttachmentType.PNG,
        extension='png')