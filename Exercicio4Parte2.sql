CREATE DATABASE DB_SENAIDAHORA;
USE DB_SENAIDAHORA;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao TEXT NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
    (1, 'Eletrônicos', 'Produtos eletrônicos modernos.'),
    (2, 'Roupas', 'Vestuário para todas as idades.'),
    (3, 'Alimentos', 'Produtos alimentícios.'),
    (4, 'Decoração', 'Itens decorativos para sua casa.');

INSERT INTO produtos (id_produto, nome, preco_unitario, id_categoria)
VALUES
    (1, 'Smartphone', 990.99, 1),
    (2, 'Camiseta', 29.99, 2),
    (3, 'Arroz', 8.90, 3),
    (4, 'Vaso Decorativo', 25.80, 4);

SELECT * FROM categorias;
SELECT * FROM produtos;

CREATE VIEW vw_relatorio_produtos_categoria AS
SELECT
    c.nome_categoria AS nome_categoria,
    COUNT(p.id_produto) AS num_produtos,
    SUM(p.preco_unitario) AS valor_total_produtos
FROM
    categorias c
    LEFT JOIN produtos p ON c.id_categoria = p.id_categoria
GROUP BY
    c.id_categoria, c.nome_categoria;

SELECT * FROM vw_relatorio_produtos_categoria;
