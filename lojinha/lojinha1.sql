
CREATE DATABASE lojinha;
USE lojinha;


CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE EmailCliente (
    id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);


CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    data DATE NOT NULL,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);


CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE Produto (
    id INT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    idCategoria INT,
    idFornecedor INT,
    estoque INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(id),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(id)
);


CREATE TABLE PedidoProduto (
    id INT PRIMARY KEY,
    idPedido INT,
    idProduto INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedido(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);


INSERT INTO Cliente (id, nome) VALUES
(1, 'Ana'),
(2, 'José'),
(3, 'João');


INSERT INTO EmailCliente (id, email, idCliente) VALUES
(1, 'e1', 1),
(2, 'e2', 1),
(3, 'e3', 2),
(4, 'e4', 2),
(5, 'e5', 3);


INSERT INTO Pedido (id, data, idCliente) VALUES
(1, '2015-10-05', 1),
(2, '2014-12-31', 1),
(3, '2010-09-10', 2),
(4, '2015-03-14', 2),
(5, '2014-07-21', 2);


INSERT INTO Categoria (id, nome) VALUES
(1, 'Ferramenta'),
(2, 'Vestuário'),
(3, 'Alimento');


INSERT INTO Fornecedor (id, nome) VALUES
(1, 'F1'),
(2, 'F2'),
(3, 'F3');


INSERT INTO Produto (id, descricao, idCategoria, idFornecedor, estoque) VALUES
(1, 'Alicate', 1, 1, 10),
(2, 'Leite', 2, 1, 100),
(3, 'Suco', 2, 1, 50),
(4, 'Camisa', 3, 2, 40),
(5, 'Calça', 3, 2, 20);


INSERT INTO PedidoProduto (id, idPedido, idProduto, quantidade) VALUES
(1, 1, 1, 10),
(2, 1, 2, 20),
(3, 2, 3, 5),
(4, 3, 4, 10),
(5, 4, 5, 5);


select*from cliente;
select*from emailcliente;
select*from pedido;
select*from pedidoproduto;
select*from categoria;
select*from fornecedor;
select*from produto;
