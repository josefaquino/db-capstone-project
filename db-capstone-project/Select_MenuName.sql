SELECT Menus.MenuName
FROM Menus
WHERE Menus.MenuID = ANY (
    SELECT Orders.MenuID
    FROM Orders
    GROUP BY Orders.MenuID
    HAVING COUNT(*) > 2
);
