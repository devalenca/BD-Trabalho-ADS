/* 3) Crie um script em Linguagem SQL para o SGBD 
MySQL / MariaDB que insira:
3.1) Cadastros
3.1.1) 2 Turmas:
- Turma A: Aulas entre 01/08/2022 e 20/12/2022
- Turma B: Aulas entre 13/02/2023 e 30/06/2023
*/
USE trabalho;
INSERT INTO TURMA (NUM_TURMA, DTA_INICIO_AULAS, DTA_FIM_AULAS)
VALUES
	(1, '2022-08-01', '2022-12-20'),
	(2, '2023-02-13', '2023-06-30');

-- 3.1.2) 10 alunos em cada turma --
INSERT INTO ALUNO (RA, NOME_ALUNO, SEXO_ALUNO)
VALUES
	(100001, 'Aline Machado Cardoso', 'F'),
	(100002, 'André da Silva Campos', 'M'),
	(100003, 'Beatriz Almeida Carvalho', 'F'),
	(100004, 'Bartolomeu Severos', 'M'),
	(100005, 'Celina Santos dos Reis', 'F'),
	(100006, 'Cauan Yan de Almeida', 'M'),
	(100007, 'Diana Mariana Castro', 'F'),
	(100008, 'Douglas Pereira Martins', 'M'),
	(100009, 'Edvalda Sabrina da Cruz', 'F'),
	(100010, 'Edvan Barros dos Santos', 'M'),
	(100011, 'Fabiana Araújo Fernandes', 'F'),
	(100012, 'Fernando dos Anjos', 'M'),
	(100013, 'Gabriela Marques de Outorga', 'F'),
	(100014, 'Geraldo Matos da Silva', 'M'),
	(100015, 'Isabela Cristina Gaudino', 'F'),
	(100016, 'Igor de Lima Torres', 'M'),
	(100017, 'Jaqueline Maria Sanches', 'F'),
	(100018, 'José de Andrade Belinarti', 'M'),
	(100019, 'Kelly Roberta Santoro', 'F'),
	(100020, 'Kelvin Marcos de Santana', 'M');
	
-- 3.1.3) 4 Professores --
INSERT INTO PROFESSOR (MATRICULA, NOME_PROFESSOR, TITULACAO, SEXO_PROFESSOR)
VALUES
	(201, 'Alexandra dos Santos Marques', 'Mestre', 'F'),
	(202, 'Vanderlei Wagner de Carvalho', 'Mestre', 'M'),
	(203, 'Eliana Sabino de Araújo', 'Doutora', 'F'),
	(204, 'Marcos Ferreira da Silva', 'Doutor', 'M');
	
-- 3.1.4) 4 Disciplinas --
INSERT INTO DISCIPLINA (COD_DISCIPLINA, NOM_DISCIPLINA, CARGA_HORARIA)
VALUES
	(3001, 'Modelagem de Negócios e Requisitos', 60),
	(3002, 'Programação de Computadores', 80),
	(3003, 'Programação Web', 60),
	(3004, 'Banco de Dados', 80);
	
/* 3.2) Vínculos
3.2.1) Matricule 10 alunos na turma A e outros 10 alunos na turma B */
INSERT INTO MATRICULA (NUM_MATRICULA, DTA_MATRICULA, DTA_CANCELAMENTO_MATRICULA, RA, NUM_TURMA)
VALUES 
	(901, '2022-07-15', NULL, 100001, 1),
	(902, '2022-07-15', NULL, 100002, 1),
	(903, '2022-07-15', NULL, 100003, 1),
	(904, '2022-07-15', NULL, 100004, 1),
	(905, '2022-07-15', NULL, 100005, 1),
	(906, '2022-07-15', NULL, 100006, 1),
	(907, '2022-07-15', NULL, 100007, 1),
	(908, '2022-07-15', NULL, 100008, 1),
	(909, '2022-07-15', NULL, 100009, 1),
	(910, '2022-07-15', NULL, 100010, 1),
	(911, '2022-07-16', NULL, 100011, 2),
	(912, '2022-07-16', NULL, 100012, 2),
	(913, '2022-07-16', NULL, 100013, 2),
	(914, '2022-07-16', NULL, 100014, 2),
	(915, '2022-07-16', NULL, 100015, 2),
	(916, '2022-07-16', NULL, 100016, 2), 
	(917, '2022-07-16', NULL, 100017, 2),
	(918, '2022-07-16', NULL, 100018, 2),
	(919, '2022-07-16', NULL, 100019, 2), 
	(920, '2022-07-16', NULL, 100020, 2);
	
-- 3.2.2) Ofereça as 4 disciplinas em cada uma das turmas (A e B) --
INSERT INTO DISCIPLINA_OFERECIDA (NUM_DISCIPLINA_OFERECIDA, SALA, BLOCO, DIA_SEMANA, HOR_INICIO, HOR_FIM, MATRICULA, NUM_TURMA, COD_DISCIPLINA)
VALUES
	(1, 'A301', 'A', 2, '19:10', '21:50', 201, 1, 3001), 
	(2, 'Lab Inf. 3', 'B', 3, '19:10', '21:50', 202, 1, 3002),
	(3, 'Lab Inf. 3', 'B', 4, '19:10', '21:50', 203, 1, 3003),
	(4, 'Lab Inf. 3', 'B', 5, '19:10', '21:50', 204, 1, 3004),
	(5, 'Lab Inf. 4', 'B', 6, '19:10', '21:50', 201, 2, 3002),
	(6, 'A302', 'A', 3, '19:10', '21:50', 202, 2, 3001), 
	(7, 'Lab Inf. 4', 'B', 4, '19:10', '21:50', 203, 2, 3004),
	(8, 'Lab Inf. 4', 'B', 5, '19:10', '21:50', 204, 2, 3003);
	
/* 3.2.3) Insira as notas das avaliações dos alunos da turma A, conforme abaixo:
10% dos alunos devem ser reprovados direto.
40% dos alunos devem ser aprovados direto.
50% dos alunos devem fazer AF. Destes, 40% devem ser reprovados. */
INSERT INTO AVALIACAO (SEQ_AVALIACAO_ALUNO, NOTA_A2, NOTA_A1, NOTA_AF, RA, NUM_DISCIPLINA_OFERECIDA)
VALUES 
	(1, 0, 0, NULL, 100001, 1),
	(2, 0, 0, NULL, 100001, 2),
	(3, 0, 0, NULL, 100001, 3),
	(4, 0, 0, NULL, 100001, 4),
	(5, 5, 5, NULL, 100002, 1),
	(6, 5, 4, NULL, 100002, 2),
	(7, 4, 5, NULL, 100002, 3),
	(8, 5, 5, NULL, 100002, 4),
	(9, 3, 3, NULL, 100003, 1),
	(10, 4, 2, NULL, 100003, 2),
	(11, 3, 5, NULL, 100003, 3),
	(12, 5, 2, NULL, 100003, 4),
	(13, 5, 5, NULL, 100004, 1),
	(14, 4, 3, NULL, 100004, 2),
	(15, 3, 3, NULL, 100004, 3),
	(16, 4, 4, NULL, 100004, 4),
	(17, 2, 5, NULL, 100005, 1),
	(18, 3, 4, NULL, 100005, 2),
	(19, 4, 2, NULL, 100005, 3),
	(20, 5, 2, NULL, 100005, 4),
	(21, 2, 2, 4, 100006, 1),
	(22, 1, 3, 5, 100006, 2),
	(23, 3, 2, 3, 100006, 3),
	(24, 1, 1, 5, 100006, 4),
	(25, 3, 2, 1, 100007, 1),
	(26, 1, 4, 1, 100007, 2),
	(27, 1, 2, 2, 100007, 3),
	(28, 1, 3, 1, 100007, 4),
	(29, 2, 3, 2, 100008, 1),
	(30, 1, 1, 3, 100008, 2),
	(31, 3, 1, 2, 100008, 3),
	(32, 2, 1, 3, 100008, 4),
	(33, 4, 1, 1, 100009, 1),
	(34, 3, 1, 2, 100009, 2),
	(35, 1, 2, 2, 100009, 3),
	(36, 3, 1, 1, 100009, 4),
	(37, 3, 1, 2, 100010, 1),
	(38, 2, 1, 3, 100010, 2),
	(39, 1, 1, 4, 100010, 3),
	(40, 1, 0, 1, 100010, 4);
	
	
/* 3.2.4) Insira as notas das avaliações dos alunos da turma B, conforme abaixo:
10% dos alunos devem ser reprovados direto.
40% dos alunos devem ser aprovados direto.
50% dos alunos devem fazer AF. Considere que esta turma ainda irá fazer a AF. */
INSERT INTO AVALIACAO (SEQ_AVALIACAO_ALUNO, NOTA_A2, NOTA_A1, NOTA_AF, RA, NUM_DISCIPLINA_OFERECIDA)
VALUES 
	(41, 0, 0, NULL, 100011, 1),
	(42, 0, 0, NULL, 100011, 2),
	(43, 0, 0, NULL, 100011, 3),
	(44, 0, 0, NULL, 100011, 4),
	(45, 3, 3, NULL, 100012, 1),
	(46, 2, 5, NULL, 100012, 2),
	(47, 1, 5, NULL, 100012, 3),
	(48, 4, 2, NULL, 100012, 4),
	(49, 4, 4, NULL, 100013, 1),
	(50, 5, 3, NULL, 100013, 2),
	(51, 4, 2, NULL, 100013, 3),
	(52, 4, 5, NULL, 100013, 4),
	(53, 1, 5, NULL, 100014, 1),
	(54, 3, 5, NULL, 100014, 2),
	(55, 5, 4, NULL, 100014, 3),
	(56, 2, 5, NULL, 100014, 4),
	(57, 5, 2, NULL, 100015, 1),
	(58, 2, 4, NULL, 100015, 2),
	(59, 5, 1, NULL, 100015, 3),
	(60, 4, 3, NULL, 100015, 4),
	(61, 1, 1, NULL, 100016, 1),
	(62, 0, 2, NULL, 100016, 2),
	(63, 2, 3, NULL, 100016, 3),
	(64, 0, 4, NULL, 100016, 4),
	(65, 2, 1, NULL, 100017, 1),
	(66, 1, 3, NULL, 100017, 2),
	(67, 3, 2, NULL, 100017, 3),
	(68, 0, 4, NULL, 100017, 4),
	(69, 1, 1, NULL, 100018, 1),
	(70, 4, 0, NULL, 100018, 2),
	(71, 2, 2, NULL, 100018, 3),
	(72, 1, 3, NULL, 100018, 4),
	(73, 2, 3, NULL, 100019, 1),
	(74, 4, 1, NULL, 100019, 2),
	(75, 3, 1, NULL, 100019, 3),
	(76, 2, 2, NULL, 100019, 4),
	(77, 2, 0, NULL, 100020, 1),
	(78, 1, 3, NULL, 100020, 2),
	(79, 3, 2, NULL, 100020, 3),
	(80, 4, 1, NULL, 100020, 4);
