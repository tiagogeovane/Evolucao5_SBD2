-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE CRIACAO (DDL)
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

-- SEQUENCES
CREATE SEQUENCE G8_SEQ_PRODUTO
    START WITH 101
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE G8_SEQ_VENDA
    START WITH 5001
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- TABELAS E RESTRICOES DECLARATIVAS
CREATE TABLE G8_EMPREGADO (
    cpfPessoa  VARCHAR2(11)  NOT NULL,
    matricula  NUMBER(10)    NOT NULL,
    nomePessoa VARCHAR2(100) NOT NULL,
    CONSTRAINT G8_EMPREGADO_PK PRIMARY KEY (cpfPessoa),
    CONSTRAINT G8_EMPREGADO_MATRICULA_UK UNIQUE (matricula)
);

CREATE TABLE G8_PRODUTO (
    codProduto   NUMBER(10)     NOT NULL,
    nomeProduto  VARCHAR2(100)  NOT NULL,
    precoProduto NUMBER(10,2)   NOT NULL,
    CONSTRAINT G8_PRODUTO_PK PRIMARY KEY (codProduto),
    CONSTRAINT G8_PRODUTO_PRECO_CK CHECK (precoProduto > 0)
);

CREATE TABLE G8_VENDA (
    codVenda   NUMBER(10)   NOT NULL,
    dataVenda  DATE         NOT NULL,
    cpfPessoa  VARCHAR2(11) NOT NULL,
    CONSTRAINT G8_VENDA_PK PRIMARY KEY (codVenda),
    CONSTRAINT G8_VENDA_EMPREGADO_FK FOREIGN KEY (cpfPessoa)
        REFERENCES G8_EMPREGADO (cpfPessoa)
);

CREATE TABLE G8_CONTEM (
    codVenda   NUMBER(10)   NOT NULL,
    codProduto NUMBER(10)   NOT NULL,
    quantidade NUMBER(6)    NOT NULL,
    precoVenda NUMBER(10,2) NOT NULL,
    CONSTRAINT G8_CONTEM_PK PRIMARY KEY (codVenda, codProduto),
    CONSTRAINT G8_CONTEM_VENDA_FK FOREIGN KEY (codVenda)
        REFERENCES G8_VENDA (codVenda),
    CONSTRAINT G8_CONTEM_PRODUTO_FK FOREIGN KEY (codProduto)
        REFERENCES G8_PRODUTO (codProduto),
    CONSTRAINT G8_CONTEM_QTD_CK CHECK (quantidade > 0),
    CONSTRAINT G8_CONTEM_PRECO_CK CHECK (precoVenda >= 0)
);
