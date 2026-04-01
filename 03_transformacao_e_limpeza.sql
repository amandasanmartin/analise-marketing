
-- CRIAÇÃO DA CAMADA SILVER (DADOS LIMPOS E PADRONIZADOS)

-- VIEW 1: Limpeza do Funil de Marketing
CREATE OR REPLACE VIEW silver.vw_funil_limpo AS
SELECT 
    mql_id,
    CAST(first_contact_date AS DATE) AS data_contato,
    landing_page_id,
    origin
FROM staging.tb_funil_marketing
WHERE origin IS NOT NULL;


-- VIEW 2: Limpeza e Tratamento de Negócios Fechados
CREATE OR REPLACE VIEW silver.vw_negocios_limpo AS
SELECT 
    mql_id,
    seller_id,
    sdr_id,
    sr_id,
    CAST(won_date AS TIMESTAMP) AS data_fechamento,
    
    -- Tratamento dos nulos nas categorias estruturais
    COALESCE(business_segment, 'Desconhecido') AS segmento_negocio,
    COALESCE(lead_type, 'Desconhecido') AS tipo_lead,
    COALESCE(business_type, 'Desconhecido') AS tipo_negocio,
    
    -- Separação da vírgula e remoção dos nulos para o Perfil
    COALESCE(SPLIT_PART(lead_behaviour_profile, ',', 1), 'Desconhecido') AS perfil_comportamental,
    
    -- Colunas booleanas mantidas
    has_company,
    has_gtin,
    average_stock,
    declared_product_catalog_size,
    declared_monthly_revenue
FROM staging.tb_negocios_fechados;


-- VIEW 3: Limpeza de Status de Pedidos (Regra: Apenas pedidos entregues e válidos)
CREATE OR REPLACE VIEW silver.vw_status_pedidos_limpo AS
SELECT 
    order_id AS id_pedido,
    order_status AS status_pedido,
    CAST(order_purchase_timestamp AS TIMESTAMP) AS data_compra,
    CAST(order_delivered_customer_date AS TIMESTAMP) AS data_entrega
FROM staging.tb_status_pedidos
WHERE order_status = 'delivered' 
  AND order_delivered_customer_date IS NOT NULL
  AND CAST(order_delivered_customer_date AS TIMESTAMP) >= CAST(order_purchase_timestamp AS TIMESTAMP);


-- VIEW 4: Padronização da Tabela de Faturamento (Tradução e Renomeação)
CREATE OR REPLACE VIEW silver.vw_itens_faturados_limpo AS
SELECT 
    order_id AS id_pedido,
    order_item_id AS id_item_pedido,
    product_id AS id_produto,
    seller_id,
    price AS preco_produto,
    freight_value AS valor_frete
FROM staging.tb_itens_faturados;