-- "Pet" tablosu ile "Owner" tablosunu "OwnerID" alanı üzerinden birleştirir ve her evcil hayvanın sahibinin bilgileriyle birlikte sonuçları listeler.
SELECT Pet.*, Owner.*
FROM Pet
JOIN Owner ON Pet.OwnerID = Owner.ID;

-- Belirli bir sahibin (OwnerID ile belirtilir) tüm evcil hayvanlarını listeler.
SELECT Pet.*
FROM Pet
JOIN Owner ON Pet.OwnerID = Owner.ID
WHERE Owner.ID = <OwnerID>;

-- Belirli bir randevunun (AppointmentID ile belirtilir) hizmetin detaylarını listeler.
SELECT Appointment.*, Service.*
FROM Appointment
JOIN Service ON Appointment.ServiceID = Service.ID
WHERE Appointment.ID = <AppointmentID>;
