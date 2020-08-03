/*OPERADOR LÓGICO NOT
O operador lógico NOT, grosso modo, inverte a lógica da expressão booleana, negando a mesma.
SINTAXE: NOT expressãoBooleana
Retorna a negação da expressõa booleana.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Department
WHERE GroupName = 'Sales and Marketing'
ORDER BY GroupName;
/*Essa query irá retornar todos os setores que fazem parte do grupo de Vendas e Marketing(Sales and Marketing), porém se adicionarmos
o operador lógico NOT.
*/
SELECT *
FROM AdventureWorks2017.HumanResources.Department
WHERE NOT GroupName = 'Sales and Marketing';
/*A query irá retornar todos setores que NÃO fazem parte do grupo de Vendas e Marketing
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE NOT StandardCost > 1000
ORDER BY StandardCost;
/*Essa query irá retornar todos os produtos cujo o preço padrão (StandardCost) NÃO é maior do que 1000
*/


SELECT *
FROM AdventureWorks2017.Sales.SalesTaxRate
WHERE NOT TaxRate < 10
ORDER BY TaxRate;
/*Nessa query o NOT está sendo usado para selecionar todos os locais da tabela SalesTaxRate (Taxa de Imposto sobre Vendas) onde 
o TaxRate(Taxa de Imposto) NÃO é maior do que 10.
*/