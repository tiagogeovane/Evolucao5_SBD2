-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 02/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa, Vitor Ricardo Moretti de Souza 
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: VRVR
--
-- PROJETO => 04 Sequences, 
--            08 Tabelas 
--            01 Visao (View)
--
-- ULTIMAS ATUALIZACOES
--  19/10/2026 => Implementacao de carga em lote via INSERT ALL para todas as 08 tabelas.
--             => Atribuicao de chaves primarias explicitas alinhadas aos valores das sequences para contornar a restricao ORA-02287 do Oracle.
--  18/10/2026 => Adicao dos inserts das tabelas e sequences referentes a PARTE 1 (Pessoa, Perfis, Areas).
--             => Adequacao da tabela de produto para referenciar codArea;
--             => Adequacao da tabela de venda para referenciar matricula ao inves de cpfPessoa;
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (G8_SEQ_PRODUTO e G8_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura G8_ em todos os identificadores de objetos.
-- -----------------------------------------------------------------

-- 1. PESSOA (15 Tuplas: 10 base + 5 gerentes e empregados)
INSERT ALL
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('38452167090', 'Ana Beatriz Souza', 'AnaB@2026')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('27193846052', 'Carlos Eduardo Lima', 'CarlosLima#7')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('61928374056', 'Fernanda Alves Costa', 'FerAlv2025!')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('45672189033', 'Juliana Pereira Rocha', 'JuPerRocha8')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('27193846053', 'Claudio Henrique Moraes', 'ClaudioHM#7')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('45672189034', 'Jessica Pereira Almeida', 'JessicaPA!8')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('61928374057', 'Felipe Augusto Costa', 'FelipeAC#25')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('90817263548', 'Renata Mendes Oliveira', 'RenataMO$99')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('88141652612', 'Maria Barros Souza', 'MARmar4123')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('73048261598', 'Mauricio Vinicius Ferreira', 'MauricioVF!42')
    -- Gerente e empregado
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('67482377711', 'Roberto Freitas Garagalhães', 'gaRAraGA')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('90817263540', 'Ricardo Mendes Silva', 'RicMend99$')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('73048261590', 'Marcos Vinicius Tavares', 'MarcosVT!42')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('98495161987', 'Rafael Lopes Madeira', 'Raffa123LM')
    INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES ('38452167091', 'Amanda Beatriz Nogueira', 'AmandaN@2026')
SELECT * FROM dual;

-- 2. GERENTE (10 Tuplas)
INSERT ALL
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Engenharia de Producao', 'claudio.henrique@empresa.com.br', '27193846053')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Ciencias Contabeis', 'jessica.pereira@empresa.com.br', '45672189034')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Gestao Comercial', 'felipe.augusto@empresa.com.br', '61928374057')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Sistemas de Informacao', 'mauricio.ferreira@empresa.com.br', '73048261598')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Sistemas de Informacao', 'maria.barros@empresa.com.br', '88141652612')
    -- Gerente e empregado
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Sistemas de Informacao', 'marcos.tavares@empresa.com.br', '73048261590')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Sistemas de Informacao', 'rafa.lopes@empresa.com.br', '98495161987')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Gestao de Recursos Humanos', 'ricardo.silva@empresa.com.br', '90817263540')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Administracao Financeira', 'roberto.freitas@empresa.com.br', '67482377711')
    INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES ('Administracao de Empresas', 'ana.nogueira@empresa.com.br', '38452167091')
SELECT * FROM dual;

-- 3. AREA (11 Tuplas correspondentes a G8_SEQ_CODAREA_AREA: 1 a 11)
INSERT ALL
    INTO G8_AREA (codArea, email, descricao) VALUES (1, 'marcos.tavares@empresa.com.br', 'Limpeza')
    INTO G8_AREA (codArea, email, descricao) VALUES (2, 'marcos.tavares@empresa.com.br', 'Roupas')
    INTO G8_AREA (codArea, email, descricao) VALUES (3, 'rafa.lopes@empresa.com.br', 'Higiene Pessoal')
    INTO G8_AREA (codArea, email, descricao) VALUES (4, 'ricardo.silva@empresa.com.br', 'Doces')
    INTO G8_AREA (codArea, email, descricao) VALUES (5, 'ana.nogueira@empresa.com.br', 'Peças Automotivas')
    INTO G8_AREA (codArea, email, descricao) VALUES (6, 'roberto.freitas@empresa.com.br', 'Brinquedos')
    INTO G8_AREA (codArea, email, descricao) VALUES (7, 'jessica.pereira@empresa.com.br', 'Carnes')
    INTO G8_AREA (codArea, email, descricao) VALUES (8, 'mauricio.ferreira@empresa.com.br', 'Frutas')
    INTO G8_AREA (codArea, email, descricao) VALUES (9, 'maria.barros@empresa.com.br', 'Bebidas')
    INTO G8_AREA (codArea, email, descricao) VALUES (10, 'claudio.henrique@empresa.com.br', 'Laticíneos')
    INTO G8_AREA (codArea, email, descricao) VALUES (11, 'felipe.augusto@empresa.com.br', 'Eletrônicos')
SELECT * FROM dual;

-- 4. EMPREGADOS (10 Tuplas correspondentes a G8_SEQ_MATRICULA_EMPREGADO: 1001 a 1010)
INSERT ALL
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1001, 'SQS 108 Bloco A', '120', '70070100', 'Asa Sul', 'Brasilia', 'DF', 'Apto 302', '90817263548')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1002, 'SQS 108 Bloco A', '120', '70070100', 'Asa Sul', 'Brasilia', 'DF', 'Apto 302', '38452167090')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1003, 'SQN 210 Bloco C', '450', '70710902', 'Asa Norte', 'Brasilia', 'DF', NULL, '27193846052')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1004, 'CLSW 300 Bloco D', '78', '70673120', 'Sudoeste', 'Brasilia', 'DF', 'Casa 2', '61928374056')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1005, 'QNM 34 Conjunto B', '25', '72145620', 'Taguatinga', 'Brasilia', 'DF', 'Casa 5', '45672189033')
    -- Gerente e empregado
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1006, 'Quadra 18 Conjunto C', '310', '71950750', 'Guara II', 'Brasilia', 'DF', 'Apto 104', '73048261590')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1007, 'Quadra 5 Conjunto 3', '34', '73320130', 'Cruzeiro', 'Brasilia', 'DF', NULL, '98495161987')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1008, 'Quadra 5 Conjunto 7', '12', '70630400', 'Cruzeiro', 'Brasilia', 'DF', NULL, '90817263540')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1009, 'QRSW 6 Bloco B', '64', '70675542', 'Sudoeste', 'Brasilia', 'DF', NULL, '67482377711')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES (1010, 'CLSW 300 Bloco D', '78', '70673120', 'Sudoeste', 'Brasilia', 'DF', 'Casa 3', '38452167091')
SELECT * FROM dual;

-- 5. TELEFONE (10 Tuplas)
INSERT ALL
    INTO G8_telefone (telefone, matricula) VALUES ('61965118441', 1001)
    INTO G8_telefone (telefone, matricula) VALUES ('61984567231', 1002)
    INTO G8_telefone (telefone, matricula) VALUES ('61995126234', 1003)
    INTO G8_telefone (telefone, matricula) VALUES ('61965415615', 1004)
    INTO G8_telefone (telefone, matricula) VALUES ('61992348765', 1005)
    INTO G8_telefone (telefone, matricula) VALUES ('61978234456', 1006)
    INTO G8_telefone (telefone, matricula) VALUES ('61991234567', 1007)
    INTO G8_telefone (telefone, matricula) VALUES ('61983456789', 1008)
    INTO G8_telefone (telefone, matricula) VALUES ('61997654321', 1009)
    INTO G8_telefone (telefone, matricula) VALUES ('61986543210', 1010)
SELECT * FROM dual;

-- 6. PRODUTOS (10 Tuplas correspondentes a G8_SEQ_PRODUTO: 101 a 110)
INSERT ALL
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (101, 3, 'Xampu Anticaspa 400ml', 49.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (102, 3, 'Condicionador Hidratante 400ml', 129.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (103, 3, 'Sabonete Liquido Neutro 250ml', 19.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (104, 3, 'Desodorante Antitranspirante Roll-on', 79.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (105, 3, 'Creme Hidratante Corporal 500ml', 249.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (106, 3, 'Xampu de Marca Generica 300ml', 34.50)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (107, 1, 'Esfregao para Limpeza Pesada', 89.90)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (108, 3, 'Protetor Solar Facial FPS 60', 85.00)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (109, 3, 'Agua Micelar Demaquilante 200ml', 45.00)
    INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (110, 3, 'Oleo Capilar Reparador 100ml', 65.00)
SELECT * FROM dual;

-- 7. VENDAS (10 Tuplas correspondentes a G8_SEQ_VENDA: 5001 a 5010)
INSERT ALL
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5001, TO_DATE('2026-08-10', 'YYYY-MM-DD'), 1001)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5002, TO_DATE('2026-08-12', 'YYYY-MM-DD'), 1001)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5003, TO_DATE('2026-08-15', 'YYYY-MM-DD'), 1003)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5004, TO_DATE('2026-08-16', 'YYYY-MM-DD'), 1004)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5005, TO_DATE('2026-08-18', 'YYYY-MM-DD'), 1005)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5006, TO_DATE('2026-08-20', 'YYYY-MM-DD'), 1006)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5007, TO_DATE('2026-08-22', 'YYYY-MM-DD'), 1007)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5008, TO_DATE('2026-08-24', 'YYYY-MM-DD'), 1008)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5009, TO_DATE('2026-08-25', 'YYYY-MM-DD'), 1009)
    INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (5010, TO_DATE('2026-08-26', 'YYYY-MM-DD'), 1010)
SELECT * FROM dual;

-- 8. ITENS DE VENDA / CONTEM (12 Tuplas - Vendas 5001 e 5002 com multiplos itens)
INSERT ALL
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5001, 101, 2, 49.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5001, 102, 1, 129.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5002, 103, 3, 19.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5002, 108, 1, 85.00)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5003, 101, 3, 49.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5004, 104, 2, 79.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5005, 105, 1, 249.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5006, 106, 4, 34.50)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5007, 107, 2, 89.90)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5008, 108, 2, 85.00)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5009, 109, 1, 45.00)
    INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5010, 110, 2, 65.00)
SELECT * FROM dual;

COMMIT;
