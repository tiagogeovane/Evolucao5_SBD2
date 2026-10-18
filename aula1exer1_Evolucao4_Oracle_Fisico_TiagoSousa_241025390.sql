-- === << aula1exer1_Evolucao4_Oracle >> ===
--
--   SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 02/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: WKSP_VRVR
--
-- PROJETO => 02 Sequences
--            04 Tabelas (TGSS_EMPREGADO, TGSS_PRODUTO, TGSS_VENDA, TGSS_CONTEM)
--
-- ULTIMAS ATUALIZACOES
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (TGSS_SEQ_PRODUTO e TGSS_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura TGSS_ em todos os identificadores de objetos.
-- -----------------------------------------------------------------

-- SEQUENCES
CREATE SEQUENCE TGSS_SEQ_PRODUTO
    START WITH 101
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE TGSS_SEQ_VENDA
    START WITH 5001
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- TABELAS E RESTRICOES DECLARATIVAS
CREATE TABLE TGSS_EMPREGADO (
    cpfPessoa  VARCHAR2(11)  NOT NULL,
    matricula  NUMBER(10)    NOT NULL,
    nomePessoa VARCHAR2(100) NOT NULL,
    CONSTRAINT TGSS_EMPREGADO_PK PRIMARY KEY (cpfPessoa),
    CONSTRAINT TGSS_EMPREGADO_MATRICULA_UK UNIQUE (matricula)
);

CREATE TABLE TGSS_PRODUTO (
    codProduto   NUMBER(10)     NOT NULL,
    nomeProduto  VARCHAR2(100)  NOT NULL,
    precoProduto NUMBER(10,2)   NOT NULL,
    CONSTRAINT TGSS_PRODUTO_PK PRIMARY KEY (codProduto),
    CONSTRAINT TGSS_PRODUTO_PRECO_CK CHECK (precoProduto > 0)
);

CREATE TABLE TGSS_VENDA (
    codVenda   NUMBER(10)   NOT NULL,
    dataVenda  DATE         NOT NULL,
    cpfPessoa  VARCHAR2(11) NOT NULL,
    CONSTRAINT TGSS_VENDA_PK PRIMARY KEY (codVenda),
    CONSTRAINT TGSS_VENDA_EMPREGADO_FK FOREIGN KEY (cpfPessoa)
        REFERENCES TGSS_EMPREGADO (cpfPessoa)
);

CREATE TABLE TGSS_CONTEM (
    codVenda   NUMBER(10)   NOT NULL,
    codProduto NUMBER(10)   NOT NULL,
    quantidade NUMBER(6)    NOT NULL,
    precoVenda NUMBER(10,2) NOT NULL,
    CONSTRAINT TGSS_CONTEM_PK PRIMARY KEY (codVenda, codProduto),
    CONSTRAINT TGSS_CONTEM_VENDA_FK FOREIGN KEY (codVenda)
        REFERENCES TGSS_VENDA (codVenda),
    CONSTRAINT TGSS_CONTEM_PRODUTO_FK FOREIGN KEY (codProduto)
        REFERENCES TGSS_PRODUTO (codProduto),
    CONSTRAINT TGSS_CONTEM_QTD_CK CHECK (quantidade > 0),
    CONSTRAINT TGSS_CONTEM_PRECO_CK CHECK (precoVenda >= 0)
);
