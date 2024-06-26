
CREATE TABLE Tb_fichaclinica (
                id_ficha_clinica VARCHAR(10) NOT NULL,
                nome_completo VARCHAR NOT NULL,
                historico_de_atendimento VARCHAR(20) NOT NULL,
                altura VARCHAR(10) NOT NULL,
                peso VARCHAR(5) NOT NULL,
                pressao_arterial DOUBLE PRECISIONS NOT NULL,
                nivel_glicemia DOUBLE PRECISIONS NOT NULL,
                circ_abdominal DOUBLE PRECISIONS NOT NULL,
                exames_p_data DATE NOT NULL,
                historico_saude VARCHAR(30) NOT NULL,
                cid_atual VARCHAR(10) NOT NULL,
                historico_cid VARCHAR(30) NOT NULL,
                anminese VARCHAR(20) NOT NULL,
                condutas VARCHAR(30) NOT NULL,
                prescricoes VARCHAR(30) NOT NULL,
                eveolucao_ult_cid VARCHAR(30) NOT NULL,
                evolucoes_anteriores VARCHAR(30) NOT NULL,
                atendimentos_presenciais VARCHAR(20) NOT NULL,
                teleconsulta VARCHAR(30) NOT NULL,
                prescricoes_sem_consulta VARCHAR(20) NOT NULL,
                medicos VARCHAR(10) NOT NULL,
                crm VARCHAR(10) NOT NULL,
                fotos_queixas VARCHAR(30) NOT NULL,
                relato_queixa VARCHAR(30) NOT NULL,
                hist_vacina VARCHAR(20) NOT NULL,
                PRIMARY KEY (id_ficha_clinica)
);


CREATE TABLE tb_Chat_ia (
                id_chamado VARCHAR(10) NOT NULL,
                id_ficha_clinica VARCHAR(10) NOT NULL,
                pre_avaliacao VARCHAR(30) NOT NULL,
                historico_conversas VARCHAR(30) NOT NULL,
                historic_fotos VARCHAR(30) NOT NULL,
                tipos_orientacao VARCHAR(30) NOT NULL,
                tempo_atendim VARCHAR NOT NULL,
                envio_dados_paciente VARCHAR NOT NULL,
                comunicao_ps VARCHAR NOT NULL,
                envio_ficha_clinina VARCHAR NOT NULL,
                PRIMARY KEY (id_chamado)
);


CREATE TABLE Tb_Acesso (
                id_acesso VARCHAR(10) AUTO_INCREMENT NOT NULL,
                senha VARCHAR(10) NOT NULL,
                aceite_lgpd INT NOT NULL,
                email VARCHAR NOT NULL,
                PRIMARY KEY (id_acesso)
);


CREATE TABLE Tb_profissional_saude (
                id_profissional VARCHAR(10) NOT NULL,
                id_acesso VARCHAR(10) NOT NULL,
                id_chamado VARCHAR(10) NOT NULL,
                nome_completo VARCHAR(20) NOT NULL,
                sigla_conselho VARCHAR(6) NOT NULL,
                dados_bancarios VARCHAR(30) NOT NULL,
                cpf VARCHAR(14) NOT NULL,
                rg VARCHAR(10) NOT NULL,
                local_atendimento VARCHAR(15) NOT NULL,
                tipo_consulta VARCHAR(20) NOT NULL,
                chamdos_abertos VARCHAR(20) NOT NULL,
                chamados_atendidos VARCHAR(20) NOT NULL,
                chamados_acompanhamento VARCHAR(30) NOT NULL,
                registro_conduta VARCHAR(30) NOT NULL,
                qtda_teleconsultas VARCHAR(30) NOT NULL,
                qtda_orientacao_ps VARCHAR(15) NOT NULL,
                qtda_orientacao_chat VARCHAR NOT NULL,
                grafico_atendimento VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_profissional)
);


CREATE TABLE Tb_Responsavel (
                id_responsavel VARCHAR NOT NULL,
                cpf_responsavel VARCHAR(18) NOT NULL,
                id_acesso VARCHAR(10) NOT NULL,
                nome_completo VARCHAR(25) NOT NULL,
                rg VARCHAR(12),
                tipo_convenio VARCHAR(10) NOT NULL,
                data_nasc DATE NOT NULL,
                email VARCHAR(25) NOT NULL,
                rua VARCHAR(25) NOT NULL,
                numero VARCHAR(5),
                cep VARCHAR(9) NOT NULL,
                bairro VARCHAR(15) NOT NULL,
                cidade VARCHAR(15) NOT NULL,
                estado VARCHAR(10) NOT NULL,
                PRIMARY KEY (id_responsavel)
);


CREATE TABLE tb_Beneficiario_paciente (
                id_paciente VARCHAR(15) NOT NULL,
                id_ficha_clinica VARCHAR(10) NOT NULL,
                id_responsavel VARCHAR NOT NULL,
                nome_completo VARCHAR(30) NOT NULL,
                tipo_convencio VARCHAR(10) NOT NULL,
                responsavel VARCHAR(10) NOT NULL,
                escolaridade VARCHAR(10),
                eg VARCHAR(10),
                data_nasc DATE NOT NULL,
                certidao_nascimento VARCHAR(10),
                rua VARCHAR(25) NOT NULL,
                cep VARCHAR(9) NOT NULL,
                numero VARCHAR(10) NOT NULL,
                bairro VARCHAR(15) NOT NULL,
                cidade VARCHAR(15) NOT NULL,
                estado VARCHAR(10) NOT NULL,
                PRIMARY KEY (id_paciente)
);


CREATE TABLE Tb_Sistema (
                versao_sistema VARCHAR(15) NOT NULL,
                id_sistema VARCHAR(15) NOT NULL,
                id_acesso VARCHAR(10) NOT NULL,
                PRIMARY KEY (versao_sistema, id_sistema)
);


CREATE TABLE Tb_Sus (
                versao_sistema_sus VARCHAR(15) NOT NULL,
                id_sistemaa VARCHAR(15) NOT NULL,
                PRIMARY KEY (versao_sistema_sus)
);


CREATE TABLE Tb_Outras_operadoras (
                versao_sistema_out VARCHAR(15) NOT NULL,
                id_sistemac VARCHAR(15) NOT NULL,
                PRIMARY KEY (versao_sistema_out)
);


CREATE TABLE Tb_Hapvida (
                versao_sistema_hp VARCHAR(15) NOT NULL,
                id_sistemab VARCHAR(15) NOT NULL,
                PRIMARY KEY (versao_sistema_hp)
);


ALTER TABLE tb_Chat_ia ADD CONSTRAINT new_table_tb_chat_ia_fk
FOREIGN KEY (id_ficha_clinica)
REFERENCES Tb_fichaclinica (id_ficha_clinica)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_Beneficiario_paciente ADD CONSTRAINT tb_fichaclinica_tb_beneficiario_paciente_fk
FOREIGN KEY (id_ficha_clinica)
REFERENCES Tb_fichaclinica (id_ficha_clinica)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_profissional_saude ADD CONSTRAINT tb_chat_ia_tb_profissional_saude_fk
FOREIGN KEY (id_chamado)
REFERENCES tb_Chat_ia (id_chamado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_Sistema ADD CONSTRAINT tb_acesso_tb_sistema_fk
FOREIGN KEY (id_acesso)
REFERENCES Tb_Acesso (id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_Responsavel ADD CONSTRAINT tb_acesso_tb_responsavel_fk
FOREIGN KEY (id_acesso)
REFERENCES Tb_Acesso (id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_profissional_saude ADD CONSTRAINT tb_acesso_tb_profissional_saude_fk
FOREIGN KEY (id_acesso)
REFERENCES Tb_Acesso (id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_Beneficiario_paciente ADD CONSTRAINT tb_responsavel_tb_beneficiario_paciente_fk
FOREIGN KEY (id_responsavel)
REFERENCES Tb_Responsavel (id_responsavel)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_Hapvida ADD CONSTRAINT tb_sistema_tb_hapvida_fk
FOREIGN KEY (versao_sistema_hp, id_sistemab)
REFERENCES Tb_Sistema (versao_sistema, id_sistema)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_Outras_operadoras ADD CONSTRAINT tb_sistema_tb_outras_operadoras_fk
FOREIGN KEY (versao_sistema_out, id_sistemac)
REFERENCES Tb_Sistema (versao_sistema, id_sistema)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_Sus ADD CONSTRAINT tb_sistema_tb_sus_fk
FOREIGN KEY (versao_sistema_sus, id_sistemaa)
REFERENCES Tb_Sistema (versao_sistema, id_sistema)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
