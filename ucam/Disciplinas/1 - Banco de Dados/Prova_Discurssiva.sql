create view v_chamados as
select c.dtAbertura,
       c.NumChamado,
       c.NumSerie,
       u.NomeUser,
       m.DescricaoMotivo
  from chamado c
  inner join motivo m on m.codMotivo = c.codMotivo
  inner join usuario u on u.UserName = c.UserName;
  
  
    select m.DescricaoMotivo, te.DescricaoTipo, count (c.NumChamado)
      from chamado c
inner join motivo m on m.codMotivo = c.codMotivo
inner join user_eqpto ue on ue.NumSerie = c.NumSerie and ue.UserName = c.UserName
inner join equipamento e on e.NumSerie = ue.NumSerie
inner join tipo_equipamento te on te.codTipo = e.codTipo
  group by m.DescricaoMotivo, te.DescricaoTipo
  order by m.DescricaoMotivo, te.DescricaoTipo;
