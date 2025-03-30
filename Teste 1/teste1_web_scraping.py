import requests
from bs4 import BeautifulSoup
import os
import zipfile

#url do site alvo
url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

#requisição para o site
response = requests.get(url)

#verificando a requisição
if response.status_code == 200:
    soup = BeautifulSoup(response.text, 'html.parser')

    #diretorio para os PDFs
    pasta_pdf = 'pastaPDF'
    os.makedirs(pasta_pdf, exist_ok=True)

    #links para os PDFs
    links_pdf = soup.find_all('a', href=True)
    download_pdf = []

    for link in links_pdf:
        href = link['href']
        if 'Anexo' in href and href.endswith('.pdf'):
            #verificando iniciar com http
            url_pdf = href if href.startswith('http') else f"https://www.gov.br{href}"
            
            #salvando arquivo com o mesmo nome a partir da url
            nome_arquivo = os.path.join(pasta_pdf, href.split('/')[-1])

            #realizando o download do PDF
            response_pdf = requests.get(url_pdf)
            if response_pdf.status_code == 200:
                with open(nome_arquivo, 'wb') as arquivo:
                    arquivo.write(response_pdf.content)
                download_pdf.append(nome_arquivo)
                print(f"Baixado: {nome_arquivo}")
            else:
                print(f"Falha ao baixar: {url_pdf}")
    
    #compactando os PDFs em ZIP
    arquivo_zip = 'teste1_pdfs.zip'
    with zipfile.ZipFile(arquivo_zip, 'w') as ziparquivo:
        for arquivo in download_pdf:
            ziparquivo.write(arquivo, os.path.basename(arquivo))
    
    print(f"Todos os PDFs foram compactados em: {arquivo_zip}")

else:
    print(f"Errou ao acessar a página: {response.status_code}")
