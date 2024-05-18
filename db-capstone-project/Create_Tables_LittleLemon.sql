-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

-- Create Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2)
);

-- Create Menu table
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100) UNIQUE NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create Booking table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StaffID INT,
    BookingDate DATE NOT NULL,
    BookingTime TIME NOT NULL,
    TableNumber INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    OrderDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Create Order_Item table
CREATE TABLE Order_Item (
    OrderID INT,
    MenuID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- Create Order_Delivery_Status table
CREATE TABLE Order_Delivery_Status (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(50) NOT NULL,
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

