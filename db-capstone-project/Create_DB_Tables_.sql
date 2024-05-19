CREATE DATABASE LittleLemonDB;


-- ... (schema creation)

-- Customer Table (unchanged)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
    `CustomerID` INT PRIMARY KEY AUTO_INCREMENT, 
    `FirstName` VARCHAR(45) NULL,
    `LastName` VARCHAR(45) NULL,
    `Email` VARCHAR(45) NULL,
    `Phone` VARCHAR(45) NULL
) ENGINE = InnoDB;

-- Booking Table (corrected)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Booking` (
    `BookingID` INT PRIMARY KEY AUTO_INCREMENT,
    `CustomerID` INT,
    `BookingDate` DATE NULL,
    `TableNumber` INT NULL,
    FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE = InnoDB;

-- Menu Table (unchanged)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
    `MenuID` INT PRIMARY KEY AUTO_INCREMENT, 
    `Category` VARCHAR(45) NULL,
    `ItemName` VARCHAR(45) NULL,
    `Description` VARCHAR(45) NULL,
    `Price` DECIMAL(10,2) NULL
) ENGINE = InnoDB;

-- Orders Table (corrected)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
    `OrderID` INT PRIMARY KEY AUTO_INCREMENT,
    `BookingID` INT NULL,
    `OrderDate` DATE NULL,
    `TotalCost` DECIMAL(10,2) NULL,
    FOREIGN KEY (`BookingID`) REFERENCES `Booking` (`BookingID`) ON DELETE SET NULL ON UPDATE CASCADE 
) ENGINE = InnoDB;

-- Order_Item Table (corrected)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order_Item` (
    `OrderID` INT NOT NULL,
    `MenuID` INT NOT NULL,
    `Quantity` INT NULL,
    PRIMARY KEY (`OrderID`, `MenuID`), 
    FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Delivery_Status Table (unchanged)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery_Status` (
    `StatusID` INT PRIMARY KEY AUTO_INCREMENT, 
    `StatusDescription` VARCHAR(45) NULL
) ENGINE = InnoDB;

-- Order_Delivery Table (corrected)
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order_Delivery` (
    `OrderID` INT NOT NULL,
    `StatusID` INT NOT NULL,
    `DeliveryDate` DATE NULL,
    PRIMARY KEY (`OrderID`, `StatusID`),
    FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (`StatusID`) REFERENCES `Delivery_Status` (`StatusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ... (reset SQL mode)
