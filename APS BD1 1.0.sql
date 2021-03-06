DROP DATABASE IF EXISTS TRABALHOFINAL;
CREATE DATABASE TRABALHOFINAL;
USE TRABALHOFINAL;

DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS EMPRESTIMO;
DROP TABLE IF EXISTS RESERVA;
DROP TABLE IF EXISTS DEVOLUCAO;
DROP TABLE IF EXISTS OBRA;
DROP TABLE IF EXISTS ESTUDANTE;
DROP TABLE IF EXISTS ACERVO;
DROP TABLE IF EXISTS RE_EMPRESTIMO;
DROP TABLE IF EXISTS RE_DEVOLUCAO;

CREATE TABLE FUNCIONARIO(
	Id CHAR (20),
    NOME VARCHAR (40),
    PRIMARY KEY (Id)
);
CREATE TABLE EMPRESTIMO(
	Id CHAR (20),
    RA_ALUNO CHAR (10),
    Id_funcionario CHAR (20),
    CodigoObra INTEGER,
    DATA_ALUGUEL DATE,
    DATA_LIMITE DATE,
    PRIMARY KEY (Id)
    
);
CREATE TABLE RESERVA(
	Id CHAR (20),
    RA_ALUNO CHAR (10),
    Id_funcionario CHAR (20),
    CODIGO_OBRA INTEGER,
    
    PRIMARY KEY (Id)
);
CREATE TABLE DEVOLUCAO(
	Id_emprestimo CHAR (20),
    Ra_aluno CHAR (10),
    CODIGO_OBRA INTEGER,
    DIA DATE,
    MULTA INTEGER,
    
    FOREIGN KEY (Id_emprestimo) REFERENCES EMPRESTIMO(Id) 
);
CREATE TABLE OBRA(
	Isbn INTEGER,
    CATEGORIA CHAR (20),
    AUTOR VARCHAR (40),
    TITULO VARCHAR (50),
    NUM_EXEMPLARES INTEGER,
    
    PRIMARY KEY (Isbn)
);
CREATE TABLE ESTUDANTE(
	RA CHAR(10),
    NOME VARCHAR (40),
    
    PRIMARY KEY (RA)
);
CREATE TABLE ACERVO(

	codigoObra INTEGER,
    NUM_EXEMPLARES_DISP INTEGER,
    
    CONSTRAINT FOREIGN KEY (codigoObra) REFERENCES OBRA(Isbn)
);
CREATE TABLE RE_EMPRESTIMO(
	Id_emprestimo CHAR (20),
    DATA_EMPRESTIMO DATE,
    DATA_LIMITE DATE,
    TITULO_OBRA VARCHAR (40),
    RA_ALUNO CHAR (10),
    NOME_ALUNO VARCHAR (40),
    NOME_FUNCIONARIO CHAR (20),
    
	FOREIGN KEY (Id_emprestimo) REFERENCES EMPRESTIMO(Id)
);
CREATE TABLE RE_DEVOLUCAO(
	Id_emprestimo CHAR (20),
    DATA_EMPRESTIMO DATE,
    DATA_DEVOLUCAO DATE,
    TITULO_OBRA VARCHAR (40),
    VALOR_MULTA INTEGER,
    RA_ALUNO CHAR (10),
    NOME_ALUNO VARCHAR (40),
    NOME_FUNCIONARIO CHAR (20),
    
    FOREIGN KEY (Id_emprestimo) REFERENCES EMPRESTIMO(Id)
);

INSERT INTO FUNCIONARIO(Id, NOME) VALUES (0, 'Keith Ishibashi'), (1, 'Isabela Gantzel'), (2, 'Guilherme Canesin');

INSERT INTO RESERVA(Id, RA_ANUNO, Id_funcionario, CODIGO_OBRA) VALUES ('0', '1835114', '1', 331);

SELECT *
FROM FUNCIONARIO
WHERE Id = 0 OR Id = 1 OR Id = 2
