IDENTIFICATION DIVISION.
PROGRAM-ID. CalculReductions.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 MontantAchat    PIC 9(6)V99 COMP.
01 Reduction       PIC 9(2)V99 COMP.
01 MontantFinal    PIC 9(3)V99.

PROCEDURE DIVISION.
TRAITTEMENT.

    DISPLAY "Bienvenue dans le Calculateur de Réductions."
    DISPLAY "Veuillez entrer le montant total de votre achat : ".
    ACCEPT MontantAchat.

    IF MontantAchat < 100
        MOVE 0 TO Reduction
    ELSE
        IF MontantAchat <= 500
            MOVE 5 TO Reduction
        ELSE
            MOVE 10 TO Reduction
        END-IF
    END-IF.

    COMPUTE MontantFinal = MontantAchat - (MontantAchat * Reduction / 100).

    DISPLAY "Réduction applicable : " Reduction "%".
    DISPLAY "Montant final à payer : " MontantFinal.

    STOP RUN.
