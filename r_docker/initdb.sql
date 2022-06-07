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

CREATE SEQUENCE id_esterilizacao_terceirizada;
CREATE TABLE esterilizacoes_terceirizadas(
  id_esterilizacao_terceirizada int default nextval('id_esterilizacao_terceirizada'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  terceiriza_esterilizacao boolean,
  controla_terceirizado boolean,
  pop_terceirizado boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

CREATE TABLE tbl_ambientes(
  id_ambiente Varchar(2) PRIMARY KEY,
  label_ambiente text
);

CREATE SEQUENCE id_ambiente_lav_esterilizacao;
CREATE TABLE ambientes_lav_esterilizacao(
  id_ambiente_lav_esterilizacao int default nextval('id_ambiente_lav_esterilizacao'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  lavagem_esterilizacao boolean,
  ambiente_esterilizacao Varchar(1),
  ambiente_esterilizacao_outro text,
  fluxo_unidirecional boolean,
  pop_esterilizacao boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_ambientes
    FOREIGN KEY(ambiente_esterilizacao)
      REFERENCES tbl_ambientes(id_ambiente)
);

CREATE TABLE tbl_equipamentos_esteril(
  id_equipamento Varchar(2) PRIMARY KEY,
  label_equipamento text
);

CREATE TABLE tbl_armazenamento_esteril(
  id_armazenamento Varchar(2) PRIMARY KEY,
  label_armazenamento text
);

CREATE SEQUENCE id_condicao_lav_esterilizacao;
CREATE TABLE condicoes_lav_esterilizacao(
  id_condicao_lav_esterilizacao int default nextval('id_condicao_lav_esterilizacao'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  monitora_limpeza boolean,
  acessorio_abrasivo boolean,
  embalagem_mantem_esteril boolean,
  embalagem_rotulada boolean,
  equipamento_esterilizacao Varchar(1),
  incador_qm2 boolean,
  controla_esterilizacao boolean,
  ambiente_armazenagem Varchar(1),
  mobiliario_armazenagem boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_equipamentos_esteril
    FOREIGN KEY(equipamento_esterilizacao)
      REFERENCES tbl_equipamentos_esteril(id_equipamento),
  CONSTRAINT fk_tbl_armazenamento_esteril
    FOREIGN KEY(ambiente_armazenagem)
      REFERENCES tbl_armazenamento_esteril(id_armazenamento)
);

CREATE TABLE tbl_parametros(
  id_parametro Varchar(2) PRIMARY KEY,
  label_parametro text
);

CREATE TABLE tbl_cirurgia(
  id_cirurgia Varchar(2) PRIMARY KEY,
  label_cirurgia text
);

CREATE SEQUENCE id_ambiente_cirurgia;
CREATE TABLE ambientes_cirurgia(
  id_ambiente_cirurgia int default nextval('id_ambiente_cirurgia'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_cirurgia Varchar(1),
  ambiente_cirurgia_outro text,
  foco_cirurgico Varchar(1),
  iluminacao_emergencial boolean,
  mesa_cirurgia Varchar(1),
  mesa_auxiliar Varchar(1),
  oxigenio_cirurgia boolean,
  oxigenio_reserva_cirurgia boolean,
  aquecimento_cirurgia Varchar(1),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_cirurgia
    FOREIGN KEY(ambiente_cirurgia)
      REFERENCES tbl_cirurgia(id_cirurgia),
  CONSTRAINT fk_tbl_funcionamento_foco
    FOREIGN KEY(foco_cirurgico)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mesa_cir
    FOREIGN KEY(mesa_cirurgia)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mesa_aux
    FOREIGN KEY(mesa_auxiliar)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_aquecimento
    FOREIGN KEY(aquecimento_cirurgia)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE SEQUENCE id_parametro_cirurgia;
CREATE TABLE paramentros_cirurgia(
  id_parametro_cirurgia int default nextval('id_parametro_cirurgia'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  parametro_cirurgia Varchar(1),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_parametros
    FOREIGN KEY(parametro_cirurgia)
      REFERENCES tbl_parametros(id_parametro)
);

CREATE SEQUENCE id_ambiente_internacao;
CREATE TABLE ambientes_internacao(
  id_ambiente_internacao int default nextval('id_ambiente_internacao'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  acomodacao_individual Varchar(1),
  local_higienizacao Varchar(1),
  mesa_internacao Varchar(1),
  aquecimento_internacao Varchar(1),
  pia_internacao Varchar(1),
  mobiliario_internacao Varchar(1),
  registra_internacao boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_funcionamento_acomodacao
    FOREIGN KEY(acomodacao_individual)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_higienizacao
    FOREIGN KEY(local_higienizacao)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mesa
    FOREIGN KEY(mesa_internacao)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_aquecimento
    FOREIGN KEY(aquecimento_internacao)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_pia
    FOREIGN KEY(pia_internacao)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mobiliario
    FOREIGN KEY(mobiliario_internacao)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE SEQUENCE id_ambiente_infecto;
CREATE TABLE ambientes_infecto_internacao(
  id_ambiente_infecto int default nextval('id_ambiente_infecto'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  interna_infecto boolean,
  exclusivo_infecto boolean,
  acomodacao_infecto Varchar(1),
  mesa_infecto Varchar(1),
  aquecimento_infecto Varchar(1),
  pia_infecto Varchar(1),
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_funcionamento_acomodacao
    FOREIGN KEY(acomodacao_infecto)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mesa
    FOREIGN KEY(mesa_infecto)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_aquecimento
    FOREIGN KEY(aquecimento_infecto)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_pia
    FOREIGN KEY(pia_infecto)
      REFERENCES tbl_funcionamento(id_condicao)
);

CREATE TABLE tbl_exames(
  id_exame VARCHAR(2) PRIMARY KEY,
  label_exame text,
  tipo_exame VARCHAR(40)
);

CREATE SEQUENCE id_exame_imagem;
CREATE TABLE exames_imagem(
  id_exame_imagem int default nextval('id_exame_imagem'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  exame_imagem Varchar(2),
  exame_imagem_outro text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_exames
    FOREIGN KEY(exame_imagem)
      REFERENCES tbl_exames(id_exame)
);

CREATE SEQUENCE id_ambiente_imagiologia;
CREATE TABLE ambientes_imagiologia(
  id_ambiente_imagiologia int default nextval('id_ambiente_imagiologia'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_imagem Varchar(2),
  ambiente_imagem_outro text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_ambientes
    FOREIGN KEY(ambiente_imagem)
      REFERENCES tbl_ambientes(id_ambiente)
);

CREATE SEQUENCE id_ambiente_radiografia;
CREATE TABLE ambientes_radiografia(
  id_ambiente_radiografia int default nextval('id_ambiente_radiografia'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_radio Varchar(2),
  ambiente_radio_outro text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_ambientes
    FOREIGN KEY(ambiente_radio)
      REFERENCES tbl_ambientes(id_ambiente)
);

CREATE SEQUENCE id_exame_laboratorio;
CREATE TABLE exames_laboratorio(
  id_exame_laboratorio int default nextval('id_exame_laboratorio'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  exame_laboratorio Varchar(2),
  exame_laboratorio_outro text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_exames
    FOREIGN KEY(exame_laboratorio)
      REFERENCES tbl_exames(id_exame)
);

CREATE SEQUENCE id_ambiente_laboratorio;
CREATE TABLE ambientes_laboratorio(
  id_ambiente_laboratorio int default nextval('id_ambiente_laboratorio'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  ambiente_laboratorio Varchar(2),
  ambiente_laboratorio_outro text,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_ambientes
    FOREIGN KEY(ambiente_laboratorio)
      REFERENCES tbl_ambientes(id_ambiente)
);

CREATE SEQUENCE id_equipamento_laboratorio;
CREATE TABLE equipamentos_laboratorio(
  id_equipamento_laboratorio int default nextval('id_equipamento_laboratorio'::regclass) PRIMARY KEY,
  id_relatorio Varchar(45),
  equipamento_glic_lac boolean,
  equipamento_urina boolean,
  pia_laboratorio Varchar(1),
  bancada_laboratorio Varchar(1),
  mobilia_laboratorio Varchar(1),
  unidade_refrigeracao_lab Varchar(1),
  termometro_un_refrigeracao_lab boolean,
  CONSTRAINT fk_dados_fiscalizacao FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio),
  CONSTRAINT fk_tbl_funcionamento_pia
    FOREIGN KEY(pia_laboratorio)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_bancada
    FOREIGN KEY(bancada_laboratorio)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_mobilia
    FOREIGN KEY(mobilia_laboratorio)
      REFERENCES tbl_funcionamento(id_condicao),
  CONSTRAINT fk_tbl_funcionamento_un_refrigeracao
    FOREIGN KEY(unidade_refrigeracao_lab)
      REFERENCES tbl_funcionamento(id_condicao)
);