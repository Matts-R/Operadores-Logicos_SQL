/*OPERADOR L�GICO ALL
O operador l�gico ALL faz uma compara��o envolvendo a coluna dada com a lista de valores
retornados pela subquery.
SINTAXE: colunaASerComparada + operadorDeCompara��o(=,<>,>,>=,<,<=) + ALL + (subQuery)
� retornado TRUE e exibido no resultado, caso a linha da coluna selecionada ao ser comparada 
com todos os valores da subQuery satisfa�am a condi��o dada pelo operador de compara��o, e assim continua at� 
que todos os valores da coluna tenha sido comparados.	 
*/

--ESSE � UM EXEMPLO SIMPLES POR�M PERFEITO PARA SE ENTENDER O FUNCIONAMENTO DO ALL.
SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice >= ALL (
	SELECT ListPrice
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY ListPrice, Name;
/*A compara��o � feita da seguinte maneira, � avaliada cada linha da coluna selecionada com o operador de compara��o,
que nesse caso foi o maior ou igual que, e se o valor dessa linha for maior ou igual do que TODOS os valores 
retornados pela subquery, ent�o o teste retorna TRUE, o produto � exibido e o teste passa a ser realizado na linha seguinte,
realizando esse processo at� que todos os valores da coluna tenha sido avaliados.
Nesse exemplo o �nico produto ou produtos que seriam retornados, seriam os produtos com o maior pre�o, isso porque eles s�o
os �nicos que possuem pre�os maiores ou igual do que todos os outros, satisfazendo assim a condi��o.
Da mesma maneira, se o operador de compara��o fosse menor ou igual que, os produtos retornados seriam somente aqueles cujo pre�o 
forem igual a zero (esse � o menor pre�o dessa tabela), pois eles seriam os �nicos produtos que quando comparados, seriam menor ou 
igual do que TODOS.*/


SELECT *
FROM  AdventureWorks2017.Production.Product
WHERE ListPrice < all (
	SELECT StandardCost 
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY Name;
/*Nesse exemplo foram selecionados somente os produtos cujo pre�o � maior do que o custo padr�o de todos os produtos
e em seguida ordenados pelo nome.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Employee
WHERE VacationHours < ALL (
	SELECT AVG (VacationHours)
	FROM AdventureWorks2017.HumanResources.Employee)
ORDER BY VacationHours;
/*Nesse exemplo usei a fun��o AVG(), que serve para calcular o valor m�dio de uma coluna num�rica, para obter a m�dia do tempo
de f�rias dos funcion�rios e o operador de compara��o menor que, em conjunto com o ALL, para visualizar todos os funcion�rios que 
tiraram f�rias inferiores � m�dia da empresa e foram ordenados pelo seu respectivo tempo de f�rias.
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesPerson
WHERE SalesLastYear >= ALL(
	SELECT AVG(SalesLastYear)
	FROM AdventureWorks2017.Sales.SalesPerson)
ORDER BY Bonus, CommissionPct;
/*Aqui foi selecionado todos os vendedores cuja as vendas no ano passado superaram a m�dia de vendas e em seguida foram 
ordenados pelo B�nus que receberam e caso algum vendedor tenha recebido b�nus igual ao de outro, a porcetagem de de comiss�o
foi usada como segundo crit�rio de ordem.
*/