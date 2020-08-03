/*OPERADOR LÓGICO ALL
O operador lógico ALL faz uma comparação envolvendo a coluna dada com a lista de valores
retornados pela subquery.
SINTAXE: colunaASerComparada + operadorDeComparação(=,<>,>,>=,<,<=) + ALL + (subQuery)
É retornado TRUE e exibido no resultado, caso a linha da coluna selecionada ao ser comparada 
com todos os valores da subQuery satisfaçam a condição dada pelo operador de comparação, e assim continua até 
que todos os valores da coluna tenha sido comparados.	 
*/

--ESSE É UM EXEMPLO SIMPLES PORÉM PERFEITO PARA SE ENTENDER O FUNCIONAMENTO DO ALL.
SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice >= ALL (
	SELECT ListPrice
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY ListPrice, Name;
/*A comparação é feita da seguinte maneira, é avaliada cada linha da coluna selecionada com o operador de comparação,
que nesse caso foi o maior ou igual que, e se o valor dessa linha for maior ou igual do que TODOS os valores 
retornados pela subquery, então o teste retorna TRUE, o produto é exibido e o teste passa a ser realizado na linha seguinte,
realizando esse processo até que todos os valores da coluna tenha sido avaliados.
Nesse exemplo o único produto ou produtos que seriam retornados, seriam os produtos com o maior preço, isso porque eles são
os únicos que possuem preços maiores ou igual do que todos os outros, satisfazendo assim a condição.
Da mesma maneira, se o operador de comparação fosse menor ou igual que, os produtos retornados seriam somente aqueles cujo preço 
forem igual a zero (esse é o menor preço dessa tabela), pois eles seriam os únicos produtos que quando comparados, seriam menor ou 
igual do que TODOS.*/


SELECT *
FROM  AdventureWorks2017.Production.Product
WHERE ListPrice < all (
	SELECT StandardCost 
	FROM AdventureWorks2017.Production.Product
	)
ORDER BY Name;
/*Nesse exemplo foram selecionados somente os produtos cujo preço é maior do que o custo padrão de todos os produtos
e em seguida ordenados pelo nome.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Employee
WHERE VacationHours < ALL (
	SELECT AVG (VacationHours)
	FROM AdventureWorks2017.HumanResources.Employee)
ORDER BY VacationHours;
/*Nesse exemplo usei a função AVG(), que serve para calcular o valor médio de uma coluna numérica, para obter a média do tempo
de férias dos funcionários e o operador de comparação menor que, em conjunto com o ALL, para visualizar todos os funcionários que 
tiraram férias inferiores à média da empresa e foram ordenados pelo seu respectivo tempo de férias.
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesPerson
WHERE SalesLastYear >= ALL(
	SELECT AVG(SalesLastYear)
	FROM AdventureWorks2017.Sales.SalesPerson)
ORDER BY Bonus, CommissionPct;
/*Aqui foi selecionado todos os vendedores cuja as vendas no ano passado superaram a média de vendas e em seguida foram 
ordenados pelo Bônus que receberam e caso algum vendedor tenha recebido bônus igual ao de outro, a porcetagem de de comissão
foi usada como segundo critério de ordem.
*/