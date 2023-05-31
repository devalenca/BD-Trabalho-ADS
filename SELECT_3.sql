 /*4.3 ) Lista de notas dos alunos de uma determinada turma (B, por exemplo) com
Nome da Disciplina, Nome do Professor, o local da aula (sala/Bloco), o dia da semana
por extenso, o horário de início e fim das aulas, RA e Nome dos alunos, Nota_A2,
Nota_A1, Nota_AF e a situação do aluno (APROVADO, REPROVADO, AVALIAÇÃO
FINAL) (0,25 ponto). 
*/ 


SELECT 
d.NOM_DISCIPLINA, p.NOME_PROFESSOR, dof.SALA, dof.BLOCO,
    CASE dof.DIA_SEMANA
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda-feira'
        WHEN 3 THEN 'Terça-feira'
        WHEN 4 THEN 'Quarta-feira'
        WHEN 5 THEN 'Quinta-feira'
        WHEN 6 THEN 'Sexta-feira'
        ELSE 'Sábado'
    END AS DIA_SEMANA, 
	#(a.NOTA_A2 + a.NOTA_A1)  <= 5.74 AS 'REPROVADO TESTE',
    #IF (a.RA > 100010 AND a.NOTA_AF IS NULL, 1, 0) = 1 AS 'AF(PENDENTE TESTE)',
    #IF (a.NOTA_A2 > a.NOTA_A1, a.NOTA_A2 + a.NOTA_AF, a.NOTA_A1 + a.NOTA_AF) AS 'NOTA FINAL TESTE APROVADO',
    TIME_FORMAT(dof.HOR_INICIO, '%H:%i') AS HOR_INICIO,
    TIME_FORMAT(dof.HOR_FIM, '%H:%i') AS HOR_FIM,
    a.RA, al.NOME_ALUNO, a.NOTA_A2, a.NOTA_A1, a.NOTA_AF,
   # IF(a.NOTA_A2 > a.NOTA_A1, a.NOTA_A2 + a.NOTA_AF, a.NOTA_A1 + a.NOTA_AF) AS 'NOTA FINAL',
    
    CASE
        WHEN (a.NOTA_A2 + a.NOTA_A1)  >= 5.75 THEN 'APROVADO'
        WHEN IF(a.NOTA_A2 > a.NOTA_A1, a.NOTA_A2 + a.NOTA_AF, a.NOTA_A1 + a.NOTA_AF) >= 5.75  THEN 'AF(APROVADO)'
        WHEN IF (a.RA > 100010 AND a.NOTA_AF IS NULL AND (a.NOTA_A2 + a.NOTA_A1) >= 1 , 1, 0) = 1 THEN 'AF(PENDENTE)' 
        WHEN IF(a.NOTA_A2 < a.NOTA_A1, a.NOTA_A1 + a.NOTA_AF, a.NOTA_A1 + a.NOTA_AF) <= 5.74  THEN 'AF(REPROVADO)'
		WHEN (a.NOTA_A2 + a.NOTA_A1)  <= 5.74 THEN 'REPROVADO'
        ELSE 'REPROVADO FINAL'
    END AS SITUACAO_ALUNO
FROM TRABALHO.DISCIPLINA_OFERECIDA dof
INNER JOIN 
TRABALHO.DISCIPLINA d ON d.COD_DISCIPLINA = dof.COD_DISCIPLINA
INNER JOIN
TRABALHO.PROFESSOR p ON p.MATRICULA = dof.MATRICULA
INNER JOIN
TRABALHO.TURMA t ON t.NUM_TURMA = dof.NUM_TURMA
INNER JOIN
TRABALHO.AVALIACAO a ON a.NUM_DISCIPLINA_OFERECIDA = dof.NUM_DISCIPLINA_OFERECIDA
INNER JOIN 
TRABALHO.MATRICULA m ON m.RA = a.RA 
INNER JOIN 
TRABALHO.ALUNO al ON al.RA = m.RA
WHERE t.NUM_TURMA IS NOT NULL
