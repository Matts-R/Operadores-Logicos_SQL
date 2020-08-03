/*OPERADOR L�GICO NOT
O operador l�gico NOT, grosso modo, inverte a l�gica da express�o booleana, negando a mesma.
SINTAXE: NOT express�oBooleana
Retorna a nega��o da express�a booleana.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Department
WHERE GroupName = 'Sales and Marketing'
ORDER BY GroupName;
/*Essa query ir� retornar todos os setores que fazem parte do grupo de Vendas e Marketing(Sales and Marketing), por�m se adicionarmos
o operador l�gico NOT.
*/
SELECT *
FROM AdventureWorks2017.HumanResources.Department
WHERE NOT GroupName = 'Sales and Marketing';
/*A query ir� retornar todos setores que N�O fazem parte do grupo de Vendas e Marketing
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE NOT StandardCost > 1000
ORDER BY StandardCost;
/*Essa query ir� retornar todos os produtos cujo o pre�o padr�o (StandardCost) N�O � maior do que 1000
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesTaxRate
WHERE NOT TaxRate < 10
ORDER BY TaxRate;
/*Nessa query o NOT est� sendo usado para selecionar todos os locais da tabela SalesTaxRate (Taxa de Imposto sobre Vendas) onde 
o TaxRate(Taxa de Imposto) N�O � maior do que 10.
*/