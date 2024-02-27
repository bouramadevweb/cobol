IDENTIFICATION DIVISION.
PROGRAM-ID. exemple_tb_hiere.
ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Produit.
   02 Produit OCCURS 2 TIMES INDEXED BY idx.
      03 nom-produit PIC X(10).
      03 Qantite PIC 9(3).

PROCEDURE DIVISION.
   MOVE "banane" TO nom-produit OF Produit(1).
   MOVE 33 TO Qantite OF Produit(1).
   MOVE "pomme" TO nom-produit OF Produit(2).
   MOVE 33 TO Qantite OF Produit(2).
   MOVE "fraise" TO nom-produit OF Produit(3)
   MOVE 44 TO Qantite

   PERFORM VARYING idx FROM 1 BY 1 UNTIL idx > 2
      DISPLAY "Produit : " nom-produit(idx) " Quantite : " Qantite(idx)
   END-PERFORM.

   STOP RUN.
