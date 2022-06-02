SET DATESTYLE TO PostgreSQL,European;

CREATE TABLE tbl_formularios(
  tp_form Varchar(10) PRIMARY KEY,
  label_form text,
  grupo Varchar(30)
);

INSERT INTO tbl_formularios(tp_form, label_form, grupo) VALUES ('EMV', 'Relatório de Fiscalização em Estabelecimento Médico-Veterinário de Animais de Estimação de Pequeno Porte', 'SEFIS');
INSERT INTO tbl_formularios(tp_form, label_form, grupo) VALUES ('FG', 'Relatório Geral de Fiscalização em Estabelecimentos', 'SEFIS');

CREATE TABLE tbl_classes(
  classe Varchar(3) PRIMARY KEY,
  label_classe Varchar(200)
);

INSERT INTO tbl_classes(classe, label_classe) VALUES ('1', 'Exploração Pecuária');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('2', 'Estabelecimentos onde estejam em exposição, em serviço ou para qualquer outro fim animais');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('3', 'Certificação, consultoria, planejamento ou execução de projetos');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('4', 'Comércio de animais, produtos à animais, medicamentos ou produtos veterinários e serviços de estética animal');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('5', 'Ensino');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('6', 'Abate de animais produtores de carne, recepção, manipulação, industrialização, acondicionamento, rotulagem, armazenagem, expedição ou comercialização de produtos de origem animal');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('7', 'Produção de produto veterinário, alimento ou insumo à alimentação animal');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('8', 'Clínica Veterinária e serviços relativos à reprodução animal');
INSERT INTO tbl_classes(classe, label_classe) VALUES ('0', 'Outros');

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

INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('2', 'Aquicultura (Exploração Pecuária)', '1', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('3', 'Avicultura (Exploração Pecuária)', '1', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('4', 'Piscicultura (Exploração Pecuária)', '1', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('5', 'Suinocultura (Exploração Pecuária)', '1', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('6', 'Haras, Jóqueis ou Entidades Hípicas', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('7', 'Evento pecuário ou outro com animal doméstico (feira, exposição, leilão, vaquejada, prova de laço, remate, rodeio, evento desportivo ou recreativo)', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('8', 'Canil', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXVI');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('9', 'Gatil', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXVI');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('10', 'Abrigo para animais', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XVI');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('11', 'Biotério', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XVII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('12', 'Centro de Controle de Zoonoses', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('15', 'Zoológicos', '2', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXVIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('16', 'Criador de Animais de Estimação - criação de animais de estimação com finalidade comercial, desportiva ou de proteção', '0', 'FG', '0', null, '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º. Resolução CFMV nº 1177/2017, art. 1º, Inciso XI');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('17', 'Associação de Criadores de animais - criação de animais de estimação com finalidade comercial, desportiva ou de proteção', '0', 'FG', '0', null, '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, inciso XI.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('19', 'Associação de Proteção de Direitos Animais', '0', 'FG', '0', null, '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º, Resolução CFMV nº 1177/2017, art. 2º, Inciso XI.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('22', 'Comércio ou dispensação de medicamentos veterinários', '4', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('23', 'Comércio de animais vivos', '4', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('24', 'Comércio de Materiais ou Produtos Hospitalares veterinários', '4', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('26', 'Distribuidora de medicamentos veterinários ou rações para animais', '4', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('27', 'Higiene e embelezamento de animais', '4', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 848/2008; Resolução CFMV nº 1.069/2014, art. 2º.', '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('28', 'Plano de Saúde Animal', '0', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXII.', '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('29', 'Certificadora', '3', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 848/2008; Resolução CFMV nº 1.177/2014, art. 2º, incio VI.', '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('31', 'Florestamento e/ou Reflorestamento', '3', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('32', 'Consultoria e execução de projetos relativos à produção animal', '3', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('33', 'Consultoria e execução de projetos relativos à sanidade animal', '3', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "d"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "d"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso I.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('34', 'Projetos para implantação de PGRSS', '3', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('35', 'Empresa de Controle de Pragas', '0', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('36', 'Licenciamento Ambiental', '3', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('37', 'Gerenciamento de Aspectos Ambientais', '3', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('38', 'Curso de Auxiliar Veterinário', '5', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "j"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "j"; Resolução CFMV nº 682/2001, art. 1º.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('39', 'Instituição de ensino de medicina veterinária', '5', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "j" e "i"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "j" e "i"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('40', 'Instituição de ensino de zootecnia', '5', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "j" e "i"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "j" e "i"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('41', 'Instituição de ensino agrícola médio em que a natureza dos trabalhos tenha por objetivo exclusivo a indústria animal', '5', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "l"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "l"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1177/2017, art. 1º, Inciso XXIV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('43', 'Fábrica de Produto de Uso Animal', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "l"; Resolução CFMV 1177/2017, art. 1º, Inciso III', '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('44', 'Fábrica de Ração para alimentação animal', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º, inciso IV', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º inciso IV');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('45', 'Fábrica de Misturas Vitamínicas para alimentação animal', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º inciso IV', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º inciso IV');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('46', 'Fábrica de Misturas Minerais para alimentação animal', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º inciso IV', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV 1177/2017, art. 2º inciso IV');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('47', 'Abatedouro frigorífico de carnes', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso IV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('48', 'Unidade de beneficiamento de carne e produtos cárneos', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso IV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('49', 'Fábrica de conserva de produtos de origem animal', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso IV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('50', 'Unidade de beneficiamento e processamento de produtos de origem animal', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso IV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('51', 'Entreposto de Produtos de Origem Animal', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso VIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('52', 'Unidade de extração e beneficiamento de produtos de abelhas', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso VI.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('53', 'Entreposto de beneficiamento de produtos de abelhas e derivados', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso VI.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('54', 'Barco-fábrica', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('55', 'Abatedouro frigorífico de pescado', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso V.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('56', 'Unidade de beneficiamento de pescado e produtos de pescado', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso V.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('57', 'Estação depuradora de moluscos bivalves', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso XX.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('58', 'Granja avícola', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso VII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('59', 'Unidade de beneficiamento de ovos e derivados', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso VII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('60', 'Granja leiteira', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso X.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('61', 'Usina de beneficiamento de leite e derivados', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso X.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('62', 'Fábrica de laticínios', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso X.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('63', 'Queijaria', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso X.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('64', 'Cortume', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 2º inciso IX.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('65', 'Unidade de beneficiamento de produtos de origem animal não comestíveis', '6', 'FG', '1', 'Lei nº 5.517/1968: art. 5º, alínea "e"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "e"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 2º inciso IX.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('66', 'Supermercado', '6', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('67', 'Mercado', '6', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('68', 'Açougue', '6', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('69', 'Serviço de incubatório, inseminação artificial ou comercialização de sêmen ou embrião e demais biotecnologias associadas à reprodução animal', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "i"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "c" e "i"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso XIV.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('70', 'Ambulatório médico-veterinário de animais de produção (bovídeos, equídeos, suídeos, ovinos, caprinos)', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('71', 'Consultório médico-veterinário de animais de produção (bovídeos, equídeos, suídeos, ovinos, caprinos)', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º;Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('72', 'Clínica médico-veterinária de animais de produção (bovídeos, equídeos, suídeos, ovinos, caprinos)', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('73', 'Hospital médico-veterinário de animais de produção (bovídeos, equídeos, suídeos, ovinos, caprinos)', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('74', 'Ambulatório médico-veterinário de animais silvestres ou exóticos', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('75', 'Consultório médico-veterinário de animais silvestres ou exóticos', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('76', 'Clínica médico-veterinária de animais silvestres ou exóticos', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('77', 'Hospital médico-veterinário de animais silvestres ou exóticos', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('78', 'Realização de exames de apoio diagnóstico veterinário (exames por imagem)', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso XVIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('79', 'Laboratório clínico de diagnóstico veterinário', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso XVIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('80', 'Laboratório de patologia veterinária', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso XVIII.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('81', 'Posto de coleta de material para exame laboratorial veterinário', '8', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('82', 'Fabricação, manipulação, fracionamento, envase ou rotulagem de produto veterinário biológico (antígeno, vacina, bacterina, soro, outros biológicos)', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "c"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1.177/2017, art. 2º, Inciso III.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('83', 'Fabricação, manipulação, fracionamento, envase ou rotulagem de produto veterinário farmacêutico', '7', 'FG', '1', 'Lei nº 5.517/1968, art. 5º, alínea "l"', '1', 'Lei nº 5.517/1968, art. 5º, alínea "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV nº 1.177/2017, art. 2º, Inciso III.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('0', 'Nenhuma das opções descritas', '0', 'FG', '0', null, '0', null);
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('84', 'Ambulatório médico-veterinário', '8', 'EMV', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('85', 'Consultório médico-veterinário', '8', 'EMV', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('86', 'Clínica médico-veterinária Dia', '8', 'EMV', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('87', 'Clínica médico-veterinária 24 horas', '8', 'EMV', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');
INSERT INTO tbl_atividades(tipo_atividade, label_atividade, classe, tp_form, art_obrigatorio, fundamento_legal_art, registro_obrigatorio, fundamento_legal_registro) VALUES ('88', 'Hospital médico-veterinário', '8', 'EMV', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"', '1', 'Lei nº 5.517/1968, art. 5º, alíneas "a", "b" e "c"; Resolução CFMV nº 682/2001, art. 1º; Resolução CFMV 1177/2017, art. 1º inciso II.');

CREATE TABLE forms(
  uuid_form Varchar(40) PRIMARY KEY,
  id_form Varchar(40),
  tp_form Varchar(5),
  CONSTRAINT fk_tp_form FOREIGN KEY(tp_form) REFERENCES tbl_formularios(tp_form)
);

INSERT INTO forms(uuid_form, id_form, tp_form) VALUES ('2dbc2b91-c4fa-48a3-8316-67458a7557f6', '157984688', 'EMV');

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

INSERT INTO dados_fiscalizacao(id_relatorio, data_fiscalizacao, hora_inicio, hora_fim, data_escrita, registro, art, possui_vetzoo, gera_tcpj, gera_tcpf, gera_ai_art, gera_ai_registro, gera_ai_comerciovacina, uuid_form)
VALUES ('EMV-157984688', '2022-05-19', '2022-05-19 12:45:00', '2022-05-19 15:48:51', '19 de mai. de 2022', '1', '1', '1', '1', '1', '1', '1', '1', '2dbc2b91-c4fa-48a3-8316-67458a7557f6');

CREATE TABLE estabelecimentos(
  crmv Varchar(10),
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

INSERT INTO estabelecimentos(id_relatorio, crmv, razao_social, cpf_cnpj, endereco, contato_email, contato_telcel, latitude, longitude)
VALUES ('EMV-157984688', '124', 'ALDO JOSE DE RESENDE', '24732927000184', 'R. FREI CANDIDO; 54; ; CENTRO; 36301196; SAO JOAO DEL REI', 'marcelo_thelin@hotmail.com', '(32)33711240', -19.93428, -43.95321);

CREATE TABLE atividades_mv(
  tipo_atividade Varchar(3),
  id_relatorio Varchar(200),
  CONSTRAINT fk_tipo_atividade FOREIGN KEY(tipo_atividade) REFERENCES tbl_atividades(tipo_atividade),
  CONSTRAINT fk_id_relatorio FOREIGN KEY(id_relatorio) REFERENCES dados_fiscalizacao(id_relatorio)
);

INSERT INTO atividades_mv(id_relatorio, tipo_atividade) VALUES ('EMV-157984688', '52');
INSERT INTO atividades_mv(id_relatorio, tipo_atividade) VALUES ('EMV-157984688', '53');
INSERT INTO atividades_mv(id_relatorio, tipo_atividade) VALUES ('EMV-157984688', '54');

CREATE TABLE tbl_servicos(
  servico_ofertado Varchar(3) PRIMARY KEY,
  label_servico text
);

INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('0', 'Procedimentos clínico-ambulatoriais')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('1', 'Cirurgia')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('2', 'Internação')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('3', 'Exames por imagem')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('4', 'Exames laboratoriais')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('5', 'Anestesia')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('6', 'Fisioterapia')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('7', 'Coleta, processamento, estocagem ou distribuição de sangue, seus componentes e derivados')
INSERT INTO tbl_servicos(servico_ofertado, label_servico) VALUES ('23', 'Outras atividades não descritas nas opções')

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