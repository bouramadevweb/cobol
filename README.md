IDENTIFICATION DIVISION.
PROGRAM-ID. InitiationCOBOL.

* Ce programme COBOL est conçu pour l'initiation en COBOL chez Walden Digital IT Solutions.
* Il présente des concepts de base tels que les variables, les procédures et l'entrée/sortie.

DATA DIVISION.
WORKING-STORAGE SECTION.

* Déclaration de variables
01 NomUtilisateur PIC X(30).
01 AgeUtilisateur PIC 9(3).

PROCEDURE DIVISION.

* Section de démarrage
   DISPLAY 'Bienvenue à l''initiation en COBOL chez Walden Digital IT Solutions!'.
   DISPLAY 'Veuillez saisir votre nom : '.
   ACCEPT NomUtilisateur.
   DISPLAY 'Bonjour, ', NomUtilisateur, '!'.

* Saisie de l'âge et affichage avec commentaire
   DISPLAY 'Veuillez saisir votre âge : '.
   ACCEPT AgeUtilisateur.
   DISPLAY 'Vous avez ', AgeUtilisateur, ' ans.'.

* Appel de la procédure d'affichage
   PERFORM AFFICHER-MESSAGE.

* Fin du programme
   DISPLAY 'Merci d''avoir participé à l''initiation en COBOL!'.
   STOP RUN.

AFFICHER-MESSAGE.

* Procédure pour afficher un message supplémentaire
   DISPLAY 'Ceci est un message provenant de la procédure AFFICHER-MESSAGE.'.

* Fin de la procédure
   EXIT.

