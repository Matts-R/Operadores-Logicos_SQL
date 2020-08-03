/*OPERADOR LÓGICO LIKE
O operador lógico LIKE serve para determinar se um carácter ou cadeia de carácteres coincide com um padrão especificado.
O LIKE é muito utilizado com os Wildcards, que são carácteres especiais que podem substituir zero, um ou mais carácteres, combinado com 
os Wildcards, o LIKE se torna muito mais útil.
Os Wildcards mais utilizados no SQL Server são:
% - Representa zero ou mais carácteres
	Exemplo: Ca% -> Pode representar casa, calha, cauda. Qualquer palavra que comece com CA
_ - Representa um único carácter
	Exemplo: Cas_ -> Pode representar casa, caso. Qualquer palavra que comece com CAS e tenha somente mais um carácter

SINTAXE: coluna/expressão + LIKE + padrãoDeCarácteres
O LIKE funciona avaliando o padrão de carácteres dado e retorna TRUE e exibe nos resultados caso exista ao menos um único valor que coincida
com o padrão.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName like 'Mat%'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard %, para selecionar somente as pessoas cujo o primeiro nome (FirstName) comecem com Mat e sejam seguidos por 
qualquer outro carácter ou sequência de carácteres.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName NOT LIKE 'A%'
ORDER BY FirstName;
/*Usando o LIKE, o Wildcard % e o operador lógico NOT, para inverter a lógica de execução do operador LIKE, e selecionar somente as pessoas 
cujo o primeiro nome(FirstName) não comece com a letra A.
*/


SELECT *
FROM AdventureWorks2017.Person.Person
WHERE FirstName LIKE '%on'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard % no final do padrão de carácteres, para selecionar somente as pessoas cujo o primeiro nome(FirstName) TERMINEM COM
ON, não importando qual carácter vem antes.
*/


SELECT  *
FROM AdventureWorks2017.Person.Person
WHERE BusinessEntityID LIKE '12_'
ORDER BY FirstName;
/*Usando o LIKE e o Wildcard _ no final do padrão de carácteres, para selecionar somente as pessoas cujo o ID comece com os números 12 e só possuam 
mais um único carácter.
*/


SELECT *
FROM AdventureWorks2017.Person.PersonPhone
WHERE PhoneNumber LIKE '31%' AND PhoneNumber LIKE '%0';
/*Usando o LIKE, o Wildcard % e o operador lógico AND, para podermos adicionar um outro padrão de carácteres que deve ser seguido, nesse caso serão 
selecionado somente os números de telefone de comecem com 31 e terminem com 0.
*/