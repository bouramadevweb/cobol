IDENTIFICATION DIVISION.
PROGRAM-ID. GestionInventaireLivres.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 IndexLivres  PIC 9(2).

01 Inventaire.
   02 Titre         PIC X(30) OCCURS 50 TIMES.
   02 Auteur        PIC X(20) OCCURS 50 TIMES.
   02 AnneePub      PIC 9(4) OCCURS 50 TIMES.
   02 CopiesDispo   PIC 9(1) OCCURS 50 TIMES.

01 NbLivres PIC 9(2).

PROCEDURE DIVISION.

   DISPLAY "Bienvenue dans le programme de gestion d'inventaire de livres.".
   DISPLAY "Veuillez entrer le nombre de livres que vous souhaitez enregistrer : ".
   ACCEPT NbLivres.

   PERFORM 1000-RECORD-INPUT THRU 1000-EXIT.

   DISPLAY "Inventaire des Livres : ".
   PERFORM VARYING IndexLivres FROM 1 BY 1 UNTIL IndexLivres > NbLivres
      DISPLAY "Livre : " Titre(IndexLivres)
              " | Auteur : " Auteur(IndexLivres)
              " | Année de Publication : " AnneePub(IndexLivres)
              " | Copies Disponibles : " CopiesDispo(IndexLivres)
   END-PERFORM.

   DISPLAY "Merci d'avoir utilisé le programme de gestion d'inventaire de livres.".
   STOP RUN.

   1000-RECORD-INPUT.
      DISPLAY "Veuillez saisir les détails du Livre : ".
      ACCEPT Titre(IndexLivres).
      DISPLAY "Veuillez saisir l'auteur du Livre : ".
      ACCEPT Auteur(IndexLivres).
      DISPLAY "Veuillez saisir l'année de publication du Livre : ".
      ACCEPT AnneePub(IndexLivres).
      DISPLAY "Veuillez saisir le nombre de copies disponibles du Livre : ".
      ACCEPT CopiesDispo(IndexLivres).
      ADD 1 TO IndexLivres.

   1000-EXIT.
      EXIT.
