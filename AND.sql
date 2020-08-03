/*OPERADOR LÓGICO AND 
O operador lógico AND permite combinar duas ou mais expressões booleanas.
SINTAXE: expressãoBooleana + AND + expressãoBooleana
Todas as expressões booleanas são avaliadas e só retornam TRUE e exibem os resultados caso os mesmo atendam as "condições"
apresentadas por elas.
Quando se é usado mais de um operador lógico em uma query, o AND é o primeiro a ser avaliado, porém é possível alterar essa 
ordem usando parênteses
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > 2000 AND SafetyStockLevel > 800
ORDER BY Name;
/*Essa query retornará somente os produtos cujo preço seja maior do que 2000 E a quantidade de estoque de segurança seja maior do 800.
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > 2000 AND NOT SafetyStockLevel > 800
ORDER BY Name;
/*Usando o operador lógico NOT em conjunt com o AND, essa query retornará somente os produtos cujo preço seja maior do que 2000 E a quantidade de
estoque de segurança NÃO seja maior do 800.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M' AND SalariedFlag = 1
ORDER BY BusinessEntityID;
/*Usando dois ou mais AND's é possível estabelecer mais condições a serem impostas na query, nessa query serão retornados somente os funcionários 
que são solteiros(MaritalStatus), do sexo masculino(Gender) e que possuem a bandeira salarial 1(SalariedFlag).
*/