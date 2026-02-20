-- Criando tabela de farmacias
CREATE TABLE farmacias (
    id_farmacia INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Criando tabela de medicamentos
CREATE TABLE medicamentos (
    id_medicamento INT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

-- Criando tabela de vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_farmacia INT,
    id_medicamento INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_farmacia) REFERENCES farmacias(id_farmacia),
    FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento)
);

-- Inserindo dados em farmacias
INSERT INTO farmacias VALUES
(1, 'Farmácia Popular', 'Recife'),
(2, 'Drogaria Central', 'São Paulo'),
(3, 'Farmácia Saúde+', 'Rio de Janeiro');

-- Inserindo dados em medicamentos
INSERT INTO medicamentos VALUES
(1, 'Dipirona', 'Analgésico', 12.50),
(2, 'Amoxicilina', 'Antibiótico', 35.90),
(3, 'Vitamina C', 'Suplemento', 18.00);

-- Inserindo dados em vendas
INSERT INTO vendas VALUES
(1, 1, 1, 10, '2026-01-10'),
(2, 2, 2, 5, '2026-01-12'),
(3, 3, 3, 8, '2026-01-15'),
(4, 1, 2, 3, '2026-01-20');

-- Medicamento mais vendido
SELECT m.nome, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN medicamentos m ON v.id_medicamento = m.id_medicamento
GROUP BY m.nome
ORDER BY total_vendido DESC;

-- Faturamento por farmácia
SELECT f.nome, SUM(v.quantidade * m.preco) AS faturamento
FROM vendas v
JOIN farmacias f ON v.id_farmacia = f.id_farmacia
JOIN medicamentos m ON v.id_medicamento = m.id_medicamento
GROUP BY f.nome
ORDER BY faturamento DESC;
