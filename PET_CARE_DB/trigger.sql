-- (8) Proje ile ilgili TRIGGER (tetikleyici) oluşturulması.

-- Tabloya yeni bir randevu eklenirken, randevu tarihini kontrol etmek için bir trigger yazalım.
CREATE TRIGGER CheckAppointmentDate
ON Appointment
AFTER INSERT
AS
BEGIN
    DECLARE @AppointmentDate DATE;
    DECLARE @CurrentDate DATE;

    SELECT @AppointmentDate = AppointmentDate
    FROM inserted;

    SET @CurrentDate = GETDATE();

    IF @AppointmentDate < @CurrentDate
    BEGIN
        RAISERROR ('Invalid appointment date. Appointment cannot be scheduled in the past.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END

-- Tabloya yeni bir hayvan eklenirken, hayvanın yaşını kontrol etmek için bir trigger yazalım.
CREATE TRIGGER CheckPetAge
ON Pet
AFTER INSERT
AS
BEGIN
    DECLARE @PetAge INT;

    SELECT @PetAge = Age
    FROM inserted;

    IF @PetAge <= 0
    BEGIN
        RAISERROR ('Invalid pet age. Age must be greater than zero.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
