import requests # pip install requests 
import mysql.connector # pip install mysql-connector-python

#função para conectar o banco de dados 
def banco(sql):
    conexao = mysql.connector.connect(
        host='localhost',
        database='brasil',
        user='root',
        password='senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()


# Endereço de onde vamos acessar 
def insert_regiao():
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'

    response = requests.get(url)

    lista = response.json()

    i = 0
    while i < len(lista):
        id = lista[i]['id']
        sigla = lista [i]['sigla']
        nome = lista [i]['nome']
        sql = f"insert into regiao values ({id},'{sigla}','{nome}');"
        print(sql)
        banco(sql)
        
        i = i + 1

def insert_estado():
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'

    response = requests.get(url)

    lista = response.json()

    i = 0
    while i < len(lista):
        id = lista[i]['id']
        sigla = lista [i]['sigla']
        nome = lista [i]['nome']
        id_regiao = lista[i]['regiao']['id']
        sql = f"insert into estado values ({id},'{sigla}','{nome}',{id_regiao});"
        print(sql)
        banco(sql)
        
        i = i + 1

def insert_municipio():
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios'

    response = requests.get(url)

    lista = response.json()

    i = 0
    while i < len(lista):
        id = lista[i]['id']
        nome = lista [i]['nome']. replace ("'","''")
        id_estado = lista[i]['microrregiao']['mesorregiao']['UF']['id']
        sql = f"insert into municipios values ({id},'{nome}',{id_estado});"
        print(sql)
        banco(sql)
        
        i = i + 1        

#insert_regiao()
#insert_estado()        
insert_municipio()

# instalar o request executar no cmd ou no shell dentro dessa pasta 
# pip install requests 
# pip install mysql-connector-python