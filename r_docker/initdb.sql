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

CREATE SEQUENCE id_estabelecimentos;
CREATE TABLE estabelecimentos(
  id_estabelecimentos int default nextval('id_estabelecimentos'::regclass) PRIMARY KEY,
  crmv_pj Varchar(10),
  razao_social Varchar(200),
  cpf_cnpj Varchar(40),
  endereco text,
  contato_email Varchar(40),
  contato_telcel Varchar(40),
  latitude real,
  longitude real,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_atividades_mv;
CREATE TABLE atividades_mv(
  id_atividades_mv int default nextval('id_atividades_mv'::regclass) PRIMARY KEY,
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

CREATE SEQUENCE id_fiscais_atv;
CREATE TABLE fiscais_atv(
  id_fiscais_atv int default nextval('id_fiscais_atv'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  matricula Varchar(10),
  nome Varchar(400),
  cargo Varchar(400),
  img_assinatura Varchar(400),
  CONSTRAINT fk_matricula FOREIGN KEY(matricula) REFERENCES tbl_sefis(matricula),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_testemunhas;
CREATE TABLE testemunhas(
  id_testemunhas int default nextval('id_testemunhas'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  documento Varchar(40),
  img_assinatura Varchar(400),
  negou_assinar boolean,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_recursos_humanos;
CREATE TABLE recursos_humanos(
  id_recursos_humanos int default nextval('id_recursos_humanos'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  crmv_pf Varchar(40),
  uf Varchar(2),
  funcao text,
  formacao Varchar(40),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_responsavel_tecnico;
CREATE TABLE responsavel_tecnico(
  id_responsavel_tecnico int default nextval('id_responsavel_tecnico'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  crmv_pf Varchar(40),
  formacao Varchar(40),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE tbl_tcpj(
  constatacoes_tabeladas Varchar(3) PRIMARY KEY,
  label_constatacao text
);

CREATE TABLE termo_constatacao_pj(
  id_relatorio Varchar(200),
  id_tcpj Varchar(400) PRIMARY KEY,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE termo_constatacao_pj_adc(
  id_relatorio Varchar(200),
  id_tcpj Varchar(400),
  constatacoes_adicionais text,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_id_tcpj FOREIGN KEY(id_tcpj) REFERENCES tcpj(id_tcpj)
);

CREATE TABLE termo_constatacao_pj_tb(
  id_relatorio Varchar(200),
  id_tcpj Varchar(400),
  constatacoes_tabeladas Varchar(3),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_id_tcpj FOREIGN KEY(id_tcpj) REFERENCES tcpj(id_tcpj),
  CONSTRAINT fk_constatacoes_tabeladas FOREIGN KEY(constatacoes_tabeladas) REFERENCES tbl_tcpj(constatacoes_tabeladas)
);

CREATE TABLE termo_constatacao_pf(
  id_relatorio Varchar(200),
  id_tcpf Varchar(400) PRIMARY KEY,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE termo_constatacao_pf_dt(
  id_relatorio Varchar(200),
  id_tcpf Varchar(400),
  nome Varchar(400),
  documento Varchar(40),
  img_assinatura Varchar(400),
  negou_assinar boolean,
  contato_email Varchar(40),
  constatacao text,
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_id_tcpf FOREIGN KEY(id_tcpf) REFERENCES tcpf(id_tcpf)
);

CREATE TABLE termo_fiscalizacao(
  id_relatorio Varchar(200),
  id_tf Varchar(400) PRIMARY KEY,
  label_tf text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE auto_infracao(
  id_relatorio Varchar(200),
  id_ai Varchar(400) PRIMARY KEY,
  label_ai_rt text,
  label_ai_registro text,
  label_ai_comerciovacina text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

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