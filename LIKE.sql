/*OPERADOR L�GICO LIKE
O operador l�gico LIKE serve para determinar se um car�cter ou cadeia de car�cteres coincide com um padr�o especificado.
O LIKE � muito utilizado com os Wildcards, que s�o car�cteres especiais que podem substituir zero, um ou mais car�cteres, combinado com 
os Wildcards, o LIKE se torna muito mais �til.
Os Wildcards mais utilizados no SQL Server s�o:
% - Representa zero ou mais car�cteres
	Exemplo: Ca% -> Pode representar casa, calha, cauda. Qualquer palavra que comece com CA
_ - Representa um �nico car�cter
	Exemplo: Cas_ -> Pode representar casa, caso. Qualquer palavra que comece com CAS e tenha somente mais um car�cter

SINTAXE: coluna/express�o + LIKE + padr�oDeCar�cteres
O LIKE funciona avaliando o padr�o de car�cteres dado e retorna TRUE e exibe nos resultados caso exista ao menos um �nico valor que coincida
com o padr�o.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName like 'Mat%'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard %, para selecionar somente as pessoas cujo o primeiro nome (FirstName) comecem com Mat e sejam seguidos por 
qualquer outro car�cter ou sequ�ncia de car�cteres.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName NOT LIKE 'A%'
ORDER BY FirstName;
/*Usando o LIKE, o Wildcard % e o operador l�gico NOT, para inverter a l�gica de execu��o do operador LIKE, e selecionar somente as pessoas 
cujo o primeiro nome(FirstName) n�o comece com a letra A.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName LIKE '%on'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard % no final do padr�o de car�cteres, para selecionar somente as pessoas cujo o primeiro nome(FirstName) TERMINEM COM
ON, n�o importando qual car�cter vem antes.
*/


SELECT  *
FROM AdventureWorks2017.Person.Person
WHERE BusinessEntityID LIKE '12_'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard _ no final do padr�o de car�cteres, para selecionar somente as pessoas cujo o ID comece com os n�meros 12 e s� possuam 
mais um �nico car�cter.
*/


SELECT *
FROM AdventureWorks2017.Person.PersonPhone
WHERE PhoneNumber LIKE '31%' AND PhoneNumber LIKE '%0';
/*Usando o LIKE, o Wildcard % e o operador l�gico AND, para podermos adicionar um outro padr�o de car�cteres que deve ser seguido, nesse caso ser�o 
selecionado somente os n�meros de telefone de comecem com 31 e terminem com 0.
*/