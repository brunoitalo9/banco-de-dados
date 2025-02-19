-- a
select nome, email from cliente c inner join emailcliente ec
on c.id = ec.id
group by nome, email;

-- b
select * from pedido where data between '2010-01-01' and '2014-12-31';

-- c 
select nome, data from cliente c inner join pedido p
on c.id = p.id where data between '2015-01-01' and '2016-12-31'
group by nome, data;

-- d 
select distinct * from categoria 
where nome like 'f%';

 -- e
select count(*) from produto where idcategoria = 2;

-- f 

select c.nome categoria, sum(p.estoque) from produto p inner join categoria c 
on p.idcategoria = c.id 
group by c.nome;

-- g 
select descricao, f.nome from produto p inner join fornecedor f 
on p.idfornecedor = f.id; 

-- Fiz mas nao sei se ta certo 

/*-- h 
select nome, data, quantidade, count(*) from cliente c inner join pedido p 
on c.id = p.id
inner join pedidoproduto pp
on p.id=pp.idproduto where c.id = 1
group by nome, data, quantidade
;*/

-- i
select distinct descricao, quantidade from produto p1 inner join pedidoproduto pp 
on p1.id = pp.idproduto
 group by descricao, quantidade
;

-- j 

alter table produto add preco decimal (5,2);
update  produto set preco = estoque *0.1;

-- k 
select max(preco) from produto;
