USE [master]
GO

-- Create the database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FUMiniHotelManagement')
BEGIN
    CREATE DATABASE [FUMiniHotelManagement]
END
GO

USE [FUMiniHotelManagement]
GO

-- Create RoomType table
CREATE TABLE [dbo].[RoomType] (
    [RoomTypeID] INT PRIMARY KEY,
    [RoomTypeName] NVARCHAR(50),
    [TypeDescription] NVARCHAR(MAX),
    [TypeNote] NVARCHAR(MAX)
)
GO

-- Create RoomInformation table
CREATE TABLE [dbo].[RoomInformation] (
    [RoomID] INT PRIMARY KEY,
    [RoomNumber] NVARCHAR(10),
    [RoomDetailDescription] NVARCHAR(MAX),
    [RoomMaxCapacity] INT,
    [RoomTypeID] INT,
    [RoomStatus] NVARCHAR(20),
    [RoomPricePerDay] DECIMAL(10, 2),
    FOREIGN KEY ([RoomTypeID]) REFERENCES [dbo].[RoomType]([RoomTypeID])
)
GO

-- Create Customer table
CREATE TABLE [dbo].[Customer] (
    [CustomerID] INT PRIMARY KEY,
    [CustomerFullName] NVARCHAR(100),
    [Telephone] NVARCHAR(20),
    [EmailAddress] NVARCHAR(100),
    [CustomerBirthday] DATE,
    [CustomerStatus] NVARCHAR(20),
    [Password] NVARCHAR(100)
)
GO

-- Create BookingReservation table
CREATE TABLE [dbo].[BookingReservation] (
    [BookingReservationID] INT PRIMARY KEY,
    [BookingDate] DATE,
    [TotalPrice] DECIMAL(10, 2),
    [CustomerID] INT,
    [BookingStatus] NVARCHAR(20),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer]([CustomerID])
)
GO

-- Create BookingDetail table
CREATE TABLE [dbo].[BookingDetail] (
    [BookingReservationID] INT,
    [RoomID] INT,
    [StartDate] DATE,
    [EndDate] DATE,
    [ActualPrice] DECIMAL(10, 2),
    PRIMARY KEY ([BookingReservationID], [RoomID]),
    FOREIGN KEY ([BookingReservationID]) REFERENCES [dbo].[BookingReservation]([BookingReservationID]),
    FOREIGN KEY ([RoomID]) REFERENCES [dbo].[RoomInformation]([RoomID])
)
GO

-- Insert sample data into RoomType
INSERT INTO [dbo].[RoomType] ([RoomTypeID], [RoomTypeName], [TypeDescription], [TypeNote]) VALUES
(1, 'Standard Room', 'Basic room with essential amenities.', 'No special notes.'),
(2, 'Deluxe Room', 'Luxurious room with additional amenities.', 'Includes a mini-bar and city view.'),
(3, 'Suite', 'Large and luxurious suite.', 'Includes a separate living area and jacuzzi.'),
(4, 'Family Room', 'Spacious room suitable for families.', 'Equipped with bunk beds and children''s play area.'),
(5, 'Ocean View Room', 'Room with a view of the ocean.', 'Perfect for guests looking for a scenic view.');
GO

-- Insert sample data into RoomInformation
INSERT INTO [dbo].[RoomInformation] ([RoomID], [RoomNumber], [RoomDetailDescription], [RoomMaxCapacity], [RoomTypeID], [RoomStatus], [RoomPricePerDay]) VALUES
(1, '101', 'Single room with a beautiful view of the city.', 1, 1, 'Active', 100.00),
(2, '102', 'Double room with garden access.', 2, 2, 'Active', 150.00),
(3, '103', 'Suite with a private balcony.', 4, 3, 'Active', 250.00),
(4, '104', 'Economy single room.', 1, 1, 'Active', 80.00),
(5, '105', 'Luxury double room with ocean view.', 2, 2, 'Active', 300.00),
(6, '106', 'Family room with kitchenette.', 5, 4, 'Active', 200.00),
(7, '107', 'Single room with a queen-sized bed.', 1, 1, 'Active', 120.00),
(8, '108', 'Double room with two single beds.', 2, 2, 'Active', 130.00),
(9, '109', 'Single room with workspace.', 1, 1, 'Active', 110.00),
(10, '110', 'Deluxe suite with two bedrooms.', 6, 3, 'Active', 350.00);
GO

-- Insert sample data into Customer
INSERT INTO [dbo].[Customer] ([CustomerID], [CustomerFullName], [Telephone], [EmailAddress], [CustomerBirthday], [CustomerStatus], [Password]) VALUES
(1, 'John Doe', '1234567890', 'john.doe@example.com', '1990-01-01', 'Active', 'password123'),
(2, 'Jane Smith', '0987654321', 'jane.smith@example.com', '1985-05-15', 'Active', 'password456'),
(3, 'Michael Johnson', '1231231234', 'michael.johnson@example.com', '1978-08-20', 'Active', 'password789'),
(4, 'Emily Davis', '4564564567', 'emily.davis@example.com', '1995-03-10', 'Active', 'password101'),
(5, 'William Brown', '7897897890', 'william.brown@example.com', '1982-12-25', 'Active', 'password102'),
(6, 'Olivia Wilson', '1472583690', 'olivia.wilson@example.com', '1991-06-30', 'Active', 'password103'),
(7, 'James Taylor', '3216549870', 'james.taylor@example.com', '1988-11-11', 'Active', 'password104'),
(8, 'Isabella Anderson', '3692581470', 'isabella.anderson@example.com', '1993-02-20', 'Active', 'password105'),
(9, 'Liam Thomas', '8529637410', 'liam.thomas@example.com', '1987-04-14', 'Active', 'password106'),
(10, 'Sophia Martinez', '9637412580', 'sophia.martinez@example.com', '1992-09-19', 'Active', 'password107');
GO

-- Insert sample data into BookingReservation
INSERT INTO [dbo].[BookingReservation] ([BookingReservationID], [BookingDate], [TotalPrice], [CustomerID], [BookingStatus]) VALUES
(1, '2024-03-30', 300.00, 1, 'Confirmed'),
(2, '2024-04-01', 450.00, 2, 'Pending')
GO

-- Insert sample data into BookingDetail
INSERT INTO [dbo].[BookingDetail] ([BookingReservationID], [RoomID], [StartDate], [EndDate], [ActualPrice]) VALUES
(1, 1, '2024-04-05', '2024-04-08', 300.00),
(2, 2, '2024-04-10', '2024-04-13', 450.00)
GO