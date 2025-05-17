CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100),
    duracao INT
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    rg VARCHAR(20),
    nascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    nome_responsavel VARCHAR(100),
    curso_id INT,
    situacao_academica VARCHAR(30),
    data_ingresso DATE,
    forma_ingresso VARCHAR(50),
    FOREIGN KEY (curso_id) REFERENCES Curso(id_curso)
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    email VARCHAR(100),
    titulacao VARCHAR(50),
    area_atuacao VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    curso_id INT,
    carga_horaria INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(id_curso)
);

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    disciplina_id INT,
    professor_id INT,
    semestre VARCHAR(10),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (professor_id) REFERENCES Professor(id_professor)
);

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (turma_id) REFERENCES Turma(id_turma)
);

CREATE TABLE Nota (
    id_nota INT PRIMARY KEY,
    matricula_id INT,
    tipo_avaliacao VARCHAR(50),
    valor DECIMAL(5,2),
    FOREIGN KEY (matricula_id) REFERENCES Matricula(id_matricula)
);