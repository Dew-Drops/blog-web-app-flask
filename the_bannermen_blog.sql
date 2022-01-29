-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2022 at 11:50 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_bannermen_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_num` varchar(100) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(20, 'Rohan Das ', 'rohandas@gmail.com', '9874563214', 'hi', '2022-01-15 23:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `tagline` text NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `tagline`, `content`, `img_file`, `date`) VALUES
(8, 'The Best Fitness Blog', 'the-fitness-blog', 'Health Is Wealth', 'A self-described community of “underdogs, misfits, and mutants” ready and willing to help people with every step of their fitness journey, Nerd Fitness is a comprehensive resource that’s motivating and inspiring. Sure, they’ll teach you how to work out without a gym and how to prepare a basic meal, but they also focus on helping you fix your own mindset, develop positive habits, and really change your life one step at a time.\r\nRoss Enamait’s website is dedicated to high performance conditioning, strength, and athletic development. The longtime trainer and boxing coach understands that a successful fitness regimen boils down to finding what works for you. His blog is a great resource for information about different kinds of training — from fitness fundamentals to old-school workouts like jumping rope to philosophical riffs on mental endurance', 'health-bg.jpg', '2022-01-15 22:38:04'),
(9, 'Digital Marketing', 'the-digital-blog', '“The best marketing doesn\'t feel like marketing.”', 'Digital marketing, also called online marketing, is the promotion of brands to connect with potential customers using the internet and other forms of digital communication. This includes not only email, social media, and web-based advertising, but also text and multimedia messages as a marketing channel.\r\n\r\nEssentially, if a marketing campaign involves digital communication, it\'s digital marketing.\r\nDigital marketing and inbound marketing are easily confused, and for good reason. Digital marketing uses many of the same tools as inbound marketing—email and online content, to name a few. Both exist to capture the attention of prospects through the buyer’s journey and turn them into customers. But the 2 approaches take different views of the relationship between the tool and the goal.\r\n\r\nDigital marketing considers how each individual tool can convert prospects. A brand\'s digital marketing strategy may use multiple platforms or focus all of its efforts on 1 platform.\r\n\r\nInbound marketing is a holistic concept. It considers the goal first, then looks at the available tools to determine which will effectively reach target customers, and then at which stage of the sales funnel that should happen.\r\n\r\nThe most important thing to remember about digital marketing and inbound marketing is that as a marketing professional, you don’t have to choose between the  In fact, they work best together. Inbound marketing provides structure and purpose for effective digital marketing to digital marketing efforts, making sure that each digital marketing channel works toward a goal.\r\n', 'digital-bg.jpg', '2022-01-15 22:58:26'),
(10, 'Technology', 'the-technology-blog', ' “Technology is best when it brings people together.”', 'technology, the application of scientific knowledge to the practical aims of human life or, as it is sometimes phrased, to the change and manipulation of the human environment.\r\n\r\nThe subject of technology is treated in a number of articles. For general treatment, see technology, history of; hand tool. For description of the materials that are both the object and means of manipulating the environment, see elastomers; industrial ceramics; industrial glass; metallurgy; mineral deposit; mineral processing; mining; plastic. For the generation of energy, see energy conversion; coal mining; coal utilization; petroleum production; petroleum refining. For treatment of food production, see agriculture, history of; agricultural economics; beekeeping; beer; cereal farming; coffee; commercial fishing; dairy farming; distilled spirit; food preservation; fruit farming; livestock farming; poultry farming; soft drink; tea; vegetable farming; wine. For the techniques of construction technology, see bridge; building construction; canals and inland waterways; dam; harbours and sea works; lighthouse; roads and highways; tunnels and underground excavations; environmental works. For the manufacture and design of the means of transportation, see aerospace industry; automotive industry; ship construction. For communications technology, see broadcasting; computer science; information processing; photography; printing; photoengraving; typography; telecommunication. For the processes and products of other manufacturing industries, see adhesive; clothing and footwear industry; dye; explosive; floor covering; forestry; chemical industry; man-made fibre; surface coating; papermaking; soap and detergent; textile. For medical applications of technology, see diagnosis; therapeutics; drug; medicine, history of; pharmaceutical industry. For military applications, see military technology. For treatment of the organization of technological systems, see automation; engineering; production system; systems engineering; work, history of the organization of.', 'technology-bg.jpg', '2022-01-15 23:30:31'),
(11, 'Robotics Technology', 'a-robotics-blog', '“In the long term, artificial intelligence and automation are going to be taking over so much of what gives humans a feeling of purpose.”', 'Robotics is the intersection of science, engineering and technology that produces machines, called robots, that substitute for (or replicate) human actions. Pop culture has always been fascinated with robots. R2-D2. Optimus Prime. WALL-E. These over-exaggerated, humanoid concepts of robots usually seem like a caricature of the real thing...or are they more forward thinking than we realize? Robots are gaining intellectual and mechanical capabilities that don’t put the possibility of a R2-D2-like machine out of reach in the future.\r\nAs technology progresses, so too does the scope of what is considered robotics. In 2005, 90% of all robots could be found assembling cars in automotive factories. These robots consist mainly of mechanical arms tasked with welding or screwing on certain parts of a car. Today, we’re seeing an evolved and expanded definition of robotics that includes the development, creation and use of bots that explore Earth’s harshest conditions, robots that assist law-enforcement and even robots that assist in almost every facet of healthcare.   ', 'robotics-bg.jpg', '2022-01-20 12:34:46'),
(17, 'return render_template', ',niohjohophpon', '.,nkiuguiviv', 'vgfufh', 'technol', '2022-01-20 13:04:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
