/*OPERADOR LÓGICO IN
O operador lógico IN possibilita verificar se o valor especificado é igual a qualquer valor da lista ou subQuery
SINTAXE: WHERE + coluna/expressão + IN + (lista/subQuery)
O IN retorna verdadeiro caso qualquer valor da coluna ou expressão seja igual a qualquer valor da lista ou subQuery.
O operador IN é equivalente ao uso de múltiplos operadores OR.
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode IN ('CA', 'FR');
/*Nesse exemplo o operador IN retorna todos os valores da tabela SalesTerritory onde o código da região do país (CountryRegionCode)
seja igual a CA ou FR.
A query abaixo exibiria o mesmo resultado
*/
SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode = 'CA' OR CountryRegionCode = 'FR';


SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode NOT IN ('CA', 'FR');
/*Usando o operador IN em conjunto com o operador lógico NOT, sua lógica de execução é mudada, passando a retornar todos os valores
que NÃO forem iguais a CA ou FR
*/


SELECT *
from AdventureWorks2017.Sales.Customer
WHERE TerritoryID IN (
	SELECT TerritoryID
	FROM AdventureWorks2017.Sales.SalesTerritory
	WHERE CountryRegionCode <> 'US')
ORDER BY TerritoryID;
/*Nesse exemplo foi usada a coluna TerritoryID para realizar uma interação com as duas tabelas, Sales.Custumer e Sales.SalesTeritory,
para poder ser exibido como resultado todos os clientes cujo CountryRegionCode (Código de Região do País) seja diferente de US, ou seja, 
todos os clientes que não residem nos Estados Unidos
*/