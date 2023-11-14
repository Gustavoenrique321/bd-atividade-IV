CREATE DATABASE db_natalsenai;
use db_natalsenai;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cidade VARCHAR(255)
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    data_pagamento DATE,
    valor_pagamento DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nome, endereco, cidade) VALUES
    (1, 'Maria Silva', 'Rua A, 123', 'Cidade A'),
    (2, 'João Oliveira', 'Rua B, 456', 'Cidade B');

INSERT INTO pagamentos (id_pagamento, id_cliente, data_pagamento, valor_pagamento) VALUES
    (1, 1, '2023-01-01', 1200.00),
    (2, 2, '2023-01-02', 2500.50);

CREATE VIEW vw_relatorio_pagamentos_cidade AS
SELECT
    c.cidade AS nome_cidade,
    SUM(p.valor_pagamento) AS valor_total_pagamentos_cidade
FROM
    clientes c
    LEFT JOIN pagamentos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.cidade;
    
SELECT * FROM vw_relatorio_pagamentos_cidade;

