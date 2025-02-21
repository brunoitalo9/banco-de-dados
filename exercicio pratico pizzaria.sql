-- 1️ Crie um usuário chamado luiz-maia e conceda a ele permissões apenas de insert, update e select no banco pizzaria.

create user 'luiz_maia'@'%' identified by 'senai@123';


grant insert, update, select on pizzaria.* to 'luiz_maia'@'%';

-- Informe o ip do seu computador para o instrutor.

-- 192.168.56.1

--  3 Monitore as operações realizadas na tabela de auditoria au_pizza.

select * from au_pizza;

-- 4 Construa uma trigger para identificar os updates na tabela pizza e grave as antigas informações na tabela au_pizza.

delimiter $$
create trigger depois_update_pizza
after update on pizza 
 for each row 
begin
insert into au_pizza (id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'update');
end $$

delimiter ;    

