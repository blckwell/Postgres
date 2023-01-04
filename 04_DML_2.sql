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

--EXERCICIOS
-- 1) SELECIONE TODOS OS ALUNOS QUE NÃO POSSUEM TELEFONE E COLOQUE EM ALGUNS A INFORMAÇÃO DO TELEFONE

update aluno
set telefone = 999880741
where telefone is null;

-- 2) ATUALIZE OS ALUNOS, AUMENTANDO EM UM ANO A IDADE DE TODOS OS ALUNOS QUE NASCERAM DEPOIS DE 01/01/1980

update aluno
set idade = idade + 1
where dtNascimento > '01-01-1992';

-- 3) ATUALIZE AS DISCIPLINAS, DEIXANDO TODAS AS CARGAS HORARIA IGUAL A 60

update disciplina
set cargaHoraria = 60;

-- 4) CRIE UMA CONSULTA PARA EXIBIR O NOME E O SALARIO DOS FUNCIONARIOS QUE RECEBEM MAIS DE 800 REAIS

select nome, salario
from funcionario
where salario > 800;

-- 5) CRIE UMA CONSULTA PARA EXIBIR O NOME DO FUNCIONARIO E O NUMERO DO DEPARTAMENTO PARA O CÓDIGO
-- DO FUNCIONARIO 

update funcionario
set codDepartamento = 459
where nome in ('PELÉ', 'MARADONA');

select nome, codDepartamento
from funcionario
where codDepartamento = 459;

-- 6) EXIBA O NOME E O SALARIO DE TODOS OS FUNCIONARIOS CUJOS SALARIOS NAO ESTEJAM NA FAIXA ENTRE 
-- 950 E 2300 REAIS

select nome, salario
from funcionario
where salario not between 950 and 2300;

-- 7) EXIBA O NOME DO FUNCIONARIO, O CARGO E A DATA DOS FUNCIONARIOS ADMITIDOS ENTRE 20 DE FEVEREIRO
-- DE 1988 E 1 DE MAIO DE 1992

select nome, cargo, dtContratacao
from funcionario
where dtContratacao between '1988-02-20' and '1992-05-01';

-- 8) EXIBA O NOME DO FUNCIONARIO E O NUMERO DO DEPARTAMENTO DE TODOS OS FUNCIONARIOS DOS DEPARTAMENTOS 10 E 30
-- POR ORDEM ALFABETICA DE NOME

update funcionario
set codDepartamento = 10
where cod in ('1290','1291','1292');

update funcionario
set codDepartamento = 30
where cod in ('1293', '1294', '1295');

select nome, codDepartamento
from funcionario
where codDepartamento in ('10', '30')
order by nome asc;

-- 9) LISTE O NOME E O SALARIO DOS FUNCIONARIOS QUE RECEBEM MAIS DE 1500 E QUE ESTAO NOS DEPARTAMENTOS
-- 10 OU 30. NOMEIE AS COLUNAS NOME E SALARIO, PARA FUNCIONARIO E SALARIO DO MES

select nome as funcionario, salario as salario_do_mes, codDepartamento
from funcionario
where salario > 1500 and codDepartamento in ('10', '30');

-- 10) EXIBA O NOME E A DATA DE ADMISSAO DE CADA FUNCIONARIO ADMITIDO EM 1995-01-01

select nome, dtContratacao 
from funcionario
where dtContratacao >= '1995-01-01';

-- 11) EXIBA O NOME E O CARGO DE CADA FUNCIONARIO QUE NÃO POSSUA GERENTE

select nome, cargo
from funcionario
where codGerente is null;

-- 12) EXIBA OS NOMES DE TODOS OS FUNCIONARIOS QUE POSSUEM UM 'A'NA SEGUNDA LETRA DE SEUS NOMES

select nome
from funcionario
where nome like '_A%';

-- 13) EXIBA TODOS OS FUNCIONARIOS QUE POSSUEM DUAS LETRAS 'A' EM SEUS NOMES E ESTÃO NO DEPARTAMENTO 30 
-- OU SEU GERENTE SEJA O 7529, ORDENADO PELO CODIGO DO DEPARTAMENTO DE FORMA DECRESCENTE

update funcionario 
set codGerente = 7529
where nome IN ('MAKELELE', 'FERDINAND');

select *
from funcionario
where nome like '%A%A%' and (codDepartamento = 30 or codGerente = 7529)
order by nome desc;

-- 14) PREMIE, AUMENTANDO O SALARIO EM 300 REAIS, DE TODOS OS FUNCIONARIOS QUE GANHAM MENOS
-- DE 1700

select nome, salario, salario + 300 as salario_reajustado_em_trezentos_reais
from funcionario
where salario < 1700;

-- 15) DE UM AUMENTO DE 15 POR CENTO AOS FUNCIONARIOS DO DEPARTAMENTO 30

select nome, salario, salario + ((salario*15)/100) as salario_reajustado_em_quinze_porCento
from funcionario
where codDepartamento = 30;


