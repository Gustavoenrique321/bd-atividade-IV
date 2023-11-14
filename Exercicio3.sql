CREATE DATABASE DB_BANCODOLUQUETAA;
USE DB_BANCODOLUQUETAA;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);
INSERT INTO funcionarios (id_funcionario, nome, data_admissao)
VALUES
    (23, 'Renato Russo', '2023-01-01');
    
SELECT * FROM funcionarios;
    
DELIMITER //

CREATE TRIGGER verificar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
   IF NEW.data_admissao <= NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'erro: A data de admissão deve ser maior que a data atual.';
    END IF;
END;

//

DELIMITER ;
