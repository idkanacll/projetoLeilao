use projetoleilao;


-- =====================================================================
-- PARTE 1 - GROUP BY (questões 1 a 5; as questões 1 e 4 usam HAVING)
-- =====================================================================
 
-- 1. (3 pontos) Faça uma consulta SQL que apresente o nome do colecionador e a quantidade de
--    compras realizadas por ele, no entanto, apresente somente os colecionadores
--    com mais de 2 compras.
 
  Select p.nome, count(v.idVendas) as qtd
  from vendas as v
  inner join colecionador as c on c.idColecionador = v.id_colecionador_fk
  inner join pessoa as p on p.idPessoa = c.id_Pessoa_FK
  group by c.idColecionador, p.nome
  having count(v.idvendas) > 2;
 
 
-- 2. (3 pontos) Faça uma consulta SQL que apresente cada cidade e a quantidade de colecionadores
--    cadastrados nela, exemplo: Porto Velho 7, Cuiabá 5. Observação: o resultado deve
--    ser apresentado do maior para o menor número de colecionadores e, em caso de
--    empate, em ordem alfabética pela cidade.

Select c.cidade, count(c.idColecionador) as QtdColecionador 
from colecionador as c 
group by c.cidade
order by QtdColecionador desc, c.cidade;
 
-- 3. (3 pontos) Faça uma consulta SQL que apresente a especialidade dos avaliadores e a
--    quantidade de avaliações realizadas pelos avaliadores de cada especialidade.

select a.especialidade, count(*) as qtdAvaliacoes
from avaliador as a
inner join avaliacoes av on av.id_avaliador_fk = a.idAvaliador
group by a.especialidade;

 
-- 4. (3 pontos) Faça uma consulta SQL que apresente o nome do leilão e a quantidade de lances
--    recebidos pelos itens desse leilão, no entanto, apresente somente os leilões
--    com mais de 8 lances.
 
 select l.nome, count(lan.idLances) 
 from leilao as l
 inner join itemLeilao as itLei on itLei.id_Leilao_fk = l.idLeilao
 inner join lances as lan on lan.id_item_Leilao_FK = itLei.idItemLeilao
 group by l.idLeilao, l.nome
 having count(lan.idLances) > 8;
 
-- 5. (3 pontos) Faça uma consulta SQL que apresente o tipo de obra e a quantidade de avaliações
--    recebidas pelas obras de cada tipo.
 
 select ob.tipoObra, count(*) 
 from avaliacoes as av
 inner join Obras as ob on ob.idObras = av.id_obra_fk
 group by ob.tipoObra;
 
-- =====================================================================
-- PARTE 2 - SUBCONSULTAS (questões 6 a 10; um exemplo de cada tipo da Aula 09)
-- =====================================================================
 
-- 6. (3 pontos) Faça uma consulta SQL que apresente o código, o título e o valor avaliado das
--    obras cujo valor avaliado seja superior à média dos valores de todas as
--    avaliações registradas.

select ob.idObras, ob.titulo, ob.valorAvaliado from obras as ob
where ob.valorAvaliado > 
(select avg(valor) from avaliacoes);
 
-- 7. (3 pontos) Faça uma consulta SQL que apresente o código, o lance inicial e o código do
--    leilão dos itens de leilão cujo lance mínimo seja igual ao maior lance mínimo
--    cadastrado.
 
 select itLei.idItemLeilao, itLei.lanceInicial, itLei.id_leilao_fk 
 from itemleilao as itLei
 where itLei.lanceMinimo >=
 (select max(itLei.lanceMinimo) from itemLeilao as itLei);
 
-- 8. (3 pontos) Faça uma consulta SQL que apresente o código e o título das obras que foram
--    inscritas em algum leilão com status 'Aberto'.
 
 select ob.idObras, ob.titulo 
 from obras as ob
 where ob.idObras in 
 (select itLei.id_obras_fk from itemLeilao as itLei 
 inner join leilao as l on itLei.id_leilao_fk = l.idLeilao 
 where l.statusLeilao = "aberto");
 
-- 9. (3 pontos) Faça uma consulta SQL que apresente os itens de leilão que pertencem ao mesmo
--    leilão e possuem o mesmo status do item de código 1. Não apresentar o item com
--    código 1 (idItemLeilao). Exiba o código do item, o lance inicial, o código do
--    leilão e o status.
 
select itLei.idItemLeilao, itLei.lanceInicial, itLei.id_leilao_fk, itLei.statusItem
from itemLeilao as itLei
where (itLei.id_leilao_fk, itLei.statusItem) =
      (select id_leilao_fk, statusItem from itemLeilao where idItemLeilao = 1)
  and itLei.idItemLeilao <> 1;
 
-- 10. (3 pontos) Apresente a quantidade de colecionadores que realizaram mais de uma compra. A
--    subconsulta deve identificar esses colecionadores com GROUP BY e HAVING, e a
--    consulta principal deve contar quantos colecionadores foram encontrados.
 
 select count(*) as qtdColecionadores
 from colecionador as c
 where c.idColecionador in 
 (select v.id_colecionador_fk 
 from vendas as v
 inner join colecionador as c on c.idColecionador = v.id_colecionador_fk
 group by v.id_colecionador_fk
 having count(*) > 1);
 
-- =====================================================================
-- PARTE 3 - JOIN (questões 11 a 15)
-- =====================================================================
 
-- 11. (3 pontos) Faça uma consulta SQL que apresente o título da obra, o nome do avaliador e o
--    valor da avaliação, somente das avaliações com valor superior a R$ 3.000.000,00.

select ob.titulo, p.nome, av.valor
from avaliacoes as av 
inner join obras as ob on av.id_obra_fk = ob.idObras
inner join avaliador as v on v.idAvaliador = av.id_avaliador_fk
inner join pessoa as p on p.idPessoa = v.id_pessoa_fk
where av.valor > 3000000;
 
-- 12. (3 pontos) Faça uma consulta SQL que apresente o nome do leilão, o título da obra e o
--    status do item para todos os itens do leilão de código 12.

select l.nome, ob.titulo, itLei.statusItem 
from itemLeilao as itLei 
inner join leilao as l on l.idLeilao = itLei.id_leilao_fk
inner join obras as ob on ob.idObras = itLei.id_obras_fk
where l.idLeilao = 12;
 
-- 13. (3 pontos) Faça uma consulta SQL que apresente o nome e o e-mail de todas as pessoas
--    cadastradas e, caso a pessoa seja um artista, apresente também a
--    nacionalidade; se não for, apresente NULL no local da nacionalidade.

select p.nome, p.email, a.nacionalidade
from artista as a
right join pessoa as p on p.idPessoa = a.id_pessoa_fk;

-- 14. (3 pontos) Faça uma consulta SQL que apresente o nome do colecionador, o título da obra e
--    o valor do lance de todos os lances com valor superior a R$ 4.000.000,00.

select p.nome, ob.titulo, l.valor 
from lances as l 
inner join itemLeilao as itLei on l.id_item_leilao_fk = itLei.idItemLeilao
inner join obras as ob on itLei.id_obras_fk = ob.idObras
inner join colecionador as c on c.idColecionador = l.id_colecionador_fk
inner join pessoa as p on c.id_pessoa_fk = p.idPessoa
where l.valor > 4000000;

 
 
-- 15. (3 pontos) Faça uma consulta SQL que apresente o nome do artista, o título da obra, a data
--    da venda e a forma de pagamento das vendas realizadas em 2025.
 
 
 select p.nome, ob.titulo, v.dataVenda, v.formaPagamento
 from obras as ob 
 inner join artista as a on ob.id_artista_fk = a.idArtista
 inner join pessoa as p on p.idPessoa = a.id_pessoa_fk
 inner join itemLeilao as it on ob.idObras = it.id_obras_fk
 inner join vendas as v on it.idItemLeilao = v.id_item_leilao_fk
 where v.dataVenda between '2025-01-01' and '2025-12-31';