-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 02/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa,  Vitor Ricardo Moretti de Souza 
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: VRVR
--
-- PROJETO => 04 Sequences, 
--            08 Tabelas 
--            01 Visao (View)
--
-- ULTIMAS ATUALIZACOES
--  18/10/2026 => Adição dos inserts das tabelas e sequences referentes a PARTE 1 (Pessoa, Perfis, Areas).
--             => Adequação da tabela de produto para referenciar codArea;
--             => Adequação da tabela de venda para referenciar matricula ao invés de cpfPessoa;
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (G8_SEQ_PRODUTO e G8_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura G8_ em todos os identificadores de objetos.
-- -----------------------------------------------------------------

-- 1. PESSOA (10 Tuplas)
INSERT INTO G8_PESSOA (cpfPessoa, nomePessoa, senha) VALUES
('38452167090', 'Ana Beatriz Souza',             'AnaB@2026'),
('27193846052', 'Carlos Eduardo Lima',           'CarlosLima#7'),
('61928374056', 'Fernanda Alves Costa',          'FerAlv2025!'),
('45672189033', 'Juliana Pereira Rocha',         'JuPerRocha8'),
('27193846053', 'Claudio Henrique Moraes',       'ClaudioHM#7'),
('45672189034', 'Jessica Pereira Almeida',       'JessicaPA!8'),
('61928374057', 'Felipe Augusto Costa',          'FelipeAC#25'),
('90817263548', 'Renata Mendes Oliveira',        'RenataMO$99'),
('88141652612', 'Maria Barros Souza',            'MARmar4123'),
('73048261598', 'Mauricio Vinicius Ferreira',    'MauricioVF!42'),
-- Gerente e empregado
('67482377711', 'Roberto Freitas Garagalhães',   'gaRAraGA'),
('90817263540', 'Ricardo Mendes Silva',          'RicMend99$'),
('73048261590', 'Marcos Vinicius Tavares',       'MarcosVT!42'),
('98495161987', 'Rafael Lopes Madeira',          'Raffa123LM'),
('38452167091', 'Amanda Beatriz Nogueira',       'AmandaN@2026');

-- 2. GERENTE (10 Tuplas)
INSERT INTO G8_GERENTE (formacaoEscolar, email, cpfPessoa) VALUES
('Engenharia de Producao',    'claudio.henrique@empresa.com.br',   '27193846053'),
('Ciencias Contabeis',        'jessica.pereira@empresa.com.br',    '45672189034'),
('Gestao Comercial',          'felipe.augusto@empresa.com.br',     '61928374057'),
('Sistemas de Informacao',    'mauricio.ferreira@empresa.com.br',  '73048261598'),
('Sistemas de Informacao',    'maria.barros@empresa.com.br',       '88141652612'),
-- Gerente e empregado
('Sistemas de Informacao',    'marcos.tavares@empresa.com.br',     '73048261590'),
('Sistemas de Informacao',    'rafa.lopes@empresa.com.br',         '98495161987'),
('Gestao de Recursos Humanos','ricardo.silva@empresa.com.br',      '90817263540'),
('Administracao Financeira',  'roberto.freitas@empresa.com.br',    '67482377711'),
('Administracao de Empresas', 'ana.nogueira@empresa.com.br',       '38452167091');

-- 3. AREA (10 Tuplas via G8_SEQ_CODAREA_AREA)
INSERT ALL
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'marcos.tavares@empresa.com.br', 'Limpeza')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'marcos.tavares@empresa.com.br', 'Roupas')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'rafa.lopes@empresa.com.br', 'Higiene Pessoal')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'ricardo.silva@empresa.com.br', 'Doces')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'ana.nogueira@empresa.com.br', 'Peças Automotivas')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'roberto.freitas@empresa.com.br', 'Brinquedos')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'jessica.pereira@empresa.com.br', 'Carnes')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'mauricio.ferreira@empresa.com.br', 'Frutas')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'maria.barros@empresa.com.br', 'Bebidas')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'claudio.henrique@empresa.com.br', 'Laticíneos')
    INTO G8_AREA (codArea, email, descricao) VALUES
        (G8_SEQ_CODAREA_AREA.NEXTVAL, 'felipe.augusto@empresa.com.br', 'Eletrônicos')
SELECT * FROM dual;

-- 4. EMPREGADOS (10 Tuplas via G8_SEQ_MATRICULA_EMPREGADO)
INSERT ALL
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'SQS 108 Bloco A',       '120', '70070100', 'Asa Sul',    'Brasilia', 'DF', 'Apto 302', '90817263548')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'SQS 108 Bloco A',       '120', '70070100', 'Asa Sul',    'Brasilia', 'DF', 'Apto 302', '38452167090')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'SQN 210 Bloco C',       '450', '70710902', 'Asa Norte',  'Brasilia', 'DF', NULL,       '27193846052')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'CLSW 300 Bloco D',      '78',  '70673120', 'Sudoeste',   'Brasilia', 'DF', 'Casa 2',   '61928374056')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'QNM 34 Conjunto B',     '25',  '72145620', 'Taguatinga', 'Brasilia', 'DF', 'Casa 5',   '45672189033')
    -- Gerente e empregado
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'Quadra 18 Conjunto C',  '310', '71950750', 'Guara II',   'Brasilia', 'DF', 'Apto 104', '73048261590')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'Quadra 5 Conjunto 3',   '34',  '73320130', 'Cruzeiro',   'Brasilia', 'DF', NULL,       '98495161987')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'Quadra 5 Conjunto 7',   '12',  '70630400', 'Cruzeiro',   'Brasilia', 'DF', NULL,       '90817263540')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'QRSW 6 Bloco B',        '64',  '70675542', 'Sudoeste',   'Brasilia', 'DF', NULL,       '67482377711')
    INTO G8_EMPREGADO (matricula, logradouro, numero, cep, bairro, cidade, estado, complemento, cpfPessoa) VALUES
        (G8_SEQ_MATRICULA_EMPREGADO.NEXTVAL, 'CLSW 300 Bloco D',      '78',  '70673120', 'Sudoeste',   'Brasilia', 'DF', 'Casa 3',   '38452167091')
SELECT * FROM dual;

-- 5. telefone (10 Tuplas)
INSERT INTO G8_telefone (telefone, matricula) VALUES
('61965118441', 1001),
('61984567231', 1002),
('61995126234', 1003),
('61965415615', 1004),
('61992348765', 1005),
('61978234456', 1006),
('61991234567', 1007),
('61983456789', 1008),
('61997654321', 1009),
('61986543210', 1010);

-- 6. PRODUTOS (10 Tuplas via G8_SEQ_PRODUTO)
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Xampu Anticaspa 400ml', 49.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Condicionador Hidratante 400ml', 129.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Sabonete Liquido Neutro 250ml', 19.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Desodorante Antitranspirante Roll-on', 79.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Creme Hidratante Corporal 500ml', 249.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Xampu de Marca Generica 300ml', 34.50);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 1, 'Esfregao para Limpeza Pesada', 89.90);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Protetor Solar Facial FPS 60', 85.00);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Agua Micelar Demaquilante 200ml', 45.00);
INSERT INTO G8_PRODUTO (codProduto, codArea, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 3, 'Oleo Capilar Reparador 100ml', 65.00);

-- 7. VENDAS (10 Tuplas via G8_SEQ_VENDA)
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-10', 'YYYY-MM-DD'), 1001);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-12', 'YYYY-MM-DD'), 1001);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-15', 'YYYY-MM-DD'), 1003);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-16', 'YYYY-MM-DD'), 1004);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-18', 'YYYY-MM-DD'), 1005);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-20', 'YYYY-MM-DD'), 1006);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-22', 'YYYY-MM-DD'), 1007);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-24', 'YYYY-MM-DD'), 1008);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-25', 'YYYY-MM-DD'), 1009);
INSERT INTO G8_VENDA (codVenda, dataVenda, matricula) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-26', 'YYYY-MM-DD'), 1010);

-- 8. ITENS DE VENDA / CONTEM (12 Tuplas - Vendas 5001 e 5002 com multiplos itens)
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5001, 101, 2, 49.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5001, 102, 1, 129.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5002, 103, 3, 19.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5002, 108, 1, 85.00);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5003, 101, 3, 49.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5004, 104, 2, 79.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5005, 105, 1, 249.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5006, 106, 4, 34.50);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5007, 107, 2, 89.90);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5008, 108, 2, 85.00);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5009, 109, 1, 45.00);
INSERT INTO G8_CONTEM (codVenda, codProduto, quantidade, precoVenda) VALUES (5010, 110, 2, 65.00);

COMMIT;
