IDENTIFICATION DIVISION.
PROGRAM-ID. TestCreationFichier.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT HistoriqueFile 
           ASSIGN TO 'test.cob'
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS STATUS-HISTORIQUE.

DATA DIVISION.
FILE SECTION.
FD HistoriqueFile.
01 HistoriqueRecord.
   05 Montant            PIC 9(5)V99.
   05 Action             PIC X(20).

WORKING-STORAGE SECTION.
77 STATUS-HISTORIQUE   PIC XX.

PROCEDURE DIVISION.

    OPEN OUTPUT HistoriqueFile
    IF STATUS-HISTORIQUE NOT = "00"
        DISPLAY "Erreur lors de la création du fichier HistoriqueFile. Code de statut : " STATUS-HISTORIQUE
        STOP RUN
    END-IF.

    MOVE 100.00 TO Montant
    MOVE "Test" TO Action
    WRITE HistoriqueRecord.

    CLOSE HistoriqueFile.

    DISPLAY "Fichier HistoriqueFile créé avec succès."

    STOP RUN.
