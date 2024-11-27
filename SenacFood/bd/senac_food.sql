-- Criação do banco de dados
CREATE DATABASE senac_food;

USE senac_food;

-- Tabela de departamentos
CREATE TABLE departamento (
    id_departamento INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    PRIMARY KEY (id_departamento)
);


-- Tabela de funcionários
CREATE TABLE funcionario (
    id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    cargo VARCHAR(45),
    id_departamento INT,
    PRIMARY KEY (id_funcionario),
    FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento) ON DELETE SET NULL -- Caso o departamento seja excluído, o funcionário terá o departamento removido
);


/*Tabela de produtos
Contém as informações sobre os produtos disponíveis na lanchonete, 
como nome, preço, categoria e descrição.*/

CREATE TABLE produto ( 
    id_produto INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255), 
    imagem LONGBLOB, 
    categoria VARCHAR(45), 
    descricao TEXT, 
    preco DECIMAL(5,2), 
    disponibilidade BOOLEAN,
    PRIMARY KEY (id_produto) 
);


/*Tabela de estoque
Controla a quantidade em estoque de cada produto 
e permite atualizações e controle de entradas/saídas.*/

CREATE TABLE estoque (
    id_estoque INT NOT NULL AUTO_INCREMENT,
    id_produto INT, -- Referência ao produto
    quantidade INT, -- Quantidade em estoque
    preco_custo DECIMAL(5,2), -- Preço de custo do produto
    data_ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Data de alteração do estoque
    PRIMARY KEY (id_estoque),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE 
);


/*Tabela de pedidos Contém informações gerais sobre cada pedido,
como data, hora e o estado do pedido.*/

CREATE TABLE pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    data_hora_pedido DATETIME,
    estado_pedido VARCHAR(45),
    PRIMARY KEY (id_pedido)
);


/*Tabela de unidades 
Controla as unidades de medida dos produtos,
caso necessário (como unidade, gramas, litros, etc.)*/

CREATE TABLE unidade (
    id_unidade INT NOT NULL AUTO_INCREMENT,
    nome_unidade VARCHAR(45),
    PRIMARY KEY (id_unidade)
);


/*Tabela de itens de pedido
Registra cada item incluído em um pedido, 
juntamente com a quantidade e o produto correspondente.*/

CREATE TABLE item_pedido (
    id_item_pedido INT NOT NULL AUTO_INCREMENT,
    quantidade INT,
    tipo VARCHAR(45),
    observacoes VARCHAR(140),
    id_pedido INT,
    id_unidade INT,
    id_produto INT,
    PRIMARY KEY (id_item_pedido),
    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido) ON DELETE CASCADE, -- Se o pedido for excluído, os itens também são excluídos
    FOREIGN KEY (id_unidade) REFERENCES unidade (id_unidade) ON DELETE CASCADE, -- Se a unidade for excluída, o item também é excluído
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto) ON DELETE CASCADE -- Se o produto for excluído, o item do pedido também é excluído
);


/*Tabela de histórico de pedidos 
Registra as mudanças de estado dos pedidos 
ao longo do processo (separação, preparação, etc.).*/

CREATE TABLE historico_pedido (
    id_historico_pedido INT NOT NULL AUTO_INCREMENT,
    estado_pedido_historico VARCHAR(45),
    data_hora_pedido DATETIME,
    id_funcionario INT,
    id_pedido INT,
    PRIMARY KEY (id_historico_pedido),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario) ON DELETE SET NULL, -- Se o funcionário for excluído, o histórico mantém o registro com id_funcionario = NULL
    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido) ON DELETE CASCADE -- Se o pedido for excluído, o histórico relacionado ao pedido também será excluído
);


/*Tabela de histórico de status de itens de pedido
Registra as mudanças de estado de cada item dentro de um pedido,
permitindo um rastreamento mais detalhado*/

CREATE TABLE historico_item_pedido (
    id_historico_item_pedido INT NOT NULL AUTO_INCREMENT,
    id_item_pedido INT,
    estado_item_pedido VARCHAR(45), -- Estado específico do item (ex: "em separação", "em preparação", etc.)
    data_hora_estado TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora da alteração do estado
    PRIMARY KEY (id_historico_item_pedido),
    FOREIGN KEY (id_item_pedido) REFERENCES item_pedido(id_item_pedido) ON DELETE CASCADE -- Se o item de pedido for excluído, o histórico do item será excluído
);


-- Tabela de clientes
/* Contém informações sobre os clientes da lanchonete */

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(15),
    PRIMARY KEY (id_cliente)
);


/* Tabela de endereço de clientes 
Permite registrar múltiplos endereços para cada cliente */

CREATE TABLE endereco_cliente (
    id_endereco_cliente INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    cep VARCHAR(20),
    PRIMARY KEY (id_endereco_cliente),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE -- Se o cliente for excluído, todos os endereços desse cliente também são excluídos
);


/* Tabela de pagamento de pedidos
Registra o método e o valor pago para cada pedido */
CREATE TABLE pagamento_pedido (
    id_pagamento_pedido INT NOT NULL AUTO_INCREMENT,
    id_pedido INT,
    valor_pago DECIMAL(5,2), -- Valor pago
    metodo_pagamento VARCHAR(45), -- Método de pagamento (ex: 'cartão', 'dinheiro', 'pix', etc.)
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora do pagamento
    PRIMARY KEY (id_pagamento_pedido),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE -- Se o pedido for excluído, o pagamento relacionado também será excluído
);


/* Tabela de descontos nos itens de pedido
Permite o gerenciamento de descontos aplicados
aos itens dos pedidos */
CREATE TABLE desconto_item_pedido (
    id_desconto_item_pedido INT NOT NULL AUTO_INCREMENT,
    id_item_pedido INT,
    valor_desconto DECIMAL(5,2), -- Valor do desconto aplicado
    tipo_desconto VARCHAR(45), -- Tipo de desconto (por exemplo, 'porcentagem', 'valor fixo')
    PRIMARY KEY (id_desconto_item_pedido),
    FOREIGN KEY (id_item_pedido) REFERENCES item_pedido(id_item_pedido) ON DELETE CASCADE -- Se o item de pedido for excluído, o desconto aplicado será removido
);


-- Relacionamentos de departamentos e funcionários
ALTER TABLE funcionario ADD CONSTRAINT fk_departamento
    FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento) ON DELETE NO ACTION;


-- Índices na tabela de pedido
CREATE INDEX idx_pedido_estado ON pedido(estado_pedido);
CREATE INDEX idx_pedido_id_cliente ON pedido(id_pedido);

-- Índices na tabela de item_pedido
CREATE INDEX idx_item_pedido_id_pedido ON item_pedido(id_pedido);
CREATE INDEX idx_item_pedido_id_produto ON item_pedido(id_produto);

-- Índices na tabela de estoque
CREATE INDEX idx_estoque_id_produto ON estoque(id_produto);

-- Índices na tabela de produto
CREATE INDEX idx_produto_disponibilidade ON produto(disponibilidade);
CREATE INDEX idx_produto_categoria ON produto(categoria);

-- Índices na tabela de historico_pedido
CREATE INDEX idx_historico_pedido_id_pedido ON historico_pedido(id_pedido);
CREATE INDEX idx_historico_pedido_funcionario ON historico_pedido(id_funcionario);

-- Índices na tabela de historico_item_pedido
CREATE INDEX idx_historico_item_pedido_id ON historico_item_pedido(id_item_pedido);
CREATE INDEX idx_historico_item_pedido_estado ON historico_item_pedido(estado_item_pedido);



-- Compra e atualização do estoque numa transação
START TRANSACTION;

-- 1. Verificar se o estoque é suficiente para todos os itens do pedido
-- Esta consulta verifica a quantidade de estoque disponível e retorna a quantidade de produtos com estoque insuficiente
SELECT COUNT(*) 
INTO @estoque_insuficiente
FROM item_pedido ip
JOIN estoque e ON ip.id_produto = e.id_produto
WHERE ip.id_pedido = ?  -- Passar o id do pedido
AND e.quantidade < ip.quantidade;

-- 2. Caso o estoque seja insuficiente, desfazemos a transação
-- Caso o valor retornado pela verificação seja maior que 0, significa que o estoque não é suficiente
SELECT @estoque_insuficiente;

-- Se o valor de @estoque_insuficiente for maior que 0, significa que o estoque é insuficiente
-- Neste caso, utilizamos ROLLBACK para desfazer as alterações realizadas até o momento.
-- Caso contrário, prosseguimos com as atualizações.

-- Exemplo de como pode ser feito na aplicação, o controle de fluxo para verificar o estoque:
-- Se o resultado de @estoque_insuficiente for maior que 0, então é necessário emitir uma mensagem de erro e não continuar

-- 3. Atualizar o estado do pedido conforme necessário
UPDATE pedido
SET estado_pedido = 
    CASE 
        WHEN estado_pedido = 'em separação' THEN 'em preparação'
        WHEN estado_pedido = 'em preparação' THEN 'pronto para retirada'
        WHEN estado_pedido = 'pronto para retirada' THEN 'retirado'
        ELSE estado_pedido
    END
WHERE id_pedido = ?;  -- Passar o id do pedido

-- 4. Atualizar o estoque, subtraindo a quantidade dos itens no pedido
UPDATE estoque
SET quantidade = quantidade - (SELECT quantidade FROM item_pedido WHERE id_pedido = ? AND id_produto = estoque.id_produto)
WHERE id_produto IN (SELECT id_produto FROM item_pedido WHERE id_pedido = ?);

-- 5. Registrar a mudança de estado no histórico de pedidos
INSERT INTO historico_pedido (estado_pedido_historico, data_hora_pedido, id_funcionario, id_pedido)
VALUES ('Estado atualizado para ' || (SELECT estado_pedido FROM pedido WHERE id_pedido = ?), NOW(), ?, ?);

-- 6. Registrar a mudança de estado do item no histórico de itens de pedido
INSERT INTO historico_item_pedido (id_item_pedido, estado_item_pedido, data_hora_estado)
SELECT id_item_pedido, 
       CASE 
           WHEN estado_item_pedido IS NULL THEN 'em separação'
           ELSE estado_item_pedido
       END,
       NOW()
FROM item_pedido
WHERE id_pedido = ?;

-- 7. Confirmar a transação se tudo ocorreu bem
COMMIT;







-- trigger para atualizar estoque ao adicionar item de pedido
DELIMITER $$

CREATE TRIGGER trg_atualiza_estoque_ao_adicionar_item_pedido
AFTER INSERT ON item_pedido
FOR EACH ROW
BEGIN
    -- Verifica se há estoque suficiente antes de atualizar
    IF (SELECT quantidade FROM estoque WHERE id_produto = NEW.id_produto) < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente para este produto';
    ELSE
        -- Atualiza a quantidade de estoque, subtraindo a quantidade do item adicionado
        UPDATE estoque
        SET quantidade = quantidade - NEW.quantidade
        WHERE id_produto = NEW.id_produto;
    END IF;
END$$

DELIMITER ;


-- trigger para restaurar estoque ao remover item de pedido
DELIMITER $$

CREATE TRIGGER trg_restaurar_estoque_ao_remover_item_pedido
AFTER DELETE ON item_pedido
FOR EACH ROW
BEGIN
    -- Restaura a quantidade de estoque somando a quantidade do item removido
    UPDATE estoque
    SET quantidade = quantidade + OLD.quantidade
    WHERE id_produto = OLD.id_produto;
END$$

DELIMITER ;


-- trigger para validar estado dos itens de pedido
DELIMITER $$

CREATE TRIGGER trg_valida_estado_item_pedido
BEFORE INSERT ON historico_item_pedido
FOR EACH ROW
BEGIN
    -- Verifica se a transição de estado é válida para o item do pedido
    IF NEW.estado_item_pedido = 'pronto para retirada' THEN
        -- Verifica se o item está em preparação antes de permitir a transição
        IF (SELECT estado_item_pedido FROM item_pedido WHERE id_item_pedido = NEW.id_item_pedido) != 'em preparação' THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transição inválida de estado do item.';
        END IF;
    END IF;
END$$

DELIMITER ;
