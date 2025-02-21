create user 'novo_usuario'@'localhost ' identified by 'senha123';

select user, host from mysql.user;

create database pizzaria;

grant all privileges on pizzaria. * to 'novo_usuario'@'localhost';

revoke create on pizzaria. * from 'novo_usuario'@'localhost';

use pizzaria;
create table pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
ingredientes varchar(250)
);


show grants for 'novo_usuario'@'localhost';


create table au_pizza(
id_aupizza int auto_increment primary key,
id_pizza int ,
sabor varchar(250),
ingredientes varchar(250),
usuario varchar(100),
data_hora datetime,
operacao varchar(10)
);

delimiter $$
create trigger depois_insert_pizza
after insert on pizza 
for each row 
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
end $$

delimiter ;    


select * from au_pizza;