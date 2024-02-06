Tables du MLD :
Table "Utilisateur" (User)

IDUtilisateur (PK)
Email
MotDePasse
Type
Table "Élève"

IDElève (PK, FK vers Utilisateur)
Photo
Table "Formateur"

IDFormateur (PK, FK vers Utilisateur)
Table "Session"

IDSession (PK)
Nom
DateDeDébut
DateDeFin
Table "Cours"

IDCours (PK)
Nom
IDSession (FK vers Session)
Table "Évaluation"

IDEvaluation (PK)
IDCours (FK vers Cours)
IDFormateur (FK vers Formateur)
Type
Description
Table "Évaluation_Etudiant" 
IDEvaluation_Etudiant (PK)
IDEvaluation (FK vers Évaluation)
Note 
ID_Etudiant (FK vers Élève)