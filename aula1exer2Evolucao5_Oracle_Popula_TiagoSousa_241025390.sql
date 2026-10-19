-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 02/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa,  Vitor Ricardo Moretti de Souza 
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: VRVR
--
-- PROJETO => 02 Sequences, 
--            04 Tabelas 
--            01 Visao (View)
--
-- ULTIMAS ATUALIZACOES
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (G8_SEQ_PRODUTO e G8_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura G8_ em todos os identificadores de objetos.
-- -----------------------------------------------------------------

-- 1. BASE DE APOIO (EMPREGADOS VENDEDORES - 10 Tuplas)
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('38452167090', 1001, 'Ana Beatriz Souza');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('27193846052', 1002, 'Carlos Eduardo Lima');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('61928374056', 1003, 'Fernanda Alves Costa');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('90817263540', 1004, 'Ricardo Mendes Silva');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('45672189033', 1005, 'Juliana Pereira Rocha');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('73048261590', 1006, 'Marcos Vinicius Tavares');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('67482377711', 1007, 'Roberto Freitas Garagalhaes');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('11223344556', 1008, 'Lucas Gabriel Antunes');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('22334455667', 1009, 'Patricia Hellen Soares');
INSERT INTO G8_EMPREGADO (cpfPessoa, matricula, nomePessoa) VALUES ('33445566778', 1010, 'Diego Silveira Ramos');

-- 2. PRODUTOS (10 Tuplas via G8_SEQ_PRODUTO)
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Xampu Anticaspa 400ml', 49.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Condicionador Hidratante 400ml', 129.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Sabonete Liquido Neutro 250ml', 19.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Desodorante Antitranspirante Roll-on', 79.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Creme Hidratante Corporal 500ml', 249.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Xampu de Marca Generica 300ml', 34.50);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Esfregao para Limpeza Pesada', 89.90);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Protetor Solar Facial FPS 60', 85.00);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Agua Micelar Demaquilante 200ml', 45.00);
INSERT INTO G8_PRODUTO (codProduto, nomeProduto, precoProduto) VALUES (G8_SEQ_PRODUTO.NEXTVAL, 'Oleo Capilar Reparador 100ml', 65.00);

-- 3. VENDAS (10 Tuplas via G8_SEQ_VENDA)
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-10', 'YYYY-MM-DD'), '38452167090');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-12', 'YYYY-MM-DD'), '38452167090');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-15', 'YYYY-MM-DD'), '61928374056');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-16', 'YYYY-MM-DD'), '90817263540');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-18', 'YYYY-MM-DD'), '45672189033');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-20', 'YYYY-MM-DD'), '73048261590');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-22', 'YYYY-MM-DD'), '67482377711');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-24', 'YYYY-MM-DD'), '11223344556');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-25', 'YYYY-MM-DD'), '22334455667');
INSERT INTO G8_VENDA (codVenda, dataVenda, cpfPessoa) VALUES (G8_SEQ_VENDA.NEXTVAL, TO_DATE('2026-08-26', 'YYYY-MM-DD'), '33445566778');

-- 4. ITENS DE VENDA / CONTEM (12 Tuplas - Vendas 5001 e 5002 com multiplos itens)
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
