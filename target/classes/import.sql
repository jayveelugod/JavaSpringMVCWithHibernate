--
-- Dumping data for table `categories`
--
INSERT INTO `categories` (`category_id`, `categoryName`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5');


--
-- Dumping data for table `products`
--
INSERT INTO `products` (`productID`, `available`, `categoryID`, `categoryName`, `categoryPath`, `description`, `name`, `price`) VALUES
(1, 1, 2, 'Category 2', 'path 1', 'dec 1', 'prod 1', 10),
(2, 2, 2, 'Category 2', 'path 2', 'desc 2', 'prod 2', 20),
(3, 3, 4, 'Category 4', 'path 3', 'desc 3', 'prod 3', 30),
(4, 4, 3, 'Category 3', 'path 4', 'desc 4', 'prod 4', 40),
(5, 5, 1, 'Category 1', 'path 5', 'desc 5', 'prod 5', 50);