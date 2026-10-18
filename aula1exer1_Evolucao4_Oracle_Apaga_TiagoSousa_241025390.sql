-- === << aula1exer1_Evolucao4_Oracle >> ===
--
--   SCRIPT DE APAGA (DDL)
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

-- 1. REMOCAO DE TABELAS (Ordem reversa de dependencia de FK)
DROP TABLE TGSS_CONTEM CASCADE CONSTRAINTS;
DROP TABLE TGSS_VENDA CASCADE CONSTRAINTS;
DROP TABLE TGSS_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE TGSS_EMPREGADO CASCADE CONSTRAINTS;

-- 2. REMOCAO DE SEQUENCES
DROP SEQUENCE TGSS_SEQ_VENDA;
DROP SEQUENCE TGSS_SEQ_PRODUTO;
