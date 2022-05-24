--DDL (Criação e definição do banco de dados)
CREATE DATABASE RpgOnline_Dataq
GO

USE RpgOnline_Dataq
GO

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(30) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE Classe_Habilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	Habilidade INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)

--DML Manipulação de dados (P/ testar e aprovar)

INSERT INTO Usuarios VALUES ('email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug', 1, 1)
INSERT INTO Classe_Habilidade (ClasseId, Habilidade) Values (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('email_mail@email.com', '123456')
INSERT INTO Classes VALUES ('Monge', 'Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 2, 2)
INSERT INTO Classe_Habilidade (ClasseId, Habilidade) Values (2, 2), (2, 3)

UPDATE Usuarios
SET Senha = '098876'
WHERE UsuarioId = 1

--DQL 
SELECT * FROM Usuarios

SELECT Personagens.NomePersonagem, Classes.Nome, Classes.Descricao FROM Personagens JOIN Classes
ON Personagens.ClasseId = Classes.ClasseId

--Outra maneira resumida de escrever o join acima.

SELECT P.NomePersonagem, C.Nome 'Nome da Classe', C.Descricao FROM Personagens P JOIN Classes C
ON P.ClasseId = C.ClasseId 





--DESAFIO ODIRLEI
SELECT P.NomePersonagem, C.Nome 'Nome da Classe', C.Descricao, U.UsuarioId, U.Email FROM Personagens P JOIN Classes C
ON P.ClasseId = C.ClasseId  JOIN Usuarios U ON C.ClasseId = P.ClasseId







--Exemplo de USO do comando Join
CREATE DATABASE ExemploJoin
GO

USE ExemploJoin
GO

--DDL
CREATE TABLE TabelaA(
	Nome VARCHAR(50) NOT NULL
)
GO

CREATE TABLE TabelaB(
	Nome VARCHAR(50) NOT NULL
)
GO

--DML
INSERT INTO TabelaA VALUES('Fernanda')
INSERT INTO TabelaA VALUES('Josefa')
INSERT INTO TabelaA VALUES('Luiz')
INSERT INTO TabelaA VALUES('Fernando')

INSERT INTO TabelaB VALUES('Carlos'),('Manoel'),('Luiz'),('Fernando')

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome
WHERE TabelaB.nome IS NULL OR TabelaA.Nome IS NULL