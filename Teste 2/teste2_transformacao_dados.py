import pdfplumber
import pandas as pd
import os
import zipfile

#Função para substituir abreviações
def substituir_abre(df):
    df['OD'] = df['OD'].replace({'OD' : 'Seg. Odontológica'})
    df['AMB'] = df['AMB'].replace({'AMB': 'Seg. Ambulatorial'})
    return df

#Extração de dados do PDF
pdf_caminho = 'pastaPDF/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf' #caminho para o arquivo pdf
dados = []

with pdfplumber.open(pdf_caminho) as pdf:
    for pagina in pdf.pages:
        #Extraindo tabela das páginas
        tabela = pagina.extract_table()
        if tabela:
            dados.extend(tabela)

#convertendo os dados extraídos em um DataFrame

df = pd.DataFrame(dados[1:], columns=dados[0]) #Primeira linha é o cabeçalho
#renomeando as colunas
df = substituir_abre(df)

#renomeando as colunas OD e AMB
df.rename(columns={'OD' : 'Seg. Odontológica', 'AMB': 'Seg. Ambulatorial'}, inplace=True)

#Salvando os dados em um arquivo CSV
csv_caminho = 'Rol_de_procedimentos.csv'
df.to_csv(csv_caminho, index=False)

#Compactando o csv em um arquivo ZIP
zip_nome = 'Teste_Robson_Salamoni.zip'
with zipfile.ZipFile(zip_nome, 'w') as zipf:
    zipf.write(csv_caminho, os.path.basename(csv_caminho))

print(f"Arquivo CSV salvo e compactado em {zip_nome}")