DELIMITER //

CREATE PROCEDURE contar_clientes_cadastrados_no_dia(IN data DATE)
BEGIN
    SELECT COUNT(*) AS total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data;
END //

DELIMITER ;

-- Para chamar o procedimento e obter a contagem de clientes cadastrados em uma data específica, você pode usar o seguinte comando SQL:
CALL contar_clientes_cadastrados_no_dia('2024-05-29');

-- Procedimento Armazenado em PostgreSQL
CREATE OR REPLACE FUNCTION contar_clientes_cadastrados_no_dia(data DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data;
    
    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

-- Para chamar a função e obter a contagem de clientes cadastrados em uma data específica, você pode usar o seguinte comando SQL:
SELECT contar_clientes_cadastrados_no_dia('2024-05-29');
