-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE CONSULTA (DML / DQL)
--
-- Data Criacao ...........: 19/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa, Vitor Ricardo Moretti de Souza
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: VRVR
--
-- PROJETO => 04 Sequences, 
--            08 Tabelas 
--            01 Visao (View)
--
-- ULTIMAS ATUALIZACOES
--  19/10/2026 => Adequacao das consultas ao modelo integrado com a PARTE 1 (G8_PESSOA, G8_GERENTE, G8_AREA, G8_EMPREGADO).
--             => Consulta A: juncao de G8_VENDA com G8_EMPREGADO (matricula) e G8_PESSOA (cpfPessoa).
--             => Consulta B: correcao de v.cpfPessoa para e.cpfPessoa via juncao com G8_EMPREGADO.
--             => Consulta C: obtencao de nomePessoa via G8_PESSOA e ativacao da clausula NOT EXISTS contra G8_GERENTE.
--             => Implementacao das consultas A, B, C, D (com criacao de View) e E para o Oracle APEX.
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (G8_SEQ_PRODUTO e G8_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura G8_ em todos os identificadores de objetos.
-- -----------------------------------------------------------------


-- =================================================================
-- CONSULTA A: Vendas por Empregado Especifico via APEX
-- Lógica e Atributos:
--   Recupera o historico de vendas realizadas por um empregado especifico.
--   A juncao (INNER JOIN) entre G8_VENDA (v) e G8_EMPREGADO (e) e realizada
--   atraves da chave matricula. Para obter o nome do empregado,
--   realiza-se a juncao com G8_PESSOA (p) atraves de cpfPessoa. Para atender
--   a interatividade no Oracle APEX, a consulta solicita a matricula funcional
--   do empregado via bind variable (:MATRICULA_EMPREGADO).
--   Sao exibidos: matricula, nome do empregado, CPF, codigo da venda e data formatada.
--   Os resultados sao ordenados de forma crescente pela data da venda e pelo codigo da venda.
-- =================================================================
SELECT
    e.matricula                        AS "Matrícula do Empregado",
    p.nomePessoa                       AS "Nome do Empregado",
    e.cpfPessoa                        AS "CPF do Empregado",
    v.codVenda                         AS "Código da Venda",
    TO_CHAR(v.dataVenda, 'DD/MM/YYYY') AS "Data da Venda"
FROM
    G8_VENDA v
INNER JOIN
    G8_EMPREGADO e ON v.matricula = e.matricula
INNER JOIN
    G8_PESSOA p ON e.cpfPessoa = p.cpfPessoa
WHERE
    e.matricula = :MATRICULA_EMPREGADO
ORDER BY
    v.dataVenda ASC,
    v.codVenda ASC;

-- Variacao alternativa filtrando diretamente pelo CPF do empregado:
-- WHERE e.cpfPessoa = :CPF_EMPREGADO;


-- =================================================================
-- CONSULTA B: Detalhamento de uma Venda Especifica e seus Produtos via APEX
-- Lógica e Atributos:
--   Exibe a discriminacao analitica dos produtos que compoem uma determinada venda.
--   Realiza a juncao interna (INNER JOIN) entre G8_VENDA (v), G8_EMPREGADO (e) por
--   matricula (para projetar o vendedor responsavel), a associativa G8_CONTEM (c)
--   por codVenda, e o catalogo G8_PRODUTO (p) por codProduto.
--   Sao projetados: codigo e data formatada da venda, CPF do vendedor responsavel,
--   codigo e nome do produto, preco unitario oficial de catalogo, quantidade
--   comercializada, preco unitario efetivamente praticado no item e o valor
--   total calculado por produto (c.quantidade * c.precoVenda).
--   O filtro interativo solicita o codigo da venda (:CODIGO_VENDA) e o resultado
--   e ordenado em ordem alfabetica crescente pelo nome do produto e codigo do produto.
-- =================================================================
SELECT
    v.codVenda                            AS "Código da Venda",
    TO_CHAR(v.dataVenda, 'DD/MM/YYYY')    AS "Data da Venda",
    e.cpfPessoa                           AS "CPF do Vendedor",
    p.codProduto                          AS "Código do Produto",
    p.nomeProduto                         AS "Nome do Produto",
    ROUND(p.precoProduto, 2)              AS "Preço de Catálogo (R$)",
    c.quantidade                          AS "Quantidade Vendida",
    ROUND(c.precoVenda, 2)                AS "Preço Unitário Praticado (R$)",
    ROUND(c.quantidade * c.precoVenda, 2) AS "Valor Total do Item (R$)"
FROM
    G8_VENDA v
INNER JOIN
    G8_EMPREGADO e ON v.matricula = e.matricula
INNER JOIN
    G8_CONTEM c ON v.codVenda = c.codVenda
INNER JOIN
    G8_PRODUTO p ON c.codProduto = p.codProduto
WHERE
    v.codVenda = :CODIGO_VENDA
ORDER BY
    p.nomeProduto ASC,
    p.codProduto ASC;


-- =================================================================
-- CONSULTA C: Empregados que NAO sao Gerentes em Ordem Alfabetica
-- Lógica e Atributos:
--   Apresenta a listagem de empregados que exercem a funcao de vendedores
--   (nao sao gerentes), organizados em ordem alfabetica crescente por nome.
--   Contexto do Modelo Fisico Integrado: A tabela G8_EMPREGADO armazena os
--   empregados vinculados a G8_PESSOA, e a especializacao G8_GERENTE armazena
--   os gerentes (compartilhando cpfPessoa com G8_PESSOA). Para selecionar
--   exclusivamente os empregados que nao sao gerentes, utiliza-se a clausula
--   NOT EXISTS contra a tabela G8_GERENTE.
--   Projeta matricula, nome completo (obtido de G8_PESSOA) e CPF do empregado.
-- =================================================================
SELECT
    e.matricula  AS "Matrícula do Empregado",
    p.nomePessoa AS "Nome do Empregado",
    e.cpfPessoa  AS "CPF do Empregado"
FROM
    G8_EMPREGADO e
INNER JOIN
    G8_PESSOA p ON e.cpfPessoa = p.cpfPessoa
WHERE
    NOT EXISTS (
        SELECT 1
        FROM G8_GERENTE g
        WHERE g.cpfPessoa = e.cpfPessoa
    )
ORDER BY
    p.nomePessoa ASC;


-- =================================================================
-- CONSULTA D: VIEW da Quantidade Vendida de CADA Produto
-- Lógica e Atributos:
--   Criacao da visao (VIEW) relacional G8_VW_QTD_VENDIDA_PRODUTO, responsavel
--   por consolidar o volume de vendas de todos os produtos do catalogo.
--   Para assegurar a legibilidade e utilidade pratica ao usuario final, a visao
--   projeta o codigo do produto, sua descricao/nome comercial, o preco unitario
--   de catalogo, o somatorio de unidades vendidas (utilizando NVL(..., 0) para
--   evitar nulos) e o total de transacoes de venda em que o produto esteve presente.
--   A juncao externa a esquerda (LEFT JOIN) entre G8_PRODUTO (p) e G8_CONTEM (c)
--   garante que mesmo os produtos com zero vendas sejam apresentados.
--   O agrupamento (GROUP BY) e realizado por codProduto, nomeProduto e precoProduto.
-- =================================================================
CREATE OR REPLACE VIEW G8_VW_QTD_VENDIDA_PRODUTO AS
SELECT
    p.codProduto              AS "Código do Produto",
    p.nomeProduto             AS "Nome do Produto",
    ROUND(p.precoProduto, 2)  AS "Preço de Catálogo (R$)",
    NVL(SUM(c.quantidade), 0) AS "Total Unidades Vendidas",
    COUNT(c.codVenda)         AS "Total Vendas Registradas"
FROM
    G8_PRODUTO p
LEFT JOIN
    G8_CONTEM c ON p.codProduto = c.codProduto
GROUP BY
    p.codProduto,
    p.nomeProduto,
    p.precoProduto;

-- Consulta de exibicao a partir da VIEW criada:
-- A ordenacao prioriza o total de unidades vendidas em ordem decrescente (DESC)
-- e o nome do produto em ordem alfabetica crescente (ASC), viabilizando uma
-- analise imediata de curva ABC (produtos de maior e menor giro no estoque).
SELECT *
FROM G8_VW_QTD_VENDIDA_PRODUTO
ORDER BY
    "Total Unidades Vendidas" DESC,
    "Nome do Produto" ASC;


-- =================================================================
-- CONSULTA E: Pesquisa Interativa por Parte do Nome do Produto
-- Lógica e Atributos:
--   Permite a localizacao parametrizada de produtos atraves de busca textual
--   interativa no Oracle APEX.
--   A busca e insensivel a maiusculas/minusculas (case-insensitive), utilizando
--   UPPER(p.nomeProduto) LIKE '%' || UPPER(:PARTE_NOME_PRODUTO) || '%'.
--   A juncao externa (LEFT JOIN) com G8_CONTEM computa o total de unidades
--   vendidas (NVL(SUM(c.quantidade), 0)) e a quantidade de vendas registradas
--   (COUNT(c.codVenda)) para cada produto correspondente ao filtro.
--   Os dados sao agrupados por p.codProduto e p.nomeProduto, e ordenados
--   obrigatoriamente pelo nome do produto em ordem alfabetica decrescente (DESC).
-- =================================================================
SELECT
    p.codProduto              AS "Código do Produto",
    p.nomeProduto             AS "Nome do Produto",
    NVL(SUM(c.quantidade), 0) AS "Total Unidades Vendidas",
    COUNT(c.codVenda)         AS "Total Vendas Registradas"
FROM
    G8_PRODUTO p
LEFT JOIN
    G8_CONTEM c ON p.codProduto = c.codProduto
WHERE
    UPPER(p.nomeProduto) LIKE '%' || UPPER(:PARTE_NOME_PRODUTO) || '%'
GROUP BY
    p.codProduto,
    p.nomeProduto
ORDER BY
    p.nomeProduto DESC;
