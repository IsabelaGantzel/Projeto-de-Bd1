DROP DATABASE IF EXISTS TRABALHOFINAL;
CREATE DATABASE TRABALHOFINAL;
USE TRABALHOFINAL;

DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS EMPRESTIMO;
DROP TABLE IF EXISTS RESERVA;
DROP TABLE IF EXISTS OBRA;
DROP TABLE IF EXISTS ESTUDANTE;
DROP TABLE IF EXISTS EXEMPLAR;


CREATE TABLE FUNCIONARIO(
	id_auto INTEGER auto_increment,
    Id CHAR (20),
    Nome VARCHAR (40),
    PRIMARY KEY (Id),
    UNIQUE KEY (id_auto)
);
CREATE TABLE OBRA(
	id INTEGER auto_increment,
	isbn VARCHAR(60),
    titulo VARCHAR (50),
	autor VARCHAR (40),
    categoria VARCHAR (20),
	PRIMARY KEY (isbn),
    UNIQUE KEY (id)
);
CREATE TABLE EXEMPLAR(
	id INTEGER auto_increment,
	CodigoExemplar VARCHAR (50) UNIQUE,
	IsbnObra VARCHAR (60),
    PRIMARY KEY (CodigoExemplar,IsbnObra),
    FOREIGN KEY (IsbnObra) REFERENCES OBRA(isbn),
	UNIQUE KEY (id)
);
CREATE TABLE ESTUDANTE(
	id INTEGER auto_increment,
	Ra CHAR(10),
    Nome VARCHAR (40),
    UNIQUE KEY (id),
    PRIMARY KEY (Ra)
);
CREATE TABLE EMPRESTIMO(
	Id INTEGER auto_increment,
    Ra_aluno CHAR (10),
    Id_funcionario CHAR (20),
    IsbnObra VARCHAR (60),
    CodigoExemplar VARCHAR (50),
    data_aluguel DATE,
    data_limite DATE,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (Ra_aluno) REFERENCES ESTUDANTE(Ra),
    FOREIGN KEY (Id_funcionario) REFERENCES FUNCIONARIO(Id),
    FOREIGN KEY (IsbnObra) REFERENCES OBRA(isbn),
    FOREIGN KEY (CodigoExemplar) REFERENCES EXEMPLAR(CodigoExemplar)
);
CREATE TABLE RESERVA(
	Id INTEGER auto_increment,
    RA_ALUNO CHAR (10),
    Id_funcionario CHAR (20),
    IsbnObra VARCHAR (60),
    
    PRIMARY KEY (Id),
    FOREIGN KEY (RA_ALUNO) REFERENCES ESTUDANTE(RA),
    FOREIGN KEY (Id_funcionario) REFERENCES FUNCIONARIO(Id),
    FOREIGN KEY (IsbnObra) REFERENCES OBRA(isbn)
);


INSERT INTO funcionario (id, nome) VALUES 
('01','Ivanilton Polato'),
('02','André Luiz Schwerz'),
('03','Igor Scaliante Wiese'),
('04','Frank Helbert'),
('05','Paulo Henrique Sabo');

INSERT INTO estudante (Ra, Nome) VALUES 
('1835114','Douglas Keith Ishibashi'),
('1357093','Guilherme Zago Canesin'),
('1816446','Isabela de Almeida Gantzel'),
('1817493','Vitor Cesar Ferreira Pereira'),
('1711857','Alisson Shoiti Asato');

INSERT INTO obra (isbn,titulo,autor,categoria) VALUES 
('1000001','Banco de Dados 1','Andre Shwerz','Banco de dados'),
('1000002','Banco de Dados 2','Andre Shwerz','Banco de dados'),
('1000003','Algoritmos e Estrutura de Dados','Rafael Liberato','Programação'),
('1000004','Programação de Aplicativos','Ivanilton Polato','Programação'),
('1000005','Libras para Iniciantes','Alberto Franco','Linguagem'),
('1000006','IHC - O Humano e o Computador','Felipe Roseiro Cogo','Computação'),
('1000007','IHC','Felipe Roseiro Cogo','Computação');


INSERT INTO exemplar(CodigoExemplar, IsbnObra) 
VALUES('111', (SELECT  isbn FROM obra WHERE isbn = '1000001'));

SELECT obra.isbn,obra.titulo,exemplar.CodigoExemplar
FROM obra, exemplar
WHERE obra.isbn = exemplar.IsbnObra;

