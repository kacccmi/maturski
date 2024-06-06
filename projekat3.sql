-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 10:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekat3`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `autor_id` int(11) NOT NULL,
  `autor_ime` varchar(256) NOT NULL,
  `autor_eadresa` varchar(191) NOT NULL,
  `autor_lozinka` varchar(256) NOT NULL,
  `autor_info` longtext NOT NULL,
  `autor_uloga` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`autor_id`, `autor_ime`, `autor_eadresa`, `autor_lozinka`, `autor_info`, `autor_uloga`) VALUES
(1, 'Администратор', 'mihailo.petrovic@valjevskagimnazija.edu.rs', 'admin', 'Vlasnik', 'admin'),
(2, 'Корисник', 'it@valjevskagimnazija.edu.rs', '$2y$10$zR1OGz30bkHi1vn9NdjJ5ehtuXnd7uK30XSeG7OVL7PWV.98xIwNa', 'Кориснички налог', 'admin'),
(3, 'Уредник', 'mp@gmail.com', '$2y$10$p5Ah0R31zxDrnvpvvrxbFOC9F6u1WDEZ5bRvoGf8M72Y6JnKKeOGq', 'Основне информације о уреднику', 'autor');

-- --------------------------------------------------------

--
-- Table structure for table `clanak`
--

CREATE TABLE `clanak` (
  `clanak_id` int(20) NOT NULL,
  `clanak_naslov` varchar(256) NOT NULL,
  `clanak_sadrzaj` longtext NOT NULL,
  `clanak_kategorija` int(20) NOT NULL,
  `clanak_autor` int(20) NOT NULL,
  `clanak_datum` varchar(256) NOT NULL,
  `clanak_reci` varchar(256) NOT NULL,
  `clanak_slika` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clanak`
--

INSERT INTO `clanak` (`clanak_id`, `clanak_naslov`, `clanak_sadrzaj`, `clanak_kategorija`, `clanak_autor`, `clanak_datum`, `clanak_reci`, `clanak_slika`) VALUES
(9, 'Audi A6 E-Tron', '<p><span style=\"--darkreader-inline-color: #cfcbc4; color: #dbd8d3;\" data-darkreader-inline-color=\"\"><span style=\"font-size: 28px;\">Датум изласка: 2024</span></span></p>\r\n<p><span style=\"--darkreader-inline-color: #cfcbc4; color: #dbd8d3;\" data-darkreader-inline-color=\"\"><span style=\"font-size: 28px;\">&nbsp;</span></span></p>\r\n<p><span style=\"--darkreader-inline-color: #cfcbc4; color: #dbd8d3;\" data-darkreader-inline-color=\"\"><span style=\"font-size: 28px;\">Већ смо видели Ауди А6 Е-Трон у форми концепта (слика приказана овде), али производна верзија би требало да дебитује негде касније следеће године пре него што крене у продају. Са Аудијевом скалабилном премиум платформом електричном (ППЕ) архитектуром испод, А6 Е-Трон ће имати могућност пуњења од 800 волти и нудити домет до 400 миља. Најмоћнија верзија би такође могла да има 469 КС преко два електромотора.</span></span></p>', 3, 1, '07/09/22', 'Audi', 'slike/664649724e2123.39125953.jpg'),
(10, 'Нови Xiaomi SU7', '<p><span class=\"Y2IQFc\" lang=\"sr\">Xiaomi SU7 је батеријски електрични седан пуне величине који је развила кинеска компанија Xiaomi Auto, подружница кинеске компаније за потрошачку електронику Xiaomi. То је прво Xiaomi возило, а производи га по уговору BAIC Off-road у Пекингу. Најављен је у децембру 2023. Аутомобил је званично представљен 28. марта 2024. у Пекингу, а Xiaomi је тог дана почео да прима поруџбине за аутомобил. Према Xiaomi-ју, \'SU\' значи \'Speed ultra\', а број 7 означава тржишни сегмент аутомобила. &bdquo;SU&ldquo; такође може бити референца на кинеску реч 速 (су), што значи &bdquo;брзина&ldquo;. SU7 је доступан у три верзије, а то су SU7, SU7 Pro и SU7 Max.</span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"Y2IQFc\" lang=\"sr\">SU7 је изграђен на 800-волтној електричној архитектури са максималним напоном од 871 волти. Компанија продаје електричне моторе које користи SU7 као \"HyperEngine V6 Series\". Основни SU7 са погоном на задње точкове ради са 400 волти са оценом снаге од 220 кВ (295 КС; 299 КС) и 400 Н&sdot;м (40,8 кг&sdot;м; 295 лб&sdot;фт). SU7 Max са погоном на све точкове ради на 800 волти и пружа укупно 495 кВ (664 КС; 673 КС) и 500 Нм (51,0 кг&sdot;м; 369 лб&sdot;фт).</span></p>\r\n<p><span class=\"Y2IQFc\" lang=\"sr\">SU7 Max користи НМЦ батерију од 101 кВх коју производи CALT и брендиран као Qilin монтирана у формату од ћелије до паковања. Основни SU7 са погоном на задње точкове користи мању ЛФП батерију од 73,6 кВ. Xiaomi такође планира да објави верзије са батеријама од 132 кВх и 150 кВх. Према Xiaomi, основни SU7 може да убрза од 0&ndash;100 км/х (0&ndash;62 мпх) за 5,3 секунде, док SU7 Max убрзава од 0&ndash;100 км/х (0&ndash;62 мпх) за 2,78 секунди. Брзина је ограничена на 210 км/х (130 мпх) за основни модел и 265 км/х (165 мпх) за SU7 Max.</span></p>', 3, 1, '07/09/22', 'Xiaomi, automobil, car, sedan', 'slike/664647e4098974.28508741.jpg'),
(11, 'Dodge Charger Daytona SRT EV', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Датум изласка: 2024</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Почивај у миру тренутној Додге линији какву познајемо. Ускоро ће Цхаргер Даитона СРТ ЕВ живети на местима тренутних Цхаргер-а и Цхалленгер-а. Већ смо га видели у облику прототипа, али када званично буде дебитовао следеће године, Даитона СРТ ЕВ ће имати до 600 КС и електричну архитектуру од 800 волти испод која би требало да му пружи око 500 миља домета.</span></p>', 3, 1, '07/09/22', '', 'slike/664649d3d2cba8.38435520.jpg'),
(12, 'Audi', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Audi AG (нем. Audi AG) је немачки произвођач луксузних, спортских и суперспорт аутомобила и члан Фолксваген групе са седиштем у Инголштату, у Баварској. Фолксваген је обновио бренд, лансирањем модела Ауди F103, 1965. године. До 1966. године, постаје власник 99,55% акција компаније, купујући у фазама акције од пређашњег власника Дајмлер-Бенца.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Име компаније потиче од презимена оснивача Аугуста Хорха. Оснивач је назвао компанију, преводећи своје презиме на латински. Хорх које на немачком значи &bdquo;слушати&ldquo;. Компанија је званично основана 1909. године, да би се 1932. интегрисала у јединствену компанију са још три произвођача. Четири прстена у амблему, управо представљају аутомобилске компаније које се удружине и створиле Ауто унију. Слоган Аудија на немачком гласи &bdquo;Vorsprung durch Technik&ldquo;, што значи &bdquo;Напредак кроз технику&ldquo;.</span></p>', 2, 1, '07/09/22', '', 'slike/66464d7e7d2d97.00743264.png'),
(14, 'Aston Martin Valhalla', '<p><span style=\"color: #e8eaed; font-family: arial, sans-serif; font-size: 28px; white-space-collapse: preserve; background-color: #303134; --darkreader-inline-color: #dbd8d3; --darkreader-inline-bgcolor: #26292a;\" data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Датум изласка: 2024</span></p>\r\n<p><span class=\"Y2IQFc\" lang=\"sr\">Валхалла са средњим мотором биће следећи супераутомобил у линији Астон Мартина. Очекивано почетком 2024. године, Астон Мартин Валхалла ће наводно имати В8 мотор равног авиона и могао би имати снагу од 900 КС са очекиваним временом од 0-60 од око три секунде.</span></p>', 3, 1, '07/09/22', '', 'slike/664648b88fb3a3.06423419.jpg'),
(15, 'Rolls-Royce Motor Cars', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Ролс-Ројс је британски произвођач луксузних аутомобила чија традиција датира из 1904. и чије се власништво и званично име мењало више пута током историје.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Данашња компанија, &bdquo;Ролс-Ројс Мотор Карс&ldquo; (енгл. Rolls-Royce Motor Cars) је британски огранак немачке фирме BMW у чијем је потпуном власништву. Седиште компаније се налази у Гудвуду у западном Сасексу у Енглеској. Производи аутомобиле марке &bdquo;Ролс-Ројс&ldquo;.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Хенри Ројс је 1884. са уштеђевином од 20 фунти и учешћем свог пријатеља Ернеста Клермонта од још 50 фунти отворио електричарску и механичарску радионицу у Манчестеру, под именом &bdquo;Ф. Х. Ројс и Друштво&ldquo; енгл. F H Royce and Company. Током 1894. су почели да производе динамо моторе и електричне дизалице, и фирма је пререгистрована у друштво са ограниченом одговоршношћу &bdquo;Ројс Лимитид&ldquo; енгл. Royce Ltd. а са приливом капитала отвара фабрику у Трафорд Парку, у Мачестеру.</span></p>', 2, 1, '07/09/22', '', 'slike/664650f4749c24.30628402.png'),
(16, 'Mercedes-Benz EQA Sedan', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Датум изласка: 2024</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Мерцедесова линија пролази кроз еволуцију која ће ускоро видети да ће сваки аутомобил на гас прећи на напајање из батерија, укључујући и неке од најмањих понуда компаније. Мерцедес ЕКА лимузина (не СУВ који је већ у продаји) требало би да стигне 2024. године као почетни ЕВ за овај бренд. Користећи моделе ЦЛА и А-Класе на гас као инспирацију, ЕКА би требало да има елегантан купе стил са четворо врата и најмање 200 КС.</span></p>', 3, 1, '07/09/22', '', 'slike/66464a5ed79510.30401416.jpg'),
(17, 'Lamborghini', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Ламборгини (итал. Lamborghini) италијански је произвођач спортских аутомобила врхунских перформанси чије је седиште у малом италијанском селу Сант\'Агата Болоњезе у близини Болоње. Ламборгини је данас у власништву немачког произвођача Ауди АГ, које је у ствари предузеће у власништву Фолксваген групе.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Предузеће Аутомобили Ламборгини је основано од стране Феручa Ламборгинија, који је дете виноградара из општине Ренацо ди Ћенто, провинције у Ферари, Италија.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Након што је радио као механичар у авијацији за време Другог светског рата, Ламборгини је кренуо у посао производње трактора од остатака војне опреме из рата. До средине 1950-их, Ламборгинијева компанија Ламборгини Трактори СпА је постала један од највећих произвођача пољопривредне опреме у земљи. Он је такође био власник успешне компаније за инсталацију гаса за грејање и клима-уређаја.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Ламборгинију богатство омогућава да гаји интерес из детињства за аутомобиле, поседујући луксузне аутомобиле као што су Алфа Ромео, Ланча, Мазерати и Мерцедес Бенц. Затим је купио свој први Ферари, 250ГТ из 1958, a затим још неколико. Ламборгини је био склон Ферарију, али је сматрао да је превише гласан и груб да буде прави путнички аутомобил, сматрајући их само болидима за Формулу 1.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">После бројних проблема са својим Фераријима, Феручo Ламборгини одлучује да се жали Енцо Ферарију. После дуго чекања да га прими саопштава Енцу да има проблеме са квачилом на првом месту и после многих сугестија како да усаврши аутомобиле Ферари му одговара: &bdquo;Можда си у стању да возиш трактор, али нећеш никада знати да возиш Ферари како треба!\" Сам Феручo Ламборгини је признао касније: \"Енцо Ферари је био велики човек, признајем, али било је веома лако изнервирати га&ldquo;.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Ламборгини је тада одлучио да започне производњу аутомобила, са циљем претварања у живот цвоје визије савршеног ГТ-a.</span></p>', 2, 1, '07/09/22', '', 'slike/66464ee2ccc0d8.44442209.png'),
(18, 'Rimac Automobili', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Rimac Automobili je hrvatska kompanija za proizvodnju vrhunskih električnih vozila osnovana 2009. godine sa sedi&scaron;tem u Svetoj Nedelji. Rimac Automobili je razvio i predstavio automobilski koncept električnog automobila Concept_One, koji je kasnije krenuo u serijsku proizvodnju. Prvi put je predstavljen svetskoj javnosti 2011. godine na najvećoj svetskoj izložbi automobila Internationale Automobil-Ausstellung u Frankfurtu.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Osnivač kompanije Rimac Automobili je Mate Rimac, koji je pretvorio svoj stari BMW E30 u trkačko električno vozilo.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Prvi primjerak modela Concept_One isporučen je 2013. godine &scaron;panskom kupcu, kompaniji Applus+ IDIADA. Automobil je dovr&scaron;en u četiri meseca, a cena je nepoznata.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Svoj prvi komercijalni model Concept_One koji će biti proizveden u svega osam primeraka, Rimac Automobili predstavili su na međunarodnom salonu automobila u Ženevi 1. marta 2016. godine.</span></p>', 2, 1, '07/09/22', '', 'slike/664650545109e1.54564590.png'),
(24, 'Sedan', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Лимузина је лични аутомобил који има четворо врата, опадајући облик код врата, нешто \"извученија\" врата пртљажника и по облику, доста личи на лифтбек и купе.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Лимузина је било који аутомобил таквог облика каросерије, понекад се тако често називају продужене stretch лимузине које су честе у САД, а разлог томе је што се тамо за &bdquo;обичне&rdquo; лимузине користи искључиво појам sedan.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Лимузина је као караван, само што један део крова од каравана нема, те има више хоризонталан, него вертикалан облик. Пошто има опадајућу линију крова, има мање места за главу позади, него караван.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Лимузине су име добиле према француској провинцији Лимузен, која се налази у средишњој Француској око града Лиможа и где су становници носили шешире облика сличног оном каросерије аутомобила овог модела.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">У Уједињеном Краљевству лимузина се назива saloon, у Француској berline, а у Италији berlina.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">За разлику од лифтбека, с којим дели исти облик, код лимузина се не отвара задње стакло заједно са вратима пртљажника.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">За разлику од купеа, с којим дели исти облик, лимузина има задња врата, што доприноси лимузини да има четири, а купе двоје врата.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Пошто се стакло са пртљажником не отвара, код некихлимузина постоји дугме или ручица у пртљажнику којом се обара седиште на задњој клупи.</span></p>', 1, 1, '07/09/22', '', 'slike/664651e7e39bd3.61471581.jpg'),
(25, 'Кабриолет', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Кабриолет је било који путнички аутомобил са металним или платненим кровом, којег је по потреби могуће електричним или ручним путем склопити иза путничке кабине или у пртљажник.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Међутим, за неке врсте кабриолета често се користе и посебни називи, па се тако спортски кабриолет са два седала назива родстер, спајдер или спидер. Модерни кабриолет са дводелним електрично склопивим металним кровом назива се и купе кабриолет или скраћено CC, будући да са подигнутим кровом има облик купеа.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Постоји и врста полукабриолета под називом тарга, а ради се о спортском купеу са два седала и једноделним металним кровом, који се по потреби може склонити ручним путем. Као пример тарге може се навести корвета у купе верзији.</span></p>', 1, 1, '07/09/22', '', 'slike/66465244358466.87266664.jpg'),
(26, 'Хечбек', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Хечбек (енгл. hatchback, hatch &ndash; отвор и back &ndash; задњи део, позади, назад) је назив аутомобила са једним или два реда седишта, код кога је засечен задњи део на коме се налазе трећа или пета врата пртљажног простора која се отварају нагоре заједно са задњим стаклом. Хечбек може да има други ред седишта на расклапање, која се спуштају у унутрашњости возила, ради стварања што већег пртљажног простора.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Хечбек верзије се углавном користе у малим и градским аутомобилима и код аутомобила ниже средње (компактне) класе са троја или петора врата, где је пртљажни простор смештен унутар кабине иза задњих седишта. Овај тип каросерије имају Шкода фабија, Форд фијеста, Фијат пунто, Дачија сандеро, Ситроен Ц3, Пежо 208, Лада самара, Југо флорида, Фолксваген голф, Тојота аурис, BMW серије 1, Алфа Ромео ђулијета, Мерцедес А класе и други.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Сама реч хечбек сугерише да се ради о скраћеном задњем делу каросерије у односу на лимузину или караван. Први аутомобили са хечбек верзијом појавили су се још тридесетих година 20. века, најпознатији такав је био Ситроен траксион авант. Први пут појам хечбек датира из седамдесетих година 20. века према речнику Меријам-Вебстера.</span></p>', 1, 1, '07/09/22', '', 'slike/664652efcfe1c7.38747308.jpg'),
(27, 'Пикап', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Пикап (енгл. Pickup truck, Pickup) или камионет је лаки камион са затвореном кабином и отвореним теретним простором са ниским странама и вратима пртљажника. Заснивају се на теренским возилима, који уз путничку кабину имају припојен отворени товарни простор. Пикапови могу бити са једним или два реда седишта и погоном на свим или само задњим точковима. Код верзија са два реда седишта, пртљажни простор је краћи, док верзије са једним редом седишта има дужи пртљажник. Платформа за утовар се на неким моделима може покрити церадом или структуром од фибергласа.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Према правилнику о подели моторних и прикључних возила и техничким условима за возила у саобраћају на путевима Републике Србије, пикап јесте возило највеће дозвољене масе која не прелази 3,5 тоне код кога товарни простор и места за седење нису у истој целини.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">У зависности од тржишта, пикапови могу да варирају у зависности од величине, конфигурације кабине и простора терета, вучне снаге, мотора и шасије. У Северној Америци и Азији, већина пикапова има чвршћу шасију, дужине између пет и шест метара. У Јужној Америци, Европи и другим областима у развоју постоје мања пикап возила, са самоносећом каросеријом, која су заснована на путничким возилима из Б-сегмента, дужине око 4,50 метра. Амерички и азијски камионети су углавном класична вучна возила са предњим мотором и погоном на задњим точковима или имају систем погона на сва четири точка, док европски камионети, базирани на компактним возилима, имају погон на предњим точковима.</span></p>', 1, 1, '07/09/22', '', 'slike/664653bc8b6857.45264828.jpg'),
(28, 'SUV sport utility vehicle', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Теренски аутомобил или теренац је врста аутомобила велике носивости, вучне снаге и путничког капацитета на нивоу каравана или комбија, а који је опремљен свим елементима потребним за вожњу изван асфалта (енгл. off-road). Најважнији елементи који један теренац мора да има су погон на свим точковима, редуктор, блокаду диференцијала, велики клиренс (удаљеност од тла) и велики точкови.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">На енглеском језику теренци се називају SUV, sport utility vehicle или suburban utility vehicle. Према речнику Меријам-Вебстера, SUV је робусно возило слично каравану изграђено на шасији лаког теретног возила.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Теренце користи војска, погранична полиција, ловци и шумари, а први пут су их почели производити америчка компанија Џип почетком Другог светског рата, због чега их велики број људи назива џиповима. Били су популарни крајем 20. века и почетком 21. века, а нешто касније тражња за теренцима је опала услед поскупљења горива и економске кризе. Традиционални теренци су постепено потиснути од стране кросовера, врста теренског аутомобила углавном намењен градској вожњи и који има мању тежину и бољу ефикасност у потрошњи горива. Од 2010. године расте потражња за кросоверима и теренцима.</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-family: Open Sans, Arial, sans-serif;\">Теренци имају одвојиву носиву структуру од шасије. Код теренаца носива структура је оквир, челични носач састављен од два уздужна и више попречних елемената. Због начина конструкције и одвојивог оквира возила, поправци су једноставнији, поготово ако је у питању саобраћајна незгода.</span></p>', 1, 1, '07/09/18', '', 'slike/66465178e94869.71026294.png'),
(30, 'Porsche', '<p><span style=\"--darkreader-inline-color: #c2bdb5; color: #c9c5be; font-family: sans-serif;\" data-darkreader-inline-color=\"\">Порше, је немачки произвођач аутомобила специјализован за луксузне, спортске аутомобиле високих перформанси, СУВ и лимузине, са седиштем у Штутгарту, Баден-Виртемберг, Немачка . Компанија је у власништву Фолксваген АГ, чији је контролни пакет у власништву Порше Аутомобил Холдинг СЕ. Поршеова тренутна линија укључује моделе 718, 911, Панамера, Мацан, Цаиенне и Таицан.</span></p>\r\n<p><span style=\"--darkreader-inline-color: #c2bdb5; color: #c9c5be; font-family: sans-serif;\" data-darkreader-inline-color=\"\">&nbsp;</span></p>\r\n<p><span style=\"--darkreader-inline-color: #c2bdb5; color: #c9c5be; font-family: sans-serif;\" data-darkreader-inline-color=\"\">Порекло компаније датира из 1930-их када је чешко-немачки инжењер аутомобила Фердинанд Порше основао Порше са Адолфом Розенбергером, кључном фигуром у стварању немачког произвођача аутомобила и Ауди претходника Ауто Унион-а, и аустријским бизнисменом Антоном Пиехом , који је у то време био и зет Фердинанда Поршеа. У првим данима, немачка влада га је уговорила да направи возило за масе, које је касније постало Фолксваген буба. После Другог светског рата, када је Фердинанд био ухапшен због ратних злочина, његов син Фери Порше је почео да прави сопствени аутомобил, што је резултирало Поршеом 356.</span></p>\r\n<p><span style=\"--darkreader-inline-color: #c2bdb5; color: #c9c5be; font-family: sans-serif;\" data-darkreader-inline-color=\"\">&nbsp;</span></p>\r\n<p><span style=\"--darkreader-inline-color: #c2bdb5; color: #c9c5be; font-family: sans-serif;\" data-darkreader-inline-color=\"\">Порше је 2009. године склопио споразум са Фолксвагеном о стварању \'интегрисане радне групе\' спајањем производње аутомобила две компаније. До 2015. године, Порше СЕ, холдинг компанија издвојена из оригиналне Порше фирме, имала је контролни интерес у Фолксваген групи, која је укључивала Ауди и Ламборгхини као подружнице.</span></p>', 2, 1, '07/09/18', 'laptop, ssd', 'slike/66464d294b5528.85731272.png'),
(33, 'Неки наслов', '<p>Неки текст о технологији</p>', 2, 10, '29/04/23', 'технологија', 'slike/644d2119f38453.15463712.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `kategorija_id` int(11) NOT NULL,
  `kategorija_naziv` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`kategorija_id`, `kategorija_naziv`) VALUES
(1, 'Типови'),
(2, 'Произвођачи'),
(3, 'Новитети');

-- --------------------------------------------------------

--
-- Table structure for table `podesavanje`
--

CREATE TABLE `podesavanje` (
  `podesavanje_naziv` varchar(191) NOT NULL,
  `podesavanje_vrednost` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `podesavanje`
--

INSERT INTO `podesavanje` (`podesavanje_naziv`, `podesavanje_vrednost`) VALUES
('pocetna_veliki_naslov', 'Аутомобили'),
('pocetna_veliki_podnaslov', 'Ово је апликација која се бави аутомобилима. Добродошли на нову платформу.');

-- --------------------------------------------------------

--
-- Table structure for table `stranica`
--

CREATE TABLE `stranica` (
  `stranica_id` int(11) NOT NULL,
  `stranica_naslov` varchar(256) NOT NULL,
  `stranica_sadrzaj` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stranica`
--

INSERT INTO `stranica` (`stranica_id`, `stranica_naslov`, `stranica_sadrzaj`) VALUES
(1, 'О нама', '<p><span class=\"Y2IQFc\" lang=\"sr\">Добродошли у свет аутомобила!</span></p>\r\n<p><span class=\"Y2IQFc\" lang=\"sr\">Ми смо страствени тим ентузијаста који дели љубав према аутомобилима и мобилности. Са седиштем у Ваљеву, предано радимо како бисмо нашим клијентима пружили најбоље искуство о новостима у свету аутомобила.</span></p>'),
(2, 'Контакт', '<table>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p>Власник:</p>\r\n<p>Контакт:</p>\r\n</td>\r\n<td>\r\n<p>Михаило Петровић</p>\r\n<p>mihailo.petrovic@valjevskagimnazija.edu.rs</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`autor_id`),
  ADD UNIQUE KEY `autor_eadresa` (`autor_eadresa`);

--
-- Indexes for table `clanak`
--
ALTER TABLE `clanak`
  ADD PRIMARY KEY (`clanak_id`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`kategorija_id`);

--
-- Indexes for table `podesavanje`
--
ALTER TABLE `podesavanje`
  ADD PRIMARY KEY (`podesavanje_naziv`);

--
-- Indexes for table `stranica`
--
ALTER TABLE `stranica`
  ADD PRIMARY KEY (`stranica_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clanak`
--
ALTER TABLE `clanak`
  MODIFY `clanak_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `kategorija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stranica`
--
ALTER TABLE `stranica`
  MODIFY `stranica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
