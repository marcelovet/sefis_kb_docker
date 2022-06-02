SET DATESTYLE TO PostgreSQL,European;

-- se aplica a todos formularios
CREATE TABLE tbl_formularios(
  tp_form Varchar(10) PRIMARY KEY,
  label_form text,
  grupo Varchar(30)
);

CREATE TABLE tbl_classes(
  classe Varchar(3) PRIMARY KEY,
  label_classe Varchar(200)
);

CREATE TABLE tbl_atividades(
  tipo_atividade Varchar(3) PRIMARY KEY,
  label_atividade Varchar(200),
  classe Varchar(3),
  tp_form Varchar(10),
  art_obrigatorio boolean,
  registro_obrigatorio boolean,
  fundamento_legal_art text,
  fundamento_legal_registro text,
  CONSTRAINT fk_classe FOREIGN KEY(classe) REFERENCES tbl_classes(classe),
  CONSTRAINT fk_tp_form FOREIGN KEY(tp_form) REFERENCES tbl_formularios(tp_form)
);

CREATE TABLE forms(
  uuid_form Varchar(40) PRIMARY KEY,
  id_form Varchar(40),
  tp_form Varchar(5),
  CONSTRAINT fk_tp_form FOREIGN KEY(tp_form) REFERENCES tbl_formularios(tp_form)
);

CREATE TABLE dados_fiscalizacao(
  id_relatorio Varchar(45) PRIMARY KEY,
  data_fiscalizacao date,
  hora_inicio timestamp(2),
  hora_fim timestamp(2),
  data_escrita Varchar(40),
  registro boolean,
  art boolean,
  possui_vetzoo boolean,
  gera_tcpj boolean,
  gera_tcpf boolean,
  gera_ai_art boolean,
  gera_ai_registro boolean,
  gera_ai_comerciovacina boolean,
  uuid_form Varchar(40),
  CONSTRAINT fk_uuid FOREIGN KEY(uuid_form) REFERENCES forms(uuid_form)
);

CREATE TABLE estabelecimentos(
  crmv_pj Varchar(10),
  razao_social Varchar(200),
  cpf_cnpj Varchar(40),
  endereco text,
  contato_email Varchar(40),
  contato_telcel Varchar(40),
  latitude real,
  longitude real,
  id_relatorio Varchar(45) PRIMARY KEY,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE atividades_mv(
  tipo_atividade Varchar(3),
  id_relatorio Varchar(200),
  CONSTRAINT fk_tipo_atividade FOREIGN KEY(tipo_atividade) REFERENCES tbl_atividades(tipo_atividade),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE tbl_sefis(
  matricula Varchar(10) PRIMARY KEY,
  nome Varchar(400),
  cargo Varchar(400)
);

CREATE TABLE fiscais_atv(
  id_relatorio Varchar(200),
  matricula Varchar(10),
  nome Varchar(400),
  cargo Varchar(400),
  img_assinatura Varchar(400),
  CONSTRAINT fk_matricula FOREIGN KEY(matricula) REFERENCES sefis_rh(matricula),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE testemunhas{
  id_relatorio Varchar(200),
  nome Varchar(400),
  documento Varchar(40),
  img_assinatura Varchar(400),
  negou_assinar boolean,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
}

CREATE TABLE recursos_humanos{
  id_relatorio Varchar(200),
  nome Varchar(400),
  crmv_pf Varchar(40),
  uf Varchar(2),
  funcao text,
  formacao Varchar(40),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
}

-- formulario emv
CREATE TABLE tbl_servicos(
  servico_ofertado Varchar(3) PRIMARY KEY,
  label_servico text
);

CREATE TABLE servicos(
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE servicos_terceirizados(
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE servicos_24h(
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);