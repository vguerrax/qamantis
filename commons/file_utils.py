import os

def deletar_diretorio(path):
    for root, dirs, files in os.walk(path,topdown=False):
        for file in files:
            os.remove(os.path.join(root, file))
        for folder in dirs:
            os.remove(os.path.join(root, folder))

def nome_arquivos_no_diretorio(dir, exibir_extensao=True):
    arquivos = []
    only_files = [f for f in os.listdir(dir) if os.path.isfile(os.path.join(dir, f))]
    for file in only_files:
        if not exibir_extensao:
            end = len(str(file))-3
            arquivos.append(file[0:end])
        else:
            arquivos.append(file)
    return arquivos
    
def conteudo_arquivo(caminho_arquivo):
    str_conteudo = ""
    with open(caminho_arquivo, encoding='utf-8') as arq:
        for linha in arq.readlines():
            str_conteudo += linha
        arq.close()
    return str(str_conteudo)