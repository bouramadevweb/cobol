IDENTIFICATION DIVISION.
PROGRAM-ID. GestionInventaireLivres.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 IndexLivres  PIC 9(2).

01 Inventaire.
   02 Titre         PIC X(30) OCCURS 5 TIMES.
   02 Auteur        PIC X(20) OCCURS 5 TIMES.
   02 AnneePub      PIC 9(4) OCCURS 5 TIMES.
   02 CopiesDispo   PIC 9(1) OCCURS 5 TIMES.

PROCEDURE DIVISION.

   MOVE "1984" TO Titre(1).
   MOVE "George Orwell" TO Auteur(1).
   MOVE 1949 TO AnneePub(1).
   MOVE 5 TO CopiesDispo(1).

   MOVE "Le Petit Prince" TO Titre(2).
   MOVE "Antoine de Saint-Exupéry" TO Auteur(2).
   MOVE 1943 TO AnneePub(2).
   MOVE 3 TO CopiesDispo(2).

   MOVE "Le Seigneur des Anneaux" TO Titre(3).
   MOVE "J.R.R. Tolkien" TO Auteur(3).
   MOVE 1954 TO AnneePub(3).
   MOVE 7 TO CopiesDispo(3).

   MOVE "Fondation" TO Titre(4).
   MOVE "Isaac Asimov" TO Auteur(4).
   MOVE 1951 TO AnneePub(4).
   MOVE 4 TO CopiesDispo(4).

   MOVE "Dune" TO Titre(5).
   MOVE "Frank Herbert" TO Auteur(5).
   MOVE 1965 TO AnneePub(5).
   MOVE 6 TO CopiesDispo(5).

   DISPLAY "Inventaire des Livres : ".
   PERFORM VARYING IndexLivres FROM 1 BY 1 UNTIL IndexLivres > 5
      DISPLAY "Livre : " Titre(IndexLivres)
              " | Auteur : " Auteur(IndexLivres)
              " | Année de Publication : " AnneePub(IndexLivres)
              " | Copies Disponibles : " CopiesDispo(IndexLivres)
   END-PERFORM.

   STOP RUN.
