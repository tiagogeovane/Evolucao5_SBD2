-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE CRIACAO (DDL)
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
--  18/10/2026 => Adição das tabelas e sequences referentes a PARTE 1 (Pessoa, Perfis, Areas).
--             => Adequação da tabela de produto para referenciar codArea;
--             => Adequação da tabela de venda para referenciar matricula ao invés de cpfPessoa;
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

CREATE SEQUENCE G8_SEQ_MATRICULA_EMPREGADO
    START WITH 1001
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE G8_SEQ_CODAREA_AREA
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- TABELAS E RESTRICOES DECLARATIVAS
CREATE TABLE G8_PESSOA (
    cpfPessoa  VARCHAR(11)  NOT NULL,
    nomePessoa VARCHAR(100) NOT NULL,
    senha      VARCHAR(25)  NOT NULL,
    CONSTRAINT G8_PESSOA_PK PRIMARY KEY (cpfPessoa)
);

CREATE TABLE G8_GERENTE (
    email VARCHAR(100) NOT NULL,
    cpfPessoa VARCHAR(11) NOT NULL,
    formacaoEscolar VARCHAR(50) NOT NULL,
    CONSTRAINT G8_GERENTE_PK PRIMARY KEY (email),
    CONSTRAINT G8_GERENTE_PESSOA_FK FOREIGN KEY (cpfPessoa) REFERENCES G8_PESSOA (cpfPessoa)
        ON DELETE CASCADE
);

CREATE TABLE G8_AREA (
    codArea NUMBER(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    CONSTRAINT G8_AREA_PK PRIMARY KEY (codArea),
    CONSTRAINT G8_AREA_GERENTE_FK FOREIGN KEY (email) REFERENCES G8_GERENTE (email)
		ON DELETE CASCADE
);

CREATE TABLE G8_EMPREGADO (
    matricula NUMBER(10) NOT NULL,
    cpfPessoa VARCHAR(11) NOT NULL,
    logradouro VARCHAR(20) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    complemento VARCHAR(20),
    CONSTRAINT G8_EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT G8_EMPREGADO_PESSOA_FK FOREIGN KEY (cpfPessoa) REFERENCES G8_PESSOA (cpfPessoa)
        ON DELETE CASCADE
);

CREATE TABLE G8_telefone (
    telefone VARCHAR(15) NOT NULL,
    matricula NUMBER(10) NOT NULL,
    CONSTRAINT G8_TELEFONE_PK PRIMARY KEY (telefone, matricula),
    CONSTRAINT G8_TELEFONE_EMPREGADO_FK FOREIGN KEY (matricula) REFERENCES G8_EMPREGADO (matricula)
);

CREATE TABLE G8_PRODUTO (
    codProduto   NUMBER(10)     NOT NULL,
    codArea NUMBER(10) NOT NULL,
    nomeProduto  VARCHAR2(100)  NOT NULL,
    precoProduto NUMBER(10,2)   NOT NULL,
    CONSTRAINT G8_PRODUTO_PK PRIMARY KEY (codProduto),
    CONSTRAINT G8_PRODUTO_AREA_FK FOREIGN KEY (codArea)
        REFERENCES G8_AREA (codArea),
    CONSTRAINT G8_PRODUTO_PRECO_CK CHECK (precoProduto > 0)
);

CREATE TABLE G8_VENDA (
    codVenda   NUMBER(10)   NOT NULL,
    dataVenda  DATE         NOT NULL,
    matricula  NUMBER(10) NOT NULL,
    CONSTRAINT G8_VENDA_PK PRIMARY KEY (codVenda),
    CONSTRAINT G8_VENDA_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES G8_EMPREGADO (matricula)
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
