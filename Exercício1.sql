CREATE DATABASE SENAICARLAAAO;
USE SENAICARLAAAO;

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque) VALUES
    (1, 'Livro 1', 'Autor 1', 10),
    (2, 'Livro 2', 'Autor 2', 15);

INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao) VALUES
    (1, 1, '2023-01-01 15:00:00', '2023-01-15 18:00:00'),
    (2, 2, '2023-02-01 12:00:00', '2023-02-15 14:00:00');
    
select * from livros;
select * from emprestimos;

DELIMITER //

CREATE TRIGGER atualizar_estoque_trigger
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.id_livro;
END;

//

DELIMITER ;

