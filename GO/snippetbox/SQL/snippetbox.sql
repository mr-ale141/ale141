SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snippetbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `snippets`
--

CREATE TABLE `snippets` (
  `id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `snippets`
--

INSERT INTO `snippets` (`id`, `title`, `content`, `created`, `expires`) VALUES
(1, 'Не имей сто рублей', 'Не имей сто рублей,\nа имей сто друзей.', UTC_TIMESTAMP(), DATE_ADD(UTC_TIMESTAMP(), INTERVAL 10 DAY)),
(2, 'Лучше один раз увидеть', 'Лучше один раз увидеть,\nчем сто раз услышать.', UTC_TIMESTAMP(), DATE_ADD(UTC_TIMESTAMP(), INTERVAL 10 DAY)),
(3, 'Не откладывай на завтра', 'Не откладывай на завтра,\nчто можешь сделать сегодня.', UTC_TIMESTAMP(), DATE_ADD(UTC_TIMESTAMP(), INTERVAL 10 DAY));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `snippets`
--
ALTER TABLE `snippets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_snippets_created` (`created`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `snippets`
--
ALTER TABLE `snippets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
