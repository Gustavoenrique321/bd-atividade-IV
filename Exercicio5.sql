CREATE DATABASE bepatient;
USE bepatient;

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);

CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);
INSERT INTO alunos (id_aluno, nome, data_nascimento, serie)
VALUES
    (1, "Ronaldo", '2005-01-15', 8),
    (2, "Kaka", '2006-03-22', 7),
    (3, "Carl", '2004-08-10', 9);
    
INSERT INTO matriculas (id_matricula, id_aluno, data_matricula, status)
VALUES
    (1, 1, '2023-01-01', 'Ativa'),
    (2, 2, '2023-01-02', 'Inativa'),
    (3, 3, '2023-01-03', 'Ativa');

SELECT * FROM alunos;
SELECT * FROM matriculas;

DELIMITER //

CREATE TRIGGER verificar_idade_aluno
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE ano_nascimento INT;
    DECLARE ano_matricula INT;
    DECLARE serie_aluno INT;

    SELECT YEAR(data_nascimento), serie INTO ano_nascimento, serie_aluno
    FROM alunos
    WHERE id_aluno = NEW.id_aluno;

    SET ano_matricula = YEAR(NEW.data_matricula);

    IF (ano_matricula - ano_nascimento) < serie_aluno THEN
        SET NEW.status = 'erro: O aluno não atende aos requisitos de idade para a série.';
    END IF;
END;

//

DELIMITER ;
