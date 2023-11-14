CREATE DATABASE senaisenpai;
use senaisenpai;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_estoque INT
);

INSERT INTO produtos (id_produto, nome, quantidade_estoque) VALUES
    (1, 'Produto A', 20),
    (2, 'Produto B', 10),
    (3, 'Produto C', 30);

CREATE TABLE itens_venda (
    id_item_venda INT PRIMARY KEY,
    id_venda INT,  
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO itens_venda (id_item_venda, id_venda, id_produto, quantidade)
VALUES
    (1, 1, 1, 5),
    (2, 1, 2, 10),
    (3, 2, 3, 25);

SELECT * FROM  itens_venda;

DELIMITER //

CREATE TRIGGER verificar_estoque_trigger
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;

    SELECT quantidade_estoque INTO estoque_atual
    FROM produtos
    WHERE id_produto = NEW.id_produto;

    IF estoque_atual < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'erro: Produto fora de estoque.';
    END IF;
END;

//

DELIMITER ;
