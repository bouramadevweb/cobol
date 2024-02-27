IDENTIFICATION DIVISION.
PROGRAM-ID. GestionInventaireLivres.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 IndexLivres  PIC 9(2).

01 Titre         PIC X(30) OCCURS 5 TIMES.
01 Auteur        PIC X(20) OCCURS 5 TIMES.
01 AnneePub      PIC 9(4) OCCURS 5 TIMES.
01 CopiesDispo   PIC 9(1) OCCURS 50 TIMES.

01 NbLivres         PIC 9(2).
01 LivreAjoute      PIC X VALUE 'N'.

PROCEDURE DIVISION.

   DISPLAY "Bienvenue dans le programme de gestion d'inventaire de livres.".
   DISPLAY "Veuillez entrer le nombre de livres que vous souhaitez enregistrer : ".
   ACCEPT NbLivres.

   MOVE 'N' TO LivreAjoute.

   PERFORM 1000-ENREGISTRER-LIVRE THRU 1000-SORTIR.

   IF LivreAjoute = 'O' 
      DISPLAY "Livre ajouté avec succès !"
   ELSE
      DISPLAY "Aucun livre ajouté."
   END-IF.

   DISPLAY "Inventaire des Livres : ".
   PERFORM VARYING IndexLivres FROM 1 BY 1 UNTIL IndexLivres > NbLivres
      DISPLAY "Livre : " Titre(IndexLivres)
              " | Auteur : " Auteur(IndexLivres)
              " | Année de Publication : " AnneePub(IndexLivres)
              " | Copies Disponibles : " CopiesDispo(IndexLivres)
   END-PERFORM.

   DISPLAY "Merci d'avoir utilisé le programme de gestion d'inventaire de livres.".
   STOP RUN.

   1000-ENREGISTRER-LIVRE.
      DISPLAY "Veuillez saisir les détails du Livre : ".
      ACCEPT Titre(IndexLivres).
      DISPLAY "Veuillez Auteur du livre"
      ACCEPT Auteur(IndexLivres).
      DISPLAY "Veuillez Année de publication"
      ACCEPT AnneePub(IndexLivres).
      DISPLAY "Veuillez le nombre de copie"
      ACCEPT CopiesDispo(IndexLivres).

      MOVE 'O' TO LivreAjoute.

      ADD 1 TO IndexLivres.

   1000-SORTIR.
      EXIT.
