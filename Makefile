build:
				docker build -t theozaurus/postgres    postgres
				docker build -t theozaurus/spotweb     spotweb
				docker build -t theozaurus/sabnzbd     sabnzbd
				docker build -t theozaurus/couchpotato couchpotato
				docker build -t theozaurus/headphones  headphones
				docker images | grep theozaurus
