CREATE DATABASE H20;
USE H20; 

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
INSERT INTO clientes (id_cliente, nome, email, telefone)
VALUES
    (1, 'Maria Silva', 'mariasilva@gmail.com', '123456789'),
    (2, 'João Carneiro', 'joaocarneiro@gmail.com', '987654321'),
    (3, 'Ana Souza', 'anasouza@gmail.com', '719875514'),
    (4, 'Carlos Jesus', 'carlosjesus@gmail.com', '71987331918');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total)
VALUES
    (1, 1, '2023-01-01', 50.00),
    (2, 2, '2023-03-02', 75.50),
    (3, 3, '2023-04-03', 120.00),
    (4, 4, '2023-05-04', 30.00);
    
SELECT * FROM clientes;
SELECT * FROM pedidos;
    
CREATE VIEW vw_relatorio_pedidos_cliente AS
SELECT
    c.id_cliente,
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS num_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente, c.nome;
    
    SELECT * FROM vw_relatorio_pedidos_cliente;
