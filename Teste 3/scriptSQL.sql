CREATE TABLE relatorio_cadop (
Registro_ANS VARCHAR(20) PRIMARY KEY,                     
CNPJ CHAR(14) NOT NULL,
Razao_Social VARCHAR(250) NOT NULL,
Nome_Fantasia VARCHAR(250),
Modalidade VARCHAR(50),
Logradouro VARCHAR(250),
Numero VARCHAR(10),
Complemento VARCHAR(100),
Bairro VARCHAR(100),
Cidade VARCHAR(100),
UF CHAR(2),
CEP VARCHAR(10),
DDD VARCHAR(3),
Telefone VARCHAR(11),
Fax VARCHAR(15),
Endereco_eletronico VARCHAR(255),
Representante VARCHAR(100),
Cargo_Representante VARCHAR(100),
Regiao_de_Comercializacao VARCHAR(4),
Data_registro_ANS DATE NOT NULL
);

CREATE TABLE demons_contab_1T2023 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_2T2023 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_3T2023 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_4T2023 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_1T2024 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_2T2024 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_3T2024 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

CREATE TABLE demons_contab_4T2024 (
id INT AUTO_INCREMENT PRIMARY KEY,         						-- Chave primária simples, auto-incrementada
DATA_EVENTO DATE,                           					-- Data da demonstração contábil, não pode ser nula
REG_ANS VARCHAR(20) NOT NULL,               					
CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,     					
DESCRICAO VARCHAR(250),                     					
VL_SALDO_INICIAL DECIMAL(15, 2) NOT NULL,   					
VL_SALDO_FINAL DECIMAL(15, 2) NOT NULL,                         
FOREIGN KEY (REG_ANS) REFERENCES relatorio_cadop(Registro_ANS)  -- Chave estrangeira referenciando a tabela relatorio_cadop
);

-- Carregando os dados dos arquivos CSV
LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/Relatorio_cadop.csv' INTO TABLE relatorio_cadop
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, 
Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, Regiao_de_Comercializacao, Data_Registro_ANS);

SET FOREIGN_KEY_CHECKS=0;    -- Desabilitando temporariamente a chave estrangeira por conta de conflitos

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/1T2023.csv' INTO TABLE demons_contab_1t2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/2T2023.csv' INTO TABLE demons_contab_2t2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/3T2023.csv' INTO TABLE demons_contab_3t2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/4T2023.csv' INTO TABLE demons_contab_4t2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/1T2024.csv' INTO TABLE demons_contab_1t2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/2T2024.csv' INTO TABLE demons_contab_2t2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/3T2024.csv' INTO TABLE demons_contab_3t2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

LOAD DATA INFILE '3_TESTE_DE_BANCO_DE_DADOS/DemonstracaoCont/4T2024.csv' INTO TABLE demons_contab_4t2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (DATA_EVENTO, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL);

-- Filtrando os dados onde não tem ligação com a tabela relatorio_cadop
DELETE FROM demons_contab_1t2023                                      
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_2t2023 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_3t2023 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_4t2023 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_1t2024 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_2t2024 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_3t2024 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

DELETE FROM demons_contab_4t2024 
WHERE REG_ANS NOT IN (SELECT Registro_ANS FROM relatorio_cadop);

SET FOREIGN_KEY_CHECKS=1; -- Restabelecendo a ligação da chave estrangeira

-- Foi verificado 2 formas diferentes para EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MEDICO HOSPITALAR, dessa forma foi decidido a criação de uma tabela para padronização.
CREATE TABLE descricoes_padronizadas (
    descricao_variavel VARCHAR(255),
    descricao_padrao VARCHAR(255)
);

INSERT INTO descricoes_padronizadas (descricao_variavel, descricao_padrao) 
VALUES ("EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE", "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"), 
("EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR", "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR");

-- query para as 10 operadoras com maiores despesas em EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR no ultimo trimestre
SELECT relatorio_cadop.Registro_ANS, relatorio_cadop.Razao_Social, demons_contab_4t2024.DESCRICAO, SUM(demons_contab_4t2024.VL_SALDO_FINAL - demons_contab_4t2024.VL_SALDO_INICIAL) as total_despesas FROM demons_contab_4t2024
JOIN relatorio_cadop ON demons_contab_4t2024.REG_ANS = relatorio_cadop.Registro_ANS
JOIN descricoes_padronizadas ON demons_contab_4t2024.DESCRICAO LIKE concat('%', descricoes_padronizadas.descricao_variavel, '%')
WHERE descricoes_padronizadas.descricao_padrao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR' AND demons_contab_4t2024.VL_SALDO_FINAL < demons_contab_4t2024.VL_SALDO_INICIAL
GROUP BY relatorio_cadop.Registro_ANS, relatorio_cadop.Razao_Social, descricoes_padronizadas.descricao_padrao
ORDER BY total_despesas ASC
LIMIT 10;

-- query para as 10 operadoras com maiores despesas em EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR no ultimo ano
SELECT relatorio_cadop.Registro_ANS, relatorio_cadop.Razao_Social, d.DESCRICAO, SUM(d.VL_SALDO_FINAL - d.VL_SALDO_INICIAL) as total_despesas 
-- Unindo as tabelas
FROM                                          
(SELECT * FROM demons_contab_1t2024
UNION ALL
SELECT * FROM demons_contab_2t2024
UNION ALL
SELECT * FROM demons_contab_3t2024
UNION ALL
SELECT * FROM demons_contab_4t2024) AS d           -- Colocando abreviação para as tabelas juntas como d
JOIN relatorio_cadop ON d.REG_ANS = relatorio_cadop.Registro_ANS
JOIN descricoes_padronizadas ON d.DESCRICAO LIKE concat('%', descricoes_padronizadas.descricao_variavel, '%')
WHERE descricoes_padronizadas.descricao_padrao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR' AND d.VL_SALDO_FINAL < d.VL_SALDO_INICIAL
GROUP BY relatorio_cadop.Registro_ANS, relatorio_cadop.Razao_Social, descricoes_padronizadas.descricao_padrao
ORDER BY total_despesas ASC
LIMIT 10;