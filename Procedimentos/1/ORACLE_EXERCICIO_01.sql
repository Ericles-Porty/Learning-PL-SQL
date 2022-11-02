CREATE TABLE TB_FORNECEDOR(
CD_FORNECEDOR INT PRIMARY KEY,
NM_FORNECEDOR VARCHAR(60),
NM_CONTATO VARCHAR2(60),
DT_CADASTRO DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE SQ_FORNECEDOR START WITH 1 INCREMENT BY 1;

INSERT INTO TB_FORNECEDOR (CD_FORNECEDOR, NM_FORNECEDOR, NM_CONTATO, DT_CADASTRO) 
VALUES (
    SQ_FORNECEDOR.nextval,
    'MANS�O MAROMBA',
    'ERICLES',
    SYSDATE
);

INSERT INTO TB_FORNECEDOR (CD_FORNECEDOR, NM_FORNECEDOR, NM_CONTATO, DT_CADASTRO) 
VALUES (
    SQ_FORNECEDOR.nextval,
    'MANS�O MAROMBA',
    'THIAGO',
    SYSDATE
);

INSERT INTO TB_FORNECEDOR (CD_FORNECEDOR, NM_FORNECEDOR, NM_CONTATO, DT_CADASTRO) 
VALUES (
    SQ_FORNECEDOR.nextval,
    'MANS�O MAROMBA',
    'MILENA',
    SYSDATE
);

SELECT * FROM TB_FORNECEDOR;