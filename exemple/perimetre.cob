IDENTIFICATION DIVISION.
PROGRAM-ID. CalculPerimetre.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Longueur       PIC 9(4).
01 Largeur        PIC 9(4).
01 Perimetre      PIC 9(4).

PROCEDURE DIVISION.
    DISPLAY "Entrez la longueur  du jardin: ".
    ACCEPT Longueur.

    DISPLAY "Entrez la largeur du jardin : ".
    ACCEPT Largeur.
    DISPLAY "longeur".Longueur ;
    ADD  Largeur TO Longueur .
    

    COMPUTE Perimetre = 2 * (Longueur + Largeur).

    DISPLAY "Le périmètre du jardin est de " Perimetre " mètres.".

    STOP RUN.
