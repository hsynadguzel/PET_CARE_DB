-- Evcil hayvanların bilgilerini listeleyen bir sorgu yapar.
CREATE PROCEDURE ListPets
AS
BEGIN
    SELECT *
    FROM Pet;
END

-- Yeni bir randevu eklemek için gerekli bilgileri alır ve Appointment tablosuna yeni bir kayıt ekler.
CREATE PROCEDURE AddAppointment
    @Date DATE,
    @Time TIME,
    @PetID INT,
    @OwnerID INT,
    @ServiceID INT
AS
BEGIN
    INSERT INTO Appointment (Date, Time, PetID, OwnerID, ServiceID)
    VALUES (@Date, @Time, @PetID, @OwnerID, @ServiceID);
END

-- Tabloya yeni bir evcil hayvan eklemek için.
CREATE PROCEDURE AddPet
    @Name NVARCHAR(50),
    @Type NVARCHAR(50),
    @Age INT,
    @Gender NVARCHAR(10),
    @OwnerID INT
AS
BEGIN
    INSERT INTO Pet (Name, Type, Age, Gender, OwnerID)
    VALUES (@Name, @Type, @Age, @Gender, @OwnerID);
END
