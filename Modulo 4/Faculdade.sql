-- Cria o banco de dados
CREATE DATABASE IF NOT EXISTS Faculdade;

-- Seleciona o banco
USE Faculdade;

-- Criação da tabela DEPARTAMENTO
CREATE TABLE departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    local VARCHAR(100)
);

-- Criação da tabela PROFESSOR
CREATE TABLE professor (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    inicio_contrato DATE DEFAULT CURRENT_DATE,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- Criação da tabela ALUNO
CREATE TABLE aluno (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(150)
);

-- Criação da tabela DISCIPLINA
CREATE TABLE disciplina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT DEFAULT 60,
    ementa TEXT
);

-- Tabela associativa ALUNO_DISCIPLINA (N:M)
CREATE TABLE aluno_disciplina (
    matricula INT,
    id_disciplina INT,
    PRIMARY KEY (matricula, id_disciplina),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id)
);

-- Inserção de dados
INSERT INTO departamento (nome, local)
VALUES ('Computação', 'Bloco A');

INSERT INTO professor (cpf, nome, contato, id_departamento)
VALUES ('12345678901', 'Carlos Silva', 'carlos@email.com', 1);

INSERT INTO aluno (nome, data_nascimento, endereco)
VALUES ('Ana Souza', '2002-05-10', 'Rua Central, 123');

INSERT INTO disciplina (nome, carga_horaria, ementa)
VALUES ('Banco de Dados', 60, 'Modelagem ER e SQL');

INSERT INTO aluno_disciplina (matricula, id_disciplina)
VALUES (1, 1);
