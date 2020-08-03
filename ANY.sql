/*EXEMPLO DE USO DO OPERADOR L�GICO ANY/SOME
O operador l�gico ANY e SOME possuem a mesma fun��o, sendo assim equivalentes, ambos realizam uma compara��o envolvendo a 
coluna dada com a lista de valores retornados pela subQuery.
SINTAXE: coluna + operadorDeCompara��o(=,<>,>,>=,<,<=) + ANY + (subQuery)
Semelhante a execu��o do operador ALL, o ANY retorna TRUE e exibe como resultado, caso a linha da coluna selecionada ao 
ser comparada com todos os valores da subQuery satisfa�a a condi��o dada pelo operador de compara��o pelo menos uma �nica vez, 
e assim continua at� que todos os valores da coluna tenha sido comparados.
*/


--ESSE � UM EXEMPLO SIMPLES POR�M PERFEITO PARA SE ENTENDER O FUNCIONAMENTO DO ALL.
SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > ANY (
	SELECT ListPrice
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY ListPrice, Name;
/*A compara��o � feita da seguinte maneira, � avaliada cada linha da coluna selecionada com o operador de compara��o,
que nesse caso foi o maior que, e se o valor dessa linha for maior do que QUALQUER valor retornado pela subquery,
ent�o o teste retorna TRUE, o produto � exibido e o teste passa a ser realizado na linha seguinte, realizando esse 
processo at� que todos os valores da coluna tenha sido avaliados.
Nesse exemplo o �nico produto ou produtos que n�o seriam retornados, seriam os produtos com menor pre�o(que nessa tabela � zero),
isso porque eles n�o possuem o pre�o maior do qualquer outro produto.
Da mesma maneira, se o operador de compara��o fosse menor que(<), os produtos retornados seriam todos cujo o pre�o fosse menor do que 3578,27,
que nessa tabela � o pre�o mais alto, pois se esse � o maior pre�o, e logicamente nenhum outro produto poderia seria menor do que esse.
*/


SELECT*
FROM AdventureWorks2017.Production.Product
WHERE ProductID = ANY (
	SELECT ProductID
	FROM AdventureWorks2017.Production.ProductInventory
	WHERE Quantity > 550
	)
ORDER BY Name;
/*Nesse exemplo foi usada a coluna ProductID como param�tro para relacionar as duas tabelas, onde estamos comparando os ID's de ambas
para identificar os produtos que possuem um ID igual a qualquer ID da tabela ProductInventory(Invent�rio dos Pordutos) e uma quantidade em estoque 
superior � 550 unidades
*/


SELECT * 
FROM AdventureWorks2017.Production.Product PRODUTO
WHERE ProductID = SOME ( --Utilizei o SOME aqui para demonstrar como ambos s�o equivalentes 
	SELECT ProductID
	FROM AdventureWorks2017.Production.ProductReview
	WHERE Comments IS NOT NULL)
ORDER BY ProductID;
/*Nesse exemplo foi usada a coluna ProductID como param�tro para relacionar as duas tabelas, onde estamos comparando os ID's de ambas
para identificar os produtos que possuem um ID igual a qualquer ID da tabela ProductReview(Revis�o dos Produtos) e selecionando os valores 
n�o nulos da coluna comment atrav�s da condi��o IS NOT NULL, dessa maneira pegamos somente os produtos que possuem coment�rios registrados.
*/