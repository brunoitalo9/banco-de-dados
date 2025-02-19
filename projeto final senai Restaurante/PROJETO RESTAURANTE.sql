create database restaurante;
use restaurante;
 -- drop database restaurante;

CREATE TABLE comanda (
id_comanda int not null,
abertura datetime,
cliente varchar(100),
mesa int ,
fechamento datetime,
primary key (id_comanda, abertura)
);

create table cardapio (
id_cardapio int not null primary key,
nome varchar(100),
quantidade int,
preco decimal(7,2),
descricao varchar(250)
); 

CREATE TABLE pedido (
id_pedido int not null primary key,
quantidade int,
data_hora datetime,
id_comanda int,
id_cardapio int,
abertura datetime
);

alter table pedido 
add foreign key (id_comanda, abertura) references comanda (id_comanda, abertura);

alter table pedido
add foreign key (id_cardapio) references cardapio (id_cardapio);

insert into cardapio (id_cardapio, nome, quantidade, preco, descricao) values
("1","Picanha",1,8.99,"Espeto de picanha suculenta"),
("2","Alcatra",1,8.99,"Espeto de Alcatra saborosa"),
("3","Contra-Filé",1,8.99,"Espeto suculento de Contra-Filé"),
("4","Carne-de-Sol",1,8.99,"Espeto delicioso da melhor carne de sol do Nordeste"),
("5","Coração",1,8.99,"Espeto de coração delicioso preparado pelo chef"),
(6,"Frango",1,8.99,"Espeto de Frango na melhor brasa"),
(7,"Asinha de Frango",1,8.99,"Espeto de Asinha de Frango de uma galinha de ouro"),
(8,"Medalhão de Frango",1,8.99,"Espeto de Medalhão de Frango da melhor dupla frango e porco do mundo"),
(9,"Medalhão de Carne",1,8.99,"Espeto de Medalhão de Carne da melhor dupla carne e porco do mundo"),
(10,"Kafta com queijo",1,8.99,"Espeto de Kafta da meçhor dupla carne e queijo do mundo"),
(11,"Linguiça Toscana",1,8.99,"Espeto de Linguiça Toscana do porco mais delicioso do Nordeste "),
(12,"Linguiça Apimentada",1,8.99,"Espeto de Linguiça preparado com a pimenta mais voraz do Nordeste"),
(13,"Queijo coalho",1,8.99,"Espeto de Queijo Coalho preparado com o leite retirado diretamente das tetas das meelhores vacas Nordestinas"),
(14,"Pão de Alho",1,8.99,"Pão de alho do melhor alho já cultivado pelas mãos Nordestinas"),
(15,"Jantinha",1,19.99,"Arroz branco ou baião de dois, feijão tropeiro, mandioca e vinagrete preparado pelas majestosas mãos da rainha da culinaria Nordestina"),
(16,"Baguete",1,19.99,"A junção de tudo aquilo que há de melhor, uma mistura de sabores, uma inserção de amores, a junção de tudo aquilo que você pode amar, uma maravilhosa baguete espetacular"),
(17,"Refrigerante Lata",1,4.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(18,"Refrigerante 600ml",1,6.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(19,"Regrigerante 2L",1,9.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(20,"Suco 500ml",1,6.99,"Limão, Laranja, Maracujá, Acerola, Uva, Abacaxi, Abacaxi C/Hortelã");

insert into comanda (id_comanda, cliente, mesa, abertura) values 
(1,"Fabricio ",7,'2025-02-14 22:00:00'),
(2,"Maria",8,'2025-03-01 13:45:00'),
(3,"Eduarda",6,'2025-06-12 09:30:00'),
(4,"Lucas",2,'2025-04-18 17:20:00'),
(5,"Carlos",5,'2025-07-22 21:10:00'),
(6,"Deivid",4,'2025-11-05 06:55:00'),
(7,"João",9,'2025-02-25 14:35:00'),
(8,"Davi",1,'2025-09-30 03:15:00'),
(9,"Ricardo",3,'2025-05-08 11:50:00'),
(10,"Lucemar",10,'2025-10-21 19:05:00');

insert into pedido(id_pedido, quantidade, data_hora, id_cardapio, id_comanda) values
(1,1,'2025-02-14 22:05:00',15,1),
(2,1,'2025-02-14 22:05:00',2,1),
(3,1,'2025-02-14 22:05:00',20,1),
(4,1,'2025-03-01 13:50:00',15,2),
(5,1,'2025-03-01 13:50:00',7,2),
(6,1,'2025-03-01 13:45:00',17,2),
(7,2,'2025-09-30 03:15:00',1,8),
(8,1,'2025-09-30 03:15:00',15,8),
(9,1,'2025-09-30 03:15:00',17,8),
(10,1,'2025-10-21 19:07:00',14,10),
(11,1,'2025-10-21 19:15:00',20,10),
(12,1,'2025-03-01 13:50:00',15,3),
(13,1,'2025-03-01 13:50:00',3,3),
(14,1,'2025-03-01 13:50:00',17,3),
(15,1,'2025-07-22 21:25:00',20,5),
(16,1,'2025-07-22 21:27:00',15,5),
(17,1,'2025-07-22 21:27:00',4,5),
(18,3,'2025-05-08 11:55:00',12,9),
(19,2,'2025-05-08 12:00:00',17,9),
(20,1,'2025-03-01 13:50:00',2,2),
(21,1,'2025-03-01 13:50:00',15,2),
(22,1,'2025-03-01 13:50:00',20,2);