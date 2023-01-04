-- FUNÇÕES CARACTERES
-- UPPER, LOWER, SUBSTR, TRIM .. 

-- FUNÇÕES NUMÉRICAS
-- TRUNC, EXP, PI, RANDOM, ROUND .. 

-- FUNÇÕES COM DATA
-- CURRENT_DATE, CURRENT_TIME, NOW(), EXTRACT(DAY ..) ..

-- FUNCÇÕES DE CONVERSÃO
-- TO_CHAR, TO_DATE, TO_NUMBER .. 
-- CAST()
-- EX:

select cast(idade as text)
from aluno;

-- FUNÇÕES DE CONDIÇÕES NA PROJEÇÃO
-- COALESCE(...), CASE WHEN ... THEN ... ELSE ... END, ...
-- COEALESCE: RETORNA O PRIMEIRO ARGUMENTO QUE NÃO FOR NULL

-- FUNÇÕES DE GRUPO
-- EX:

select max(idade)
from aluno;

-- MAIS COMUNS
-- AVG(coluna) - valor medio
-- COUNT(*) <=> COUNT(coluna) - numero de linhas
-- MAX(coluna) - valor máximo
-- MIN(coluna) - valor mínimo
-- STDDEV(coluna) - desvio padrão
-- SUM(coluna) - soma de todos os valores
-- VARIANCE(coluna) - variação da coluna

select count(*)
from aluno;

select count(telefone)
from aluno;

select max(idade), min(idade), round(avg(idade))
from aluno;

-- GROUP BY: USANDO O GROUP BY DIVIDIMOS AS LINHAS RETORNADAS NA CONSULTA/TABELA EM GRUPOS MENORES
-- OU SUBGRUPOS. PODEMOS UTILIZAR AS FUNÇÕES DE GRUPO PARA RETORNAR INFORMAÇÕES SUMÁRIAS PARA
-- CADA SUBGRUPO.

select max(idade), cidade
from aluno
group by cidade;

select max(idade), upper(cidade)
from aluno
group by upper(cidade);

-- QUEREMOS OBTER OS MAIORES SALARIOS, POR CARGO DENTRO DE CADA DEPARTAMENTO

select cargo, codDepartamento, max(salario)
from funcionario
group by codDepartamento, cargo
order by 2;

--CUIDADO!
-- QUALQUER COLUNA OU EXPRESSÂO NA LISTA SELECT QUE NÃO SEJA UMA FUNÇÃO DE GRUPO
-- DEVE ESTAR NA CLÁUSULA GROUP BY

select cidade, min(idade)
from aluno;             -- ERRADO! 

select cidade, min(idade)
from aluno
group by cidade;      -- CORRETO! 

-- MISTURANDO

select lower(cidade) as Cidade, max(idade) as Idade
from aluno
where telefone is not null
group by lower(cidade);

-- CLÁUSULA HAVING
-- HAVING CONSEGUE RESTRINGIR GRUPOS
-- AS LINHAS SÃO SELECIONADAS
-- A FUNÇÃO DE GRUPO É APLICADA
-- OS GRUPOS QUE FOREM APROVADOS PELA CLÁUSULA HAVING SÃO EXIBIDOS

select lower(cidade) as Cidade, max(idade) as Idade
from aluno
where telefone is not null
group by lower(cidade)
having max(idade) >= 18
order by 2 desc;