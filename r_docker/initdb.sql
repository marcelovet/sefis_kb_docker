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
  CONSTRAINT fk_tbl_classes FOREIGN KEY(classe) REFERENCES tbl_classes(classe),
  CONSTRAINT fk_tbl_formularios FOREIGN KEY(tp_form) REFERENCES tbl_formularios(tp_form)
);

CREATE TABLE forms(
  uuid_form Varchar(40) PRIMARY KEY,
  id_form Varchar(40),
  tp_form Varchar(5),
  CONSTRAINT fk_tbl_formularios FOREIGN KEY(tp_form) REFERENCES tbl_formularios(tp_form)
);

CREATE TABLE dados_fiscalizacao(
  id_relatorio Varchar(200) PRIMARY KEY,
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
  CONSTRAINT fk_forms FOREIGN KEY(uuid_form) REFERENCES forms(uuid_form)
);

CREATE SEQUENCE id_estabelecimento;
CREATE TABLE estabelecimentos(
  id_estabelecimento int default nextval('id_estabelecimento'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  crmv_pj Varchar(10),
  razao_social Varchar(200),
  cpf_cnpj Varchar(40),
  endereco text,
  contato_email Varchar(40),
  contato_telcel Varchar(40),
  latitude real,
  longitude real,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_atividades_mv;
CREATE TABLE atividades_mv(
  id_atividades_mv int default nextval('id_atividades_mv'::regclass) PRIMARY KEY,
  tipo_atividade Varchar(3),
  id_relatorio Varchar(200),
  CONSTRAINT fk_tbl_atividades FOREIGN KEY(tipo_atividade) REFERENCES tbl_atividades(tipo_atividade),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
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
  CONSTRAINT fk_tbl_sefis FOREIGN KEY(matricula) REFERENCES tbl_sefis(matricula),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_testemunha;
CREATE TABLE testemunhas(
  id_testemunha int default nextval('id_testemunha'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  documento Varchar(40),
  img_assinatura Varchar(400),
  negou_assinar boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_recurso_humano;
CREATE TABLE recursos_humanos(
  id_recurso_humano int default nextval('id_recurso_humano'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  crmv_pf Varchar(40),
  uf Varchar(2),
  funcao text,
  formacao Varchar(40),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_responsavel_tecnico;
CREATE TABLE responsaveis_tecnicos(
  id_responsavel_tecnico int default nextval('id_responsavel_tecnico'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  nome Varchar(400),
  crmv_pf Varchar(40),
  formacao Varchar(40),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE tbl_tcpj(
  constatacoes_tabeladas Varchar(3) PRIMARY KEY,
  label_constatacao text
);

CREATE TABLE termo_constatacao_pj(
  id_relatorio Varchar(200),
  id_tcpj Varchar(400) PRIMARY KEY,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_tcpj_adc;
CREATE TABLE termo_constatacao_pj_adc(
  id_tcpj_adc int default nextval('id_tcpj_adc'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  id_tcpj Varchar(400),
  constatacoes_adicionais text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_termo_constatacao_pj FOREIGN KEY(id_tcpj) REFERENCES termo_constatacao_pj(id_tcpj)
);

CREATE SEQUENCE id_tcpj_tb;
CREATE TABLE termo_constatacao_pj_tb(
  id_tcpj_tb int default nextval('id_tcpj_tb'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  id_tcpj Varchar(400),
  constatacoes_tabeladas Varchar(3),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_termo_constatacao_pj FOREIGN KEY(id_tcpj) REFERENCES termo_constatacao_pj(id_tcpj),
  CONSTRAINT fk_tbl_tcpj FOREIGN KEY(constatacoes_tabeladas) REFERENCES tbl_tcpj(constatacoes_tabeladas)
);

CREATE SEQUENCE id_tcpj_dt;
CREATE TABLE termo_constatacao_pj_dt(
  id_tcpj_dt int default nextval('id_tcpj_dt'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  id_tcpj Varchar(400),
  constatacoes text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_termo_constatacao_pj FOREIGN KEY(id_tcpj) REFERENCES termo_constatacao_pj(id_tcpj)
);

CREATE TABLE termo_constatacao_pf(
  id_relatorio Varchar(200),
  id_tcpf Varchar(400) PRIMARY KEY,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_tcpf_dt;
CREATE TABLE termo_constatacao_pf_dt(
  id_tcpf_dt int default nextval('id_tcpf_dt'::regclass) PRIMARY KEY,
  id_relatorio Varchar(200),
  id_tcpf Varchar(400),
  nome Varchar(400),
  documento Varchar(40),
  img_assinatura Varchar(400),
  negou_assinar boolean,
  contato_email Varchar(40),
  constatacao text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tcpf FOREIGN KEY(id_tcpf) REFERENCES termo_constatacao_pf(id_tcpf)
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

CREATE SEQUENCE id_imagem_fiscalizacao;
CREATE TABLE imagens_fiscalizacao(
  id_imagem_fiscalizacao int default nextval('id_imagem_fiscalizacao'::regclass) PRIMARY KEY,
  uuid_form Varchar(40),
  id_relatorio Varchar(200),
  arquivo_imagem text,
  label_imagem text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_forms FOREIGN KEY(uuid_form) REFERENCES forms(uuid_form)
);

CREATE SEQUENCE id_imagem_endereco;
CREATE TABLE imagens_enderecos(
  id_imagem_endereco int default nextval('id_imagem_endereco'::regclass) PRIMARY KEY,
  uuid_form Varchar(40),
  id_relatorio Varchar(200),
  arquivo_imagem text,
  url_imagem text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_forms FOREIGN KEY(uuid_form) REFERENCES forms(uuid_form)
);

-- formulario emv
CREATE TABLE tbl_servicos(
  servico_ofertado Varchar(3) PRIMARY KEY,
  label_servico text
);

CREATE SEQUENCE id_servico;
CREATE TABLE servicos(
  id_servico int default nextval('id_servico'::regclass) PRIMARY KEY,
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_servicos FOREIGN KEY(servico_ofertado) REFERENCES tbl_servicos(servico_ofertado)
);

CREATE SEQUENCE id_servico_terceirizado;
CREATE TABLE servicos_terceirizados(
  id_servico_terceirizado int default nextval('id_servico_terceirizado'::regclass) PRIMARY KEY,
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_servicos FOREIGN KEY(servico_ofertado) REFERENCES tbl_servicos(servico_ofertado)
);

CREATE SEQUENCE id_servico_24h;
CREATE TABLE servicos_24h(
  id_servico_24h int default nextval('id_servico_24h'::regclass) PRIMARY KEY,
  servico_ofertado Varchar(3),
  id_relatorio Varchar(45),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_servicos FOREIGN KEY(servico_ofertado) REFERENCES tbl_servicos(servico_ofertado)
);

CREATE SEQUENCE id_atividade_mv_correto;
CREATE TABLE atividades_mv_correto(
  id_atividade_mv_correto int default nextval('id_atividade_mv_correto'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  tipo_atividade_correto boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_documento_mv;
CREATE TABLE documentos_mv(
  id_documento_mv int default nextval('id_documento_mv'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  livro_exclusivo_rt boolean,
  arquivo_mv boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE SEQUENCE id_ambiente_geral;
CREATE TABLE ambientes_gerais(
  id_ambiente_geral int default nextval('id_ambiente_geral'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  recepcao_espera boolean,
  sanitario_publico boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE tbl_funcionamento(
  id_condicao Varchar(2) PRIMARY KEY,
  label_condicao text
);

CREATE SEQUENCE id_ambiente_clin_ambulatorial;
CREATE TABLE ambientes_clin_ambulatoriais(
  id_ambiente_clin_ambulatorial int default nextval('id_ambiente_clin_ambulatorial'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  balanca Varchar(1),
  unidade_refrigeracao_vacina Varchar(1),
  termometro_un_refrigeracao boolean,
  exclusiva_un_refrigeracao boolean,
  num_salas_atendimento  int,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_funcionamento_balanca
    FOREIGN KEY(balanca)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_unidade_refrigeracao
    FOREIGN KEY(unidade_refrigeracao_vacina)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE SEQUENCE id_sala_atendimento;
CREATE TABLE salas_atendimento(
  id_sala_atendimento int default nextval('id_sala_atendimento'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  sala Varchar(2),
  mesa_atendimento Varchar(1),
  pia_higienizacao Varchar(1),
  materiais_higienizacao boolean,
  mobiliario Varchar(1),
  exclusivo_mobiliario boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_funcionamento_mesa
    FOREIGN KEY(mesa_atendimento)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_pia
    FOREIGN KEY(pia_higienizacao)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mobiliario
    FOREIGN KEY(mobiliario)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE TABLE tbl_preparo(
  id_preparo Varchar(2) PRIMARY KEY,
  label_preparo text
);

CREATE SEQUENCE id_ambiente_preparo;
CREATE TABLE ambientes_preparo(
  id_ambiente_preparo int default nextval('id_ambiente_preparo'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_preparo Varchar(1),
  mesa_preparo Varchar(1),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_preparo
    FOREIGN KEY(ambiente_preparo)
      REFERENCES tbl_preparo(id_preparo),
  CONSTRAINT fk_tbl_funcionamento_mesa
    FOREIGN KEY(mesa_preparo)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE TABLE tbl_recuperacao(
  id_recuperacao Varchar(2) PRIMARY KEY,
  label_recuperacao text
);

CREATE SEQUENCE id_ambiente_recuperacao;
CREATE TABLE ambientes_recuperacao(
  id_ambiente_recuperacao int default nextval('id_ambiente_recuperacao'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_recuperacao Varchar(1),
  oxigenio_recuperacao boolean,
  oxigenio_reserva_recuperacao boolean,
  aquecimento_recuperacao Varchar(1),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_recuperacao
    FOREIGN KEY(ambiente_recuperacao)
      REFERENCES tbl_recuperacao(id_recuperacao),
  CONSTRAINT fk_tbl_funcionamento_aquecimento
    FOREIGN KEY(aquecimento_recuperacao)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE TABLE tbl_paramentacao(
  id_paramentacao Varchar(2) PRIMARY KEY,
  label_paramentacao text
);

CREATE SEQUENCE id_ambiente_paramentacao;
CREATE TABLE ambientes_paramentacao(
  id_ambiente_paramentacao int default nextval('id_ambiente_paramentacao'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_paramentacao Varchar(1),
  ambiente_paramentacao_outro text,
  pia_dispensador Varchar(1),
  pia_sem_mao boolean,
  insumo_preparacao boolean,
  insumo_paramentacao boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_paramentacao
    FOREIGN KEY(ambiente_paramentacao)
      REFERENCES tbl_paramentacao(id_paramentacao),
  CONSTRAINT fk_tbl_funcionamento_pia
    FOREIGN KEY(pia_dispensador)
      REFERENCES tbl_funcionamento(id_condicao)
);
