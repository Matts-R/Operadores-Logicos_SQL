/*OPERADOR LÓGICO BETWEEN
O operador lógico BETWEEN nos permite selecionar valores dentro de um alcance predeterminado, sendo usando junto do operador lógico
AND para estabelecer o alcance.
SINTAXE: coluna/expressão + BETWEEN + valorInicial + AND + valorFinal
Quando o BETWEEN é executado não só os valores "dentro" da pesquisa serão exibidos, como o valorInicial e valorFinal também
serão exibidos na resposta.
Os valores avaliados pelo BETWEEN podem tanto ser númericos, como também textos e datas. 
O BETWEEN irá retornar TRUE e exibirá como resultado qualquer valor que esteja dentro dos "limites" estabelecidos.
*/


SELECT * 
FROM AdventureWorks2017.HumanResources.Employee
WHERE HireDate BETWEEN '2010-01-01' AND '2010-12-31'
ORDER BY HireDate;
/*Nesse exemplo o BETWEEN foi usado para limitar os resultados da coluna HireDate (Data de Contratação), seu alcance foi especificado
para exibir somente os funcionários que foram contratados no ano de 2010.
*/


SELECT * 
FROM AdventureWorks2017.HumanResources.Employee
WHERE HireDate NOT BETWEEN '2010-01-01' and '2010-12-31'
ORDER BY HireDate;
/*Usando o BETWEEN em conjunto com o operador lógico NOT, sua lógica é invertida, e passam a ser selecionados todos os funcionários que
NÃO foram contratados no ano de 2010.
*/


SELECT *
FROM AdventureWorks2017.Production.Product
WHERE StandardCost BETWEEN 500 AND 1000
ORDER BY StandardCost;
/*Aqui foram selecionados somente os produtos cujo custo padrão (StandardCost), está entre 500 e 1000.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName BETWEEN 'R%' AND 'V%'
ORDER BY FirstName;
/*Nesse exemplo foi usado o Wildcard %, que funciona como um carácter que pode substituir um ou mais carácteres, no SQL Server
o Wildcard % serve para representar zero ou mais carácteres, permitindo assim que seja possível pesquisar nessa query por todos os nomes que 
comecem com R e tenham mais carácteres e estejam entre os nomes que comecem com V e tenham mais carácteres.
*/