-- Création de la table des utilisateurs
CREATE TABLE Utilisateurs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    MotDePasse VARCHAR(255) NOT NULL,
    Role ENUM('Étudiant', 'Formateur') NOT NULL
);

-- Création de la table des étudiants
CREATE TABLE Étudiants (
    ID INT,
    Photo VARCHAR(255),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Utilisateurs(ID)
);

-- Création de la table des formateurs
CREATE TABLE Formateurs (
    ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Utilisateurs(ID)
);

-- Création de la table des sessions
CREATE TABLE Sessions (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) UNIQUE NOT NULL,
    DateDébut DATE NOT NULL,
    DateFin DATE NOT NULL
);

-- Création de la table des cours
CREATE TABLE Cours (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    SessionID INT,
    FOREIGN KEY (SessionID) REFERENCES Sessions(ID)
);

-- Création de la table des évaluations
CREATE TABLE Évaluations (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Type ENUM('QCM', 'TP', 'Projet', 'Examen') NOT NULL,
    Description TEXT,
    CoursID INT,
    FormateurID INT,
    FOREIGN KEY (CoursID) REFERENCES Cours(ID),
    FOREIGN KEY (FormateurID) REFERENCES Formateurs(ID)
);

-- Création de la table des évaluations des étudiants
CREATE TABLE Évaluations_Étudiants (
    ÉvaluationID INT,
    ÉtudiantID INT,
    Note DECIMAL(5,2),
    PRIMARY KEY (ÉvaluationID, ÉtudiantID),
    FOREIGN KEY (ÉvaluationID) REFERENCES Évaluations(ID),
    FOREIGN KEY (ÉtudiantID) REFERENCES Étudiants(ID)
);