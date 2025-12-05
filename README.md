# Sistema de Controle de Depósito Industrial (MySQL)

Projeto de banco de dados relacional desenvolvido para gerenciar **estoque, produtos, fornecedores, localizações e movimentações** em um cenário de **depósito industrial**.  
O foco do projeto está em **modelagem de dados, integridade referencial, automação de regras de negócio, consultas analíticas e geração de relatórios**.

Projeto desenvolvido para fins de **aprendizado, portfólio e validação de boas práticas em SQL/MySQL**.

---

## 🎯 Objetivo do Projeto

Desenvolver uma base de dados capaz de:

- Controlar o estoque por **produto e localização**
- Impedir operações inválidas por meio de **triggers**
- Garantir **integridade referencial** com chaves estrangeiras
- Gerar **relatórios gerenciais por views**
- Simular movimentações reais de **entrada e saída de produtos**

---

## ✅ Funcionalidades

- Controle de estoque por produto e localização  
- Regras automáticas com **triggers**
- Integridade com **foreign keys** e **constraints**
- Relatórios gerados por **views**
- Validação de dados inconsistentes
- **Backup/Dump** do banco de dados
- Integração com **Python para geração de relatórios em Excel**

---

## ⚙️ Desafios Técnicos Resolvidos

- Bloqueio automático de movimentações que gerem estoque abaixo do mínimo
- Garantia da consistência dos dados entre tabelas relacionadas
- Criação de consultas analíticas para apoio à gestão
- Implementação de views para relatórios automatizados
- Estruturação de rotina de backup/dump
- Integração segura entre MySQL e Python (sem exposição de credenciais)

---

## ✅ Boas Práticas de DBA Aplicadas

- Uso de **PRIMARY KEY, FOREIGN KEY, UNIQUE e NOT NULL**
- **Normalização das tabelas**
- Triggers para validação em tempo real


## 👩‍💻 Autoria

Projeto desenvolvido por **Halina de Oliveira**  
Área de atuação: **DBA Júnior, Banco de Dados, SQL e Análise de Dados**  
Objetivo: **Primeiro projeto principal de portfólio na área de dados**
