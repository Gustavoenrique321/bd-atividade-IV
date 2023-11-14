CREATE DATABASE cansaço;
use cansaço;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);

INSERT INTO funcionarios (id_funcionario, nome, cargo, salario)
VALUES
    (1, 'marina Silva', 'Vendedor', 4000.00),
    (2, 'Pedro jose', 'Gerente', 5000.00),
    (3, 'Ana claudia', 'Vendedor', 3200.00);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

INSERT INTO vendas (id_venda, id_funcionario, data_venda, valor_venda)
VALUES
    (1, 1, '2023-01-01', 1200.00),
    (2, 2, '2023-01-02', 2800.50),
    (3, 3, '2023-01-03', 850.00);
   

CREATE VIEW vw_relatorio_vendas_funcionario AS
SELECT
    f.nome AS nome_funcionario,
    COUNT(v.id_venda) AS num_vendas,
    SUM(v.valor_venda) AS valor_total_vendas
FROM
    funcionarios f
    LEFT JOIN vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY
    f.id_funcionario, f.nome;
    
SELECT * FROM vw_relatorio_vendas_funcionario;

