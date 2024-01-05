import 'package:portfolio/constants/imgUrls.dart';

class Project {
  final String title;
  final String subtitle;
  final String imgPath;
  final String? linkUrl;

  Project({required this.title, required this.subtitle, required this.imgPath, required this.linkUrl});
}

List<Project> projectData = [
  Project(
      title: "Anvaad-Py",
      subtitle:
          "Transliteration toolkit for Gurmukhi (Punjabi) ASCII to Unicode, romanized and other character sets.",
      imgPath: anvaadPy,
      linkUrl: "https://hushed-boat-f59.notion.site/anvaad-py-be68ae30daa945498a81d50f47c4eab6"),
  Project(
      title: "Ragi Duties Api",
      subtitle:
          "Simple Python GET API for Ragi duties from Sri Darbar Sahib, Amritsar",
      imgPath: api,
      linkUrl: "https://hushed-boat-f59.notion.site/Ragi-Duties-Api-6d0a805f459f4f51b09f8d38a12666dd"),
  Project(
      title: "Live Darbar App",
      subtitle:
          "A simple yet powerful & intelligent mobile app for live audio & video broadcast from Golden Temple, Amritsar.",
      imgPath: liveDarbar,
      linkUrl: "https://hushed-boat-f59.notion.site/Live-Darbar-83558049f8a54a6a8f37ebd50cec88d3"),
  Project(
      title: "Ragi Duties Reader",
      subtitle:
          "Simple python script to download, read, upload ragi duty data from sgpc.net to github gist.",
      imgPath: reader,
      linkUrl: "https://hushed-boat-f59.notion.site/Ragi-Duties-Reader-12c0a1a3f698479480c619660595cd5b"),
  Project(
      title: "CryptoSardars NFTs",
      subtitle:
          "CryptoSardars is a first ever NFT collection of 4444 unique digital Sardars, where each Sardar is living on the Polygon Chain as ERC-721 token.",
      imgPath: cryptoSardars,
      linkUrl: "https://hushed-boat-f59.notion.site/CryptoSardars-bad18a834a1c4e5f93970d61eac9d7c5"),
  Project(
      title: "NFT Images Generator",
      subtitle:
          "Generate unique NFT images and their metadata from different traits pngs.",
      imgPath: nft,
      linkUrl: "https://hushed-boat-f59.notion.site/NFT-Image-Generation-0f971d2c38904e35a3f9bda4715ab81c"),
  Project(
      title: "Pong 2D",
      subtitle:
          "A very classic game - Pong made with lua and love2d game engine.",
      imgPath: pong,
      linkUrl: "https://hushed-boat-f59.notion.site/Pong-69d187b39cae49d7a9869dcd9d861750"),
  Project(
      title: "Python Bots",
      subtitle:
          "These are couple of python automation projects including a Zoom Meeting Bot & several game beating bots.",
      imgPath: game,
      linkUrl: "https://hushed-boat-f59.notion.site/Python-Automations-98965e9e84df415597976effc28b365d"),
  Project(
      title: "This Portfolio",
      subtitle:
          "Personal Portfolio website made using Flutter for Web, Firebase & three.js",
      imgPath: harkLogo,
      linkUrl: null),
];
