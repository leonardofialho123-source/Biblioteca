BEGIN TRANSACTION;

Create table usuario (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100) NOT NULL,
    cpf TEXT(15) NOT NULL,
    data_de_nascimento TEXT,
    telefone TEXT(15),
    email TEXT(100)
);

Create table livro (
    id_livro INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT(100) NOT NULL,
    ano_publicacao INTEGER(30),
    numero_paginas INTEGER,
    quantidade INTEGER,
    secao TEXT(10)
);

Create table emprestimo (
    id_emprestimo INTEGER PRIMARY KEY AUTOINCREMENT,
    data_emprestimo TEXT NOT NULL,
    data_devolucao_real TEXT,
    data_prevista_devolucao TEXT,
    multa_aplicada TEXT,
    id_usuario INTEGER,
    id_livro INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
    );

Create table autor (
    id_autor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100) NOT NULL,
    nacionalidade TEXT(30)
);

Create table livro_autor(
    id_livro INTEGER,
    id_autor INTEGER,
    FOREIGN KEY(id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY(id_autor) REFERENCES autor(id_autor)
);



INSERT INTO usuario(nome, cpf, data_de_nascimento, telefone, email)
VALUES
('Ana de Lima', '011.011.011-11', '2010-12-18', '1199999-9999', 'anadelima@gmail.com'),
('Jose Carlos ', '022.022.022-22', '1985-03-31', '1198888-8888', 'josecarlos@gmail.com'),
('Maria do Carmo', '033.033.033-33', '1970-05-24', '1197777-7777', 'mariadocarmo@gmail.com');

INSERT INTO livro(titulo, ano_publicacao, numero_paginas, quantidade, secao)
VALUES
('A torre Negra', '1994', '580', '5', 'A5-54'),
('A fada azul', '2011', '370', '10', 'F8-34'),
('O cavaleiro', '2008', '450', '7', 'C11-14');

INSERT INTO emprestimo(data_emprestimo, data_devolucao_real, data_prevista_devolucao, multa_aplicada, id_usuario, id_livro)
VALUES
('2025-12-01', '2025-12-08', '2025-12-11', '0', '3', '1'),
('2025-10-25', '2025-11-06', '2025-12-11', '1,80', '1', '2'),
('2024-08-31', '2025-09-25', '2025-12-11', '10,50', '2', '3');

INSERT INTO autor(nome, nacionalidade)
VALUES
('Lucia Garcia', 'espanhol'),
('John Kane', 'britanico'),
('Roberto Andrade', 'brasileiro');

INSERT INTO livro_autor(id_livro, id_autor)
VALUES
('1', '1'),
('2', '3'),
('3', '2');



select * from usuario
Order BY data_de_nascimento;

select
    e.multa_aplicada AS multa_aplicada_emprestimo,
    u.nome AS nome_usuario
FROM usuario u
JOIN emprestimo e
    ON u.id_usuario = e.id_usuario
Where e.multa_aplicada= '0';

select
UPPER(nome) AS nome_usuario,
UPPER(titulo) AS titulo_livro
FROM usuario
JOIN livro;



update usuario
set nome = 'Rodrigo Lima'
where id_usuario = 3;

update livro
set titulo = 'As viagens extraordinarias'
where id_livro = 2;

update autor
set nacionalidade = 'argentina'
where id_autor < 2;



delete from emprestimo
where id_emprestimo > 2;

delete from livro
where id_livro > 3;

drop table emprestimo;