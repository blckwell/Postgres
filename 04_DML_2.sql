-- 04_DML_2

-- SELEÇÃO E PROJEÇÃO

select * 
from aluno
where cidade = 'PELOTAS';

select * 
from aluno
where matricula is not null;

select matricula, nome, email
from aluno
where cidade = 'PELOTAS';

-- STRING DE CARACTERES E DATAS

select *
from aluno
where dtNascimento > '2000-01-01';

-- OPERADORES DE COMPARAÇÃO

select *
from aluno
where dtNascimento = '2000-01-01';

select *
from aluno
where idade between 18 and 21;

select *
from aluno
where idade in (5, 8, 2);

select *
from funcionario
where nome = 'PELÉ';

-- OPERADOR BETWEEN(ENTRE)

select *
from aluno
where idade between 16 and 21;

-- OPERADOR IN

select *
from aluno
where idade in (30, 28, 16, 18);

-- OPERADOR LIKE
-- SIMBOLO  | DESCRIÇÃO
-- %        | SIGNIFICA ZERO, UM OU MUITOS CARACTERES
-- _		| SIGNIFICA UM ÚNICO CARACTER

select nome
from aluno
where nome like 'MAR%';

select nome
from aluno
where nome like '_A%';

select nome
from aluno
where nome like '%';

-- OPERADOR IS (NUNCA É IGUAL A NULL)
-- TESTA VALORES QUE SÃO NULOS.

select nome, matricula
from aluno
where telefone is null;

-- OPERADORES LÓGICOS

select *
from aluno
where idade not in (18, 28, 30, 25);

select *
from aluno
where matricula not between 1000 and 2000;

select *
from aluno
where nome not like ('_A%');

select *
from aluno
where telefone is not null;

select email, nome, matricula
from aluno
where nome like 'MAR%' and idade >=18;

select telefone, nome
from aluno
where telefone is not null;

select matricula
from aluno
where idade >= 22 and cidade = 'PELOTAS' 
and telefone is null;

-- REGRAS DE PRECEDENCIA
-- OPERADORES DE COMPARAÇÃO E LÓGICOS(NOT, AND E OR(NESSA ORDEM))
-- PODEM SER REESTRUTURADAS USANDO PARENTESES!

select *
from aluno
where (cidade = 'PELOTAS' or cidade = 'CRISTAL') and idade >= 20;

-- ORDER BY
-- CLASSIFICA AS LINHAS EM ORDEM CRESCENTE OU DECRESCENTE
-- OBS: UM ORDER BY POR SELECT

select email, nome, matricula
from aluno
where nome like 'MAR%' and idade >=18
order by cidade asc;

select *
from aluno
where (cidade = 'PELOTAS' or cidade = 'CRISTAL')
and idade > 20
order by idade;

select nome
from aluno
where nome like '_A%'
order by matricula desc;

-- podemos usar o apelido (ALIAS) da coluna como referencia
select telefone, nome, dtNascimento as quandoNasceu
from aluno
where telefone is not null
order by quandoNasceu;

-- podemos usar o número da coluna que será retornada como referência 
select cidade, telefone, nome
from aluno
order by 2;

-- CLASSIFICANDO POR VÁRIAS COLUNAS

select telefone, nome, dtNascimento, matricula
from aluno
order by nome, dtNascimento desc;

select telefone, nome, dtNascimento, matricula
from aluno 
order by nome, dtNascimento asc;

-- ATUALIZANDO REGISTROS/ LINHAS/ TUPLAS
-- UPDATE -> é a cláusula que consegue fazer atualizações nos registros das tabelas

update aluno
set dtNascimento = '05-10-1992', cidade = 'PELOTAS', telefone = 999880741
where cidade = 'PELOTAS';

update aluno
set idade = 23
where matricula = 123;

update aluno
set idade = 86
where matricula = 333;

-- REMOVENDO REGISTROS/ LINHAS/ TUPLAS
-- DELETE -> é a cláusula que consegue remover registros das tabelas

delete from aluno
where matricula = 1432;

delete from aluno
where cidade = 'PORTO ALEGRE';

delete from aluno
where matricula = 3;