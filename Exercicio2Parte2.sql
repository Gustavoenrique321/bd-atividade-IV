CREATE DATABASE TIsenai;
use TIsenai;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(50)
);


CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO produtos (id_produto, nome, preco_unitario, categoria)
VALUES
    (1, 'Produto A', 20.00, 'Eletrônicos'),
    (2, 'Produto B', 17.50, 'Roupas'),
    (3, 'Produto C', 25.00, 'Alimentos'),
    (4, 'Produto D', 11.75, 'Decoração');

INSERT INTO estoque (id_produto, quantidade) VALUES
    (1, 50),
    (2, 100),
    (3, 75),
    (4, 30);

SELECT * FROM produtos;
SELECT * FROM estoque;

CREATE VIEW vw_estoque_critico AS
SELECT
    p.nome AS nome_produto,
    e.quantidade
FROM
    produtos p
    INNER JOIN estoque e ON p.id_produto = e.id_produto
WHERE
    e.quantidade < 50;
SELECT * FROM vw_estoque_critico;

