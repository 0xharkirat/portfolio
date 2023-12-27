class Project {
  final String title;
  final String subtitle;
  final String imgPath;

  Project({required this.title, required this.subtitle, required this.imgPath});
}

List<Project> projectData = [
  Project(
      title: "Anvaad-Py",
      subtitle:
          "Python module to convert unicode, ascii & Gurmukhi (Punjabi) characters.",
      imgPath: "assets/images/anvaad-py.png"),
  Project(
      title: "Ragi Duties Api",
      subtitle:
          "Simple Python GET API for Ragi duties from Sri Darbar Sahib, Amritsar",
      imgPath: "assets/images/api.png"),
  Project(
      title: "Ragi Duties Reader",
      subtitle:
          "Python script collect ragi duty data from sgpc.net to github gist.",
      imgPath: "assets/images/reader.png"),
  Project(
      title: "NFT Images Generator",
      subtitle:
          "Generate unique NFT images and their metadata from different trait pngs.",
      imgPath: "assets/images/nft.png"),
  Project(
      title: "Game Automation",
      subtitle:
          "Python script to beat all levels of comfy cake game of Purble Place game suite.",
      imgPath: "assets/images/game.png"),
  Project(
      title: "This Portfolio",
      subtitle:
          "Personal Portfolio website made using Flutter for Web, Custom HTML, CSS & JS.",
      imgPath: "assets/images/hark-logo.png"),
];
