from selenium import webdriver
from qamantis import get_args

def get_driver():
    w = None
    args = get_args()
    driver = args.driver
    if driver == 'chrome':
        w = webdriver.Chrome(executable_path=args.chromedriver)
    elif driver == 'firefox':
        w = webdriver.Firefox(executable_path=args.geckodriver)
    w.maximize_window()
    return w