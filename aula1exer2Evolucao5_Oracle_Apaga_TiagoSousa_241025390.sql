-- === << aula1exer2Evolucao5 >> ===
--
--   SCRIPT DE APAGA (DDL)
--
-- Data Criacao ...........: 19/10/2026
-- Autor(es) ..............: Rodrigo Orlandi, Beatriz Santos, Yasmin Sousa Abdon, Tiago Geovane da Silva Sousa,  Vitor Ricardo Moretti de Souza 
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: VRVR
--
-- PROJETO => 04 Sequences, 
--            08 Tabelas 
--            01 Visao (View)
--
-- ULTIMAS ATUALIZACOES
--  18/10/2026 => Adição do drop das tabelas e sequences referentes a PARTE 1 (Pessoa, Perfis, Areas).
--  02/10/2026 => Migracao da solucao do MySQL 8.0 para Oracle APEX.
--             => Implementacao exclusiva da PARTE 2 (Vendas, Itens de Venda, Produtos).
--             => Substituicao de AUTO_INCREMENT por SEQUENCE (G8_SEQ_PRODUTO e G8_SEQ_VENDA).
--             => Adequacao de tipos de dados para padrao Oracle (VARCHAR2, NUMBER).
--             => Aplicacao de assinatura G8_ em todos os identificadores de objetos.
--             => Adição da Remoção de View ao script
-- -----------------------------------------------------------------
-- 1. REMOCAO DE VISOES (VIEWS)
DROP VIEW G8_VW_QTD_VENDIDA_PRODUTO;


-- 2. REMOCAO DE TABELAS (Ordem reversa de dependencia de FK)
DROP TABLE G8_CONTEM CASCADE CONSTRAINTS;
DROP TABLE G8_VENDA CASCADE CONSTRAINTS;
DROP TABLE G8_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE G8_telefone CASCADE CONSTRAINTS;
DROP TABLE G8_EMPREGADO CASCADE CONSTRAINTS;
DROP TABLE G8_AREA CASCADE CONSTRAINTS;
DROP TABLE G8_GERENTE CASCADE CONSTRAINTS;
DROP TABLE G8_PESSOA CASCADE CONSTRAINTS;

-- 3. REMOCAO DE SEQUENCES
DROP SEQUENCE G8_SEQ_CODAREA_AREA;
DROP SEQUENCE G8_SEQ_MATRICULA_EMPREGADO;
DROP SEQUENCE G8_SEQ_VENDA;
DROP SEQUENCE G8_SEQ_PRODUTO;