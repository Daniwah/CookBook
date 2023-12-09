class ModelTutorialMasakan {
  String image;
  String title;
  String link;
  String description;

  ModelTutorialMasakan(
      {required this.image,
      required this.title,
      required this.link,
      required this.description});
}

List<ModelTutorialMasakan> contents = [
  ModelTutorialMasakan(
      title: 'Tutorial Memasak Seblak',
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2023/10/shutterstock_2171375907-400x240.jpg',
      link: "jNaij7X2c2g",
      description:
          "Seblak adalah salah satu hidangan tradisional Indonesia yang memiliki cita rasa pedas dan gurih."),
  ModelTutorialMasakan(
      title: 'Tutorial Memasak capcay',
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2023/03/shutterstock_2000809403-400x240.jpg',
      link: "YxMqHgQxsW0",
      description:
          "Capcay adalah hidangan tumis sayuran yang berasal dari Tiongkok dan telah menjadi populer di berbagai masakan Asia, termasuk Indonesia."),
  ModelTutorialMasakan(
      title: 'Tutorial Memasak Rendang',
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2019/10/Oseng-Mercon-Khas-Jogja_Masak-Apa-Hari-Ini-400x240.jpg',
      link: "VX0ox3uQHQc",
      description:
          "Rendang adalah hidangan khas Indonesia, terutama dari daerah Minangkabau di Sumatra Barat."),
  ModelTutorialMasakan(
      title: 'Tutorial Memasak Bakso',
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2023/06/bakso-ayam-soun-400x240.jpeg',
      link: "BJpGEtyVCII",
      description:
          "Tutorial memasak bakso merupakan panduan langkah demi langkah untuk membuat hidangan bakso"),
  ModelTutorialMasakan(
      title: 'Tutorial Memasak Cilok',
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2023/01/cilok-kuah-pedas-segar-400x240.jpg',
      link: "enta285j6gQ",
      description:
          "Cilok adalah sejenis jajanan tradisional Indonesia yang berasal dari Bandung, Jawa Barat. Cilok singkatan dari aci dicolok."),
];
