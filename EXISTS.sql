/*OPERADOR L�GICO EXISTS
O operador l�gico EXISTS possibilita realizar um teste para checar se a subQuery retorna qualquer valor. 
SINTAXE: WHERE + EXISTS + (subQuery)
O EXISTS retorna TRUE caso a subQuery retorne um ou mais valores.
Na pr�tica o EXISTS � melhor utilizado quando se precisa somente checar a exist�ncia de valores ou condi��es, sem uma real 
necessidade de retorna-los, para isso seria melhor utilizado o JOIN. 
*/


SELECT *
FROM AdventureWorks2017.Production.Product, AdventureWorks2017.Production.ProductInventory
WHERE EXISTS (
	SELECT ProductID
	FROM AdventureWorks2017.Sales.SalesOrderDetail
	WHERE Product.ProductID = SalesOrderDetail.ProductID AND
	OrderQty > Quantity
	)
ORDER BY Name;
/*Nesse exemplo estamos usando o ID dos produtos para poder relacionar as duas tabelas e o usando o EXISTS para testar 
se EXISTE algum produto cuja quantidade do pedido de compra seja maior do que a quantidade presente no estoque e depois
organizando pelo nome os produtos exibidos como resultado.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE EXISTS (
	SELECT NULL
	)
ORDER BY FirstName;
/*Esse exemplo serve para demonstrar um comportamento do operador EXISTS, CASO A SUBQUERY RETORNE UM NULL, O OPERADOR EXISTS
AINDA � AVALIADO COMO TRUE, porque apesar de NULL significar, grosso modo, a aus�ncia de um valor, caso exista um NULL na tabela
o EXISTS ir� encarar o NULL como um valor.
Dessa maneira a query acima tem o mesmo valor da query abaixo.
*/
SELECT *
FROM AdventureWorks2017.Person.Person


SELECT *
FROM AdventureWorks2017.Person.person pessoas
WHERE NOT EXISTS(
	SELECT FirstName
	FROM AdventureWorks2017.Person.Person
	WHERE FirstName = 'Matheus'
	)
ORDER BY FirstName;
/*Usando o EXISTS com outro comparador l�gico, o NOT, faz com que sua l�gica seja invertida, passando a retornar TRUE caso n�o exista
o valor retornado na subQuery. Nesse caso ir� retornar TRUE e mostrar� na resposta todos os nomes cujo o primeiro nome (FirstName) n�o 
seja igual a Matheus.
*/