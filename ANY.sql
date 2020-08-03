/*EXEMPLO DE USO DO OPERADOR LÓGICO ANY/SOME
O operador lógico ANY e SOME possuem a mesma função, sendo assim equivalentes, ambos realizam uma comparação envolvendo a 
coluna dada com a lista de valores retornados pela subQuery.
SINTAXE: coluna + operadorDeComparação(=,<>,>,>=,<,<=) + ANY + (subQuery)
Semelhante a execução do operador ALL, o ANY retorna TRUE e exibe como resultado, caso a linha da coluna selecionada ao 
ser comparada com todos os valores da subQuery satisfaça a condição dada pelo operador de comparação pelo menos uma única vez, 
e assim continua até que todos os valores da coluna tenha sido comparados.
*/


--ESSE É UM EXEMPLO SIMPLES PORÉM PERFEITO PARA SE ENTENDER O FUNCIONAMENTO DO ALL.
SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > ANY (
	SELECT ListPrice
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY ListPrice, Name;
/*A comparação é feita da seguinte maneira, é avaliada cada linha da coluna selecionada com o operador de comparação,
que nesse caso foi o maior que, e se o valor dessa linha for maior do que QUALQUER valor retornado pela subquery,
então o teste retorna TRUE, o produto é exibido e o teste passa a ser realizado na linha seguinte, realizando esse 
processo até que todos os valores da coluna tenha sido avaliados.
Nesse exemplo o único produto ou produtos que não seriam retornados, seriam os produtos com menor preço(que nessa tabela é zero),
isso porque eles não possuem o preço maior do qualquer outro produto.
Da mesma maneira, se o operador de comparação fosse menor que(<), os produtos retornados seriam todos cujo o preço fosse menor do que 3578,27,
que nessa tabela é o preço mais alto, pois se esse é o maior preço, e logicamente nenhum outro produto poderia seria menor do que esse.
*/


SELECT*
FROM AdventureWorks2017.Production.Product
WHERE ProductID = ANY (
	SELECT ProductID
	FROM AdventureWorks2017.Production.ProductInventory
	WHERE Quantity > 550
	)
ORDER BY Name;
/*Nesse exemplo foi usada a coluna ProductID como paramêtro para relacionar as duas tabelas, onde estamos comparando os ID's de ambas
para identificar os produtos que possuem um ID igual a qualquer ID da tabela ProductInventory(Inventário dos Pordutos) e uma quantidade em estoque 
superior à 550 unidades
*/


SELECT * 
FROM AdventureWorks2017.Production.Product PRODUTO
WHERE ProductID = SOME ( --Utilizei o SOME aqui para demonstrar como ambos são equivalentes 
	SELECT ProductID
	FROM AdventureWorks2017.Production.ProductReview
	WHERE Comments IS NOT NULL)
ORDER BY ProductID;
/*Nesse exemplo foi usada a coluna ProductID como paramêtro para relacionar as duas tabelas, onde estamos comparando os ID's de ambas
para identificar os produtos que possuem um ID igual a qualquer ID da tabela ProductReview(Revisão dos Produtos) e selecionando os valores 
não nulos da coluna comment através da condição IS NOT NULL, dessa maneira pegamos somente os produtos que possuem comentários registrados.
*/