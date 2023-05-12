SELECT
    t2.seller_id
,   cast(round(t3.idade_base) as integer) as idade_base_dia
,   1 + cast(round(t3.idade_base) / 30 as integer) as idade_base_mes 
,   cast( julianday('2017-04-01') - julianday(max( t1.order_approved_at)) as integer) as qtd_dias_ult_venda

,   count( distinct strftime('%m', t1.order_approved_at)) as qtd_mes_ativacao
,   cast(count( distinct strftime('%m', t1.order_approved_at)) as float) /  cast(min(1 + round(t3.idade_base) / 30, 6) as integer) as prop_ativacao
,   sum(t2.price) as receita_total
,   count( distinct t2.order_id) as qtd_vendas
,   sum(t2.price) / count( distinct t2.order_id) as avg_vl_venda
,   sum(t2.price) /  cast(min(1 + round(t3.idade_base) / 30, 6) as integer) as avg_vl_venda_mes
,   sum(t2.price) / count( distinct strftime('%m', t1.order_approved_at)) as avg_vl_venda_mes_Ativado
,   sum(t2.price) / count(t2.product_id) as avg_vl_produto
,   count(t2.product_id) as qtd_produto
,   count(t2.product_id) / count( distinct t2.order_id) as avg_qtd_produto_venda
,   count(distinct t2.product_id) as qtd_produto_dist

,   sum(case when product_category_name = 'alimentos' then 1 else 0 end) as prod_alimentos
,   sum(case when product_category_name = 'agro_industria_e_comercio' then 1 else 0 end) as prod_agro_industria_e_comercio
,   sum(case when product_category_name = 'alimentos_bebidas' then 1 else 0 end) as prod_alimentos_bebidas
,   sum(case when product_category_name = 'artes' then 1 else 0 end) as prod_artes
,   sum(case when product_category_name = 'artes_e_artesanato' then 1 else 0 end) as prod_artes_e_artesanato
,   sum(case when product_category_name = 'artigos_de_festas' then 1 else 0 end) as prod_artigos_de_festas
,   sum(case when product_category_name = 'artigos_de_natal' then 1 else 0 end) as prod_artigos_de_natal
,   sum(case when product_category_name = 'audio' then 1 else 0 end) as prod_audio
,   sum(case when product_category_name = 'automotivo' then 1 else 0 end) as prod_automotivo
,   sum(case when product_category_name = 'bebes' then 1 else 0 end) as prod_bebes
,   sum(case when product_category_name = 'bebidas' then 1 else 0 end) as prod_bebidas
,   sum(case when product_category_name = 'beleza_saude' then 1 else 0 end) as prod_beleza_saude
,   sum(case when product_category_name = 'brinquedos' then 1 else 0 end) as prod_brinquedos
,   sum(case when product_category_name = 'cama_mesa_banho' then 1 else 0 end) as prod_cama_mesa_banho
,   sum(case when product_category_name = 'casa_conforto' then 1 else 0 end) as prod_casa_conforto
,   sum(case when product_category_name = 'casa_conforto_2' then 1 else 0 end) as prod_casa_conforto_2
,   sum(case when product_category_name = 'casa_construcao' then 1 else 0 end) as prod_casa_construcao
,   sum(case when product_category_name = 'cds_dvds_musicais' then 1 else 0 end) as prod_cds_dvds_musicais
,   sum(case when product_category_name = 'cine_foto' then 1 else 0 end) as prod_cine_foto
,   sum(case when product_category_name = 'climatizacao' then 1 else 0 end) as prod_climatizacao
,   sum(case when product_category_name = 'consoles_games' then 1 else 0 end) as prod_consoles_games
,   sum(case when product_category_name = 'construcao_ferramentas_construcao' then 1 else 0 end) as prod_construcao_ferramentas_construcao
,   sum(case when product_category_name = 'construcao_ferramentas_ferramentas' then 1 else 0 end) as prod_construcao_ferramentas_ferramentas
,   sum(case when product_category_name = 'construcao_ferramentas_iluminacao' then 1 else 0 end) as prod_construcao_ferramentas_iluminacao
,   sum(case when product_category_name = 'construcao_ferramentas_jardim' then 1 else 0 end) as prod_construcao_ferramentas_jardim
,   sum(case when product_category_name = 'construcao_ferramentas_seguranca' then 1 else 0 end) as prod_construcao_ferramentas_seguranca
,   sum(case when product_category_name = 'cool_stuff' then 1 else 0 end) as prod_cool_stuff
,   sum(case when product_category_name = 'dvds_blu_ray' then 1 else 0 end) as prod_dvds_blu_ray
,   sum(case when product_category_name = 'eletrodomesticos' then 1 else 0 end) as prod_eletrodomesticos
,   sum(case when product_category_name = 'eletrodomesticos_2' then 1 else 0 end) as prod_eletrodomesticos_2
,   sum(case when product_category_name = 'eletronicos' then 1 else 0 end) as prod_eletronicos
,   sum(case when product_category_name = 'eletroportateis' then 1 else 0 end) as prod_eletroportateis
,   sum(case when product_category_name = 'esporte_lazer' then 1 else 0 end) as prod_esporte_lazer
,   sum(case when product_category_name = 'fashion_bolsas_e_acessorios' then 1 else 0 end) as prod_fashion_bolsas_e_acessorios
,   sum(case when product_category_name = 'fashion_calcados' then 1 else 0 end) as prod_fashion_calcados
,   sum(case when product_category_name = 'fashion_esporte' then 1 else 0 end) as prod_fashion_esporte
,   sum(case when product_category_name = 'fashion_roupa_feminina' then 1 else 0 end) as prod_fashion_roupa_feminina
,   sum(case when product_category_name = 'fashion_roupa_infanto_juvenil' then 1 else 0 end) as prod_fashion_roupa_infanto_juvenil
,   sum(case when product_category_name = 'fashion_roupa_masculina' then 1 else 0 end) as prod_fashion_roupa_masculina
,   sum(case when product_category_name = 'fashion_underwear_e_moda_praia' then 1 else 0 end) as prod_fashion_underwear_e_moda_praia
,   sum(case when product_category_name = 'ferramentas_jardim' then 1 else 0 end) as prod_ferramentas_jardim
,   sum(case when product_category_name = 'flores' then 1 else 0 end) as prod_flores
,   sum(case when product_category_name = 'fraldas_higiene' then 1 else 0 end) as prod_fraldas_higiene
,   sum(case when product_category_name = 'industria_comercio_e_negocios' then 1 else 0 end) as prod_industria_comercio_e_negocios
,   sum(case when product_category_name = 'informatica_acessorios' then 1 else 0 end) as prod_informatica_acessorios
,   sum(case when product_category_name = 'instrumentos_musicais' then 1 else 0 end) as prod_instrumentos_musicais
,   sum(case when product_category_name = 'la_cuisine' then 1 else 0 end) as prod_la_cuisine
,   sum(case when product_category_name = 'livros_importados' then 1 else 0 end) as prod_livros_importados
,   sum(case when product_category_name = 'livros_interesse_geral' then 1 else 0 end) as prod_livros_interesse_geral
,   sum(case when product_category_name = 'livros_tecnicos' then 1 else 0 end) as prod_livros_tecnicos
,   sum(case when product_category_name = 'malas_acessorios' then 1 else 0 end) as prod_malas_acessorios
,   sum(case when product_category_name = 'market_place' then 1 else 0 end) as prod_market_place
,   sum(case when product_category_name = 'moveis_colchao_e_estofado' then 1 else 0 end) as prod_moveis_colchao_e_estofado
,   sum(case when product_category_name = 'moveis_cozinha_area_de_servico_jantar_e_jardim' then 1 else 0 end) as prod_moveis_cozinha_area_de_servico_jantar_e_jardim
,   sum(case when product_category_name = 'moveis_decoracao' then 1 else 0 end) as prod_moveis_decoracao
,   sum(case when product_category_name = 'moveis_escritorio' then 1 else 0 end) as prod_moveis_escritorio
,   sum(case when product_category_name = 'moveis_quarto' then 1 else 0 end) as prod_moveis_quarto
,   sum(case when product_category_name = 'moveis_sala' then 1 else 0 end) as prod_moveis_sala
,   sum(case when product_category_name = 'musica' then 1 else 0 end) as prod_musica
,   sum(case when product_category_name = 'papelaria' then 1 else 0 end) as prod_papelaria
,   sum(case when product_category_name = 'pc_gamer' then 1 else 0 end) as prod_pc_gamer
,   sum(case when product_category_name = 'pcs' then 1 else 0 end) as prod_pcs
,   sum(case when product_category_name = 'perfumaria' then 1 else 0 end) as prod_perfumaria
,   sum(case when product_category_name = 'pet_shop' then 1 else 0 end) as prod_pet_shop
,   sum(case when product_category_name = 'portateis_casa_forno_e_cafe' then 1 else 0 end) as prod_portateis_casa_forno_e_cafe
,   sum(case when product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos' then 1 else 0 end) as prod_portateis_cozinha_e_preparadores_de_alimentos
,   sum(case when product_category_name = 'relogios_presentes' then 1 else 0 end) as prod_relogios_presentes
,   sum(case when product_category_name = 'seguros_e_servicos' then 1 else 0 end) as prod_seguros_e_servicos
,   sum(case when product_category_name = 'sinalizacao_e_seguranca' then 1 else 0 end) as prod_sinalizacao_e_seguranca
,   sum(case when product_category_name = 'tablets_impressao_imagem' then 1 else 0 end) as prod_tablets_impressao_imagem
,   sum(case when product_category_name = 'telefonia' then 1 else 0 end) as prod_telefonia
,   sum(case when product_category_name = 'telefonia_fixa' then 1 else 0 end) as prod_telefonia_fixa
,   sum(case when product_category_name = 'utilidades_domesticas' then 1 else 0 end) as prod_utilidades_domesticas   



FROM
    tb_orders AS t1 
LEFT JOIN 
    tb_order_items AS t2 ON t1.order_id = t2.order_id
LEFT JOIN
        (SELECT
        t2.seller_id
    ,   max(julianday('2017-04-01') - julianday(t1.order_approved_at)) as idade_base
    FROM
        tb_orders AS t1 
    LEFT JOIN 
        tb_order_items AS t2 ON t1.order_id = t2.order_id
    WHERE
        order_approved_at < '2017-04-01'
    AND
        order_status = 'delivered'
    GROUP BY 
        t2.seller_id
        ) AS t3 ON t2.seller_id = t3.seller_id
LEFT JOIN
    tb_products AS t4 ON t2.product_id = t4.product_id
WHERE
    order_approved_at BETWEEN '2016-10-01' AND '2017-04-01'
AND
    order_status = 'delivered'
GROUP BY 
    t2.seller_id