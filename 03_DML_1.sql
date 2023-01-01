create table aluno(
	matricula numeric(10),
	nome varchar(50),
	email varchar(50),
	telefone numeric(10),
	idade numeric(3),
	dtNascimento date,
	cidade varchar(50),
	primary key(matricula)
);

create table matricula(
	matriculaAluno numeric(10),
	codDisciplina numeric(10),
	dtEfetivado date,
	primary key(matriculaAluno, codDisciplina)
);

create table disciplina(
	cod numeric(10),
	nome varchar(50),
	turma varchar(10),
	numAlunos numeric(3),
	cargaHoraria numeric(3),
	primary key(cod)
);

create table funcionario(
	cod varchar(10),
	nome varchar(50),
	cargo varchar(40),
	dtContratacao date,
	codGerente numeric(10),
	salario numeric(9),
	codDepartamento numeric(10),
	primary key(cod)
);

create table departamento(
	cod numeric(10),
	descricao varchar(30),
	sigla varchar(10),
	primary key(cod)
);

insert into aluno(matricula, nome, email, telefone, idade, dtNascimento, cidade)
values (201527701, 'ANDRESSA MOREIRA DA SILVA', 'teste@teste', NULL, NULL, '01-09-2009', 'PELOTAS'),
	   (201610253, 'ANGELO GAWLINSKI MARTINS', 'teste@teste', 999888000, 30, '05-10-1992', 'BAHIA'),
	   (201618375, 'CESAR AUGUSTO VITORIA MARTINS JUNIOR', NULL, NULL, 22, '10-02-2000', 'PORTO ALEGRE'),
	   (201618361, 'KAREN REDIESS MULLER SORIA', 'teste@teste', 111222333, NULL, NULL, 'ARAMBARÉ'),
	   (201610689, 'LUCAS DE OLIVEIRA NEVES', NULL, NULL, 22, NULL, 'BAGÉ' ),
	   (201510501, 'MARCELO SOARES BARROSO', 'teste@teste', 555444333, NULL, '15-09-1987', 'PELOTAS'),
	   (201411454, 'MURILO MADRUGA FERREIRA', NULL, NULL, 25, '10-10-1997', 'PELOTAS'),
	   (201618355, 'PATRICK ALVES BARBOSA', 'teste@teste', 888777555, NULL, NULL, 'ARAMBARÉ'),
	   (201510324, 'RAFAEL GOULART DE OLIVEIRA', NULL, 111222333, 28, '11-02-1994', 'FLORIANOPOLIS'),
	   (201610716, 'REGIS FERNANDES GALLI', 'teste@teste', 777666333, 21, '07-07-2021', 'PORTO ALEGRE'),
	   (201618673, 'THAYNA ALMEIDA DA ROSA DE OLIVEIRA', 'teste@teste', 333000111, 33, NULL, 'PORTO ALEGRE'),
	   (201610682, 'VICTOR HUGO DA SILVEIRA LIMA', NULL, 000999888, NULL, NULL, 'BAHIA'),
	   (201717410, 'YASSER AYMAN JABER', NULL, NULL, 29, '12-05-1993', 'PELOTAS');
	   
	   
insert into disciplina(cod, nome, turma)
values (369008, 'BANCO DE DADOS', 123),
	   (369009, 'CALCULO 1', 123),
	   (369010, 'SISTEMAS DISCRETOS', 123),
	   (369011, 'LÓGICA DE PROGRAMAÇÃO', 123),
	   (369012, 'INTRODUÇÃO A ENGENHARIA DA COMPUTACAO', 123),
	   (369013, 'CALCULO 2', 124),
	   (369014, 'PROGRAMAÇÃO DE COMPUTADORES', 124),
	   (369015, 'ALGEBRA LINEAR E GEOMETRIA ANALITICA', 124),
	   (369016, 'FISICA 1', 124),
	   (369017, 'CIRCUITOS DIGITAIS', 124);
	   
	  
insert into departamento(cod, descricao, sigla)
values (005,'RECURSOS HUMANOS', 'RH'),
	   (010,'AUDITORIA', 'AUD'),
	   (015,'DIRECAO', 'DIR'),
	   (020,'INFORMATICA', 'INF'),
	   (025,'DESIGN', 'DES'),
	   (030,'CRIACAO', 'CRI'),
	   (035,'COZINHA', 'COZ'),
	   (040,'CONSULTORIA', 'CON'),
	   (045,'CONTABILIDADE', 'CONT');


insert into funcionario(cod, nome, cargo, dtContratacao, codGerente, salario)
values ('10A', 'PELÉ', 'GERENTE', '23-10-1995', 10, 2200.10),
	   ('1289', 'MARADONA', 'SUPERVISOR', '23-10-1999', 20, 1200.10),
	   ('1290', 'CARECA', 'CONSULTOR', '26-12-1988', 30, 2240.10),
	   ('1291', 'MALDONADO', 'EXECUTIVO', '28-11-1990', 40, 1250.10),
	   ('1292', 'BATISTA', 'AUDITOR', '17-10-1998', 50, 1215.10),
	   ('1293', 'THIENRY HENRY', 'DIRETOR', '12-12-1986', 60, 11200.10),
	   ('1294', 'GERARD', 'CANTINA', '22-03-1996', 70, 2300.10),
	   ('1295', 'LAMPARD', 'REFEITORIO', '07-07-1995', 80, 3200.10),
	   ('1296', 'MAKELELE', 'TECNICO', '04-11-1993', 90, 1700.10),
	   ('1297', 'ESSIEN', 'SOCIAL MIDIA', '21-12-1992', 100, 11200.10),
	   ('1298', 'FERDINAND', 'DESIGNER', '15-10-1991', 110, 5200.10);
	   

-- SELEÇÕES - PROJEÇÃO

--1) SELECIONE TODOS OS REGISTROS DAS TABELAS FUNCIONARIO
SELECT *
FROM funcionario;

--2) SELECIONE SOMENTE A MATRICULA E O NOME DOS REGISTROS DA TABELA ALUNO
SELECT matricula
FROM aluno;

--3) NA TABELA FUNCIONARIO, SELECIONE O CODIGO, O NOME, O SALARIO ATUAL E O SALARIO ATUAL
-- + 10%, COLOCANDO O APELIDO/ALIAS NESTA ULTIMA COLUNA DE "NOVOSALARIO"
SELECT cod, nome, salario, salario + (salario*10)/100 as NOVOSALARIO
FROM funcionario;

--4) SELECIONE A COLUNA SIGLA NA TABELA DEPARTAMENTO, SEM REPETIR REGISTROS IGUAIS
SELECT DISTINCT (sigla)
FROM departamento;

--5) SELECIONE A DESCRICAO E A SIGLA NA TABELA DEPARTAMENTO SEM REPETIR REGISTROS IGUAIS.
-- APELIDE A COLUNA DESCRICAO DE "NOMEDEPARTAMENTO" E SIGLA DE "CODIGOREDUZIDO"
SELECT DISTINCT (descricao, sigla), descricao as NOMEDEPARTAMENTO, sigla as CODIGOREDUZIDO
FROM departamento;

--6) SELECIONE TODAS AS IDADES DOS ALUNOS, SEM REPETI-LAS
SELECT DISTINCT (idade)
FROM aluno;

--7) SELECIONE A MATRICULA, O NOME, A IDADE E A IDADE + 2 APELIDANDO ESTA ULTIMA
-- COLUNA DE "PROVAVEL_IDADE_FORMADO"
SELECT nome, idade, idade + 2 as PROVAVEL_IDADE_FORMADO
FROM aluno;

--8) FAÇA RETORNAR O SEGUINTE TEXTO ORIUNDO DA TABELA ALIN0
-- ALUNO: XXXXX NASCIDO EM: XXXXX ESTARÁ COM A IDADE APROXIMADA DE: XX AO SE FORMAR! 
SELECT 'ALUNO(A): ' || nome || ' NASCIDO: ' || dtNascimento || ' ESTARÁ COM A IDADE APROXIMADA DE: ' || idade || 
' ANOS AO SE FORMAR!'
FROM aluno;
