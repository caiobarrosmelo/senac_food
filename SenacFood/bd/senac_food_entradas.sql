-- Inserindo Sanduíches
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Pão com ovo', NULL, 'Sanduíches', 'pão, manteiga e dois ovos', 7.00, true),
('Misto quente', NULL, 'Sanduíches', 'pão, manteiga, queijo prato e presunto', 9.00, true),
('Misto quente com ovo', NULL, 'Sanduíches', 'pão, manteiga, queijo prato, presunto e ovo na chapa', 11.00, true),
('Baguete de Bacon, tomate e ovo', NULL, 'Sanduíches', 'pão, bacon, ovo, tomate, orégano, alface e molho de limão', 12.00, true),
('Baguete de frango', NULL, 'Sanduíches', 'peito de frango na chapa com cebola, tomate, alface e molho de limão', 12.00, true),
('Baguete vegetariana', NULL, 'Sanduíches', 'beringela, abobrinha, cebola e abóbora na chapa com especiarias: tomate, alface e molho de chimichurri', 9.00, true);

-- Inserindo Wraps
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Frango picante', NULL, 'Wraps', 'tortilha, cream cheese, frango, mozarela, cebolinha, alfaces, azeitonas e molho de iogurte e mostarda', 12.00, true),
('Brisket', NULL, 'Wraps', 'tortilha, cream cheese, peito confitado, cebolinha, alface, pickle de cebola roxa e molho de limão e alho', 14.00, true),
('Veggie', NULL, 'Wraps', 'tortilha integral, cream cheese light, queijo Minas, ovo cozido, tomate seco, alfaces e molho de iogurte e mostarda', 14.00, true);

-- Inserindo Crepioca
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Vegana', NULL, 'Crepioca', 'batata doce, purê de grão-de-bico com cebola, tomate seco e maionese de couve-flor', 9.00, true),
('Veggie', NULL, 'Crepioca', 'beringela, abobrinha, cebola e tomate grelhados com creme de requeijão', 10.00, true),
('Healthy', NULL, 'Crepioca', 'queijo coalho, filé de frango, cream cheese, tomate seco e cebola na chapa', 11.00, true);

-- Inserindo Tapioca
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Mista', NULL, 'Tapioca', NULL, 6.00, true),
('Queijo Coalho', NULL, 'Tapioca', NULL, 6.00, true),
('Carne com queijo', NULL, 'Tapioca', NULL, 7.00, true),
('Frango com queijo', NULL, 'Tapioca', NULL, 8.00, true),
('Coco', NULL, 'Tapioca', NULL, 6.00, true),
('Coco e queijo', NULL, 'Tapioca', NULL, 6.00, true);

-- Inserindo Folhados
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Folhado de frango', NULL, 'Folhados', NULL, 8.00, true),
('Folhado de carne de sol', NULL, 'Folhados', NULL, 8.00, true),
('Folhado de camarão', NULL, 'Folhados', NULL, 8.00, true);

-- Inserindo Salgados
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Pão Pizza', NULL, 'Salgados', NULL, 6.00, true),
('Empada de Camarão', NULL, 'Salgados', NULL, 7.00, true),
('Empada Mista ou Queijo ou Frango', NULL, 'Salgados', NULL, 6.00, true),
('Salgado Integral', NULL, 'Salgados', NULL, 6.00, true),
('Quiche Lorraine ou Alho Poró', NULL, 'Salgados', NULL, 7.00, true),
('Enrolado de Salsicha ou Calabresa', NULL, 'Salgados', NULL, 6.00, true),
('Coxinha de Carne de Sol', NULL, 'Salgados', NULL, 6.00, true),
('Coxinha de Frango', NULL, 'Salgados', NULL, 5.00, true),
('Calzone Misto', NULL, 'Salgados', NULL, 6.00, true),
('Calzone Frango', NULL, 'Salgados', NULL, 6.00, true),
('Calzone Queijo', NULL, 'Salgados', NULL, 7.00, true),
('Esfiha', NULL, 'Salgados', NULL, 6.00, true);

-- Inserindo Omeletes
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Omelete de Carne e Queijo', NULL, 'Omeletes', NULL, 15.00, true),
('Omelete de Frango e Queijo', NULL, 'Omeletes', NULL, 14.00, true),
('Omelete de Queijo ou Mista', NULL, 'Omeletes', NULL, 10.00, true);

-- Inserindo Doces
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Tortas (100g)', NULL, 'Doces', 'Escolha do dia', 7.00, true),
('Brigadeiros', NULL, 'Doces', NULL, 3.00, true),
('Tartelete', NULL, 'Doces', NULL, 7.00, true),
('Bolo de Pote', NULL, 'Doces', NULL, 7.50, true),
('Pudim', NULL, 'Doces', NULL, 7.00, true),
('Mousse', NULL, 'Doces', NULL, 5.00, true);

-- Inserindo Cafeteria
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Café Tradicional (pequeno)', NULL, 'Cafeteria', NULL, 2.00, true),
('Café Tradicional (grande)', NULL, 'Cafeteria', NULL, 3.00, true),
('Café Expresso (pequeno)', NULL, 'Cafeteria', NULL, 3.00, true),
('Café Expresso (grande)', NULL, 'Cafeteria', NULL, 5.00, true),
('Café com Leite (pequeno)', NULL, 'Cafeteria', NULL, 2.00, true),
('Café com Leite (grande)', NULL, 'Cafeteria', NULL, 3.00, true),
('Capuccino Senac (pequeno)', NULL, 'Cafeteria', NULL, 3.50, true),
('Capuccino Senac (grande)', NULL, 'Cafeteria', NULL, 6.00, true),
('Capuccino Italiano (pequeno)', NULL, 'Cafeteria', NULL, 3.50, true),
('Capuccino Italiano (grande)', NULL, 'Cafeteria', NULL, 6.00, true);

-- Inserindo Bebidas
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Água Mineral s/ gás', NULL, 'Bebidas', NULL, 3.00, true),
('Água Mineral c/ gás', NULL, 'Bebidas', NULL, 4.00, true),
('Coca-Cola (Mini)', NULL, 'Bebidas', NULL, 4.50, true),
('Fanta Laranja', NULL, 'Bebidas', NULL, 4.50, true),
('Sprite', NULL, 'Bebidas', NULL, 4.50, true),
('Coca-Cola (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true),
('Coca-Cola zero (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true),
('Guaraná Antárctica (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true),
('Guaraná Antárctica zero (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true),
('Sprite (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true),
('H20 (500ml)', NULL, 'Bebidas', NULL, 6.00, true),
('Água Tônica (Lata 350ml)', NULL, 'Bebidas', NULL, 6.00, true);

-- Inserindo Sucos Fruta
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Suco Laranja', NULL, 'Sucos Fruta', NULL, 6.00, true),
('Suco de Polpa', NULL, 'Sucos Fruta', NULL, 5.00, true),
('Suco Verde', NULL, 'Sucos Fruta', NULL, 7.00, true),
('Suco de Limão', NULL, 'Sucos Fruta', NULL, 6.00, true);

-- Inserindo Combos
INSERT INTO produto (nome, imagem, categoria, descricao, preco, disponibilidade) VALUES 
('Pão Pizza + Suco Laranja', NULL, 'Combos', NULL, 10.00, true),
('Coxinha de Frango + Suco de Laranja', NULL, 'Combos', NULL, 10.00, true);
