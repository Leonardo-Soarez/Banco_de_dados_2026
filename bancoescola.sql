-- 1. Criação do Banco de Dados
CREATE DATABASE GestaoEscolar;
USE GestaoEscolar;

-- 2. Tabela de Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    especialidade VARCHAR(50)
);

-- 3. Tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(50) NOT NULL,
    carga_horaria INT
);

-- 4. Tabela de Turmas
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    codigo_turma VARCHAR(10) NOT NULL,
    ano_letivo INT,
    periodo VARCHAR(20) -- Ex: Manhã, Tarde, Noite
);

-- 5. Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);

-- 6. Tabela de Notas (Relaciona Aluno, Disciplina e Professor)
CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    id_professor INT,
    valor_nota DECIMAL(4,2),
    bimestre INT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);
