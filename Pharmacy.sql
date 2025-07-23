-- Το βήμα αυτό γίνεται για να "καθαρίσουμε" την ύπαρξη τυχ΄ψν πινάκων από πριν
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Orders';
    EXECUTE IMMEDIATE 'DROP TABLE Customers';
    EXECUTE IMMEDIATE 'DROP TABLE Medicines';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Δημιουργία πρώτου πίνακα 
CREATE TABLE MEDICINES (
    MEDICINE_ID NUMBER PRIMARY KEY,
    NAME        VARCHAR2(50),
    PRICE       NUMBER(5, 2),
    STOCK       INT
);

-- Δημιουργία δεύτερου πίνακα 
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    FULL_NAME   VARCHAR2(100),
    EMAIL       VARCHAR2(100)
);

-- Δημιουργία τρίτου πίνακα
CREATE TABLE ORDERS (
    ORDER_ID    NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    MEDICINE_ID NUMBER,
    QUANTITY    INT,
    ORDER_DATE  DATE,
    FOREIGN KEY ( CUSTOMER_ID )
        REFERENCES CUSTOMERS ( CUSTOMER_ID ),
    FOREIGN KEY ( MEDICINE_ID )
        REFERENCES MEDICINES ( MEDICINE_ID )
);

-- Εισαγωγή στοιχείων στο πίνακα 1 
INSERT INTO MEDICINES VALUES ( 1,
                               'Paracetamol',
                               3.50,
                               100 );

INSERT INTO MEDICINES VALUES ( 2,
                               'Amoxicillin',
                               7.20,
                               60 );

INSERT INTO MEDICINES VALUES ( 3,
                               'Ibuprofen',
                               4.10,
                               80 );

-- Εισαγωγή στοιχείων στο πίνακα 2 
INSERT INTO CUSTOMERS VALUES ( 1,
                               'Maria Papadopoulou',
                               'maria@email.com' );

INSERT INTO CUSTOMERS VALUES ( 2,
                               'Giorgos Ioannou',
                               'giorgos@email.com' );

-- Εισαγωγή στοιχείων στο πίνακα 3 
INSERT INTO ORDERS VALUES ( 1,
                            1,
                            2,
                            1,
                            SYSDATE );

INSERT INTO ORDERS VALUES ( 2,
                            2,
                            1,
                            2,
                            SYSDATE );

SELECT
    *
FROM
    ORDERS;