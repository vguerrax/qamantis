#!/usr/bin/env python
# -*- coding: utf-8 -*-

__version__ = "1.0.1-SNAPSHOT"

import argparse
import configparser
import pytest
import commons.config
from commons.file_utils import deletar_diretorio

# read the configs from config.ini file
exec_configs = commons.config.get_exec_configs()

# define the list of possible drivers and define the first of the list as default
drivers = ['chrome', 'firefox']
driver = drivers[0]

# define the driver's path and application url
chromedriver = ''
geckodriver = ''
url = ''

# Verify that driver param is defined in config.ini and set the driver variable with his value
# If the param not defined, the first item of drivers list is maintained as default
if 'driver' in exec_configs and not exec_configs['driver'] == '':
    driver = exec_configs['driver']

# Verify that url param is defined in config.ini and set if he will be required or not
# If the param is defined then his value is setted as default
url_req = False
if not 'url' in exec_configs or exec_configs['url'] == '':
    chromedriver_req = True
else:
    url = exec_configs['url']

# Verify that chromedriver param is defined in config.ini and set if he will be required or not
# The param only will be required case the driver value was 'chrome'
# If the param is defined then his value is setted as default
chromedriver_req = False
if (not 'chromedriver' in exec_configs or exec_configs['chromedriver'] == '') and driver == 'chrome':
    chromedriver_req = True
elif driver == 'chrome':
    chromedriver = exec_configs['chromedriver']

# Verify that geckodriver param is defined in config.ini and set if he will be required or not
# The param only will be required case the driver value was 'firefox'
# If the param is defined then his value is setted as default
geckodriver_req = False
if (not 'geckodriver' in exec_configs or exec_configs['geckodriver'] == '') and driver == 'firefox':
    geckodriver_req = True
elif driver == 'firefox':
    geckodriver = exec_configs['geckodriver']

# Define the command-line arguments
parser = argparse.ArgumentParser(description='Execute functional UI tests')
parser.add_argument('-d', '--driver', choices=drivers, default=driver,
                    help='the browser driver to run the tests, override the passed in config.ini. Default is ' + driver)
parser.add_argument('-c', '--chromedriver', metavar='"chromedriver path"',
                    help='the path of chromedriver binary, override the passed in config.ini',
                    required=chromedriver_req, default=chromedriver)
parser.add_argument('-g', '--geckodriver', metavar='"geckodriver path"',
                    help='the path of geckodriver binary, override the passed in config.ini',
                    required=geckodriver_req, default=geckodriver)
parser.add_argument('-u', '--url', help='the application URL, override the passed in config.ini',
                    required=url_req, default=url)
parser.add_argument('-v', '--version', action='version',
                    version='%(prog)s ' + __version__)
parser.add_argument('-p', '--pytest_args', metavar='"Pytest options"', 
                    default=None, help='the Pytest command line args to execution')

def get_args():
    # Parse the command-line args
    return parser.parse_args()

if __name__ == '__main__':
    #deletar_diretorio('test_output')
    args = get_args()
    if not hasattr(args, 'h') or not hasattr(args, 'v'):
        command = ['--alluredir', './test_output/', '-v', '--tb=short']
        if hasattr(args, 'pytest_args') and args.pytest_args != None:
            command.extend(args.pytest_args.split())
        pytest.main(command)