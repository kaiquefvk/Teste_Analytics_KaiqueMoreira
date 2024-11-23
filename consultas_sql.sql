CREATE DATABASE analise; 
USE analise;

SELECT * 
FROM dados; 

ALTER TABLE dados 
MODIFY Data DATE; --- Alteração do tipo de dados
--- * Alteração do tipo de dados

ALTER TABLE dados ADD Total_da_Venda FLOAT 
GENERATED ALWAYS AS (Quantidade * Preço) STORED;
--- * Criação da coluna "Total_da_Venda" como um campo calculado automático, o "stored" armazena o valor gerado no banco de dados

SELECT 
Produto,
Categoria,
SUM(Total_da_Venda) AS Total_por_Produto
FROM dados
GROUP BY Produto, Categoria
ORDER BY Total_por_Produto DESC;
--- * Nessa linha, eu trago e agrupo os Produtos juntamente com sua Categoria e faço a criação de uma coluna 
--- resultada pela soma total de cada produto ao longo do ano em ordem decrescente

SELECT 
Produto,
Categoria,
SUM(Total_da_Venda) AS Receita_por_Produto_Junho
FROM dados
WHERE MONTH (Data) = 6 AND YEAR(Data) = 2023
GROUP BY Produto, Categoria
ORDER BY Receita_por_Produto_Junho ASC; 
--- * Aqui há uma análise para ver como foram as vendas, no quesito receita, dos produto no mês de junho em ordem decrescente.
--- O filtro para trazer esses dados referente ao mês de junho, é feito a partir de um "where".
--- * Os 3 Produtos com menor RECEITA em junho foram: Teclado, Mouse Pad e Mouse

SELECT 
Produto,
Categoria,
SUM(Quantidade) AS Quantidade_por_Produto_Junho
FROM dados
WHERE MONTH (Data) = 6 AND YEAR(Data) = 2023
GROUP BY Produto, Categoria
ORDER BY Quantidade_por_Produto_Junho ASC; 
--- * Aqui há uma análise para ver como foram as vendas, no quesito quantidade, dos produto no mês de junho em ordem decrescente.
--- O filtro para trazer esses dados referente ao mês de junho, é feito a partir de um "where".
--- * Os 3 Produtos com menor QUANTIDADE vendida em junho foram: Teclado, Mouse Pad e Mouse










