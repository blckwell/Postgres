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

-- EXERCICIOS
-- 1) CRIE UMA CONSULTA PARA EXIBIR DATA ATUAL

select current_date;

-- 2) CRIE UMA CONSULTA PARA INFORMAR O DIA DA SEMANA ATUAL (SEGUNDA, TERCA, QUARTA)

select extract (dow from current_date) as semana_numerica,
case when extract(dow from current_date) = 0 then 'Domingo'
	 when extract(dow from current_date) = 1 then 'Segunda-feira'
	 when extract(dow from current_date) = 2 then 'Terca-feira'
	 when extract(dow from current_date) = 3 then 'Quarta-feira'
	 when extract(dow from current_date) = 4 then 'Quinta-feira'
	 when extract(dow from current_date) = 5 then 'Sexta-feira'
	 when extract (dow from current_date) = 6 then 'Sabado'
	 else 'other'
end;

-- 3) EXIBA O CODIGO DO FUNCIONARIO, O NOME, O SALARIO E O AUMENTO SALARIAL DE 15 POR CENTO 
-- EXPRESSO COMO NUMERO INTEIRO 

select nome, salario, salario + ((salario*15)/100) as aumento_salarial 
from funcionario;

-- 4) ADICIONE A CONSULTA ANTERIOR UMA COLUNA QUE CONTERÁ O SALÁRIO NOVO MENOS O SALÁRIO ANTIGO.

select salario, salario + ((salario*15/100)) as salario_novo, salario - ((salario*15/100)) as salario_antigo
from funcionario;

-- 5) EXIBA O NOME DO FUNCIONARIO, A DATA DE ADMISSÃO E A DATA DE EFETIVACAO, QUE É SEIS MESES APOS A ADMISSÃO.
--	  (tabela não possui colunas exigidas)

-- 6) Para cada funcionário exiba o nome do mesmo e calcule o número de meses entre a hoje e a sua data de
-- admissão. Ordene a consulta pelo número de meses. Arredonde para inteiro o número de meses.

select nome, (current_date - dtContratacao)/30 as numero_de_meses
from funcionario;

-- 7) CRIE UMA CONSULTA QUE PRODUZA A SEGUINTE FRASE: O <NOMEFUNC> RECEBE R$ <SALARIO> MENSALMENTE, MAS DESEJA
-- RECEBER <SALARIO * 4>. COLOQUE UM LABEL DE “SONHO” A COLUNA.

select 'O ' || nome || ' RECEBE R$ ' || salario || ' MENSALMENTE, ' || ' MAS DESEJA RECEBER '
	   || salario * 4 as sonho
from funcionario;

-- 8) Faça um select, que retorne o nome do funcionário com a primeira letra em maiúscula e o número de letras que o
-- nome contem. Para todos os funcionários cujos os nomes começam com J ou M. Coloque em ordem decrescente
-- pelo número de letras

select upper(substr(nome, 1, 1)) || lower(substr(nome, 2)) as nome, length(nome) as tamanho_string 
from funcionario
where nome like 'M%' or nome like 'N%'
order by tamanho_string desc;

-- 9) Exiba a admissão e o dia (segunda, terça, quarta, ...) em que o funcionário começou a trabalhar. Ordene pelo dia
-- da semana.

select nome, case when extract(dow from dtContratacao) = 1 then 'Segunda-feira'
			 when extract(dow from dtContratacao) = 2 then 'Terca-feira'
			 when extract(dow from dtContratacao) = 3 then 'Quarta-feira'
			 when extract(dow from dtContratacao) = 4 then 'Quinta-feira'
			 when extract(dow from dtContratacao) = 5 then 'Sexta-feira'
			 when extract(dow from dtContratacao) = 6 then 'Sabado'
			 when extract(dow from dtContratacao) = 7 then 'Domingo'
			 else 'other'
			 end
from funcionario
order by extract(dow from dtContratacao) asc;

-- 10) Faça uma consulta pelo nome do aluno e o telefone, informando “Sem telefone”, para os alunos em que o telefone
-- é null.

update aluno
set telefone = 333222444
where nome IN ('ANGELO GAWLINSKI MARTINS','KAREN REDIESS MULLER SORIA','MARCELO SOARES BARROSO');

select nome, telefone, telefone as sem_telefone
from aluno

