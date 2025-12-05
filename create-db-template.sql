create database deposito_industrial;

use deposito_industrial;

create table produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    SKU VARCHAR(50) UNIQUE NOT NULL,
    codigo_barras VARCHAR(50) UNIQUE,
    id_categoria INT,
    id_fornecedor INT,
    descricao TEXT,
    unidade VARCHAR(20) NOT NULL,
    estoque INT DEFAULT 0,
    estoque_minimo INT DEFAULT 0,
    preco DECIMAL(10, 2) NOT NULL
);

create table fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    CNPJ VARCHAR(20) UNIQUE NOT NULL,
    endereco TEXT NOT NULL
);

create table categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

create table localizacao (
    id_localizacao INT AUTO_INCREMENT PRIMARY KEY,
    nome_local VARCHAR(100) NOT NULL,
    descricao TEXT
);

create table setores (
    id_setor int AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

create table funcionarios (
    id_funcionario int primary key AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

create table estoque_local (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL
);

create table pedidos_compra (
    id_pedido int AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total_pedido DECIMAL(10, 2) NOT NULL,
    id_funcionario INT NOT NULL
);

create table itens_pedido_compra (
    id_item int AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);


CREATE TABLE entrada (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id INT NOT NULL,
    data_entrada DATE NOT NULL,
    quantidade INT NOT NULL,
    id_funcionario INT NOT NULL,

    CONSTRAINT fk_entrada_funcionarios 
        FOREIGN KEY (id_funcionario) 
        REFERENCES funcionarios (id_funcionario),

    CONSTRAINT fk_entrada_produtos 
        FOREIGN KEY (id) 
        REFERENCES produtos (id)
);

create table itens_entrada (
    id_item_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_entrada INT NOT NULL,
    id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_itens_entrada

    FOREIGN key (id_entrada) references entrada (id_entrada),

    CONSTRAINT fk_entrada_produto

        FOREIGN KEY (id) 
        REFERENCES produtos (id)
);

create table saidas (
    id_saida int AUTO_INCREMENT PRIMARY KEY,
    data_saida date not null,
    destino varchar(200) not null,
    id_funcionario int not null,
    observacao text,
    CONSTRAINT fk_saidas_funcionarios
    foreign key (id_funcionario)
    references funcionarios (id_funcionario)
);

create table itens_saida (
    id_item_saida int AUTO_INCREMENT PRIMARY KEY,
    id_saida int not null,
    id int not null,
    quantidade int not null,
    id_funcionario int not null,

    CONSTRAINT fk_itens_saida
    foreign key (id_saida)
    references saidas (id_saida),

    constraint fk_saida_funcionario
    foreign key (id_funcionario)
    references funcionarios (id_funcionario),

    constraint fk_saida_produto
    foreign key (id)
    references produtos (id)

);

 create table transferencias (
    id_trasnferencia INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_localizacao INT NOT NULL,
    quantidade INT NOT NULL,
    data_transferencia DATE NOT NULL,
    id_funcionario INT NOT NULL,

    constraint fk_transferencia_funcionarios
    foreign key (id_funcionario)
    references funcionarios (id_funcionario),

    constraint fk_transferencia_produto
    foreign key (id_produto)
    references produtos (id),

    constraint fk_transferencia_localizacao
    foreign key (id_localizacao)
    references localizacao (id_localizacao)
 );

 