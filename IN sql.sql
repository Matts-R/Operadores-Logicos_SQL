/*OPERADOR L�GICO IN
O operador l�gico IN possibilita verificar se o valor especificado � igual a qualquer valor da lista ou subQuery
SINTAXE: WHERE + coluna/express�o + IN + (lista/subQuery)
O IN retorna verdadeiro caso qualquer valor da coluna ou express�o seja igual a qualquer valor da lista ou subQuery.
O operador IN � equivalente ao uso de m�ltiplos operadores OR.
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode IN ('CA', 'FR');
/*Nesse exemplo o operador IN retorna todos os valores da tabela SalesTerritory onde o c�digo da regi�o do pa�s (CountryRegionCode)
seja igual a CA ou FR.
A query abaixo exibiria o mesmo resultado
*/
SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode = 'CA' OR CountryRegionCode = 'FR';


SELECT *
FROM AdventureWorks2017.Sales.SalesTerritory
WHERE CountryRegionCode NOT IN ('CA', 'FR');
/*Usando o operador IN em conjunto com o operador l�gico NOT, sua l�gica de execu��o � mudada, passando a retornar todos os valores
que N�O forem iguais a CA ou FR
*/


SELECT *
from AdventureWorks2017.Sales.Customer
WHERE TerritoryID IN (
	SELECT TerritoryID
	FROM AdventureWorks2017.Sales.SalesTerritory
	WHERE CountryRegionCode <> 'US')
ORDER BY TerritoryID;
/*Nesse exemplo foi usada a coluna TerritoryID para realizar uma intera��o com as duas tabelas, Sales.Custumer e Sales.SalesTeritory,
para poder ser exibido como resultado todos os clientes cujo CountryRegionCode (C�digo de Regi�o do Pa�s) seja diferente de US, ou seja, 
todos os clientes que n�o residem nos Estados Unidos
*/