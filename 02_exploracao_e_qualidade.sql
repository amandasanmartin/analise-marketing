
-- TESTES DE QUALIDADE DE DADOS 


-- Verificar se existem leads duplicados no funil de marketing
SELECT mql_id, COUNT(mql_id)
FROM staging.tb_funil_marketing
GROUP BY mql_id
HAVING COUNT(mql_id) > 1;

-- Validar anomalias financeiras (Preços zerados ou negativos)
SELECT price    
FROM staging.tb_itens_faturados
WHERE price <= 0;

-- EXPLORAÇÃO INICIAL DE NEGÓCIOS

--  Contagem de leads agrupada por perfil comportamental
SELECT 
    lead_behaviour_profile, 
    COUNT(mql_id) AS total_de_leads
FROM staging.tb_negocios_fechados
GROUP BY lead_behaviour_profile
ORDER BY total_de_leads DESC;