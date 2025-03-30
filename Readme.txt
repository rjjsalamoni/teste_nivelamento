Estas pastas contém a implementação do teste de nivelamento solicitado, que envolve web scraping, transformação de dados, manipulação de banco de dados e desenvolvimento de uma API com Vue.js e Python.

Para executar, é necessário ter as seguintes ferramentas instaladas:
- Python 3.8+ (bibliotecas: requests, BeautifulSoup, os, pandas, zipfile, Flask, pdfplumber)
- Node.js 14+ (para o Vue.js)
- MySQL 8+
- Postman (para testar a API)

Teste 1: Web Scraping
**Objetivo:**
- Acessar a página e baixar os Anexos I e II em PDF.
- Compactar os arquivos baixados em um único arquivo ZIP.

**Execução:**
bash
cd Teste 1
python teste1_web_scraping.py

Os arquivos serão salvos e compactados automaticamente.

Teste 2: Transformação de Dados
**Objetivo:**
- Extrair a tabela do Anexo I (Rol de Procedimentos e Eventos em Saúde) do PDF.
- Salvar os dados em CSV.
- Substituir abreviações por descrições completas.
- Compactar o CSV.

**Execução:**
bash
cd Teste 2
python teste2_transformacao_dados.py

O arquivo CSV gerado será compactado automaticamente.

Teste 3: Banco de Dados
**Objetivo:**
- Baixar os dados contábeis e cadastrais das operadoras.
- Criar tabelas e importar os dados.
- Criar consultas analíticas sobre despesas médicas.


Teste 4: API com Vue.js e Python
**Objetivo:**
- Criar uma API para busca de operadoras.
- Criar uma interface web para interagir com a API.

**Execução:**
### Backend:
bash
cd pythonserver
python app.py


### Frontend:
bash
cd test-4
npm install
npm run dev

Teste no Postman
A coleção de requisições do Postman pode ser importada a partir do arquivo `Teste 4/Colecao_Postman.postman_collection.json`.

Conclusão
Este projeto implementa todas as etapas solicitadas no teste de nivelamento, garantindo a extração, transformação, análise e exposição dos dados via API e interface web.

