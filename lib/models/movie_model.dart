class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String synopsis;
  final String category;
  final int year;
  final Duration duration;

  const Movie({
      required this.name,
      required this.imagePath,
      required this.videoPath,
      required this.synopsis,
      required this.category,
      required this.year,
      required this.duration,
  });

  static List<Movie> movies = const [
    Movie(
      name: 'Captain America: The First Avenger',
      imagePath: 'https://image.tmdb.org/t/p/w500/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg',
      videoPath: 'assets/videos/captain_america.mp4',
      synopsis: "During World War II, Steve Rogers is a sickly man from Brooklyn who's transformed into super-soldier Captain America to aid in the war effort. Rogers must stop the Red Skull – Adolf Hitler's ruthless head of weaponry, and the leader of an organization that intends to use a mysterious device of untold powers for world domination.",
      category: 'Action',
      year: 2011,
      duration: Duration(hours: 2, minutes: 4, seconds: 0)
    ),
    Movie(
      name: 'Interstellar',
      imagePath: 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      videoPath: 'assets/videos/interstellar.mp4',
      synopsis: "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.",
      category: 'Sci-Fi',
      year: 2014,
      duration: Duration(hours: 2, minutes: 49, seconds: 0)
    ),
    Movie(
      name: 'The Dark Knight',
      imagePath: 'https://image.tmdb.org/t/p/w500/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg',
      videoPath: 'assets/videos/the_dark_knight.mp4',
      synopsis: "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
      category: 'Action',
      year: 2008,
      duration: Duration(hours: 2, minutes: 32, seconds: 0)
    ),
    Movie(
      name: 'The Avengers',
      imagePath: 'https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
      videoPath: 'assets/videos/the_avengers.mp4',
      synopsis: "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!",
      category: 'Action',
      year: 2012,
      duration: Duration(hours: 2, minutes: 23, seconds: 0)
    ),
    Movie(
      name: 'Tenet',
      imagePath: 'https://image.tmdb.org/t/p/w500/k68nPLbIST6NP96JmTxmZijEvCA.jpg',
      videoPath: 'assets/videos/tenet.mp4',
      synopsis: "Armed with only one word – Tenet – and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
      category: 'Sci-Fi',
      year: 2020,
      duration: Duration(hours: 2, minutes: 30, seconds: 0)
    ),
    Movie(
      name: 'Dune',
      imagePath: 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      videoPath: 'assets/videos/dune.mp4',
      synopsis: "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
      category: 'Sci-Fi',
      year: 2021,
      duration: Duration(hours: 2, minutes: 32, seconds: 0)
    ),
    Movie(
      name: 'The Tomorrow War',
      imagePath: 'https://image.tmdb.org/t/p/w500/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg',
      videoPath: 'assets/videos/the_tomorrow_war.mp4',
      synopsis: "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.",
      category: 'Sci-Fi',
      year: 2021,
      duration: Duration(hours: 2, minutes: 0, seconds: 0)
    )
  ];
}
