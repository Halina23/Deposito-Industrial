# Depósito Industrial — Fase 2: Volume, Performance e Operação

## Objetivo

Esta fase do projeto tem foco **operacional**, simulando um cenário real de atuação de **DBA** com **grande volume de dados**. O objetivo é trabalhar performance, segurança, disponibilidade e monitoramento diretamente no banco.

---

## Geração de volume

Foram criadas **procedures de carga automática** para popular as tabelas:

* `produtos`
* `entrada`
* `saidas`
* `transferencias`

Essas procedures existem apenas para **ambiente de teste/homologação**, permitindo:

* simular crescimento real
* repetir cenários de teste
* expor gargalos de performance

---

## Performance e uso de índices

Com o volume gerado, foi possível analisar queries reais utilizando `EXPLAIN` e `EXPLAIN ANALYZE`. Mesmo sem degradação significativa de tempo no ambiente local, alguns planos de execução apresentaram **full table scan**, o que indica impacto potencial à medida que o volume cresce.

Foi criado um **índice de forma intencional e demonstrativa**, com o objetivo de exemplificar o uso correto desse recurso e documentar o processo de análise, e não apenas reagir a lentidão imediata.

A tabela escolhida foi **`produtos`**, por ser considerada a tabela mais consultada do cenário (referência para entradas, saídas e transferências). Em sistemas reais, esse tipo de tabela costuma participar de múltiplos JOINs e consultas frequentes, o que justifica a decisão.

O foco foi demonstrar:

* leitura de plano de execução
* decisão consciente de criação de índice
* preocupação com escalabilidade futura

O índice foi criado com base no padrão de acesso esperado, e não apenas no volume atual.

---

## Segurança

Regras críticas foram aplicadas no nível do banco:

* uso de **triggers** para restringir funcionários autorizados a realizar transferências


---

## Disponibilidade e monitoramento

O projeto permite trabalhar conceitos de:

* backup e restore
* recuperação de dados
* impacto de carga contínua
* identificação de queries lentas

---

## Conclusão

Este projeto demonstra atuação prática de DBA em ambiente com dados em escala, cobrindo geração de volume, análise de performance, aplicação de segurança e conceitos operacionais essenciais.

## Responsabilidades de DBA abordadas no projeto

* **Performance**: análise de consultas, leitura de plano de execução (`EXPLAIN`) e criação consciente de índices visando escalabilidade.
* **Segurança**: controle de acesso por regras de negócio, uso de triggers e restrição de operações sensíveis a usuários específicos.
* **Disponibilidade**: estratégias de backup, possibilidade de restauração e preocupação com continuidade do serviço.
* **Monitoramento**: observação de comportamento das consultas, impacto do volume e identificação de pontos críticos.
* **Automação**: uso de procedures para geração de dados em massa e simulação de cenários reais.
* **Governança de dados**: padronização de estrutura, definição clara de responsabilidades e regras sobre movimentação de dados.
* **Documentação técnica**: registro das decisões tomadas, justificativas e objetivos, facilitando manutenção e entendimento futuro.
