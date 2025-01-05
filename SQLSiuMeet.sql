CREATE DATABASE SIUMeeting;
Use SIUMeeting
CREATE TABLE Users (
    userID INT PRIMARY KEY,
    account VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Create the Room table
CREATE TABLE Rooms (
    roomID INT PRIMARY KEY,
    joinCode VARCHAR(255) NOT NULL UNIQUE
);

-- Create the Participants table
CREATE TABLE Participants (
    caseID INT PRIMARY KEY,
    roomID INT NOT NULL,
    userID INT NOT NULL,
    hostPermit bit NOT NULL,
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Device (
    deviceID INT PRIMARY KEY,
    deviceType VARCHAR(255)
);

-- Create the LoginLog table
CREATE TABLE LoginLog (
    logID INT PRIMARY KEY,
    deviceID INT NOT NULL,
    userID INT NOT NULL,
    timeStart DATETIME NOT NULL,
    timeStop DATETIME,
    FOREIGN KEY (deviceID) REFERENCES Device(deviceID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);