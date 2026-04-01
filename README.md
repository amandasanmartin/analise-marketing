# Olist E-commerce: Análise End-to-End (Do Marketing ao Faturamento)

<img width="728" height="394" alt="image" src="https://github.com/user-attachments/assets/00a01e6f-4294-4636-8278-583e2c121516" />


##  O Problema de Negócio
Muitas empresas operam em silos: o time de Marketing foca em atrair leads, o time de Vendas foca em assinar contratos, e o Financeiro olha apenas para a receita final. O problema desse modelo é o **Ponto Cego do ROI (Retorno sobre Investimento)**. 

O desafio deste projeto foi integrar dados isolados da Olist (maior loja de departamentos dos marketplaces brasileiros) para responder a uma pergunta central: **"Qual canal de marketing e qual perfil de lojista trazem o maior retorno financeiro real para a empresa?"**

##  Objetivo do Projeto
Construir um pipeline de dados completo (End-to-End) que rastreia a jornada do cliente desde o primeiro clique no site (captação do lead) até a entrega final do produto logístico, identificando gargalos operacionais e o Perfil de Cliente Ideal (ICP).

##  Tecnologias e Arquitetura (Tech Stack)
* **Python (Pandas, SQLAlchemy):** Extração via API (Kaggle) e Carga (Load) dos dados brutos no banco de dados.
* **PostgreSQL (SQL):** Modelagem Relacional (Primary/Foreign Keys), Data Quality e Transformação de Dados (ETL/ELT).
* **Power BI & DAX:** Visualização de dados, modelagem tabular, inteligência de tempo e design UI/UX em formato "Soft Dark".

---

## Estrutura do Repositório e Pipeline (ETL)

O projeto foi construído seguindo as melhores práticas de Engenharia e Análise de Dados, dividido em 4 etapas principais:

1. **`olist.ipynb` (Camada Raw/Staging):** Script em Python responsável por baixar os múltiplos datasets do Kaggle, conectar ao PostgreSQL via SQLAlchemy e realizar a carga bruta dos dados no esquema `staging`.
2. **`01_arquitetura_e_chaves.sql` (Modelagem):** Definição rigorosa de Primary Keys e Foreign Keys para garantir a integridade relacional entre o Funil de Marketing, CRM de Vendas e Sistema de Faturamento/Logística.
3. **`02_exploracao_e_qualidade_dados.sql` (Data Quality):** Testes de integridade (Due Diligence) para identificar anomalias, leads duplicados e inconsistências financeiras antes da modelagem final.
4. **`03_etl_criacao_views_silver.sql` (Camada Silver):** Criação das regras de negócio. Uso de funções avançadas (`COALESCE`, `SPLIT_PART`, `CAST`) para tratamento de nulos, higienização de strings e padronização semântica, deixando os dados prontos para consumo no Power BI.
5. ** `Dashboard_Olist_Executivo.pbix` (Dashboard)
---

## Principais Insights e Decisões Estratégicas

A análise do Dashboard Executivo revelou três grandes oportunidades de otimização para a companhia:

1. ** Furo na Governança de Dados (CRM):** Cerca de 1/3 da receita e centenas de leads estão classificados com perfil e origem "Desconhecidos". Os contratos estão sendo fechados sem preencher os dados no sistema, o que cega o Marketing. **Ação:** Tornar os campos de origem e perfil obrigatórios no CRM.
2. ** Gargalo no Fluxo de Caixa (Ciclo de 50 dias):** O ciclo comercial médio é de 36 dias para fechar contrato, somado a quase 14 dias de logística. São 50 dias entre o esforço de marketing e a entrega. **Ação:** Investir em réguas de automação de e-mail para "esquentar" os leads mais rápido e reduzir o Custo de Aquisição (CAC).
3. ** O Cliente Ideal (ICP) Confirmado:** Lojistas classificados como Revendedores (*Resellers*) com perfil comercial independente (*Cat*) dominam completamente o faturamento gerado. **Ação:** O marketing deve direcionar o orçamento de Tráfego Pago (que possui a maior receita por lead) especificamente para atrair esse nicho.

---

## Autora
**Amanda San Martin** *Data Analyst* https://linkedin/in/amanda-san-martin | https://amanda-data-tales.lovable.app/
