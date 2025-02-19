-- Relatório (SQL - SELECT) para extrair informações importantes do banco (DQL), como:

-- Listar todas as comandas abertas:
select * from comanda where fechamento is null;

-- Consultar o cardápio completo:
select * from cardapio;

-- Obter o histórico de pedidos realizados:
select * from pedido;

-- Verificar quais pratos foram pedidos em uma determinada comanda:
select p.id_comanda, p.id_cardapio, c.nome from pedido p inner join cardapio c 
on p.id_cardapio = c.id_cardapio
group by p.id_comanda, p.id_cardapio , c.nome
order by p.id_comanda ;

-- Calcular o total gasto por cada comanda:

select p.id_comanda, sum(preco) from pedido p inner join cardapio c 
on p.id_cardapio = c.id_cardapio
group by p.id_comanda
order by p.id_comanda;



-- Implemente uma consulta SQL para identificar qual prato foi o mais pedido e quantas vezes ele foi solicitado:

select c.nome, count(p.id_cardapio) quant  from pedido p inner join cardapio c 
on p.id_cardapio = c.id_cardapio
group by c.nome
having quant = (select max(qt) from (select count(*) qt from pedido group by id_cardapio)a)
order by quant desc;

-- Criar uma procedure que atualize a quantidade em estoque de um item do cardápio.

DELIMITER $$

CREATE PROCEDURE atualizar_estoque(v_estoque int, v_id_cardapio int)
begin 


update cardapio  set estoque = estoque+ v_estoque where id_cardapio = v_id_cardapio; 
end $$

delimiter ;

call atualizar_estoque (3,1);

select * from pedido;


-- Criar uma trigger que subtraia a quantidade em estoque de um tem do cardápio quando for solicitado em um pedido.

delimiter $$

create trigger saida_estoque 
after insert on pedido 
for each row
	begin
    
	update cardapio set estoque = estoque - new.quantidade where id_cardapio = new.id_cardapio ;
    
    end $$
    
Delimiter ;

    