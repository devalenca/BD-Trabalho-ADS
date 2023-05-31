/*
4.2 ) Lista de presença com Nome da Disciplina, Nome do Professor, o local da aula
(sala/Bloco), o dia da semana por extenso, o horário de início e fim das aulas, RA e
Nome dos alunos, mas apenas da turma vigente (0,25 ponto).
*/

SELECT 
    d.NOM_DISCIPLINA AS 'DISCIPLINA',
    p.NOME_PROFESSOR AS 'PROFESSOR',
    do.BLOCO, 
    do.SALA,
    t.NUM_TURMA,
    CASE 
        WHEN do.DIA_SEMANA = 1 THEN 'Domingo'
        WHEN do.DIA_SEMANA = 2 THEN 'Segunda-feira'
        WHEN do.DIA_SEMANA = 3 THEN 'Terça-feira'
        WHEN do.DIA_SEMANA = 4 THEN 'Quarta-feira'
        WHEN do.DIA_SEMANA = 5 THEN 'Quinta-feira'
        WHEN do.DIA_SEMANA = 6 THEN 'Sexta-feira'
        WHEN do.DIA_SEMANA = 7 THEN 'Sábado'
    END AS 'DIA SEMANA',
    do.HOR_INICIO AS 'HORÁRIO DE INÍCIO',
    do.HOR_FIM AS 'HORÁRIO DE FIM',
    al.RA AS 'RA',
    al.NOME_ALUNO AS 'NOME'
    
FROM 
    TRABALHO.DISCIPLINA_OFERECIDA do
     INNER JOIN
     TRABALHO.PROFESSOR p ON p.MATRICULA = do.MATRICULA
     INNER JOIN 
     TRABALHO.TURMA t ON t.NUM_TURMA = do.NUM_TURMA 
     INNER JOIN 
     TRABALHO.DISCIPLINA d ON d.COD_DISCIPLINA = do.COD_DISCIPLINA
     INNER JOIN
     TRABALHO.MATRICULA m ON m.NUM_TURMA = t.NUM_TURMA
     INNER JOIN 
     TRABALHO.ALUNO al ON al.RA = m.RA
	 WHERE 
     t.NUM_TURMA IS NOT NULL
	 
ORDER BY 
    d.NOM_DISCIPLINA,
    do.SALA,
    do.BLOCO,
    do.DIA_SEMANA,
    do.HOR_INICIO,
    al.NOME_ALUNO;
    
    
    
