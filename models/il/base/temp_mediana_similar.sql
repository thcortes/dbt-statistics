    SELECT
        A.cnpj_loja,
        A.id_similar,
        A.preco,
        A.tkt_item,
        A.fat_item,
        A.qtd_item,
        B.Preco_medio,									
		B.Preco_minimo,
        B.Cont,
        A.Ordem,
        CASE WHEN MOD(B.Cont, 2) = 1 THEN CASE WHEN (B.Cont + 1) / 2 = A.ORDEM THEN 1 ELSE 0 END ELSE CASE WHEN ((B.Cont) / 2 = A.ORDEM)
        or (((B.Cont) / 2) + 1 = A.ORDEM) THEN 0.5 ELSE 0 END END AS MEDIANA
    FROM
		{{ref('temp_base_sellout_similar')}} A
        LEFT JOIN {{ref('temp_cont_mediana_similar')}} B ON A.Cnpj_loja = B.Cnpj_loja
        AND A.id_similar = B.id_similar