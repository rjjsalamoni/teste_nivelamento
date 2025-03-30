from flask import Flask, request, Response
from flask_cors import CORS
import pandas as pd
from collections import OrderedDict
import json

app = Flask(__name__)
# Habilitando CORS para permitir requisições do frontend
CORS(app)

# Carregando o CSV, por estar separado por ";" deve ser especificado
df = pd.read_csv("relatorio_cadop.csv", sep=';', dtype=str)

#Substituição de dados vazios por string vazia
df.fillna("", inplace=True)

# Para flexibilizar a busca, será criado uma nova coluna de índice e convertido para minúsculo
df["busca_indice"] = df.apply(lambda row: " ".join(row.astype(str)).lower(), axis=1)

# Requisição de busca do front através do GET
@app.route("/search", methods=["GET"])
def pesquisa_operadoras():
    query = request.args.get("query", "").lower()

    # Filtrar registros que contenham o termo na coluna de índice
    resultado = df[df["busca_indice"].str.contains(query, na=False)].head(10)

    # Organizando e selecionando apenas algumas colunas mais importantes para a análise atual
    colunas_organizadas = ["Registro_ANS", "CNPJ", "Razao_Social", "Nome_Fantasia", "Modalidade", "Cidade", "Numero", "Complemento", "Representante", "Data_Registro_ANS"] 
    
    # Convertendo a coluna de data para o formato brasileiro (DD/MM/AAAA)
    if "Data_Registro_ANS" in resultado.columns:
        resultado["Data_Registro_ANS"] = pd.to_datetime(resultado["Data_Registro_ANS"], errors="coerce").dt.strftime("%d/%m/%Y")

    # Criando uma lista de OrderedDicts para garantir a ordem das colunas
    registros_ordenados = [
        OrderedDict((coluna, row[coluna]) for coluna in colunas_organizadas)
        for _, row in resultado.drop(columns=["busca_indice"]).iterrows()
    ]

    # Convertendo para JSON manualmente mantendo a ordem e filtrando caracteres especiais
    json_response = json.dumps(registros_ordenados, ensure_ascii=False)

    return Response(json_response, content_type="application/json; charset=utf-8")

if __name__ == "__main__":
    app.run(debug=True)