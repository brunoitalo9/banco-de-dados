import requests # pip install requests 
import mysql.connector # pip install mysql-connector-python

#função para conectar o banco de dados 
def banco(sql):
    conexao = mysql.connector.connect(
        host='localhost',
        database='pizzaria',
        user='root',
        password='senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()


# Endereço de onde vamos acessar 
url = 'https://api.anota.ai/clientauth/nm-category/menu-merchant?displaySources=DIGITAL_MENU'
# token de autorição
headers = {
    'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHBhZ2UiOiI2NGY4ZTUwZGRlYTRkNDAwMTI2OTlmMzMiLCJpYXQiOjE3NDA0MzY3NjN9.P_6cFc9UDFBPihCmrvOsR4I2VwXy_ljUvVvWLCj343I'
}
# execução da requisição
response = requests.get(url, headers=headers)

# mostrar o retorno 
# print (response.json())

obj = response.json()
lista = obj['data']['menu']['menu'][1]['itens']

# loop para mostrar todos os itens 
i = 0
while i < len(lista):
    titulo = lista[i]['title']
    descricao = lista [i]['description']
    preco = lista [i]['price']
    # print(f"{titulo} - {descricao}")
    # sql = f"INSERT INTO pizza(sabor, ingredientes) values ('{titulo}','{descricao}')"
    sql = f"update pizza set preco = '{preco}' where sabor = '{titulo}';"
    banco(sql)
    
    i = i + 1



# instalar o request executar no cmd ou no shell dentro dessa pasta 
# pip install requests 
# pip install mysql-connector-python