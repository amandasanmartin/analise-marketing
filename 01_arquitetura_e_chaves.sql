-- Criação do Schema para a camada limpa (Silver)
CREATE SCHEMA silver;


--  1: DEFININDO AS CHAVES PRIMÁRIAS


ALTER TABLE staging.tb_funil_marketing ADD PRIMARY KEY (mql_id);


ALTER TABLE staging.tb_negocios_fechados ADD PRIMARY KEY (mql_id);


ALTER TABLE staging.tb_negocios_fechados ADD CONSTRAINT unique_seller UNIQUE (seller_id);


ALTER TABLE staging.tb_status_pedidos ADD PRIMARY KEY (order_id);


ALTER TABLE staging.tb_itens_faturados ADD PRIMARY KEY (order_id, order_item_id);



--  2: DEFININDO AS CHAVES ESTRANGEIRAS (Relacionamentos)


-- A. Ligação da tabela de Contratos de volta ao Funil de Marketing (via mql_id)
ALTER TABLE staging.tb_negocios_fechados
ADD CONSTRAINT fk_funil FOREIGN KEY (mql_id) REFERENCES staging.tb_funil_marketing (mql_id);

-- B. Ligação da tabela de Vendas/Faturamento aos Contratos Fechados (via seller_id)
ALTER TABLE staging.tb_itens_faturados
ADD CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES staging.tb_negocios_fechados (seller_id);

-- C. Ligação da tabela de Vendas/Faturamento ao Status do Pedido (via order_id)
ALTER TABLE staging.tb_itens_faturados
ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES staging.tb_status_pedidos (order_id);




