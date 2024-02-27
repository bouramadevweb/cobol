IDENTIFICATION DIVISION.
PROGRAM-ID. JoursSemaine.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 IndexJour      PIC 9(2).
01 Jours          OCCURS 7 TIMES.
   02 Jour         PIC X(10) VALUE SPACE.

01 ChoixUtilisateur PIC X.

PROCEDURE DIVISION.

    MOVE "Lundi" TO Jours(1).
    MOVE "Mardi" TO Jours(2).
    MOVE "Mercredi" TO Jours(3).
    MOVE "Jeudi" TO Jours(4).
    MOVE "Vendredi" TO Jours(5).
    MOVE "Samedi" TO Jours(6).
    MOVE "Dimanche" TO Jours(7).

    PERFORM AFFICHER-MENU.

    PERFORM UNTIL ChoixUtilisateur = "Q"
        DISPLAY "Choisissez un numéro de jour  ou Q pour quitter : "
        ACCEPT ChoixUtilisateur

        EVALUATE ChoixUtilisateur
            WHEN "1"
                DISPLAY "Le jour correspondant est : " Jours(1)
            WHEN "2"
                DISPLAY "Le jour correspondant est : " Jours(2)
            WHEN "3"
                DISPLAY "Le jour correspondant est : " Jours(3)
            WHEN "4"
                DISPLAY "Le jour correspondant est : " Jours(4)
            WHEN "5"
                DISPLAY "Le jour correspondant est : " Jours(5)
            WHEN "6"
                DISPLAY "Le jour correspondant est : " Jours(6)
            WHEN "7"
                DISPLAY "Le jour correspondant est : " Jours(7)
            WHEN "Q"
                DISPLAY "Programme terminé. Au revoir!"
            WHEN OTHER
                DISPLAY "Option invalide. Veuillez choisir un numéro de jour (1-7) ou Q."
        END-EVALUATE
    END-PERFORM.

    STOP RUN.

AFFICHER-MENU.
    DISPLAY "Les jours de la semaine : ".
    PERFORM VARYING IndexJour FROM 1 BY 1 UNTIL IndexJour > 7
        DISPLAY IndexJour " - " Jours(IndexJour)
    END-PERFORM.
