import configparser

def get_all_configs():
    # read the configs from config.ini file
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config

def get_exec_configs():
    return get_all_configs()['EXEC']

def get_connect_configs():
    return get_all_configs()['CONNECT']