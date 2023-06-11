-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2023 at 02:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yara`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'VEG PIZZA', 'A delight for veggie lovers! Choose from our wide range of delicious vegetarian pizzas, it\'s softer and tastier', '2021-03-17 18:16:28'),
(2, 'PIZZA MANIA', 'Indulge into mouth-watering taste of Pizza mania range, perfect answer to all your food cravings', '2021-03-17 18:17:43'),
(3, 'SIDES ORDERS', 'Complement your pizza with wide range of sides available at Domino\'s Pizza India', '2021-03-17 18:19:10'),
(4, 'BEVERAGES', 'Complement your pizza with wide range of beverages available at Domino\'s Pizza India', '2021-03-17 21:58:58'),
(5, 'CHOICE OF CRUSTS', 'Fresh Pan Pizza Tastiest Pan Pizza. ... Domino\'s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.', '2021-03-18 07:55:28'),
(6, 'BURGER PIZZA', 'Domino’s Pizza Introducing all new Burger Pizza with the tag line looks like a burger, tastes like a pizza. Burger Pizza is burger sized but comes in a small pizza box. It is come with pizza toppings such as herbs, vegetables, tomato sauce and mozzarella,', '2021-03-18 08:06:30'),
(7, 'Gujarati', 'A Gujarati thali typically comprises of  one or two steamed or fried snacks called farsans, a green vegetable, a tuber or a gourd shaak (shaaks are main courses with vegetables and spices mixed together into a curry or a spicy dry dish)', '2023-04-02 23:31:42'),
(8, 'Rajasthani', 'dal,bati...', '2023-04-02 23:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(1, 1, 'rajubhai', 7990535333, 30, '2023-03-26 00:00:37'),
(2, 2, 'rajunhai', 7990535333, 30, '2023-04-11 13:29:33'),
(3, 3, 'rajubhai', 7990535333, 20, '2023-04-11 13:37:56'),
(4, 4, 'rajunhai', 7990535333, 30, '2023-04-17 13:19:57'),
(5, 5, 'rajubhai', 7990535333, 20, '2023-04-18 23:29:51'),
(6, 6, 'rajunhai', 7990535333, 20, '2023-04-25 21:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 1, 1),
(2, 2, 69, 1),
(3, 3, 3, 1),
(4, 3, 35, 1),
(5, 4, 69, 1),
(6, 5, 1, 1),
(7, 6, 70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `pincode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, '167,umiyanagar,kansa, gujart', 384315, 7990535333, 99, '0', '4', '2023-03-25 23:44:22'),
(2, 2, 'Sankalchand Patel University (SPU) University in Visnagar, Gujarat, ', 384315, 7990535333, 120, '0', '4', '2023-04-11 13:24:57'),
(3, 4, 'kansa na, nr pramukh villa', 384315, 6354405603, 248, '0', '4', '2023-04-11 13:35:59'),
(4, 2, 'umiyanagar,kansa, ', 384315, 7990535333, 120, '0', '6', '2023-04-17 13:16:39'),
(5, 5, 'umiyanagar,kansa, ', 384315, 7600927030, 99, '0', '1', '2023-04-18 23:28:47'),
(6, 2, 'Umiyanagar,Kansa, Visnagar', 384315, 7990535333, 70, '0', '2', '2023-04-25 20:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(1, 'Margherita ', 99, 'A hugely popular margherita, with a deliciously tangy single cheese topping\r\n\r\n', 1, '2023-04-17 21:03:26'),
(2, 'Double Cheese Margherita', 199, 'The ever-popular Margherita - loaded with extra cheese... oodies of it', 1, '2023-04-17 21:03:26'),
(3, 'Farm House\r\n', 149, 'A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes\r\n\r\n', 1, '2023-04-17 21:03:26'),
(4, 'Peppy Paneer', 249, 'Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!\r\n\r\n', 1, '2023-04-17 21:03:26'),
(5, 'Mexican Green Wave\r\n', 149, 'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.\r\n\r\n', 1, '2023-04-17 21:03:26'),
(6, 'Deluxe Veggie\r\n', 319, 'For a vegetarian looking for a BIG treat that goes easy on the spices, this one\'s got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.\r\n\r\n', 1, '2023-04-17 21:03:26'),
(7, 'Veg Extravaganza\r\n', 299, 'A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, juicyfresh tomatoes and jalapeno - with extra cheese to go all around.\r\n\r\n', 1, '2021-03-17 21:25:42'),
(8, 'Cheese N Corn\r\n', 199, 'Cheese I Golden Corn', 1, '2021-03-17 21:26:31'),
(9, 'PANEER MAKHANI\r\n', 219, 'Paneer and Capsicum on Makhani Sauce', 1, '2021-03-17 21:27:21'),
(10, 'VEGGIE PARADISE\r\n', 299, 'Goldern Corn, Black Olives, Capsicum & Red Paprika\r\n\r\n', 1, '2021-03-17 21:28:06'),
(11, 'FRESH VEGGIE', 149, 'Onion I Capsicum', 1, '2021-03-17 21:28:49'),
(12, 'Indi Tandoori Paneer\r\n', 349, 'It is hot. It is spicy. It is oh-so-Indian. Tandoori paneer with capsicum I red paprika I mint mayo\r\n\r\n', 1, '2021-03-17 21:29:41'),
(21, 'TOMATO', 99, 'Juicy tomato in a flavourful combination with cheese I tangy sauce', 2, '2021-03-17 21:44:44'),
(22, 'VEG LOADED', 149, 'Tomato | Grilled Mushroom |Jalapeno |Golden Corn | Beans in a fresh pan crust', 2, '2021-03-17 21:45:34'),
(23, 'CHEESY', 99, 'Orange Cheddar Cheese I Mozzarella', 2, '2021-03-17 21:46:21'),
(24, 'CAPSICUM', 99, 'Capsicum', 2, '2023-04-17 21:03:26'),
(25, 'ONION', 99, 'onion', 2, '2023-04-17 21:03:26'),
(26, 'GOLDEN CORN', 139, 'Golden Corn', 2, '2023-04-17 21:03:26'),
(27, 'PANEER & ONION', 149, 'Creamy Paneer | Onion', 2, '2023-04-17 21:03:26'),
(28, 'CHEESE N TOMATO', 149, 'A delectable combination of cheese and juicy tomato', 2, '2023-04-17 21:03:26'),
(29, 'Garlic Breadsticks', 99, 'The endearing tang of garlic in breadstics baked to perfection.', 3, '2023-04-17 21:03:26'),
(30, 'Stuffed Garlic Bread', 99, 'Freshly Baked Garlic Bread stuffed with mozzarella cheese, sweet corns & tangy and spicy jalapeños', 3, '2023-04-17 21:03:26'),
(33, 'Cheese Jalapeno Dip', 35, 'A soft creamy cheese dip spiced with jalapeno.', 3, '2023-04-17 21:03:26'),
(34, 'Cheese Dip', 35, 'A dreamy creamy cheese dip to add that extra tang to your snack.', 3, '2023-04-17 21:03:26'),
(35, 'Lava Cake', 99, 'Filled with delecious molten chocolate inside.', 3, '2023-04-17 21:03:26'),
(36, 'Butterscotch Mousse Cake', 149, 'A Creamy & Chocolaty indulgence with layers of rich, fluffy Butterscotch Cream and delicious Dark Chocolate Cake, topped with crunchy Dark Chocolate morsels - for a perfect dessert treat!', 3, '2023-04-17 21:03:26'),
(37, 'Lipton Ice Tea', 25, ' 250ml', 4, '2023-04-17 21:03:26'),
(38, 'Mirinda', 35, '500ml', 4, '2023-04-17 21:03:26'),
(39, 'PEPSI BLACK CAN', 45, 'PEPSI BLACK CAN', 4, '2023-04-17 21:03:26'),
(40, 'Pepsi\r\n', 52, '500ml', 4, '2023-04-17 21:03:26'),
(41, '7Up', 52, '500ml', 4, '2023-04-17 21:03:26'),
(42, 'Cheese Burst', 249, 'Crust with oodles of yummy liquid cheese filled inside.', 5, '2023-04-17 21:03:26'),
(43, 'Classic Hand Tossed', 249, 'Dominos traditional hand stretched crust, crisp on outside, soft & light inside.', 5, '2023-04-17 21:03:26'),
(44, 'Wheat Thin Crust', 299, 'Presenting the light healthier and delicious light wheat thin crust from Dominos.', 5, '2023-04-17 21:03:26'),
(45, 'Fresh Pan Pizza', 299, 'Tastiest Pan Pizza.Ever.\r\nDomino’s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.', 5, '2023-04-17 21:03:26'),
(46, 'New Hand Tossed', 299, 'Classic Domino\'s crust. Fresh, hand stretched.', 5, '2023-04-17 21:03:26'),
(47, 'BURGER PIZZA- CLASSIC VEG', 129, 'Bite into delight! Witness the epic combination of pizza and burger with our classic Burger Pizza, that looks good and tastes great!', 6, '2023-04-17 21:03:26'),
(48, 'BURGER PIZZA- PREMIUM VEG', 139, 'The good just got better! Treat yourself to the premium taste of the Burger Pizza, that looks good and tastes great with paneer and red paprika.', 6, '2023-04-17 21:03:26'),
(49, 'BURGER PIZZA- CLASSIC NON VEG', 149, 'For all the meat cravers, try the classic non-veg Burger Pizza loaded with the goodness of burger and the greatness of pizza.', 6, '2023-04-17 21:03:26'),
(69, 'Gujarati Thali', 120, 'A Gujarati thali typically comprises of  one or two steamed or fried snacks called farsans, a green vegetable, a tuber or a gourd shaak (shaaks are main courses with vegetables and spices mixed together into a curry or a spicy dry dish)', 7, '2023-04-17 21:03:26'),
(70, 'Dal Bati', 70, 'Rajasthani Dalbati', 8, '2023-04-17 21:03:26'),
(71, 'Packaged Drinking Water', 20, 'Drinking Water', 4, '2023-04-17 12:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(21) NOT NULL,
  `name` varchar(100) NOT NULL,
  `review` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `name`, `review`, `description`) VALUES
(1, 'rajpatel', 'Exellent', 'Good Service'),
(2, 'Yagna', 'Exellent', 'my food order deliver Good Service'),
(3, 'Neh Patel', 'Exellent', 'Good site'),
(4, 'DhruvPatel', 'Exellent', 'Good Service\r\n'),
(5, 'Urvish', 'Exellent', 'Good Food\r\n'),
(6, 'Amir', 'Exellent', 'Good Food Product'),
(7, 'Deep', 'Exellent', 'not my order Delay\r\n'),
(8, 'Prit Patel', 'Exellent', 'Good Working Service');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'YaRa CanMan', 'weyaracanman@gmail.com', 7990535333, 6354405603, 'Sankalchand Patel University (SPU) University in Visnagar, Gujarat', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'weyaracanman@gmail.com', 7990535333, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2023-03-11 11:40:58'),
(2, 'raj', 'raj', 'patel', 'rajmpatelkansa@gmail.com', 7990535333, '0', '$2y$10$hNBy9oAbonp76eEAqtGz1eTAsMgesgzPNLI4Zmlsr6uaqyi4qL8VO', '2023-03-25 23:30:12'),
(3, 'yagna17', 'yagna', 'acharya', 'yagnamsf@gmail', 6354405603, '0', '$2y$10$5C6YN1t49f5VR.7MsJTRj.8nd4yIe8F7DP8/WuJElsfafe3CBemBe', '2023-04-11 13:33:13'),
(4, 'neh', 'neh', 'patel', 'nehpatel@gmail.com', 6356301025, '0', '$2y$10$41ziogySiZPp66I9j/38meeSvi58kr4eLVQNkk4Krq4TK.XpmP.ey', '2023-04-18 23:28:05'),
(5, 'pritpatel', 'Prit', 'Patel', 'pritpatel@gmail.com', 9313013440, '0', '$2y$10$QzZuBwyB55BkDzBRec9Ike7ozCSSZgaM4X4M7DANWpGl7ouwsOw8K', '2023-05-06 16:28:20'),
(6, 'dhruvpatel', 'Dhruv', 'Patel', 'dhruvpatel@gmail.com', 7984223795, '0', '$2y$10$hueAY8FA0pVnADaaOYtX4.eP8MbbSN6PJCNAd3hOuBckiXG7ym7aK', '2023-05-06 16:29:51'),
(8, 'deeppatel', 'Deep', 'Patel', 'deeppatel@gmail.com', 9316731020, '0', '$2y$10$NHiN/M6o3Utov5VmMHMFheu/JSzYtV.0UGFzPUxp7OQxXh7Abmpem', '2023-05-06 16:33:02'),
(9, 'urvishyogi', 'Urvish', 'Yogi', 'urvishyogi@gmail.com', 6351965687, '0', '$2y$10$unEMSy9KuD7dzFujaX5HgOLxm9PLXemKh/53c7vDGWyzyDFGtv5fC', '2023-05-06 16:34:08'),
(10, 'amirkhokhar', 'Amir', 'Khokhar', 'amirkhokhar@gmail.com', 7041530343, '0', '$2y$10$cxPsNhSPPbR1jcqIIr8VwOdVQ4350C13OIurDQneUXoWt4PpvR44e', '2023-05-06 16:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
