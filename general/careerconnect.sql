-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 09:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `careerconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `job_posting_id` int(11) NOT NULL,
  `job_seeker_id` int(11) NOT NULL,
  `job_seeker_status` int(11) NOT NULL,
  `employer_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `employer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` longblob DEFAULT NULL,
  `about_company` text NOT NULL,
  `preferential_treatment` text DEFAULT NULL,
  `company_benefits` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`employer_id`, `user_id`, `company_name`, `company_logo`, `about_company`, `preferential_treatment`, `company_benefits`, `email`) VALUES
(21, 117, 'Tech Giants Inc.', NULL, 'Leading technology company specializing in software and hardware solutions', 'Flexible work hours', '[\"Health Insurance\",\"401(k) matching\"]', 'info@techgiants.com'),
(22, 118, 'Green Energy Solutions', NULL, 'Innovative company focused on sustainable energy solutions.', 'Remote work options', '[\"Paid time off\", \"Stock options\"]', 'contact@greenenergy.com'),
(23, 119, 'MediLife Healthcare', NULL, 'Healthcare company providing top-notch medical services.', 'On-site childcare', '[\"Health insurance\", \"Employee discounts\"]', 'support@medilife.com'),
(24, 120, 'Finance Advancers Ltd.', NULL, 'Financial services company offering a wide range of financial products.', 'Professional development programs', '[\"Paid time off\", \"Retirement plans\"]', 'info@finadvancers.com'),
(25, 121, 'Edutopia International', NULL, 'Global education company dedicated to innovative learning solutions.', 'Tuition reimbursement', '[\"Health insurance\", \"Remote work options\"]', 'hello@edutopia.com'),
(26, 122, 'Aero Engineering Corp.', NULL, 'Aerospace engineering company developing cutting-edge aviation technology.', 'Access to state-of-the-art research facilities', '[\"Paid time off\", \"Health insurance\"]', 'contact@aeroeng.com'),
(27, 123, 'Fashionista Apparel', NULL, 'Leading fashion retailer offering the latest trends and styles.', 'Employee discounts on merchandise', '[\"Paid time off\", \"Health insurance\"]', 'support@fashionista.com'),
(28, 124, 'Logistix Solutions', NULL, 'Comprehensive logistics and supply chain management services.', 'Professional development opportunities', '[\"Health insurance\", \"401(k) matching\"]', 'info@logistix.com'),
(29, 125, 'BioNext Pharmaceuticals', NULL, 'Pharmaceutical company focused on developing innovative drugs.', 'Flexible work hours', '[\"Health insurance\", \"Stock options\"]', 'contact@bionext.com'),
(30, 126, 'AutoMax Motors', NULL, 'Automotive company manufacturing state-of-the-art vehicles.', 'Employee discounts on vehicles', '[\"Paid time off\", \"Health insurance\"]', 'support@automax.com'),
(31, 127, 'SoftWorld Technologies', NULL, 'Technology company providing software solutions and services.', 'Remote work options', '[\"Health insurance\", \"401(k) matching\"]', 'info@softworld.com'),
(32, 128, 'FoodWorks Enterprises', NULL, 'Food and beverage company offering a variety of products and services.', 'Employee discounts on products', '[\"Paid time off\", \"Health insurance\"]', 'contact@foodworks.com'),
(33, 129, 'CloudZone Services', NULL, 'Cloud computing and IT services provider.', 'Professional development opportunities', '[\"Health insurance\", \"401(k) matching\"]', 'support@cloudzone.com'),
(34, 130, 'Urban Development Corp.', NULL, 'Urban planning and development company.', 'Access to cutting-edge urban planning tools', '[\"Paid time off\", \"Health insurance\"]', 'info@urbandev.com'),
(35, 131, 'AutoHaven Manufacturing', NULL, 'Manufacturing company specializing in automotive parts.', 'Employee discounts on products', '[\"Paid time off\", \"Health insurance\"]', 'contact@autohaven.com'),
(36, 132, 'AquaEarth Solutions', NULL, 'Environmental solutions company focused on water and earth conservation.', 'Remote work options', '[\"Health insurance\", \"401(k) matching\"]', 'support@aquaearth.com'),
(37, 133, 'Telecom Plus Ltd.', NULL, 'Telecommunication services provider.', 'Professional development programs', '[\"Paid time off\", \"Health insurance\"]', 'info@telecomplus.com'),
(38, 134, 'UrbanStyle Clothing', NULL, 'Retailer of urban clothing and accessories.', 'Employee discounts on merchandise', '[\"Health insurance\", \"401(k) matching\"]', 'contact@urbanstyle.com'),
(39, 135, 'MedTech Innovations', NULL, 'Medical technology company developing innovative healthcare solutions.', 'Access to cutting-edge technology', '[\"Paid time off\", \"Health insurance\"]', 'support@medtech.com'),
(40, 136, 'SpaceWorks Inc.', NULL, 'Aerospace company specializing in space technology.', 'Access to state-of-the-art research facilities', '[\"Paid time off\", \"Stock options\"]', 'info@spaceworks.com'),
(41, 137, 'BuildMax Construction', NULL, 'Construction company focused on building infrastructure projects.', 'Professional development opportunities', '[\"Health insurance\", \"401(k) matching\"]', 'contact@buildmax.com'),
(42, 138, 'GreenTech Ventures', NULL, 'Venture capital firm focused on green technology startups.', 'Flexible work hours', '[\"Paid time off\", \"Stock options\"]', 'support@greentech.com'),
(43, 139, 'AirPlus Airlines', NULL, 'Airline company offering domestic and international flights.', 'Employee discounts on flights', '[\"Health insurance\", \"401(k) matching\"]', 'info@airplus.com'),
(44, 140, 'LegalWorks LLP', NULL, 'Legal services firm offering a wide range of legal solutions.', 'Professional development programs', '[\"Paid time off\", \"Health insurance\"]', 'contact@legalworks.com'),
(45, 141, 'BioMax Research', NULL, 'Biotechnology research company.', 'Access to state-of-the-art research facilities', '[\"Paid time off\", \"Stock options\"]', 'support@biomax.com'),
(46, 142, 'AgriField Industries', NULL, 'Agricultural company specializing in innovative farming solutions.', 'Flexible work hours', '[\"Health insurance\", \"401(k) matching\"]', 'info@agrifield.com'),
(47, 143, 'Networks United', NULL, 'IT services provider focused on network solutions.', 'Remote work options', '[\"Paid time off\", \"Health insurance\"]', 'contact@networksunited.com'),
(48, 144, 'EduCare Academy', NULL, 'Dedicated to providing high-quality education and training programs.', 'Flexible working hours', '[\"Health insurance\", \"Paid time off\"]', 'educare@example.com'),
(49, 145, 'CyberSolutions Ltd.', NULL, 'Specialists in cybersecurity and IT solutions.', 'Remote work options', '[\"Health insurance\", \"Gym membership\"]', 'cybersolutions@example.com'),
(50, 146, 'TouristHub Travel', NULL, 'Leading travel agency offering personalized travel experiences.', 'Travel discounts', '[\"Paid time off\", \"Employee discounts\"]', 'touristhub@example.com'),
(51, 147, 'DesignPlus Studios', NULL, 'Innovative design studio specializing in graphic and web design.', 'Flexible project timelines', '[\"Health insurance\", \"Creative work environment\"]', 'designplus@example.com'),
(52, 148, 'TechWave Systems', NULL, 'Pioneers in providing cutting-edge technology solutions.', 'Remote work options', '[\"Paid time off\", \"401(k) matching\"]', 'techwave@example.com'),
(53, 149, 'SmartFoods Inc.', NULL, 'A company that offers healthy and smart food options.', 'Employee meal discounts', '[\"Health insurance\", \"Flexible working hours\"]', 'smartfoods@example.com'),
(54, 150, 'Inspire Education Group', NULL, 'Committed to inspiring and empowering students.', 'Professional development opportunities', '[\"Paid time off\", \"Health insurance\"]', 'inspireedu@example.com'),
(55, 151, 'HealthFirst Medical', NULL, 'Top healthcare provider offering comprehensive medical services.', 'On-site childcare', '[\"Health insurance\", \"Employee assistance programs\"]', 'healthfirst@example.com'),
(56, 152, 'Future Mobility Corp.', NULL, 'Leading the way in innovative transportation solutions.', 'Flexible work schedules', '[\"Paid time off\", \"Retirement plans\"]', 'futuremobility@example.com'),
(57, 153, 'BlueOcean Logistics', NULL, 'Efficient and reliable logistics services.', 'Employee travel allowances', '[\"Health insurance\", \"401(k) matching\"]', 'blueocean@example.com'),
(58, 154, 'UrbanTech Innovations', NULL, 'Bringing technology and innovation to urban areas.', 'Remote work options', '[\"Paid time off\", \"Professional development\"]', 'urbantech@example.com'),
(59, 155, 'NextGen Finance Ltd.', NULL, 'Innovative financial solutions for the next generation.', 'Flexible work schedules', '[\"Health insurance\", \"Retirement plans\"]', 'nextgenfinance@example.com'),
(60, 156, 'EcoEnergy Systems', NULL, 'Sustainable energy solutions for a greener future.', 'Remote work options', '[\"Paid time off\", \"Health insurance\"]', 'ecoenergy@example.com'),
(61, 157, 'HealthZone Pharmaceuticals', NULL, 'Leading pharmaceutical company dedicated to health and wellness.', 'On-site fitness center', '[\"Health insurance\", \"Paid time off\"]', 'healthzone@example.com'),
(62, 158, 'CloudGenius Solutions', NULL, 'Providing top-notch cloud computing solutions.', 'Remote work options', '[\"Paid time off\", \"401(k) matching\"]', 'cloudgenius@example.com'),
(63, 159, 'DigiSpace Media', NULL, 'Digital marketing agency specializing in social media campaigns and online advertising.', 'Flexible working hours', '[\"Health insurance\", \"Remote work options\"]', 'digispace@example.com'),
(64, 160, 'TechConnect Group', NULL, 'Leading provider of IT consulting and managed services.', 'Professional development programs', '[\"401(k) matching\", \"Tuition reimbursement\"]', 'techconnect@example.com'),
(65, 161, 'BrightFuture Education', NULL, 'Educational institution focusing on innovative teaching methods and student success.', 'Free tuition for employees\' children', '[\"Health insurance\", \"Paid time off\"]', 'brightfuture@example.com'),
(66, 162, 'AirLift Logistics', NULL, 'Logistics company providing comprehensive transportation and delivery services.', 'Company vehicles for personal use', '[\"Health insurance\", \"Retirement plans\"]', 'airlift@example.com'),
(67, 163, 'CityWorks Development', NULL, 'Urban development firm focused on sustainable city planning and infrastructure.', 'Housing allowances', '[\"Health insurance\", \"Paid parental leave\"]', 'cityworks@example.com'),
(68, 164, 'Global Trade Solutions', NULL, 'International trade company specializing in import and export services.', 'International travel opportunities', '[\"Health insurance\", \"Stock options\"]', 'globaltrade@example.com'),
(69, 165, 'FoodChain Ltd.', NULL, 'Food distribution company supplying high-quality products to retailers and restaurants.', 'Discounts on company products', '[\"Health insurance\", \"Retirement plans\"]', 'foodchain@example.com'),
(70, 166, 'AutoTech Innovations', NULL, 'Automotive technology company developing cutting-edge vehicle systems and components.', 'Employee car leasing program', '[\"Health insurance\", \"Tuition reimbursement\"]', 'autotech@example.com'),
(71, 167, 'TeleMedia Corp.', NULL, 'Telecommunications company providing a range of communication services and solutions.', 'Free company mobile plans', '[\"Health insurance\", \"401(k) matching\"]', 'telemedia@example.com'),
(72, 168, 'NextGen Biotech', NULL, 'Biotechnology firm focused on genetic research and pharmaceutical development.', 'Access to cutting-edge research facilities', '[\"Health insurance\", \"Stock options\"]', 'nextgenbio@example.com'),
(73, 169, 'BrightLights Entertainment', NULL, 'Entertainment company producing films, music, and live performances.', 'Backstage passes and event tickets', '[\"Health insurance\", \"Employee discounts\"]', 'brightlights@example.com'),
(74, 170, 'FastCourier Services', NULL, 'Courier service providing fast and reliable delivery solutions.', 'Company motorcycles for delivery personnel', '[\"Health insurance\", \"Performance bonuses\"]', 'fastcourier@example.com'),
(75, 171, 'SolarGrid Energy', NULL, 'Renewable energy company specializing in solar power solutions.', 'Stock options for employees', '[\"Health insurance\", \"Paid time off\"]', 'solargrid@example.com'),
(76, 172, 'Luxury Travels Ltd.', NULL, 'Luxury travel agency offering bespoke travel experiences and services.', 'Free or discounted travel opportunities', '[\"Health insurance\", \"401(k) matching\"]', 'luxurytravels@example.com'),
(77, 173, 'SmartLogix Solutions', NULL, 'Logistics technology company providing software and hardware solutions for supply chain management.', 'Flexible working arrangements', '[\"Health insurance\", \"Paid parental leave\"]', 'smartlogix@example.com'),
(78, 174, 'LifeCare Medical Center', NULL, 'Comprehensive medical center providing top-tier healthcare services.', 'Free annual health check-ups', '[\"Health insurance\", \"Paid time off\"]', 'lifecare@example.com'),
(79, 175, 'TechBridge Innovations', NULL, 'Innovative tech company focused on bridging the gap between technology and daily life.', 'Flexible working hours', '[\"Stock options\", \"Professional development\"]', 'techbridge@example.com'),
(80, 176, 'CityFood Inc.', NULL, 'Leading food distribution company catering to urban areas.', 'Employee meal plans', '[\"Health insurance\", \"401(k) matching\"]', 'cityfood@example.com'),
(81, 177, 'MedLabs Research', NULL, 'Pioneering research facility dedicated to medical advancements.', 'Access to cutting-edge research tools', '[\"Health insurance\", \"Paid parental leave\"]', 'medlabs@example.com'),
(82, 178, 'GreenGroove Ventures', NULL, 'Sustainable venture capital firm focusing on green technologies.', 'Green commute incentives', '[\"Health insurance\", \"Stock options\"]', 'greengroove@example.com'),
(83, 179, 'AeroWorks Ltd.', NULL, 'Leading aerospace company specializing in innovative aviation solutions.', 'Travel discounts', '[\"Health insurance\", \"Tuition reimbursement\"]', 'aeroworks@example.com'),
(84, 180, 'FutureBuild Construction', NULL, 'Construction company dedicated to futuristic and sustainable building solutions.', 'Housing allowances', '[\"Health insurance\", \"Retirement plans\"]', 'futurebuild@example.com'),
(85, 181, 'MetroHealth Medical Group', NULL, 'Medical group offering comprehensive healthcare services in metropolitan areas.', 'Free on-site childcare', '[\"Health insurance\", \"Professional development\"]', 'metrohealth@example.com'),
(86, 182, 'Innovative Health Solutions', NULL, 'Healthcare company focused on innovative medical solutions and treatments.', 'Access to experimental treatments', '[\"Health insurance\", \"Paid time off\"]', 'innovativehealth@example.com'),
(87, 183, 'Digital Dreams Agency', NULL, 'Creative agency specializing in digital marketing and media.', 'Creative freedom', '[\"Health insurance\", \"Remote work options\"]', 'digitaldreams@example.com'),
(88, 184, 'FinTech Fusion', NULL, 'Financial technology firm delivering cutting-edge financial solutions.', 'Stock options', '[\"Health insurance\", \"Paid parental leave\"]', 'fintechfusion@example.com'),
(89, 185, 'Urban Energy Solutions', NULL, 'Energy solutions company specializing in urban environments.', 'Green commute incentives', '[\"Health insurance\", \"401(k) matching\"]', 'urbanenergy@example.com'),
(91, 186, 'Sustainably Managed Co.', NULL, 'Company committed to sustainable management and eco-friendly practices.', 'Eco-friendly incentives', '[\"Health insurance\", \"Paid time off\"]', 'sustainably@example.com'),
(92, 187, 'AgriInnovate Technologies', NULL, 'Agricultural technology company focusing on innovative farming solutions.', 'Access to latest farming technologies', '[\"Health insurance\", \"Professional development\"]', 'agriinnovate@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `job_posting`
--

CREATE TABLE `job_posting` (
  `job_posting_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `skills` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_posting`
--

INSERT INTO `job_posting` (`job_posting_id`, `employer_id`, `title`, `salary`, `location`, `skills`, `description`, `created_at`, `updated_at`) VALUES
(42, 21, 'Software Developer', '$80,000 - $100,000', 'New York, USA', 'Java,Spring,REST APIs', 'Develop and maintain software applications.', '2024-10-29 07:11:32', '2024-10-29 07:11:32'),
(43, 21, 'Systems Analyst', '$70,000 - $90,000', 'Berlin, Germany', 'SQL,Data Analysis,Problem-solving', 'Analyze and improve IT systems for better efficiency.', '2024-10-29 07:11:32', '2024-10-29 07:11:32'),
(44, 22, 'Renewable Energy Engineer', '$75,000 - $95,000', 'Toronto, Canada', 'Energy Modeling,Project Management,Renewable Technologies', 'Design and implement renewable energy projects.', '2024-10-29 07:13:11', '2024-10-29 07:13:11'),
(45, 22, 'Sales Engineer', '$65,000 - $85,000', 'Sydney, Australia', 'Sales Skills,Technical Knowledge,Communication', 'Promote and sell green energy solutions to clients.', '2024-10-29 07:13:11', '2024-10-29 07:13:11'),
(46, 23, 'Registered Nurse', '$60,000 - $80,000', 'Tokyo, Japan', 'Patient Care,Critical Thinking,Communication', 'Provide high-quality nursing care to patients.', '2024-10-29 07:14:09', '2024-10-29 07:14:09'),
(47, 23, 'Healthcare Administrator', '$70,000 - $90,000', 'London, UK', 'Management,Organizational Skills,Healthcare Knowledge', 'Oversee the administration of healthcare facilities.', '2024-10-29 07:14:09', '2024-10-29 07:14:09'),
(48, 24, 'Financial Analyst', '$65,000 - $85,000', 'Singapore', 'Financial Modeling,Excel,Analytical Skills', 'Analyze financial data to support business decisions.', '2024-10-29 07:14:55', '2024-10-29 07:14:55'),
(49, 24, 'Investment Consultant', '$70,000 - $90,000', 'Dublin, Ireland', 'Investment Strategies,Client Relations,Market Analysis', 'Provide investment advice to clients.', '2024-10-29 07:14:55', '2024-10-29 07:14:55'),
(50, 25, 'Curriculum Developer', '$60,000 - $80,000', 'Cape Town, South Africa', 'Curriculum Design,Educational Technology,Research', 'Develop innovative curriculum for various educational programs.', '2024-10-29 07:15:35', '2024-10-29 07:15:35'),
(51, 25, 'Online Instructor', '$50,000 - $70,000', 'Madrid, Spain', 'Teaching,Online Platforms,Communication', 'Teach and engage students in online courses.', '2024-10-29 07:15:35', '2024-10-29 07:15:35'),
(52, 26, 'Aerospace Engineer', '$85,000 - $105,000', 'Los Angeles, USA', 'Aerospace Systems,Design Skills,Problem-solving', 'Design and develop aircraft and spacecraft.', '2024-10-29 07:16:27', '2024-10-29 07:16:27'),
(53, 26, 'Project Manager', '$90,000 - $110,000', 'Amsterdam, Netherlands', 'Leadership,Project Management,Aerospace Knowledge', 'Oversee aerospace projects from concept to completion.', '2024-10-29 07:16:27', '2024-10-29 07:16:27'),
(54, 27, 'Fashion Designer', '$60,000 - $80,000', 'Milan, Italy', 'Design Software,Creativity,Trend Analysis', 'Create new fashion designs and collections.', '2024-10-29 07:17:10', '2024-10-29 07:17:10'),
(55, 27, 'Marketing Specialist', '$55,000 - $75,000', 'Hong Kong', 'Marketing Strategies,Social Media,Communication', 'Develop and implement marketing campaigns for new collections.', '2024-10-29 07:17:10', '2024-10-29 07:17:10'),
(56, 28, 'Logistics Coordinator', '$50,000 - $70,000', 'São Paulo, Brazil', 'Logistics Management,Organizational Skills,Communication', 'Coordinate logistics and supply chain activities.', '2024-10-29 07:18:10', '2024-10-29 07:18:10'),
(57, 28, 'Supply Chain Analyst', '$60,000 - $80,000', 'Mexico City, Mexico', 'Data Analysis,Problem-solving,Supply Chain Knowledge', 'Analyze and improve supply chain processes.', '2024-10-29 07:18:10', '2024-10-29 07:18:10'),
(58, 29, 'Pharmaceutical Sales Representative', '$70,000 - $90,000', 'Mumbai, India', 'Sales Skills,Pharmaceutical Knowledge,Communication', 'Promote pharmaceutical products to healthcare professionals.', '2024-10-29 07:18:55', '2024-10-29 07:18:55'),
(59, 29, 'Research Scientist', '$80,000 - $100,000', 'Seoul, South Korea', 'Research Skills,Analytical Skills,Laboratory Techniques', 'Conduct research to develop new drugs.', '2024-10-29 07:18:55', '2024-10-29 07:18:55'),
(60, 30, 'Mechanical Engineer', '$75,000 - $95,000', 'Toronto, Canada', 'Mechanical Design,CAD Software,Problem-solving', 'Design and develop automotive components.', '2024-10-29 07:19:32', '2024-10-29 07:19:32'),
(61, 30, 'Quality Assurance Specialist', '$60,000 - $80,000', 'Berlin, Germany', 'Quality Control,Attention to Detail,Testing Procedures', 'Ensure products meet quality standards.', '2024-10-29 07:19:32', '2024-10-29 07:19:32'),
(63, 31, 'Software Engineer', '$80,000 - $100,000', 'San Francisco, USA', 'Java,Spring Boot,Microservices', 'Design and develop software applications and services.', '2024-10-29 07:21:12', '2024-10-29 07:21:12'),
(64, 31, 'Project Manager', '$90,000 - $110,000', 'Lisbon, Portugal', 'Agile Methodologies,Team Leadership,Communication', 'Lead and manage software development projects.', '2024-10-29 07:21:12', '2024-10-29 07:21:12'),
(65, 32, 'Product Manager', '$70,000 - $90,000', 'Chicago, USA', 'Product Development,Market Research,Communication', 'Oversee product development and marketing strategies.', '2024-10-29 07:21:46', '2024-10-29 07:21:46'),
(66, 32, 'Quality Assurance Specialist', '$60,000 - $80,000', 'Toronto, Canada', 'Quality Control,Food Safety Standards,Testing Procedures', 'Ensure product quality and compliance with safety standards.', '2024-10-29 07:21:46', '2024-10-29 07:21:46'),
(67, 33, 'Cloud Solutions Architect', '$85,000 - $105,000', 'Bangalore, India', 'AWS,Azure,Cloud Architecture', 'Design cloud solutions for various business needs.', '2024-10-29 07:22:19', '2024-10-29 07:22:19'),
(68, 33, 'DevOps Engineer', '$80,000 - $100,000', 'Berlin, Germany', 'CI/CD,Automation,Containerization', 'Implement and manage DevOps practices across the organization.', '2024-10-29 07:22:19', '2024-10-29 07:22:19'),
(69, 34, 'Urban Planner', '$75,000 - $95,000', 'New York, USA', 'Urban Planning,GIS Software,Public Engagement', 'Develop urban plans and policies for sustainable development.', '2024-10-29 07:23:03', '2024-10-29 07:23:03'),
(70, 34, 'Civil Engineer', '$80,000 - $100,000', 'Melbourne, Australia', 'Structural Design,Project Management,Civil Engineering Principles', 'Design and oversee construction projects within urban areas.', '2024-10-29 07:23:03', '2024-10-29 07:23:03'),
(71, 35, 'Manufacturing Engineer', '$70,000 - $90,000', 'Detroit, USA', 'Lean Manufacturing,Process Improvement,CAD Software', 'Optimize manufacturing processes for automotive parts.', '2024-10-29 07:23:56', '2024-10-29 07:23:56'),
(72, 35, 'Production Supervisor', '$65,000 - $85,000', 'Tokyo, Japan', 'Leadership,Production Management,Quality Control', 'Supervise production staff and manage workflow.', '2024-10-29 07:23:56', '2024-10-29 07:23:56'),
(73, 36, 'Environmental Scientist', '$75,000 - $95,000', 'Cape Town, South Africa', 'Research Skills,Data Analysis,Environmental Policy', 'Conduct research on water and earth conservation methods.', '2024-10-29 07:24:33', '2024-10-29 07:24:33'),
(74, 36, 'Project Coordinator', '$60,000 - $80,000', 'Seattle, USA', 'Project Management,Communication,Teamwork', 'Coordinate environmental conservation projects.', '2024-10-29 07:24:33', '2024-10-29 07:24:33'),
(75, 37, 'Network Engineer', '$70,000 - $90,000', 'London, UK', 'Networking Protocols,Troubleshooting,Cisco Systems', 'Design and maintain telecommunications networks.', '2024-10-29 07:25:15', '2024-10-29 07:25:15'),
(76, 37, 'Sales Executive', '$60,000 - $80,000', 'Dubai, UAE', 'Sales Skills,Customer Relations,Telecom Knowledge', 'Promote and sell telecommunications services.', '2024-10-29 07:25:15', '2024-10-29 07:25:15'),
(77, 38, 'Fashion Buyer', '$65,000 - $85,000', 'Paris, France', 'Negotiation,Market Trends,Inventory Management', 'Source and purchase fashion merchandise for retail.', '2024-10-29 07:25:56', '2024-10-29 07:25:56'),
(78, 38, 'Visual Merchandiser', '$50,000 - $70,000', 'Los Angeles, USA', 'Visual Design,Creativity,Retail Experience', 'Create visually appealing displays to attract customers.', '2024-10-29 07:25:56', '2024-10-29 07:25:56'),
(80, 39, 'Biomedical Engineer', '$85,000 - $105,000', 'Boston, USA', 'Biomedical Engineering,Research Skills,Problem-solving', 'Design and develop innovative medical devices.', '2024-10-29 07:28:00', '2024-10-29 07:28:00'),
(81, 39, 'Clinical Research Associate', '$70,000 - $90,000', 'Toronto, Canada', 'Clinical Trials,Data Analysis,Medical Knowledge', 'Assist in the planning and execution of clinical research.', '2024-10-29 07:28:00', '2024-10-29 07:28:00'),
(82, 40, 'Aerospace Technician', '$70,000 - $90,000', 'Houston, USA', 'Mechanical Skills,Problem-solving,Aerospace Knowledge', 'Support the assembly and testing of aerospace components.', '2024-10-29 07:29:57', '2024-10-29 07:29:57'),
(83, 40, 'Systems Engineer', '$85,000 - $105,000', 'Madrid, Spain', 'Systems Engineering,Project Management,Technical Skills', 'Develop systems and solutions for aerospace projects.', '2024-10-29 07:29:58', '2024-10-29 07:29:58'),
(84, 41, 'Project Manager', '$80,000 - $100,000', 'Chicago, USA', 'Project Management,Construction Management,Leadership', 'Oversee construction projects from inception to completion.', '2024-10-29 07:31:39', '2024-10-29 07:31:39'),
(85, 41, 'Civil Engineer', '$75,000 - $95,000', 'Toronto, Canada', 'Structural Design,Site Planning,Civil Engineering', 'Design and implement infrastructure projects.', '2024-10-29 07:31:39', '2024-10-29 07:31:39'),
(86, 42, 'Investment Analyst', '$85,000 - $105,000', 'San Francisco, USA', 'Financial Analysis,Market Research,Communication', 'Analyze and evaluate investment opportunities in green technology.', '2024-10-29 07:32:28', '2024-10-29 07:32:28'),
(87, 42, 'Venture Capital Associate', '$90,000 - $110,000', 'Berlin, Germany', 'Networking,Negotiation,Investment Strategies', 'Support investment decisions and portfolio management.', '2024-10-29 07:32:28', '2024-10-29 07:32:28'),
(88, 43, 'Customer Service Representative', '$40,000 - $60,000', 'New York, USA', 'Communication,Problem Solving,Customer Service', 'Assist passengers with inquiries and ticketing.', '2024-10-29 07:33:12', '2024-10-29 07:33:12'),
(89, 43, 'Flight Operations Manager', '$90,000 - $110,000', 'Dubai, UAE', 'Operations Management,Regulatory Compliance,Team Leadership', 'Manage flight operations and ensure compliance with regulations.', '2024-10-29 07:33:12', '2024-10-29 07:33:12'),
(92, 44, 'Associate Lawyer', '$80,000 - $100,000', 'Los Angeles, USA', 'Legal Research,Client Representation,Negotiation', 'Provide legal counsel and representation to clients.', '2024-10-29 07:36:20', '2024-10-29 07:36:20'),
(93, 44, 'Legal Assistant', '$50,000 - $70,000', 'Toronto, Canada', 'Organization,Communication,Legal Documentation', 'Assist lawyers in preparing cases and legal documents.', '2024-10-29 07:36:21', '2024-10-29 07:36:21'),
(94, 45, 'Biotechnologist', '$85,000 - $105,000', 'Boston, USA', 'Molecular Biology,Research Skills,Laboratory Techniques', 'Conduct research on biological systems and processes.', '2024-10-29 07:37:08', '2024-10-29 07:37:08'),
(95, 45, 'Research Scientist', '$90,000 - $110,000', 'Zurich, Switzerland', 'Scientific Research,Data Analysis,Project Management', 'Lead research projects in biotechnology.', '2024-10-29 07:37:08', '2024-10-29 07:37:08'),
(96, 46, 'Agricultural Engineer', '$75,000 - $95,000', 'Nairobi, Kenya', 'Engineering Principles,Crop Management,Sustainability', 'Develop agricultural technology and solutions.', '2024-10-29 07:37:47', '2024-10-29 07:37:47'),
(97, 46, 'Farm Manager', '$60,000 - $80,000', 'Fresno, USA', 'Farm Operations,Leadership,Resource Management', 'Manage day-to-day operations of a farming business.', '2024-10-29 07:37:47', '2024-10-29 07:37:47'),
(98, 47, 'Network Administrator', '$70,000 - $90,000', 'Dallas, USA', 'Networking Protocols,Troubleshooting,Firewall Management', 'Manage and maintain network infrastructure.', '2024-10-29 07:38:22', '2024-10-29 07:38:22'),
(99, 47, 'IT Support Specialist', '$55,000 - $75,000', 'Bangalore, India', 'Technical Support,Problem Solving,Customer Service', 'Provide technical support for network issues.', '2024-10-29 07:38:22', '2024-10-29 07:38:22'),
(100, 48, 'Curriculum Developer', '$65,000 - $85,000', 'Boston, USA', 'Curriculum Design,Educational Theory,Project Management', 'Create and develop educational materials and programs.', '2024-10-29 07:39:42', '2024-10-29 07:39:42'),
(101, 48, 'Training Coordinator', '$60,000 - $80,000', 'London, UK', 'Training Development,Communication,Organizational Skills', 'Coordinate and oversee training programs for educators.', '2024-10-29 07:39:42', '2024-10-29 07:39:42'),
(102, 49, 'Cybersecurity Analyst', '$80,000 - $100,000', 'Singapore', 'Risk Assessment,Network Security,Incident Response', 'Monitor and protect company networks from cyber threats.', '2024-10-29 07:40:18', '2024-10-29 07:40:18'),
(103, 49, 'Penetration Tester', '$90,000 - $110,000', 'Toronto, Canada', 'Ethical Hacking,Security Audits,Vulnerability Assessment', 'Conduct penetration tests to identify security vulnerabilities.', '2024-10-29 07:40:18', '2024-10-29 07:40:18'),
(104, 50, 'Travel Consultant', '$45,000 - $65,000', 'Barcelona, Spain', 'Customer Service,Travel Planning,Sales Skills', 'Provide personalized travel planning services to clients.', '2024-10-29 07:40:59', '2024-10-29 07:40:59'),
(105, 50, 'Marketing Specialist', '$50,000 - $70,000', 'Melbourne, Australia', 'Digital Marketing,Content Creation,Social Media', 'Develop marketing strategies to promote travel services.', '2024-10-29 07:40:59', '2024-10-29 07:40:59'),
(106, 51, 'Graphic Designer', '$60,000 - $80,000', 'Los Angeles, USA', 'Adobe Creative Suite,Creative Thinking,Communication', 'Create visual designs for various projects and clients.', '2024-10-29 07:41:42', '2024-10-29 07:41:42'),
(107, 51, 'Web Designer', '$65,000 - $85,000', 'Berlin, Germany', 'HTML/CSS,User Experience Design,Responsive Design', 'Design and develop user-friendly websites.', '2024-10-29 07:41:42', '2024-10-29 07:41:42'),
(108, 52, 'Software Engineer', '$90,000 - $110,000', 'Seattle, USA', 'Java,Python,Agile Development', 'Develop innovative software solutions for various applications.', '2024-10-29 07:42:54', '2024-10-29 07:42:54'),
(109, 52, 'Systems Analyst', '$80,000 - $100,000', 'Tokyo, Japan', 'System Design,Data Analysis,Problem Solving', 'Analyze and improve existing systems for better efficiency.', '2024-10-29 07:42:54', '2024-10-29 07:42:54'),
(110, 53, 'Nutritionist', '$70,000 - $90,000', 'New York, USA', 'Dietary Planning,Communication,Research Skills', 'Advise customers on healthy food choices and meal planning.', '2024-10-29 07:44:05', '2024-10-29 07:44:05'),
(111, 53, 'Marketing Specialist', '$60,000 - $80,000', 'Vancouver, Canada', 'Digital Marketing,Content Creation,Social Media', 'Develop marketing strategies to promote healthy food options.', '2024-10-29 07:44:06', '2024-10-29 07:44:06'),
(112, 54, 'Education Consultant', '$75,000 - $95,000', 'San Francisco, USA', 'Curriculum Development,Teaching Experience,Communication', 'Work with schools to improve educational programs.', '2024-10-29 07:44:41', '2024-10-29 07:44:41'),
(113, 54, 'Teacher', '$60,000 - $80,000', 'London, UK', 'Lesson Planning,Classroom Management,Creativity', 'Deliver high-quality education to students in various subjects.', '2024-10-29 07:44:42', '2024-10-29 07:44:42'),
(114, 55, 'Registered Nurse', '$70,000 - $90,000', 'Los Angeles, USA', 'Patient Care,Communication,Critical Thinking', 'Provide nursing care to patients in a clinical setting.', '2024-10-29 07:45:09', '2024-10-29 07:45:09'),
(115, 55, 'Healthcare Administrator', '$85,000 - $105,000', 'Sydney, Australia', 'Healthcare Management,Finance,Leadership', 'Manage healthcare operations and ensure compliance with regulations.', '2024-10-29 07:45:09', '2024-10-29 07:45:09'),
(116, 56, 'Mechanical Engineer', '$85,000 - $105,000', 'Berlin, Germany', 'CAD Software,Design Engineering,Project Management', 'Design and develop innovative transportation solutions.', '2024-10-29 07:45:39', '2024-10-29 07:45:39'),
(117, 56, 'Transportation Planner', '$80,000 - $100,000', 'Amsterdam, Netherlands', 'Urban Planning,Data Analysis,Communication', 'Plan and implement transportation systems and strategies.', '2024-10-29 07:45:39', '2024-10-29 07:45:39'),
(118, 57, 'Logistics Coordinator', '$60,000 - $80,000', 'Chicago, USA', 'Supply Chain Management,Organizational Skills,Communication', 'Coordinate logistics and supply chain activities.', '2024-10-29 07:46:09', '2024-10-29 07:46:09'),
(119, 57, 'Warehouse Manager', '$70,000 - $90,000', 'Miami, USA', 'Inventory Management,Team Leadership,Safety Compliance', 'Manage warehouse operations and ensure efficient processes.', '2024-10-29 07:46:10', '2024-10-29 07:46:10'),
(120, 58, 'Urban Planner', '$75,000 - $95,000', 'Toronto, Canada', 'Urban Design,Research Skills,Public Engagement', 'Develop plans and programs for land use in urban areas.', '2024-10-29 07:48:03', '2024-10-29 07:48:03'),
(121, 58, 'Product Manager', '$85,000 - $105,000', 'Singapore', 'Product Development,Market Research,Leadership', 'Lead product development for urban technology solutions.', '2024-10-29 07:48:03', '2024-10-29 07:48:03'),
(122, 59, 'Financial Analyst', '$80,000 - $100,000', 'New York, USA', 'Financial Modeling,Data Analysis,Investment Strategies', 'Analyze financial data to inform investment decisions.', '2024-10-29 07:48:45', '2024-10-29 07:48:45'),
(123, 59, 'Compliance Officer', '$75,000 - $95,000', 'London, UK', 'Regulatory Compliance,Risk Management,Communication', 'Ensure company compliance with financial regulations.', '2024-10-29 07:48:45', '2024-10-29 07:48:45'),
(124, 60, 'Energy Consultant', '$80,000 - $100,000', 'San Diego, USA', 'Energy Auditing,Sustainability,Communication', 'Advise clients on sustainable energy solutions.', '2024-10-29 07:49:16', '2024-10-29 07:49:16'),
(125, 60, 'Renewable Energy Engineer', '$90,000 - $110,000', 'Copenhagen, Denmark', 'Solar Energy,Wind Energy,Engineering Principles', 'Design and implement renewable energy projects.', '2024-10-29 07:49:16', '2024-10-29 07:49:16'),
(126, 61, 'Pharmaceutical Sales Representative', '$70,000 - $90,000', 'Atlanta, USA', 'Sales Skills,Communication,Negotiation', 'Promote and sell pharmaceutical products to healthcare professionals.', '2024-10-29 07:49:48', '2024-10-29 07:49:48'),
(127, 61, 'Clinical Research Associate', '$80,000 - $100,000', 'Dublin, Ireland', 'Clinical Trials,Data Management,Research Skills', 'Coordinate clinical trials and research activities.', '2024-10-29 07:49:49', '2024-10-29 07:49:49'),
(128, 62, 'Cloud Solutions Architect', '$95,000 - $115,000', 'Austin, USA', 'Cloud Architecture,AWS,DevOps', 'Design and implement cloud-based solutions for clients.', '2024-10-29 07:51:02', '2024-10-29 07:51:02'),
(129, 62, 'DevOps Engineer', '$90,000 - $110,000', 'Bangalore, India', 'Linux,Automation,CI/CD', 'Manage and optimize cloud infrastructure and deployment processes.', '2024-10-29 07:51:02', '2024-10-29 07:51:02'),
(130, 63, 'Social Media Manager', '$65,000 - $85,000', 'Los Angeles, USA', 'Social Media Strategy,Content Creation,Analytics', 'Create and manage social media campaigns for clients.', '2024-10-29 07:52:20', '2024-10-29 07:52:20'),
(131, 63, 'Digital Marketing Specialist', '$70,000 - $90,000', 'Toronto, Canada', 'SEO,PPC,Email Marketing', 'Develop and execute online marketing strategies to increase brand visibility.', '2024-10-29 07:52:20', '2024-10-29 07:52:20'),
(134, 64, 'IT Consultant', '$80,000 - $100,000', 'New York, USA', 'IT Strategy,Problem Solving,Client Management', 'Provide IT consulting services to improve clients\' operations.', '2024-10-29 07:53:35', '2024-10-29 07:53:35'),
(135, 64, 'Managed Services Technician', '$70,000 - $90,000', 'Dublin, Ireland', 'Network Administration,Technical Support,Troubleshooting', 'Support clients with their IT infrastructure and manage services.', '2024-10-29 07:53:35', '2024-10-29 07:53:35'),
(136, 65, 'Curriculum Developer', '$75,000 - $95,000', 'San Francisco, USA', 'Curriculum Design,Education Technology,Research', 'Develop innovative educational programs and materials.', '2024-10-29 07:54:09', '2024-10-29 07:54:09'),
(137, 65, 'Teacher', '$60,000 - $80,000', 'London, UK', 'Lesson Planning,Classroom Management,Communication', 'Teach and inspire students in a supportive environment.', '2024-10-29 07:54:09', '2024-10-29 07:54:09'),
(138, 66, 'Logistics Coordinator', '$65,000 - $85,000', 'Chicago, USA', 'Supply Chain Management,Organizational Skills,Communication', 'Coordinate logistics and transportation operations for clients.', '2024-10-29 07:54:48', '2024-10-29 07:54:48'),
(139, 66, 'Operations Manager', '$75,000 - $95,000', 'Miami, USA', 'Operations Management,Leadership,Problem Solving', 'Manage logistics operations to ensure timely delivery of services.', '2024-10-29 07:54:48', '2024-10-29 07:54:48'),
(140, 67, 'Urban Planner', '$80,000 - $100,000', 'Seattle, USA', 'Urban Design,Research Skills,Public Engagement', 'Develop and implement sustainable urban planning strategies.', '2024-10-29 07:55:54', '2024-10-29 07:55:54'),
(141, 67, 'Civil Engineer', '$85,000 - $105,000', 'Melbourne, Australia', 'Civil Engineering,Project Management,AutoCAD', 'Design and oversee infrastructure projects in urban areas.', '2024-10-29 07:55:54', '2024-10-29 07:55:54'),
(143, 68, 'Import/Export Coordinator', '$70,000 - $90,000', 'New York, USA', 'Customs Regulations,Logistics,Negotiation', 'Manage and coordinate international shipments for clients.', '2024-10-29 07:56:46', '2024-10-29 07:56:46'),
(144, 68, 'Business Development Manager', '$80,000 - $100,000', 'Hong Kong', 'Market Research,Sales Skills,Strategic Planning', 'Identify and develop new business opportunities in international trade.', '2024-10-29 07:56:46', '2024-10-29 07:56:46'),
(145, 69, 'Sales Representative', '$60,000 - $80,000', 'Atlanta, USA', 'Sales Skills,Customer Service,Negotiation', 'Sell food products to retailers and restaurants.', '2024-10-29 07:57:27', '2024-10-29 07:57:27'),
(146, 69, 'Supply Chain Analyst', '$65,000 - $85,000', 'Dallas, USA', 'Data Analysis,Logistics,Inventory Management', 'Analyze and optimize the supply chain processes.', '2024-10-29 07:57:27', '2024-10-29 07:57:27'),
(147, 70, 'Automotive Engineer', '$90,000 - $110,000', 'Detroit, USA', 'Mechanical Engineering,Automotive Systems,CAD Software', 'Develop cutting-edge automotive technology and systems.', '2024-10-29 07:58:24', '2024-10-29 07:58:24'),
(148, 70, 'Product Manager', '$85,000 - $105,000', 'Munich, Germany', 'Product Development,Market Research,Leadership', 'Lead product development for automotive technologies.', '2024-10-29 07:58:25', '2024-10-29 07:58:25'),
(151, 71, 'Network Engineer', '$80,000 - $100,000', 'San Francisco, USA', 'Networking,Firewall Configuration,Troubleshooting', 'Design and maintain telecommunication networks for clients.', '2024-10-29 07:59:49', '2024-10-29 07:59:49'),
(152, 71, 'Customer Support Specialist', '$60,000 - $80,000', 'Bangalore, India', 'Customer Service,Technical Support,Communication', 'Provide support to customers regarding telecommunication services.', '2024-10-29 07:59:49', '2024-10-29 07:59:49'),
(153, 72, 'Genetic Research Scientist', '$90,000 - $110,000', 'Cambridge, USA', 'Molecular Biology,Genetics,Data Analysis', 'Conduct research on genetic modifications and their applications.', '2024-10-29 08:00:46', '2024-10-29 08:00:46'),
(154, 72, 'Pharmaceutical Sales Representative', '$80,000 - $100,000', 'Berlin, Germany', 'Sales Skills,Pharmaceutical Knowledge,Communication', 'Promote and sell biotech products to healthcare professionals.', '2024-10-29 08:00:46', '2024-10-29 08:00:46'),
(155, 73, 'Film Production Assistant', '$50,000 - $70,000', 'Los Angeles, USA', 'Project Management,Communication,Teamwork', 'Assist in various aspects of film production.', '2024-10-29 08:01:15', '2024-10-29 08:01:15'),
(156, 73, 'Music Marketing Coordinator', '$60,000 - $80,000', 'Nashville, USA', 'Marketing,Social Media,Public Relations', 'Develop and implement marketing strategies for music artists.', '2024-10-29 08:01:15', '2024-10-29 08:01:15'),
(157, 74, 'Delivery Driver', '$40,000 - $60,000', 'Chicago, USA', 'Driving,Time Management,Customer Service', 'Ensure timely delivery of packages to customers.', '2024-10-29 08:01:50', '2024-10-29 08:01:50'),
(158, 74, 'Operations Supervisor', '$55,000 - $75,000', 'Toronto, Canada', 'Logistics,Team Leadership,Problem Solving', 'Oversee daily operations of the courier service.', '2024-10-29 08:01:50', '2024-10-29 08:01:50'),
(159, 75, 'Solar Energy Engineer', '$85,000 - $105,000', 'San Diego, USA', 'Solar Technology,Engineering,Project Management', 'Design and implement solar energy systems.', '2024-10-29 08:02:23', '2024-10-29 08:02:23'),
(160, 75, 'Sales Consultant for Renewable Energy', '$70,000 - $90,000', 'Phoenix, USA', 'Sales Skills,Renewable Energy Knowledge,Communication', 'Promote and sell solar energy solutions to clients.', '2024-10-29 08:02:23', '2024-10-29 08:02:23'),
(161, 76, 'Travel Consultant', '$60,000 - $80,000', 'New York, USA', 'Customer Service,Travel Planning,Communication', 'Assist clients in planning luxury travel experiences.', '2024-10-29 08:03:29', '2024-10-29 08:03:29'),
(162, 76, 'Tour Coordinator', '$55,000 - $75,000', 'London, UK', 'Organizational Skills,Event Planning,Communication', 'Coordinate bespoke travel experiences and tours for clients.', '2024-10-29 08:03:29', '2024-10-29 08:03:29'),
(163, 77, 'Supply Chain Analyst', '$70,000 - $90,000', 'Atlanta, USA', 'Data Analysis,Logistics,Problem Solving', 'Analyze and optimize supply chain processes using technology.', '2024-10-29 08:04:38', '2024-10-29 08:04:38'),
(164, 77, 'Software Engineer', '$85,000 - $105,000', 'Bangalore, India', 'Programming,Software Development,Problem Solving', 'Develop software solutions for supply chain management.', '2024-10-29 08:04:38', '2024-10-29 08:04:38'),
(165, 78, 'Registered Nurse', '$75,000 - $95,000', 'Miami, USA', 'Nursing,Patient Care,Communication', 'Provide high-quality care to patients in a medical setting.', '2024-10-29 08:05:05', '2024-10-29 08:05:05'),
(166, 78, 'Healthcare Administrator', '$80,000 - $100,000', 'Houston, USA', 'Healthcare Management,Leadership,Communication', 'Manage operations and administration of the medical center.', '2024-10-29 08:05:05', '2024-10-29 08:05:05'),
(167, 79, 'Product Development Specialist', '$80,000 - $100,000', 'Silicon Valley, USA', 'Product Development,Research,Innovation', 'Develop and enhance innovative tech products.', '2024-10-29 08:06:07', '2024-10-29 08:06:07'),
(168, 79, 'User Experience (UX) Designer', '$70,000 - $90,000', 'Berlin, Germany', 'UX Design,Prototyping,User Research', 'Design user-friendly interfaces and experiences for tech products.', '2024-10-29 08:06:07', '2024-10-29 08:06:07'),
(169, 80, 'Food Distribution Manager', '$75,000 - $95,000', 'Seattle, USA', 'Logistics,Supply Chain Management,Team Leadership', 'Oversee food distribution operations and logistics.', '2024-10-29 08:07:02', '2024-10-29 08:07:02'),
(170, 80, 'Marketing Coordinator', '$60,000 - $80,000', 'Toronto, Canada', 'Marketing,Communication,Data Analysis', 'Develop marketing strategies for food distribution services.', '2024-10-29 08:07:02', '2024-10-29 08:07:02'),
(171, 81, 'Clinical Research Coordinator', '$80,000 - $100,000', 'Boston, USA', 'Clinical Research,Project Management,Data Analysis', 'Coordinate clinical trials and research projects.', '2024-10-29 08:08:13', '2024-10-29 08:08:13'),
(172, 81, 'Laboratory Technician', '$60,000 - $80,000', 'Los Angeles, USA', 'Laboratory Skills,Data Analysis,Attention to Detail', 'Perform laboratory tests and assist in research activities.', '2024-10-29 08:08:13', '2024-10-29 08:08:13'),
(173, 82, 'Venture Capital Analyst', '$85,000 - $105,000', 'San Francisco, USA', 'Financial Analysis,Market Research,Investment Strategies', 'Analyze and evaluate potential investments in green technologies.', '2024-10-29 08:09:29', '2024-10-29 08:09:29'),
(174, 82, 'Sustainability Consultant', '$90,000 - $110,000', 'Amsterdam, Netherlands', 'Sustainability Practices,Consulting,Project Management', 'Advise companies on sustainable practices and green technology implementation.', '2024-10-29 08:09:29', '2024-10-29 08:09:29'),
(175, 83, 'Aerospace Engineer', '$100,000 - $120,000', 'Seattle, USA', 'Aerospace Engineering,CAD Software,Problem Solving', 'Design and develop innovative aviation solutions.', '2024-10-29 08:09:59', '2024-10-29 08:09:59'),
(176, 83, 'Project Manager for Aerospace Projects', '$95,000 - $115,000', 'Paris, France', 'Project Management,Aerospace Knowledge,Leadership', 'Lead aerospace projects from conception to execution.', '2024-10-29 08:09:59', '2024-10-29 08:09:59'),
(177, 84, 'Construction Project Manager', '$90,000 - $110,000', 'Denver, USA', 'Project Management,Construction Management,Budgeting', 'Oversee construction projects focusing on sustainable building solutions.', '2024-10-29 08:10:34', '2024-10-29 08:10:34'),
(178, 84, 'Sustainable Architect', '$80,000 - $100,000', 'Toronto, Canada', 'Architecture,Sustainable Design,AutoCAD', 'Design innovative and sustainable buildings.', '2024-10-29 08:10:34', '2024-10-29 08:10:34'),
(179, 85, 'Family Physician', '$150,000 - $180,000', 'New York, USA', 'Medical Degree,Patient Care,Communication', 'Provide comprehensive healthcare services to patients.', '2024-10-29 08:11:09', '2024-10-29 08:11:09'),
(180, 85, 'Healthcare Administrator', '$85,000 - $105,000', 'Los Angeles, USA', 'Healthcare Management,Leadership,Data Analysis', 'Manage operations and administration within the medical group.', '2024-10-29 08:11:09', '2024-10-29 08:11:09'),
(181, 86, 'Medical Research Scientist', '$90,000 - $110,000', 'Boston, USA', 'Medical Research,Laboratory Skills,Data Analysis', 'Conduct research to develop innovative medical treatments.', '2024-10-29 08:12:16', '2024-10-29 08:12:16'),
(182, 86, 'Clinical Trials Coordinator', '$70,000 - $90,000', 'Chicago, USA', 'Clinical Trials,Project Management,Data Analysis', 'Coordinate and manage clinical trials for new medical solutions.', '2024-10-29 08:12:16', '2024-10-29 08:12:16'),
(183, 87, 'Digital Marketing Specialist', '$65,000 - $85,000', 'Austin, USA', 'Digital Marketing,SEO,Content Creation', 'Develop and implement digital marketing strategies for clients.', '2024-10-29 08:12:50', '2024-10-29 08:12:50'),
(184, 87, 'Graphic Designer', '$55,000 - $75,000', 'Toronto, Canada', 'Graphic Design,Adobe Creative Suite,Creativity', 'Create visually compelling designs for various media.', '2024-10-29 08:12:50', '2024-10-29 08:12:50'),
(185, 88, 'Financial Analyst', '$80,000 - $100,000', 'New York, USA', 'Financial Analysis,Data Analysis,Market Research', 'Analyze financial data to provide insights and recommendations.', '2024-10-29 08:13:22', '2024-10-29 08:13:22'),
(186, 88, 'Product Manager for FinTech Solutions', '$90,000 - $110,000', 'London, UK', 'Product Management,FinTech Knowledge,Leadership', 'Lead the development of innovative financial products.', '2024-10-29 08:13:22', '2024-10-29 08:13:22'),
(187, 89, 'Energy Analyst', '$75,000 - $95,000', 'Chicago, USA', 'Energy Management,Data Analysis,Research', 'Analyze energy consumption and develop efficiency strategies.', '2024-10-29 08:14:06', '2024-10-29 08:14:06'),
(188, 89, 'Urban Planner', '$80,000 - $100,000', 'Los Angeles, USA', 'Urban Planning,Sustainability,Project Management', 'Plan and develop energy-efficient urban projects.', '2024-10-29 08:14:06', '2024-10-29 08:14:06'),
(189, 91, 'Sustainability Manager', '$90,000 - $110,000', 'San Francisco, USA', 'Sustainability Practices,Project Management,Data Analysis', 'Develop and implement sustainability initiatives within the company.', '2024-10-29 08:14:40', '2024-10-29 08:14:40'),
(190, 91, 'Environmental Consultant', '$80,000 - $100,000', 'New York, USA', 'Environmental Science,Consulting,Regulatory Knowledge', 'Advise companies on environmental policies and practices.', '2024-10-29 08:14:40', '2024-10-29 08:14:40'),
(191, 92, 'Agricultural Engineer', '$85,000 - $105,000', 'Des Moines, USA', 'Agricultural Engineering,Data Analysis,Innovation', 'Develop innovative solutions for modern farming challenges.', '2024-10-29 08:15:41', '2024-10-29 08:15:41'),
(192, 92, 'Crop Scientist', '$75,000 - $95,000', 'Kansas City, USA', 'Agronomy,Research,Data Analysis', 'Conduct research to improve crop yields and sustainability.', '2024-10-29 08:15:41', '2024-10-29 08:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `job_seekers`
--

CREATE TABLE `job_seekers` (
  `job_seeker_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_pic` longblob DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(30) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `education` text NOT NULL,
  `skills` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `job_seeker_id` int(11) NOT NULL,
  `job_posting_id` int(11) NOT NULL,
  `send_notification` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `full_name`, `user_type`, `created_at`, `updated_at`) VALUES
(117, 'techgiants', 'techgiants@example.com', '$2b$12$PqaEygeV5M3kZw9wgshkG.R1.j4.gK/8UvApNdQZgrwcNYLA9z2JC', 'Tech Giants Inc.', 'employer', '2024-10-29 05:20:18', '2024-10-29 05:20:18'),
(118, 'greenenergy', 'greenenergy@example.com', '$2b$12$ZkvXKrfU6eLbczwR0jN4SeM1k6pHNRW6avhg7fkkABF9Ux8GAVAmq', 'Green Energy Solutions', 'employer', '2024-10-29 05:20:18', '2024-10-29 05:20:18'),
(119, 'medilife', 'medilife@example.com', '$2b$12$QE7uWJsjLJWopj9YijGRve5nPuWH9AYuxR62W73i5Cu8CS2S611.y', 'MediLife Healthcare', 'employer', '2024-10-29 05:20:19', '2024-10-29 05:20:19'),
(120, 'finadvancers', 'finadvancers@example.com', '$2b$12$rMuuwL/oia8qJUVoqm.E9ehGfo7S/289JWDuVhXNtIcCsv9r2ZQlK', 'Finance Advancers Ltd.', 'employer', '2024-10-29 05:20:19', '2024-10-29 05:20:19'),
(121, 'edutopia', 'edutopia@example.com', '$2b$12$KNTXwU7MLDUq3m9Eiy8pYOCq3TzvS4i58JfpaQ2btYeHEWsvLtL9G', 'Edutopia International', 'employer', '2024-10-29 05:20:20', '2024-10-29 05:20:20'),
(122, 'aeroeng', 'aeroeng@example.com', '$2b$12$BoxL82iFwlNHFMYFczSimO.bvsPj7nRPG0ToCYlataPO18FBD5ebe', 'Aero Engineering Corp.', 'employer', '2024-10-29 05:20:20', '2024-10-29 05:20:20'),
(123, 'fashionista', 'fashionista@example.com', '$2b$12$dpGeZcsgjNA1/315LpBLfeYg9Buefen9QcFDihTRmAFWQx4S4hD5O', 'Fashionista Apparel', 'employer', '2024-10-29 05:20:20', '2024-10-29 05:20:20'),
(124, 'logistix', 'logistix@example.com', '$2b$12$P2dayMjBkUOxL3rhIR/rfOyA2ckTnvYLlF1JhGSTDD.ki183al7ZS', 'Logistix Solutions', 'employer', '2024-10-29 05:20:21', '2024-10-29 05:20:21'),
(125, 'bionext', 'bionext@example.com', '$2b$12$jrQdi8zTE5u9CwzxerZq9uBN/URWkxPXm1hTPi7V6If7hu1CsXxrK', 'BioNext Pharmaceuticals', 'employer', '2024-10-29 05:20:21', '2024-10-29 05:20:21'),
(126, 'automax', 'automax@example.com', '$2b$12$g.d9zPmHyApuWgPfft5m0e9Xaol0igvZktDpPk2J/d5xLAODJ92Ym', 'AutoMax Motors', 'employer', '2024-10-29 05:20:21', '2024-10-29 05:20:21'),
(127, 'softworld', 'softworld@example.com', '$2b$12$vcGx11lk/6Q1.wGxbgq0D.hOysiisZxoe2uZW5rqZXerme8D1wVVC', 'SoftWorld Technologies', 'employer', '2024-10-29 05:20:22', '2024-10-29 05:20:22'),
(128, 'foodworks', 'foodworks@example.com', '$2b$12$LHGgsIaTRv7OanvNEO149O6f5ov1367IlhR.Z27B/IIx49GCUQijK', 'FoodWorks Enterprises', 'employer', '2024-10-29 05:20:22', '2024-10-29 05:20:22'),
(129, 'cloudzone', 'cloudzone@example.com', '$2b$12$D9BhBif/DUEi5CgJkFekbOn6dqNGUyoKphVK.ZbhOkKB/6zchxKvy', 'CloudZone Services', 'employer', '2024-10-29 05:20:22', '2024-10-29 05:20:22'),
(130, 'urbandev', 'urbandev@example.com', '$2b$12$0cLOcYQtAvNHTZZ.OiRHs.vY0tpr7cngo/MzKh19dVw8Tab9QYbae', 'Urban Development Corp.', 'employer', '2024-10-29 05:20:23', '2024-10-29 05:20:23'),
(131, 'autohaven', 'autohaven@example.com', '$2b$12$mnjsO2mZ7JLRDQC9lMl2..O3uzylhd94bw.nGtn.h2laYq8.8XCbW', 'AutoHaven Manufacturing', 'employer', '2024-10-29 05:20:23', '2024-10-29 05:20:23'),
(132, 'aquaearth', 'aquaearth@example.com', '$2b$12$gaE3AGssFKC7IOHtYpRqWuptn6zLcyVzs1odGGJeMkQ0yEqEP86nG', 'AquaEarth Solutions', 'employer', '2024-10-29 05:20:23', '2024-10-29 05:20:23'),
(133, 'telecomplus', 'telecomplus@example.com', '$2b$12$6qYJj/kpp0RD3wzo8paAOurkUJ/tol4qSTpu26EtaCx3P0xLDVVRG', 'Telecom Plus Ltd.', 'employer', '2024-10-29 05:20:24', '2024-10-29 05:20:24'),
(134, 'urbanstyle', 'urbanstyle@example.com', '$2b$12$k66paLzBvTz1ZASEXODiYupLhNNMHsKXejfl.XZF9uqdYGwI67txC', 'UrbanStyle Clothing', 'employer', '2024-10-29 05:20:24', '2024-10-29 05:20:24'),
(135, 'medtech', 'medtech@example.com', '$2b$12$OCNdCUiLnGQjtu/qd7r//eIJR3IreTklqTX8hmocb.iUlpSTmoNoW', 'MedTech Innovations', 'employer', '2024-10-29 05:20:24', '2024-10-29 05:20:24'),
(136, 'spaceworks', 'spaceworks@example.com', '$2b$12$YYIsXWAKjD.kzV/KIt28RuKGVM9U7z7eGo4BU3.JOV/jSASZDymgq', 'SpaceWorks Inc.', 'employer', '2024-10-29 05:20:25', '2024-10-29 05:20:25'),
(137, 'buildmax', 'buildmax@example.com', '$2b$12$IaWFizocC9QNTlws6XwDJuT17LgOsWAmJQW5EL0TdmuKYYd1AK2/6', 'BuildMax Construction', 'employer', '2024-10-29 05:20:25', '2024-10-29 05:20:25'),
(138, 'greentech', 'greentech@example.com', '$2b$12$3nDsrnxuZ3CLhP3t60vJ3OS0VZoirXO.rxpgvh3gXTRyPaMXOQl1S', 'GreenTech Ventures', 'employer', '2024-10-29 05:20:25', '2024-10-29 05:20:25'),
(139, 'airplus', 'airplus@example.com', '$2b$12$zJ.L2p6K.hWiUZY00Qb2luRgZp0rOZ6hOuvOgh0LFG0NJPT/.nJ5u', 'AirPlus Airlines', 'employer', '2024-10-29 05:20:26', '2024-10-29 05:20:26'),
(140, 'legalworks', 'legalworks@example.com', '$2b$12$6DccgZkV7ydS1yhTcP9/begqmCPzn1Ee51TXglMLeUXhtLUC6rR/i', 'LegalWorks LLP', 'employer', '2024-10-29 05:20:26', '2024-10-29 05:20:26'),
(141, 'biomax', 'biomax@example.com', '$2b$12$Z5w9SPjtB.hQ8AQSRI7Ui.xFyuCqtPqF2WX/ya9sjkzCwnezyflfm', 'BioMax Research', 'employer', '2024-10-29 05:20:26', '2024-10-29 05:20:26'),
(142, 'agrifield', 'agrifield@example.com', '$2b$12$UiKDbtyaj9Qa8OWcFv4kvOOExKeiOAlF60eW33elJ6sZteVI/jVMq', 'AgriField Industries', 'employer', '2024-10-29 05:20:27', '2024-10-29 05:20:27'),
(143, 'networksunited', 'networksunited@example.com', '$2b$12$E5e2ntOril7CA9iqI0F0vOM2G6VKM9bfRuROjNQdBAfbl6zi62AP.', 'Networks United', 'employer', '2024-10-29 05:20:27', '2024-10-29 05:20:27'),
(144, 'educare', 'educare@example.com', '$2b$12$jeFZw4p1LIgLkX06Oz5BwOe/ooVmZzlcdvYZyOHq6J49cHAHXvWj2', 'EduCare Academy', 'employer', '2024-10-29 05:20:27', '2024-10-29 05:20:27'),
(145, 'cybersolutions', 'cybersolutions@example.com', '$2b$12$.TRQghEemCWiMUppTTqLlO2wd3IfFNPkgP/EpBzRmGTmEdlqKofky', 'CyberSolutions Ltd.', 'employer', '2024-10-29 05:20:28', '2024-10-29 05:20:28'),
(146, 'touristhub', 'touristhub@example.com', '$2b$12$zKGyVJuH3JKII.o5lax.Fexrg2QxhvyXlH6gI0.yEQ2Kg/KYCqScW', 'TouristHub Travel', 'employer', '2024-10-29 05:20:28', '2024-10-29 05:20:28'),
(147, 'designplus', 'designplus@example.com', '$2b$12$4lCfkagWJ3i18glhy4YkbuMuIUHZMzHY1nbyY1wu6x.bJ9RdAyqP.', 'DesignPlus Studios', 'employer', '2024-10-29 05:20:28', '2024-10-29 05:20:28'),
(148, 'techwave', 'techwave@example.com', '$2b$12$Q54NsdVzA6pAICHB4xCbJOxafCf9M.z5K41a36vt1m7BsyCcktof6', 'TechWave Systems', 'employer', '2024-10-29 05:20:29', '2024-10-29 05:20:29'),
(149, 'smartfoods', 'smartfoods@example.com', '$2b$12$BZyYmpdyQr42u55vM.euhONG9U6IvuzHdz933XuX6zhvwIh9MHDta', 'SmartFoods Inc.', 'employer', '2024-10-29 05:20:29', '2024-10-29 05:20:29'),
(150, 'inspireedu', 'inspireedu@example.com', '$2b$12$SwpyLm04W2R7w8sNg/BkPeg4sjWFCBXBPrvF2PkjOAPYOg8fMLn/e', 'Inspire Education Group', 'employer', '2024-10-29 05:20:29', '2024-10-29 05:20:29'),
(151, 'healthfirst', 'healthfirst@example.com', '$2b$12$M.mTRhAQxe7qmfuWz5j5JuIWofbJkH./yhrDpk9ge.sTvTZASmYrG', 'HealthFirst Medical', 'employer', '2024-10-29 05:20:30', '2024-10-29 05:20:30'),
(152, 'futuremobility', 'futuremobility@example.com', '$2b$12$9PynENwQbD4p/HVgNHC5X.N.gHbqYb8kTak70otHJ5..hvbE0QrCG', 'Future Mobility Corp.', 'employer', '2024-10-29 05:20:30', '2024-10-29 05:20:30'),
(153, 'blueocean', 'blueocean@example.com', '$2b$12$3LFDl9vRu9ZgF.3KunFX3exeRFwdoNsH2twOkFwhG6QpxCCFNa8jm', 'BlueOcean Logistics', 'employer', '2024-10-29 05:20:30', '2024-10-29 05:20:30'),
(154, 'urbantech', 'urbantech@example.com', '$2b$12$AyY1k1nROrO6bidU6XoKZ.mxiEHT0b0haedTghM1//mdhGpMaQ.4e', 'UrbanTech Innovations', 'employer', '2024-10-29 05:20:30', '2024-10-29 05:20:30'),
(155, 'nextgenfinance', 'nextgenfinance@example.com', '$2b$12$2rpC1A2IEpIKBKVtZrhkkerJ/LP1.5N7MXkUYLHPmgCud5e3Ax5ta', 'NextGen Finance Ltd.', 'employer', '2024-10-29 05:20:31', '2024-10-29 05:20:31'),
(156, 'ecoenergy', 'ecoenergy@example.com', '$2b$12$KFpJgNg1PZkDYgJDDo3SeOeashasvyTqXDyAanRCkCQ3/DqYmTtSy', 'EcoEnergy Systems', 'employer', '2024-10-29 05:20:31', '2024-10-29 05:20:31'),
(157, 'healthzone', 'healthzone@example.com', '$2b$12$oqsCD8Pdp3Ts1mw0s8hzJeeXzvUVV2oNk9Xtlv7uUhrHEMuPa1ffu', 'HealthZone Pharmaceuticals', 'employer', '2024-10-29 05:20:31', '2024-10-29 05:20:31'),
(158, 'cloudgenius', 'cloudgenius@example.com', '$2b$12$4vqpy8JKzDmdThwCXNtJ2.dNXj.JIx3bM0cMnTyETr75DS.QcdtQK', 'CloudGenius Solutions', 'employer', '2024-10-29 05:20:32', '2024-10-29 05:20:32'),
(159, 'digispace', 'digispace@example.com', '$2b$12$pN3TxNq.AVOhuwwEmiCCw.T8mtpIOh9JkW/JmFiQBl4EAFQ36l1fG', 'DigiSpace Media', 'employer', '2024-10-29 05:20:32', '2024-10-29 05:20:32'),
(160, 'techconnect', 'techconnect@example.com', '$2b$12$R1LHiq1NtTr4ibBl77id3uJBPQkE3a5M34wFyf1ThKZDdR0h7dFVu', 'TechConnect Group', 'employer', '2024-10-29 05:20:32', '2024-10-29 05:20:32'),
(161, 'brightfuture', 'brightfuture@example.com', '$2b$12$f94y60lm1ZtR2G8PipIfgeBt1kWOyW7JplFEMcEk11WOe953d5U.i', 'BrightFuture Education', 'employer', '2024-10-29 05:20:33', '2024-10-29 05:20:33'),
(162, 'airlift', 'airlift@example.com', '$2b$12$kC5VMx15GRkfDR709FRM2.pSTXEtnZhbNgTd5XycFI5uHV3eHw6lK', 'AirLift Logistics', 'employer', '2024-10-29 05:20:33', '2024-10-29 05:20:33'),
(163, 'cityworks', 'cityworks@example.com', '$2b$12$gYPcBPHyZtZoYLP/b6gLv.T.f830bqbctozkyXLIFs2kpAv4iwOgy', 'CityWorks Development', 'employer', '2024-10-29 05:20:33', '2024-10-29 05:20:33'),
(164, 'globaltrade', 'globaltrade@example.com', '$2b$12$azRGsnRMoR.zjIzdCq7Tn.4KlMg5XU523eSskCJAdndlhvJwNytsq', 'Global Trade Solutions', 'employer', '2024-10-29 05:20:34', '2024-10-29 05:20:34'),
(165, 'foodchain', 'foodchain@example.com', '$2b$12$r8evI3oBhiq8DZ.SmkygXOQvfxqeQLIEDelLw4qGH3Qc5x1QX929G', 'FoodChain Ltd.', 'employer', '2024-10-29 05:20:34', '2024-10-29 05:20:34'),
(166, 'autotech', 'autotech@example.com', '$2b$12$R2vi9oLlRkEeXypand6DwOOQd5PUVZcuo8NjS.b89nP1erFykZMVK', 'AutoTech Innovations', 'employer', '2024-10-29 05:20:34', '2024-10-29 05:20:34'),
(167, 'telemedia', 'telemedia@example.com', '$2b$12$I7eSVwC1H/oo79PfFySmgeuzVgxvGW4ZLUZpHeTuEQ/wOXh09rZ/G', 'TeleMedia Corp.', 'employer', '2024-10-29 05:20:35', '2024-10-29 05:20:35'),
(168, 'nextgenbio', 'nextgenbio@example.com', '$2b$12$xJLHn.yd9CHhCiXUJRrtoOnFpnCsSlftI3u7QLRswsUb0VZC6Jc1.', 'NextGen Biotech', 'employer', '2024-10-29 05:20:35', '2024-10-29 05:20:35'),
(169, 'brightlights', 'brightlights@example.com', '$2b$12$QejV84YosItyv/X1fK3iWuXfJfoJHuw7/4zwWUjyXXBUCX5QQ7QQG', 'BrightLights Entertainment', 'employer', '2024-10-29 05:20:35', '2024-10-29 05:20:35'),
(170, 'fastcourier', 'fastcourier@example.com', '$2b$12$ys/6ANvEcbqeVIoO1cYrj.VW3IndzT/D3bNMdRSwJGwI/yK33r..W', 'FastCourier Services', 'employer', '2024-10-29 05:20:36', '2024-10-29 05:20:36'),
(171, 'solargrid', 'solargrid@example.com', '$2b$12$NyqfNW12KLuxplZml7oRkOpF15a0dRsDVqeJSxjIJKIleLs4.E.22', 'SolarGrid Energy', 'employer', '2024-10-29 05:20:36', '2024-10-29 05:20:36'),
(172, 'luxurytravels', 'luxurytravels@example.com', '$2b$12$nX1Bawz2kClyLpx7/jT4R.KsgqwKZbRFoQXmGb6MYxTw1MqUoi1a6', 'Luxury Travels Ltd.', 'employer', '2024-10-29 05:20:36', '2024-10-29 05:20:36'),
(173, 'smartlogix', 'smartlogix@example.com', '$2b$12$FJNj8DMdpkHEJROubS/6Du57j0pc/sMZ17qOmTIZtFdx3I8nlin.m', 'SmartLogix Solutions', 'employer', '2024-10-29 05:20:37', '2024-10-29 05:20:37'),
(174, 'lifecare', 'lifecare@example.com', '$2b$12$qb1DyT1mNNyVEppxfW7MDewAkfjSrSL3o4hhaBDQLywtnWH0Pf2rm', 'LifeCare Medical Center', 'employer', '2024-10-29 05:20:37', '2024-10-29 05:20:37'),
(175, 'techbridge', 'techbridge@example.com', '$2b$12$tmM6NOCP7AfsgvllS1Nv6e0bU8xHzsm8USnpUzNVvvLQMGmOuazoS', 'TechBridge Innovations', 'employer', '2024-10-29 05:20:37', '2024-10-29 05:20:37'),
(176, 'cityfood', 'cityfood@example.com', '$2b$12$DkuWBKWlnDhXz.CSifs0y.Kf0kl1OqYkJgc2Ll0oFxhfZ2sUi0sRS', 'CityFood Inc.', 'employer', '2024-10-29 05:20:37', '2024-10-29 05:20:37'),
(177, 'medlabs', 'medlabs@example.com', '$2b$12$GHWhj6bOHo/WnUAvmE8bj.xNeQMa.KBApS6U3xVnwGIhaEXCEVSeu', 'MedLabs Research', 'employer', '2024-10-29 05:20:38', '2024-10-29 05:20:38'),
(178, 'greengroove', 'greengroove@example.com', '$2b$12$D342jrERvuA4Zccvbe4MCu1sXoDwdZfEW2MTff/dXREJA4Xr//9xu', 'GreenGroove Ventures', 'employer', '2024-10-29 05:20:38', '2024-10-29 05:20:38'),
(179, 'aeroworks', 'aeroworks@example.com', '$2b$12$8wHCsCt5SQjuXcA5riTHju9Ct4mObrOj1zys4X6/H9LwXTED98D5G', 'AeroWorks Ltd.', 'employer', '2024-10-29 05:20:38', '2024-10-29 05:20:38'),
(180, 'futurebuild', 'futurebuild@example.com', '$2b$12$DXNCZ4YD97IZO313xGq26.ku.BK9nLw.sN3WDlgXp8JgD8DuEMtpm', 'FutureBuild Construction', 'employer', '2024-10-29 05:20:39', '2024-10-29 05:20:39'),
(181, 'metrohealth', 'metrohealth@example.com', '$2b$12$dLKU5Diz7LAbyxeB322GEOjebphYqEFFeKGiJr91m8IqUb6VLmTFG', 'MetroHealth Medical Group', 'employer', '2024-10-29 05:20:39', '2024-10-29 05:20:39'),
(182, 'innovativehealth', 'innovativehealth@example.com', '$2b$12$uaLN7537rYkAvvO0uiyNdOIWIeUZbYp7hMz8R/F83NzuZwMMoup5W', 'Innovative Health Solutions', 'employer', '2024-10-29 05:28:04', '2024-10-29 05:28:04'),
(183, 'digitaldreams', 'digitaldreams@example.com', '$2b$12$uLyQmtpaMjuWekPJ3r74rO/5aYhS8GIZB79GE5U3N0HE19f7x3tlO', 'Digital Dreams Agency', 'employer', '2024-10-29 05:28:05', '2024-10-29 05:28:05'),
(184, 'fintechfusion', 'fintechfusion@example.com', '$2b$12$KVyHyQiyjyKB/14Onws9Wuo/pl.5vk4TdawsB4emMnMBDhlllUWvO', 'FinTech Fusion', 'employer', '2024-10-29 05:28:05', '2024-10-29 05:28:05'),
(185, 'urbanenergy', 'urbanenergy@example.com', '$2b$12$nnpep.Ra1SoqOWFtHlonfus4AROqLTplJxTRHAzfmxpsOki/ZdIqm', 'Urban Energy Solutions', 'employer', '2024-10-29 05:28:06', '2024-10-29 05:28:06'),
(186, 'sustainably', 'sustainably@example.com', '$2b$12$K1iCQQaUVVZIiFkuVI/9zOg.2oGu5OFzArgY.RyN/K3x88Tn5N49q', 'Sustainably Managed Co.', 'employer', '2024-10-29 05:28:06', '2024-10-29 05:28:06'),
(187, 'agriinnovate', 'agriinnovate@example.com', '$2b$12$x0cgL8O2YiUiEuiJ0DL4v.B./tMJVXJbajtPpt7eCJLceSRHp7KN.', 'AgriInnovate Technologies', 'employer', '2024-10-29 05:28:06', '2024-10-29 05:28:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `app_post` (`job_posting_id`),
  ADD KEY `app_seeker` (`job_seeker_id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`employer_id`),
  ADD KEY `employer_to_users` (`user_id`);

--
-- Indexes for table `job_posting`
--
ALTER TABLE `job_posting`
  ADD PRIMARY KEY (`job_posting_id`),
  ADD KEY `post_employer` (`employer_id`);

--
-- Indexes for table `job_seekers`
--
ALTER TABLE `job_seekers`
  ADD PRIMARY KEY (`job_seeker_id`),
  ADD KEY `job_seekers_to_users` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `notification_to_employer` (`employer_id`),
  ADD KEY `notification_to_jobseeker` (`job_seeker_id`),
  ADD KEY `notificatio_to_jobposting` (`job_posting_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `employer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `job_posting`
--
ALTER TABLE `job_posting`
  MODIFY `job_posting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `job_seekers`
--
ALTER TABLE `job_seekers`
  MODIFY `job_seeker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `app_post` FOREIGN KEY (`job_posting_id`) REFERENCES `job_posting` (`job_posting_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_seeker` FOREIGN KEY (`job_seeker_id`) REFERENCES `job_seekers` (`job_seeker_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_posting`
--
ALTER TABLE `job_posting`
  ADD CONSTRAINT `post_employer` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_seekers`
--
ALTER TABLE `job_seekers`
  ADD CONSTRAINT `job_seekers_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notificatio_to_jobposting` FOREIGN KEY (`job_posting_id`) REFERENCES `job_posting` (`job_posting_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_to_employer` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_to_jobseeker` FOREIGN KEY (`job_seeker_id`) REFERENCES `job_seekers` (`job_seeker_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
