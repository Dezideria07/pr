-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 06.Jan 2022, 18:41
-- Verzia serveru: 10.4.22-MariaDB
-- Verzia PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `projekt`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `categories`
--

INSERT INTO `categories` (`id`, `cat_name`) VALUES
(4, 'Asia'),
(3, 'Europe'),
(5, 'Recommended'),
(1, 'Travel'),
(2, 'Vacation');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `categories_has_posts`
--

CREATE TABLE `categories_has_posts` (
  `categories_id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `categories_has_posts`
--

INSERT INTO `categories_has_posts` (`categories_id`, `posts_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(4, 1),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `posts_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `posts_id`, `users_id`) VALUES
(16, 'djkhglasdn', '2022-01-02 16:21:28', 1, 1),
(17, 'sdfdafsdf', '2022-01-02 16:25:07', 1, 1),
(18, 'ghccvb', '2022-01-02 17:40:40', 1, 4),
(19, 'fsdf', '2022-01-02 17:46:53', 2, 1),
(21, 'sfad', '2022-01-06 17:54:27', 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

CREATE TABLE `menu` (
  `path` varchar(100) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`path`, `menu_name`, `id`) VALUES
('index.php#section1', 'Domov', 1),
('index.php#section2', 'O nás', 2),
('index.php#section3', 'Najnovšie príspevky', 3),
('index.php#section4', 'Príspevky', 4),
('index.php#section5', 'Kontakt', 5);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `post_name` varchar(150) NOT NULL,
  `perex` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `posts`
--

INSERT INTO `posts` (`id`, `post_name`, `perex`, `content`, `created_at`, `image`, `users_id`) VALUES
(1, 'BALI', 'Ostrov Bali je jedným z mnohých ostrovov v Indonézii a leží v Indickom oceáne. Nie je to samostatná krajina ako si mnohí mylne niekedy myslia. Prečo je práve ostrov Bali najpopulárnejším ostrovom zo 17500 ostrovov Indonézie? Čo robí Bali takým obľúbeným a iným, že sa stáva destináciou číslo jedna pre mnoho turistov po celom svete? Bali očarí snáď bez výnimky každého, sú láskaví a stále usmievaví ľudia a ich unikátna kultúra.', 'Ostrov Bali je prevažne hinduistický ostrov. Hinduizmus tu vyznáva približne 95% obyvateľstva, je silno ovplyvnený budhizmom a je to ňom vidieť a cítiť na každom kroku. Hinduistické chrámy sú roztrúsené po celom ostrove a krásne zapadajú do balijskej prírody, kde ich zdieľajú ľudia a samozrejme všadeprítomné opice. Počet väčších či menších chrámov sa na Bali odhaduje na viac ako 100 tisíc. Okrem toho každý príbytok či hotel má svoju malú svätyňu.\r\n<br><hr>\r\nBalijci veria, že ostrov obývajú nadprirodzené bytosti, veria v karmu a každý deň prinášajú malé obete, ktoré pokladajú na svätyne či na zem. Tie pre dobrých bohov sú pokladané do svätýň a pre zlých na zem či na cestu. Ak o ňu náhodou zakopnete alebo ju prejdete na skútri, nič sa nedeje. Sú to vlastne malé misky z palmových listov, s lupeňmi kvetov a s vonnou sviečkou. Takže takáto vôňa vás tam bude sprevádzať denne. \r\n<br><hr>\r\nBali je známe aj krásnou prírodou, ktorá je veľmi rozmanitá v rôznych častiach ostrova ale aj plážami, ktoré sú rajom pre turistov. Bali má rôzne druhy pláži. Od útesových a skalnatých až po piesočnaté. Nečakajte však žiaden Karibik či Zanzibar. Pláže na Bali nie sú typické bielym pieskom a azúrovou vodou. No aj tak má Bali krásne a zaujímavé pláže a hlavne má zopár svetových špičiek pre surfistov, ktorí sa tu zbiehajú z celého sveta.\r\n<br><hr>\r\nNájdete tu aj pláže vhodné pre pre začiatočníkov surferov. Napríklad v Kute, neďaleko letiska. Ale aj pláže pre profíkov na obrovských vlnách napríklad v Uluwatu. Mimochodom ak hľadáte krásne azúrové pláže, na tie sa chodí skôr na okolité blízke ostrovy, na ktoré sa z Bali dostanete rýchlym člnom za polhodinku či za dve. Napríklad maličké a čarovné Gili. Záleží kam sa vyberiete. Určite si však vyhraďte pár dní aj na okolité ostrovy.\r\n<br><hr>\r\nVnútrozemie je krásne zelené. Také ako vidíte na fotkách v katalógoch cestoviek či na Instagrame. S ich úpravou sa veľmi nemuseli trápiť. Naozaj to tam tak vyzerá. Nájdeme tu veľkú sopku, krásne zelené ryžové polia či pralesy, kde žijú miestni, ktorí sa s turistami často nevídajú. Veľmi obľúbeným mestom vo vnútrozemí je mesto Ubud. Je to raj pre jogu, ryžové polia, vodopády či pre Monkey Forest, čo je v podstate ohradený prales a chrám plný opíc a žiaľ aj turistov. \r\n<br><hr>\r\nNa Bali sa dá teda surfovať, kúpať sa, poznávať miestne chrámy a ceremoniály, cvičiť jogu, túlať sa po ryžových poliach ale aj dať si trek na sopku či k vodopádom. Nemusí však sadnúť každému. V prvom rade je to stále chudobná Indonézia. Mestá ako Denpasar sú špinavšie. Turizmus naučil už aj niektorých miestnych snažiť sa zarábať na vás na každom kroku. A ani pláže nemusia byť ideálne podľa vašich predstáv. Ak hľadáte luxusný rezort, bielu pieskovú pláž s azúrovým morom, Bali nemusí byť pre vás.\r\n<br><hr>\r\nA nezabudnite na okolité krásne a menej turistické ostrovy ako je Nusa Lembogan, Nusa Ceningan či Lombok. Bali je síce turistami veľmi obľúbené, no stále tu nájdete svoj raj a neturistické miesta. Hlavne mimo sezóny.', '2021-12-14 22:57:42', 'img/bali2.jpg', 1),
(2, 'SINGAPORE', 'Singapur je oficiálne Singapurská republika a je jedným z najbohatších štátov sveta. Leží v juhovýchodnej Ázii, na juh od Malajského polostrova a je tiež jediným ostrovným mestským štátom na Zemi. Rovník je vzdialený iba 150 kilometrov. Rozloha Singapuru zaberá jeden hlavný ostrov Pulau Ujong v tvare diamantu a ďalších 62 ostrovčekov. Je hlavným medzinárodným dopravným uzlom v Ázii s námornými a leteckými dopravnými trasami.', 'Veľkou zaujímavosťou Singapuru je aktívna rekultivácia, ktorá zvýšila rozlohu štátu od roku 1960 o 130 kilometrov štvorcových. Ďalšie projekty predpokladajú zlučovanie menších ostrovov a vytváranie väčších funkčných ostrovov. Jedným z prvých je ostrov Jurong. Singapur sa radí medzi štáty s efektívnou štátnou politikou pre udržateľnosť životného prostredia. Asi 10% územia je vyhradených pre parky a prírodné rezervácie. To pomáha zvyšovať pocit zelene v meste a zlepšiť kvalitu života.\r\n<br><hr>\r\nAž 42% populácie tvoria cudzinci a tento fakt má silný vplyv na kultúrny mix Singapuru. Je tu rôznorodosť jazykov aj náboženstiev. Asi tretina obyvateľov vyznáva budhizmus, nasleduje kresťanstvo, islam, taoizmus a hinduizmus. Zo štyroch oficiálnych úradných jazykov je angličtina spoločným jazykom obchodu a verejných subjektov. Všetky úradné dokumenty v ostatných úradných jazykoch musia byť preložené aj do angličtiny.\r\n<br><hr>\r\nCenová hladina Slovenska je asi o polovicu nižšia ako v Singapure. Priemerné spotrebiteľské ceny sú u nás nižšie o 48%. Za reštauračné služby si v Singapure priplatíme o 44% vyššie ceny.\r\n<br><hr>\r\nCeny niektorých potravín:\r\n<br>\r\nChlieb = 1,60 €<br>\r\nVoda (1,5l) = 1 €<br>\r\n1l mlieka = 2 €<br>\r\n1kg syra = 17 €<br>\r\nPorcia jedla v rýchlom občerstvení = 5 €<br>\r\nPorcia jedla v lacnej reštaurácii = 8 €<br>\r\nPorcia jedla v reštaurácii strednej triedy = 20 €<br>\r\nKapučíno = 3,70 €<br>\r\nFľaša vína = 20 €\r\n<br><hr>\r\nSingapur je jednou z najbezpečnejších turistických destinácií. Je jednou z krajín s najnižšou mierou užívania drog a nízkou mierou spotreby alkoholu.\r\n<br><hr>\r\nPrávny systém v Singapure zahŕňa aj telesné tresty (bitie) za priestupky ako znásilnenie, vandalizmus, výtržníctvo alebo imigrácia.\r\n<br><hr>\r\nV krajine je platný aj povinný trest smrti za priestupky ako vražda, prechovávanie, užívanie a obchodovanie s drogami a narkotickými látkami alebo zbraňami.\r\n<br><hr>\r\nNa druhej strane, Transparency International hodnotí Singapur ako najmenej skorumpovanú krajinu sveta.\r\n<br><hr>\r\nV centre Singapuru leží časť Bras Basah, Bugis, ktorá je domovom množstva múzeí a pamiatok. Je jednou z najstarších štvrtí v Singapure. Nájdete tu Národné múzeum Singapur, Arménsky kostol – najstarší kresťanský kostol v Singapure, najstaršie hasičské stanice a ďalšie skvosty.\r\n<br><hr>\r\nĎalšou historickou štvrťou Singapuru je čínska štvrť s tradičnými čínskymi obchodmi a trhmi. V tejto štvrti nájdete aj čínsky budhistický chrám a Chrám Sri Mariamman, čo je najstarší hinduistický chrám v Singapure. Datuje sa do roku 1827 a je venovaný bohyni Mariamman.\r\n<br><hr>\r\nVeľkou atrakciou je aj Singapurská botanická záhrada, ktorá prekvitá zbierkou flóry a fauny. Súčasťou je Národná záhrada orchideí alebo Detská záhrada Jacoba Ballasa.', '2021-06-22 18:44:46', 'img/singapur1.jpg', 4),
(3, 'THAJSKO', 'Thajsko je exotická a fascinujúca krajina, ktorej návšteva určite stojí za to. Čo by ste o ňom určite mali vedieť a na čo by ste sa mali pripraviť, aby ste si Thajsko užili čo najviac? ', 'V hlavnom meste Bangkok Vás čaká naozaj veľké teplo. V mesiacoch marec - máj tu priemerná teplota dosahuje 34 stupňov. Ak sa však vhodne oblečiete a zásobíte pitnou vodou, horúca noc v Bangkoku sa Vám bude veľmi páčiť. Navštívte známu ulicu Khao San Road (Thanon Khao San), kde si okrem iného môžete dopriať aj lacnú thajskú masáž a to priamo na ulici. Nočný trh a bary v Pat Pongu Vás očaria, takisto ako pohľad na nádherný budhistický chrám Wat Arun. V Bangkoku je čo pozerať.\r\n  <br><hr>\r\n \r\nNajväčší thajský ostrov Phuket ponúka možnosť oddychovať na obľúbených plážach s priezračnou vodou (napríklad v strediskách sú Patong Becha, Karon, Kata Beach) a venovať sa vodným športom. Na svoje si tu však prídu aj gurmáni, ktorí by určite mali vyskúšať miestne špeciality. Určite by ste mali vyskúšať pad Thai, vyprážané banány, krabie koláčiky a nespočetné tradičné jedlá z ryže, kuracieho a bravčového mäsa či rýb, ktoré bývajú výdatne dochutené cesnakom, čili a karí. Tým, čo majú radi väčšie extrémy, odporúčame vyskúšať larb mote daeng (červené mravce a ich vajíčka), baak bpet (kačacie zobáky) alebo Mok Huak (žubrienky vo fermentovanej rybacej omáčke). Na pitie si pýtajte kokosové mlieko, ľadový čaj alebo smoothie z čerstvého ovocia.\r\n<br><hr>\r\nJedným z najvýznamnejších letovísk Thajska je Pattaya. Okrem toho, že sa tu môžete naučiť potápať v jednej z mnohých potápačských škôl a navštíviť jednu z 800 pivární, je Pattaya aj najobľúbenejším golfovým strediskom v Ázii. Je tu až 20 golfových ihrísk, ktoré sa Vám oplatí navštíviť, ak holdujete tomuto druhu športu.\r\n <br><hr>\r\n \r\nV Thajsku nájdete aj jedinečnú a žiarivú najväčšiu sochu Buddhu, ktorá je celá vyrobená zo zlata. Váži 5,5 ton a jej pôvod siaha až do 13 storočia. Zlatý Buddha je vystavený v chráme Wat Traimit v Bangkoku. Ak sa rozhodnete ísť do Thajska na poznávací zájazd, túto pamiatku by ste rozhodne mali vidieť.', '2021-11-09 22:05:09', 'img/thajsko1.jpg', 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `owner` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `tasks`
--

INSERT INTO `tasks` (`id`, `content`, `owner`) VALUES
(1, 'Vyniest smeti', 'Oliver'),
(2, 'Upratat kuchynu', 'Janka');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Mark', '123'),
(2, 'Kate', '456'),
(3, 'Peter', '789'),
(4, 'Merry', '000');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat_name_UNIQUE` (`cat_name`);

--
-- Indexy pre tabuľku `categories_has_posts`
--
ALTER TABLE `categories_has_posts`
  ADD PRIMARY KEY (`categories_id`,`posts_id`),
  ADD KEY `fk_categories_has_posts_posts1_idx` (`posts_id`),
  ADD KEY `fk_categories_has_posts_categories1_idx` (`categories_id`);

--
-- Indexy pre tabuľku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`,`posts_id`,`users_id`),
  ADD KEY `fk_comments_posts1_idx` (`posts_id`),
  ADD KEY `fk_comments_users1_idx` (`users_id`);

--
-- Indexy pre tabuľku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_posts_users1_idx` (`users_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexy pre tabuľku `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pre tabuľku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pre tabuľku `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `categories_has_posts`
--
ALTER TABLE `categories_has_posts`
  ADD CONSTRAINT `fk_categories_has_posts_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categories_has_posts_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
