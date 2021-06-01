--
-- Base de données : `jee_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `prix` float NOT NULL,
  `descriptif` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `nom`, `photo`, `prix`, `descriptif`) VALUES
(1, 'PC LIFEBOOK A Series', '', 649, 'Le Notebook LIFEBOOK A555 de FUJITSU est un ordinateur portable robuste et fiable Ã©quipÃ© d\'unÃ©cran antireflet de 39,6 cm (15,6\"), pour un confort visuel inÃ©galÃ©, mÃªme en extÃ©rieur!!'),
(2, 'Imprimante EPSON WF-2510', '', 99.99, 'WorkForce WF-2510WF. Compacte et fiable. Imprimante monofonction pour petites entreprises, avec connexion Wi-Fi et Ethernet, cartouches d\'encre sÃ©parÃ©es'),
(6, 'Article Test1', '', 100, 'WorkForce WF-2510WF. Compacte et fiable. Imprimante monofonction pour petites entreprises, avec connexion Wi-Fi et Ethernet, cartouches d\'encre sÃ©prÃ©es'),
(7, 'Article Test2', '', 200, 'WorkForce WF-2510WF. Compacte et fiable. Imprimante monofonction pour petites entreprises, avec connexion Wi-Fi et Ethernet, cartouches d\'encre sÃ©prÃ©es');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `path` varchar(150) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_index` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `name`, `path`, `type`, `id_user`) VALUES
(2, 'photo1', 'profil.png', 1, 3),
(3, 'DOC TEST', '/test.pdf', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(15) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `login`, `lastname`, `password`, `firstname`, `admin`) VALUES
(1, 'admin', 'Chou.', '123', 'Mehdi', 1),
(2, 'james', 'Bond', '123', 'James', 0),
(3, 'donut', 'Simpson', 'miam', 'Homer', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
