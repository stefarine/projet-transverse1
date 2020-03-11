

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id_partie` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classement`
--

CREATE TABLE `classement` (
  `id_joueur` int(11) NOT NULL,
  `id_partie` int(11) NOT NULL,
  `place` set('1','2','3','4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id_joueur` int(11) NOT NULL,
  `pseudo` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE `partie` (
  `id_partie` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `type` set('public','prive') NOT NULL,
  `etat` set('init','playing','ended') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tournoi`
--

CREATE TABLE `tournoi` (
  `id_tournoi` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `type` set('public','prive') NOT NULL,
  `etat` set('init','playing','ended') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id_partie`,`id_tournoi`),
  ADD KEY `fkIdx_72` (`id_partie`),
  ADD KEY `fkIdx_76` (`id_tournoi`);

--
-- Index pour la table `classement`
--
ALTER TABLE `classement`
  ADD PRIMARY KEY (`id_joueur`,`id_partie`),
  ADD KEY `fkIdx_54` (`id_joueur`),
  ADD KEY `fkIdx_57` (`id_partie`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id_joueur`);

--
-- Index pour la table `partie`
--
ALTER TABLE `partie`
  ADD PRIMARY KEY (`id_partie`);

--
-- Index pour la table `tournoi`
--
ALTER TABLE `tournoi`
  ADD PRIMARY KEY (`id_tournoi`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id_joueur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
  MODIFY `id_partie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tournoi`
--
ALTER TABLE `tournoi`
  MODIFY `id_tournoi` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `FK_72` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id_partie`),
  ADD CONSTRAINT `FK_76` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`);

--
-- Contraintes pour la table `classement`
--
ALTER TABLE `classement`
  ADD CONSTRAINT `FK_54` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_57` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id_partie`);
