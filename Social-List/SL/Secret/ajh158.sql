USE WP_ajh158;
CREATE TABLE ajh158
(
    Name NVARCHAR(50) NOT NULL,
    Phone_Number NCHAR(24) NULL,
    Address NCHAR(60) NULL,
    City NCHAR(24) NULL,
    State NCHAR(2) NULL,
    Postal_Code NCHAR(5) NULL,
    DOB NCHAR(10) NULL,
    PA3_Link NVARCHAR(50) NULL,
    Facebook_Link NVARCHAR(50) NULL,
    Twitter_Link NVARCHAR(50) NULL,
    PRIMARY KEY (Name)
);

INSERT INTO ajh158 VALUES ('Alec Horne', '330-555-5555', '1234 Rocky Road', 'Streetsboro', 'OH', '44241', 
'03/30/1990', 'winserv1.cs.uakron.edu/ajh158/CalcStudio/calc.aspx', 'www.facebook.com/alec.horne.56', 'www.twitter.com');
INSERT INTO ajh158 VALUES ('Bernie Sanders', '123-456-7890', '552 Blah Lane', 'Buffalo', 'NY', '45623', 
'01/09/1950', 'winserv1.cs.uakron.edu', 'www.facebook.com/senatorsanders/?fref=nf', 'www.twitter.com/berniesanders?lang=en');
INSERT INTO ajh158 VALUES ('Scooby Doo', '555-555-5555', '1234 Mystery Van Rd', 'Akron', 'OH', '44313', 
'05/10/1987', 'winserv1.cs.uakron.edu', 'www.facebook.com/scoobydoo', 'www.twitter.com/hashtag/scoobydoo?lang=en');