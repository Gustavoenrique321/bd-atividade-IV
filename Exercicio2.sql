CREATE DATABASE DB_CARLAOATVD;
USE DB_CARLAOATVD;

CREATE TABLE contas (
    id_conta INT PRIMARY KEY,
    nome VARCHAR(55),
    saldo DECIMAL(10, 2)
);

CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY,
    id_conta INT,
    tipo VARCHAR(10),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);

INSERT INTO contas (id_conta, nome, saldo)
VALUES
    (1, 'Conta 1', 2000.00),
    (2, 'Conta 2', 500.00),
    (3, 'Conta 3', 2000.00);

INSERT INTO transacoes (id_transacao, id_conta, tipo, valor) VALUES
    (1, 1, 'entrada', 500.00),
    (2, 2, 'saída', 200.00),
    (3, 3, 'entrada', 1000.00);

SELECT * FROM contas;
SELECT * FROM  transacoes

DELIMITER //

CREATE TRIGGER atualizar_saldo_trigger
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    UPDATE contas
    SET saldo = CASE
        WHEN NEW.tipo = 'entrada' THEN saldo + NEW.valor
        WHEN NEW.tipo = 'saída' THEN saldo - NEW.valor
        ELSE saldo
    END
    WHERE id_conta = NEW.id_conta;
END;

//

DELIMITER ;
