# Documentação Técnica - Projeto FarmaBot SQL

## Modelagem do Banco

### Tabelas:

### 1. farmacias
- id_farmacia (PK)
- nome
- cidade

### 2. medicamentos
- id_medicamento (PK)
- nome
- categoria
- preco

### 3. vendas
- id_venda (PK)
- id_farmacia (FK)
- id_medicamento (FK)
- quantidade
- data_venda

## Relacionamentos

- Uma farmácia pode ter várias vendas (1:N)
- Um medicamento pode aparecer em várias vendas (1:N)

## Consultas Desenvolvidas

- Medicamento mais vendido
- Faturamento por farmácia
- Categoria mais vendida

## Objetivo do Projeto

Simular um modelo de análise de vendas para futura integração com o projeto FarmaBot.
