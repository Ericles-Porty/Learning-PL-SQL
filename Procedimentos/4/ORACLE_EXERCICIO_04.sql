CREATE TABLE TB_FUNCIONARIO(
    ID INT PRIMARY KEY,
    MATRICULA VARCHAR2(20),
    NOME VARCHAR2(50),
    SALARIO DECIMAL(10,2),
    CONTRIBUICAO_SINDICAL DECIMAL(10,2)
    );
    
CREATE TABLE TB_DIFERENCA_CONTRIBUICAO(
    ID INT PRIMARY KEY,
    MATRICULA VARCHAR2(20),
    VALOR DECIMAL(10,2)
);

CREATE OR REPLACE PROCEDURE SP_CALCULA_CONTRIBUICAO(SALARY IN NUMBER, CONTRIBUICAO OUT NUMBER)
AS
BEGIN
    IF SALARY <= 1200 THEN
        CONTRIBUICAO := SALARY * 0.02;
    ELSIF SALARY <= 1800 THEN
        CONTRIBUICAO := SALARY * 0.03;
    ELSE
        CONTRIBUICAO := SALARY * 0.04;
    END IF;
END;

DECLARE
    CURSOR C_FUNCIONARIO IS SELECT * FROM TB_FUNCIONARIO;
    R_FUNCIONARIO C_FUNCIONARIO%ROWTYPE;
    CONTRIBUICAO DECIMAL(10,2);
    DIFERENCA DECIMAL(10,2);
BEGIN
    DELETE FROM TB_DIFERENCA_CONTRIBUICAO;
    OPEN C_FUNCIONARIO;
    FETCH C_FUNCIONARIO INTO R_FUNCIONARIO;
    WHILE C_FUNCIONARIO%FOUND LOOP
        SP_CALCULA_CONTRIBUICAO(R_FUNCIONARIO.SALARIO,CONTRIBUICAO);
        DIFERENCA := R_FUNCIONARIO.CONTRIBUICAO_SINDICAL - CONTRIBUICAO;
        IF DIFERENCA <> 0 THEN
            INSERT INTO TB_DIFERENCA_CONTRIBUICAO(ID, MATRICULA, VALOR)
            VALUES(
                R_FUNCIONARIO.ID,
                R_FUNCIONARIO.MATRICULA,
                DIFERENCA
            );
        END IF;
        FETCH C_FUNCIONARIO INTO R_FUNCIONARIO;
    END LOOP;
END;

CREATE SEQUENCE SQ_FUNCIONARIO START WITH 1 INCREMENT BY 1;

INSERT INTO TB_FUNCIONARIO(ID, MATRICULA, NOME, SALARIO, CONTRIBUICAO_SINDICAL)
VALUES(
    SQ_FUNCIONARIO.NEXTVAL,
    '20190008177',
    'MILENA',
    5000.00,
    200.00
);

INSERT INTO TB_FUNCIONARIO(ID, MATRICULA, NOME, SALARIO, CONTRIBUICAO_SINDICAL)
VALUES(
    SQ_FUNCIONARIO.NEXTVAL,
    '20190008178',
    'ERICLES',
    6000.00,
    200.00
);


INSERT INTO TB_FUNCIONARIO(ID, MATRICULA, NOME, SALARIO, CONTRIBUICAO_SINDICAL)
VALUES(
    SQ_FUNCIONARIO.NEXTVAL,
    '20190008188',
    'KENDY',
    4000.00,
    200.00
);

SELECT * FROM TB_FUNCIONARIO;
SELECT * FROM TB_DIFERENCA_CONTRIBUICAO;