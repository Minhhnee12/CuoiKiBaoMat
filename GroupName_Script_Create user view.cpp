----Ph�n quy?n cho user ��?c ph�p truy xu?t c�c view theo b?ng m� t? chi ti?t:
----Ph�n quy?n cho user BDRead ��?c ph�p truy xu?t t?t c? c�c View
USE QLBongDa;
GRANT SELECT ON SCHEMA::dbo TO BDRead;


----Ph�n quy?n cho user BDU01 ch? ��?c ph�p truy xu?t c�c View vCau5 t?i vCau10
GRANT SELECT ON dbo.vCau5 TO BDU01;
GRANT SELECT ON dbo.vCau6 TO BDU01;
GRANT SELECT ON dbo.vCau7 TO BDU01;
GRANT SELECT ON dbo.vCau8 TO BDU01;
GRANT SELECT ON dbo.vCau9 TO BDU01;
GRANT SELECT ON dbo.vCau10 TO BDU01;

----Ph�n quy?n cho user BDU03 ��?c ph�p truy xu?t view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU03;
GRANT SELECT ON dbo.vCau2 TO BDU03;
GRANT SELECT ON dbo.vCau3 TO BDU03;
GRANT SELECT ON dbo.vCau4 TO BDU03;

----Ph�n quy?n cho user BDU04 ��?c ph�p truy xu?t view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU04;
GRANT SELECT ON dbo.vCau2 TO BDU04;
GRANT SELECT ON dbo.vCau3 TO BDU04;
GRANT SELECT ON dbo.vCau4 TO BDU04;