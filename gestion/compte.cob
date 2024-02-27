IDENTIFICATION DIVISION.
PROGRAM-ID. GestionCompteBancaire.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 SoldeCompte        PIC 9(5)V99 VALUE 1000.00.
01 MontantDepot       PIC 9(5)V99.
01 MontantRetrait     PIC 9(5)V99.
01 MontantVirement    PIC 9(5)V99.
01 SoldeSecondCompte  PIC 9(5)V99 VALUE 500.00.
01 ChoixUtilisateur   PIC X.

PROCEDURE DIVISION.

    DISPLAY "Bienvenue dans le programme de gestion de compte bancaire.".

    PERFORM UNE-FOIS UNTIL ChoixUtilisateur = "0".

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
            DISPLAY "Programme terminé. Au revoir!"
        WHEN OTHER
            DISPLAY "Option invalide. Veuillez choisir une option valide."
    END-EVALUATE.

    DISPLAY "Appuyez sur ENTER pour continuer...".
    ACCEPT MontantDepot.

DEPOT.
    DISPLAY "Montant à déposer : ".
    ACCEPT MontantDepot.
    COMPUTE SoldeCompte = SoldeCompte + MontantDepot.
    DISPLAY "Dépôt effectué avec succès. Nouveau solde : " SoldeCompte.
    EXIT.

RETRAIT.
    DISPLAY "Montant à retirer : ".
    ACCEPT MontantRetrait.
    IF SoldeCompte >= MontantRetrait
        COMPUTE SoldeCompte = SoldeCompte - MontantRetrait
        DISPLAY "Retrait effectué avec succès. Nouveau solde : " SoldeCompte
    ELSE
        DISPLAY "Solde insuffisant pour le retrait. Opération annulée."
    END-IF.
    EXIT.

VIREMENT.
    DISPLAY "Montant à transférer : ".
    ACCEPT MontantVirement.
    IF SoldeCompte >= MontantVirement
        COMPUTE SoldeCompte = SoldeCompte - MontantVirement
        COMPUTE SoldeSecondCompte = SoldeSecondCompte + MontantVirement
        DISPLAY "Virement effectué avec succès. Nouveau solde du premier compte : " SoldeCompte
                " | Nouveau solde du deuxième compte : " SoldeSecondCompte
    ELSE
        DISPLAY "Solde insuffisant pour le virement. Opération annulée."
    END-IF.
    EXIT.

AFFICHER_SOLDE.
    DISPLAY "Solde actuel du compte : " SoldeCompte.
    EXIT.
