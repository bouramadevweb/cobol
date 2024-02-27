IDENTIFICATION DIVISION.
PROGRAM-ID. GestionCompteBancaire.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT CompteFile 
           ASSIGN TO 'CompteFile'
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS STATUS-COMPTES.

    SELECT HistoriqueFile 
           ASSIGN TO 'historiquebanque'
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS STATUS-HISTORIQUE.

DATA DIVISION.
FILE SECTION.
FD CompteFile.
01 CompteRecord.
   05 SoldeCompte        PIC 9(5)V99.

FD HistoriqueFile.
01 HistoriqueRecord.
   05 Montant            PIC 9(5)V99.
   05 Action             PIC X(20).

WORKING-STORAGE SECTION.
77 STATUS-COMPTES      PIC XX.
77 STATUS-HISTORIQUE   PIC XX.
01 MontantDepot       PIC 9(5)V99.
01 MontantRetrait     PIC 9(5)V99.
01 MontantVirement    PIC 9(5)V99.
01 SoldeSecondCompte  PIC 9(5)V99 VALUE 500.00.
01 ChoixUtilisateur   PIC X.

PROCEDURE DIVISION.

    OPEN OUTPUT HistoriqueFile.
    OPEN OUTPUT CompteFile.

    PERFORM UNE-FOIS UNTIL ChoixUtilisateur EQUAL "0".

    CLOSE CompteFile. 
    CLOSE HistoriqueFile. 

    STOP RUN.

UNE-FOIS.
    DISPLAY "*******MENU**********"
    DISPLAY "1. Déposer de l'argent"
    DISPLAY "2. Retirer de l'argent"
    DISPLAY "3. Faire un virement"
    DISPLAY "4. Afficher le solde"
    DISPLAY "0. Quitter"

    ACCEPT ChoixUtilisateur.

    EVALUATE ChoixUtilisateur
        WHEN "1"
            PERFORM DEPOT
        WHEN "2"
            PERFORM RETRAIT
        WHEN "3"
            PERFORM VIREMENT
        WHEN "4"
            PERFORM AFFICHER_SOLDE
        WHEN "0"
            PERFORM TERMINER-PROGRAMME
        WHEN OTHER
            DISPLAY "Option invalide. Veuillez choisir une option valide."
    END-EVALUATE.

    DISPLAY "Appuyez sur ENTER pour continuer...".
    ACCEPT MontantDepot.

    PERFORM UNE-FOIS.  *> Permet à l'utilisateur de revenir au menu

DEPOT.
    DISPLAY "Montant à déposer : ".
    ACCEPT MontantDepot.
    ADD MontantDepot TO SoldeCompte.
    MOVE MontantDepot TO Montant.
    MOVE "Dépôt" TO Action.
    WRITE HistoriqueRecord.
    EXIT.

RETRAIT.
    DISPLAY "Montant à retirer : ".
    ACCEPT MontantRetrait.
    IF SoldeCompte >= MontantRetrait
        SUBTRACT MontantRetrait FROM SoldeCompte
        MOVE MontantRetrait TO Montant
        MOVE "Retrait" TO Action
        WRITE HistoriqueRecord
        DISPLAY "Retrait effectué avec succès. Nouveau solde : " SoldeCompte
    ELSE
        DISPLAY "Solde insuffisant pour le retrait. Opération annulée."
    END-IF.
    EXIT.

VIREMENT.
    DISPLAY "Montant à transférer : ".
    ACCEPT MontantVirement.
    IF SoldeCompte >= MontantVirement
        SUBTRACT MontantVirement FROM SoldeCompte
        ADD MontantVirement TO SoldeSecondCompte
        MOVE MontantVirement TO Montant
        MOVE "Virement" TO Action
        WRITE HistoriqueRecord
        DISPLAY "Virement effectué avec succès. Nouveau solde du premier compte : " SoldeCompte
        DISPLAY "Nouveau solde du deuxième compte : " SoldeSecondCompte
    ELSE
        DISPLAY "Solde insuffisant pour le virement. Opération annulée."
    END-IF.
    EXIT.

AFFICHER_SOLDE.
    DISPLAY "Solde actuel du compte : " SoldeCompte
    WRITE CompteRecord
    EXIT.

TERMINER-PROGRAMME.
   CLOSE CompteFile
   CLOSE HistoriqueFile
   STOP RUN.
