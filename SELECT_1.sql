/*4 ) Consultas
 4.1 ) Consulta em Linguagem SQL para MySQL/MariaDB que mostre o nome do
Professor, sua titulação, as disciplinas que leciona, as datas de início e fim das aulas
das turmas, quantos alunos há em cada turma, o local da aula (sala/Bloco), o dia da
semana por extenso, e o horário de início e fim das aulas (0,25 ponto).
*/


SELECT 
    P.NOME_PROFESSOR AS 'PROFESSOR', 
    P.TITULACAO AS 'TITULO' , 
    D.NOM_DISCIPLINA AS 'DISCIPLINA', 
    T.DTA_INICIO_AULAS AS 'INÍCIO AULAS', 
    T.DTA_FIM_AULAS AS 'FIM AULAS', 
    COUNT(M.RA) AS 'QTDE ALUNOS', 
    DO.SALA AS 'SALA', 
    DO.BLOCO AS 'BLOCO', 
    CASE 
        WHEN DO.DIA_SEMANA = 1 THEN 'Domingo' 
        WHEN DO.DIA_SEMANA = 2 THEN 'Segunda-feira' 
        WHEN DO.DIA_SEMANA = 3 THEN 'Terça-feira' 
        WHEN DO.DIA_SEMANA = 4 THEN 'Quarta-feira' 
        WHEN DO.DIA_SEMANA = 5 THEN 'Quinta-feira' 
        WHEN DO.DIA_SEMANA = 6 THEN 'Sexta-feira' 
        WHEN DO.DIA_SEMANA = 7 THEN 'Sábado' 
    END AS' DIA SEMANA', 
    DO.HOR_INICIO AS 'HORÁRIO INÍCIO', 
    DO.HOR_FIM AS 'HORÁRIO FIM' 
FROM 
    TRABALHO.PROFESSOR P 
    JOIN TRABALHO.DISCIPLINA_OFERECIDA DO ON P.MATRICULA = DO.MATRICULA 
    JOIN TRABALHO.TURMA T ON T.NUM_TURMA = DO.NUM_TURMA 
    JOIN TRABALHO.DISCIPLINA D ON D.COD_DISCIPLINA = DO.COD_DISCIPLINA 
    JOIN TRABALHO.MATRICULA M ON M.NUM_TURMA = DO.NUM_TURMA 
	
GROUP BY 
    P.NOME_PROFESSOR, 
    P.TITULACAO, 
    D.NOM_DISCIPLINA, 
    T.DTA_INICIO_AULAS, 
    T.DTA_FIM_AULAS, 
    DO.SALA, 
    DO.BLOCO, 
    DO.DIA_SEMANA, 
    DO.HOR_INICIO, 
    DO.HOR_FIM;
