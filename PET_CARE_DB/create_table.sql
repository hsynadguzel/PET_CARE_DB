CREATE TABLE Pet (
    ID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    OwnerID INT,
    CONSTRAINT FK_Pet_Owner FOREIGN KEY (OwnerID) REFERENCES Owner(ID)
);

CREATE TABLE Owner (
    ID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100)
);

CREATE TABLE Appointment (
    ID INT PRIMARY KEY IDENTITY,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    PetID INT NOT NULL,
    OwnerID INT NOT NULL,
    CONSTRAINT FK_Appointment_Pet FOREIGN KEY (PetID) REFERENCES Pet (ID),
    CONSTRAINT FK_Appointment_Owner FOREIGN KEY (OwnerID) REFERENCES Owner (ID)
);

CREATE TABLE Service (
    ID INT PRIMARY KEY IDENTITY,
    Type VARCHAR(50) NOT NULL,
    Description VARCHAR(MAX) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);