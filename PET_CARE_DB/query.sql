-- En pahalı hizmeti satın alan sahibin adı ve soyadı
SELECT FirstName, LastName
FROM Owner
WHERE ID = (
    SELECT OwnerID
    FROM Appointment
    WHERE ServiceID = (
        SELECT MAX(ID)
        FROM Service
    )
);

-- Sahibi "John Doe" olan evcil hayvanların randevu bilgilerini getirme
SELECT *
FROM Appointment
WHERE PetID IN (
    SELECT Pet.ID
    FROM Pet
    INNER JOIN Owner ON Pet.OwnerID = Owner.ID
    WHERE Owner.FirstName = 'John' AND Owner.LastName = 'Doe'
);

-- Evcil hayvanın sahibi ile birlikte randevu bilgilerini getirme
SELECT Appointment.*, Pet.Name AS PetName, Owner.FirstName AS OwnerFirstName, Owner.LastName AS OwnerLastName
FROM Appointment
INNER JOIN Pet ON Appointment.PetID = Pet.ID
INNER JOIN Owner ON Pet.OwnerID = Owner.ID;

-- Belirli bir tarihte gerçekleşen randevuları getirme
SELECT *
FROM Appointment
WHERE Date = '2023-05-17';

-- Her evcil hayvanın kaç randevusu olduğunu getirme
SELECT Pet.Name AS PetName, COUNT(Appointment.ID) AS AppointmentCount
FROM Appointment
INNER JOIN Pet ON Appointment.PetID = Pet.ID
GROUP BY Pet.ID, Pet.Name;
