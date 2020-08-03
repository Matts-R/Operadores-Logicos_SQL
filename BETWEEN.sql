/*OPERADOR L�GICO BETWEEN
O operador l�gico BETWEEN nos permite selecionar valores dentro de um alcance predeterminado, sendo usando junto do operador l�gico
AND para estabelecer o alcance.
SINTAXE: coluna/express�o + BETWEEN + valorInicial + AND + valorFinal
Quando o BETWEEN � executado n�o s� os valores "dentro" da pesquisa ser�o exibidos, como o valorInicial e valorFinal tamb�m
ser�o exibidos na resposta.
Os valores avaliados pelo BETWEEN podem tanto ser n�mericos, como tamb�m textos e datas. 
O BETWEEN ir� retornar TRUE e exibir� como resultado qualquer valor que esteja dentro dos "limites" estabelecidos.
*/


SELECT * 
FROM AdventureWorks2017.HumanResources.Employee
WHERE HireDate BETWEEN '2010-01-01' AND '2010-12-31'
ORDER BY HireDate;
/*Nesse exemplo o BETWEEN foi usado para limitar os resultados da coluna HireDate (Data de Contrata��o), seu alcance foi especificado
para exibir somente os funcion�rios que foram contratados no ano de 2010.
*/


SELECT * 
FROM AdventureWorks2017.HumanResources.Employee
WHERE HireDate NOT BETWEEN '2010-01-01' and '2010-12-31'
ORDER BY HireDate;
/*Usando o BETWEEN em conjunto com o operador l�gico NOT, sua l�gica � invertida, e passam a ser selecionados todos os funcion�rios que
N�O foram contratados no ano de 2010.
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE StandardCost BETWEEN 500 AND 1000
ORDER BY StandardCost;
/*Aqui foram selecionados somente os produtos cujo custo padr�o (StandardCost), est� entre 500 e 1000.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName BETWEEN 'R%' AND 'V%'
ORDER BY FirstName;
/*Nesse exemplo foi usado o Wildcard %, que funciona como um car�cter que pode substituir um ou mais car�cteres, no SQL Server
o Wildcard % serve para representar zero ou mais car�cteres, permitindo assim que seja poss�vel pesquisar nessa query por todos os nomes que 
comecem com R e tenham mais car�cteres e estejam entre os nomes que comecem com V e tenham mais car�cteres.
*/