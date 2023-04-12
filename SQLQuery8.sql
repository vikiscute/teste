---Sala: INF3IM / TCC Reader Kids
---Alisson dos Santos Matos N°01
---Dayani Portugal Delgado N°04
---Isadora Rodrigues dos Santos Matos N°11
---Luca Ferreira Santana N°20
---Vitória Thais Sousa de Castro N°30

USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'dbREADER_KIDS') 
DROP DATABASE dbREADER_KIDS  


CREATE DATABASE dbREADER_KIDS  


USE dbREADER_KIDS  



CREATE TABLE Usuario  
(   
   id   INT IDENTITY,  
 
   email   VARCHAR(100)    NOT NULL,  

   senha   VARCHAR(100)    NOT NULL,  

   nivelAcesso   VARCHAR(10)    NULL, -- ADM, TEC ou USER

   foto         VARBINARY(MAX) NULL,  

   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO ou TROCAR_SENHA  

   PRIMARY KEY (id)  

)  

CREATE TABLE Login  
(  
  id   INT IDENTITY NOT NULL,  

Login varchar (50) ,  

nome varchar(30),  

email varchar (50),  

senha varchar (50),

usuario_id INT NOT NULL

PRIMARY KEY (id),  

FOREIGN KEY (usuario_id) REFERENCES Usuario (id)  

)  


CREATE TABLE plataforma (  

id INT IDENTITY PRIMARY KEY,   

histórias_nomes VARCHAR (20),  

canções_nomes VARCHAR (20),  

)  


CREATE TABLE Historias (  

id INT IDENTITY  PRIMARY KEY,  

nome VARCHAR(45) NOT NULL,  

anodelançamento DATE,  

genero VARCHAR(45) NOT NULL,  

usuario_id int not null,  

plataforma_id int not null


FOREIGN KEY (usuario_id) REFERENCES Usuario (id),  

FOREIGN KEY (plataforma_id) REFERENCES plataforma (id)  
)  


CREATE TABLE Cancoes(  

id INT IDENTITY  PRIMARY KEY,  

nome VARCHAR(45) NOT NULL,  

anodelancamento DATE,  

genero VARCHAR (45) NOT NULL,  

plataforma_id INT,  

usuario_id  INT NOT NULL,  

FOREIGN KEY (usuario_id) REFERENCES Usuario (id),  

FOREIGN KEY (plataforma_id) REFERENCES plataforma (id)  

)  



CREATE TABLE Genero (   

    ID INT IDENTITY PRIMARY KEY, 

    DESCRICAO VARCHAR(20) NOT NULL,

    SIGLA CHAR(2) NOT NULL


)

 

CREATE TABLE Avaliacao( 

id INT IDENTITY  PRIMARY KEY,  

id_usuario  INT NOT NULL,  

historias_id INT  NULL,  

cancoes_id INT  NULL,  

status_aval char(1),

comentario_aval varchar(500),

 
FOREIGN KEY (id_usuario) REFERENCES Historias (id),  

FOREIGN KEY (historias_id) REFERENCES Historias (id),  

FOREIGN KEY (cancoes_id) REFERENCES Cancoes (id)  

)  


INSERT INTO Usuario(email, senha,nivelAcesso,statusUsuario) VALUES ('alice@gmail.com', '123456','Usuario','ATIVO')  
INSERT INTO Usuario(email, senha,nivelAcesso,statusUsuario) VALUES ('gabriele@gmail.com', '12233456','Usuario','ATIVO')  
INSERT INTO Usuario(email, senha,nivelAcesso,statusUsuario) VALUES ('Luca@hotmail.com', '26262626','ADM','ATIVO')  
INSERT INTO Usuario(email, senha,nivelAcesso,statusUsuario) VALUES ('vitoria@hotmail.com', '909090','ADM','ATIVO')  
INSERT INTO Usuario(email, senha,nivelAcesso,statusUsuario) VALUES ('kaiyk@hotmail.com', '675645','ADM','ATIVO')  

SELECT * FROM Usuario


INSERT INTO Login(nome, email, senha, usuario_id) VALUES ('Alice Oliveira', 'alice@gmail.com', '123456', '1')
INSERT INTO Login(nome, email, senha, usuario_id) VALUES ('Gabriele Perreira', 'gabriele@gmail.com', '123456', '2')
INSERT INTO Login(nome, email, senha, usuario_id) VALUES ('Luca Ferreira', 'luca@hotmail.com', '123456', '3')
INSERT INTO Login(nome, email, senha, usuario_id) VALUES ('Vitoria Thais', 'vitoria@hotmail.com', '123456', '4')
INSERT INTO Login(nome, email, senha, usuario_id) VALUES ('Kaiyk Silva', 'kaiyk@hotmail.com', '123456', '5')

SELECT * FROM Login

INSERT INTO plataforma VALUES ('Dormir','Aprendizagem') 

SELECT * FROM plataforma

INSERT INTO Historias VALUES ('Chapeuzinho Vermelho', '01/04/1997', 'Texto Narrativo','1','1')
INSERT INTO Historias VALUES ('Os Três Porquinhos', '15/06/1853', 'Conto','2','1')
INSERT INTO Historias VALUES ('A Cigarra e a Formiga', '04/04/1996', 'Ficção','3','1')

SELECT * FROM Historias


INSERT INTO Cancoes VALUES ('O Sapo Não Lava o Pé', '03/06/2000', 'Cantigas de Rodas','1','1')
INSERT INTO Cancoes VALUES ('Brilha, Brilha Estrelinha','04/12/1800','Canção de Ninar','1','2')
INSERT INTO Cancoes VALUES ('A Dona Aranha', '05/06/2012','Música infantis','1','3')


SELECT * FROM Cancoes

INSERT INTO Genero VALUES ('Texto Narrativo','TN')
INSERT INTO Genero VALUES ('Conto','CT')
INSERT INTO Genero VALUES ('Ficção','FC')
INSERT INTO Genero VALUES ('Cantigas Roda','CR')
INSERT INTO Genero VALUES ('Canções Ninar','CN')
INSERT INTO Genero VALUES ('Cantigas Infantis','MI')

SELECT * FROM Genero

INSERT INTO Avaliacao VALUES (1,1,1,4,'Não gostei')

SELECT * FROM Avaliacao


