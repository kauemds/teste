

import pandas as pd
import sqlalchemy

# Ajudar a definir o caminho do diretório sem que seja necessário fxar ele. Isso ajuda que qualquer outro que use o arquivo  não precise alterar os caminhos.
import os


#Pega o passo absoluto de um determinado caminho que será passado, no caso, file. Que é o caminho absoluto desse script pyton.
EP_DIR = os.path.dirname( os.path.abspath( __file__ ) ) 
print(EP_DIR)

## Importar query
# É criada a função import_query, para não precisar digitar todas as linhas abaixo para ler um arquivo, então é criada uma função para fazer essa leitura e retorna o resultado, que no caso é uma query
def import_query( path, **kwards ) :
    with open( path, 'r', **kwards ) as file_open:
        result = file_open.read()
    return result