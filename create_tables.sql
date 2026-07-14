CREATE TABLE Members (
    MemberID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Gender VARCHAR2(10) CHECK (Gender IN ('Male','Female')),
    DateOfBirth DATE,
    Phone VARCHAR2(15) UNIQUE,
    Email VARCHAR2(100) UNIQUE,
    Address VARCHAR2(100),
    JoinDate DATE NOT NULL
);


CREATE TABLE Membership (
    MembershipID NUMBER PRIMARY KEY,
    MemberID NUMBER NOT NULL,
    MinistryID NUMBER NOT NULL,
    JoinDate DATE NOT NULL,

    CONSTRAINT fk_membership_member
        FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID),

    CONSTRAINT fk_membership_ministry
        FOREIGN KEY (MinistryID)
        REFERENCES Ministries(MinistryID)
);

CREATE TABLE Events (
    EventID NUMBER PRIMARY KEY,
    EventName VARCHAR2(100) NOT NULL,
    EventDate DATE NOT NULL,
    Venue VARCHAR2(100) NOT NULL,
    Description VARCHAR2(200)
);

CREATE TABLE Attendance (
    AttendanceID NUMBER PRIMARY KEY,
    MemberID NUMBER NOT NULL,
    EventID NUMBER NOT NULL,
    AttendanceStatus VARCHAR2(20) CHECK (AttendanceStatus IN ('Present', 'Absent')),

    CONSTRAINT fk_attendance_member
        FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID),

    CONSTRAINT fk_attendance_event
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);

CREATE TABLE Donations (
    DonationID NUMBER PRIMARY KEY,
    MemberID NUMBER NOT NULL,
    DonationType VARCHAR2(30) NOT NULL,
    Amount NUMBER(10,2) NOT NULL CHECK (Amount > 0),
    DonationDate DATE NOT NULL,

    CONSTRAINT fk_donation_member
        FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID)
);

























