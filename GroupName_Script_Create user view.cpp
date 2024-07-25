----Phân quy?n cho user ðý?c phép truy xu?t các view theo b?ng mô t? chi ti?t:
----Phân quy?n cho user BDRead ðý?c phép truy xu?t t?t c? các View
USE QLBongDa;
GRANT SELECT ON SCHEMA::dbo TO BDRead;


----Phân quy?n cho user BDU01 ch? ðý?c phép truy xu?t các View vCau5 t?i vCau10
GRANT SELECT ON dbo.vCau5 TO BDU01;
GRANT SELECT ON dbo.vCau6 TO BDU01;
GRANT SELECT ON dbo.vCau7 TO BDU01;
GRANT SELECT ON dbo.vCau8 TO BDU01;
GRANT SELECT ON dbo.vCau9 TO BDU01;
GRANT SELECT ON dbo.vCau10 TO BDU01;

----Phân quy?n cho user BDU03 ðý?c phép truy xu?t view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU03;
GRANT SELECT ON dbo.vCau2 TO BDU03;
GRANT SELECT ON dbo.vCau3 TO BDU03;
GRANT SELECT ON dbo.vCau4 TO BDU03;

----Phân quy?n cho user BDU04 ðý?c phép truy xu?t view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU04;
GRANT SELECT ON dbo.vCau2 TO BDU04;
GRANT SELECT ON dbo.vCau3 TO BDU04;
GRANT SELECT ON dbo.vCau4 TO BDU04;