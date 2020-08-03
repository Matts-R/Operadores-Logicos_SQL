/*OPERADOR L�GICO AND 
O operador l�gico AND permite combinar duas ou mais express�es booleanas.
SINTAXE: express�oBooleana + AND + express�oBooleana
Todas as express�es booleanas s�o avaliadas e s� retornam TRUE e exibem os resultados caso os mesmo atendam as "condi��es"
apresentadas por elas.
Quando se � usado mais de um operador l�gico em uma query, o AND � o primeiro a ser avaliado, por�m � poss�vel alterar essa 
ordem usando par�nteses
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > 2000 AND SafetyStockLevel > 800
ORDER BY Name;
/*Essa query retornar� somente os produtos cujo pre�o seja maior do que 2000 E a quantidade de estoque de seguran�a seja maior do 800.
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE ListPrice > 2000 AND NOT SafetyStockLevel > 800
ORDER BY Name;
/*Usando o operador l�gico NOT em conjunt com o AND, essa query retornar� somente os produtos cujo pre�o seja maior do que 2000 E a quantidade de
estoque de seguran�a N�O seja maior do 800.
*/


SELECT *
FROM AdventureWorks2017.HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M' AND SalariedFlag = 1
ORDER BY BusinessEntityID;
/*Usando dois ou mais AND's � poss�vel estabelecer mais condi��es a serem impostas na query, nessa query ser�o retornados somente os funcion�rios 
que s�o solteiros(MaritalStatus), do sexo masculino(Gender) e que possuem a bandeira salarial 1(SalariedFlag).
*/