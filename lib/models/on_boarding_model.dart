class OnBoardingContentModel {
  final String image;
  final String header;
  final String title;
  final String description;

  OnBoardingContentModel({
    required this.image,
    required this.header,
    required this.title,
    required this.description,
  });
}

List<OnBoardingContentModel> contents = [
  OnBoardingContentModel(
    image: 'assets/images/astro.png',
    header: 'Read all the',
    title: 'LATEST NEWS &\nFEATURE STORIES',
    description:
        'Now news and feature\nstories are updated every\nhour of the day',
  ),
  OnBoardingContentModel(
    image: 'assets/images/galaxy.png',
    header: 'Learn more about the',
    title: 'SOLAR SYSTEM\n& BEYOND',
    description:
        'View over 19,000 images\nand watch thousands of\non-demand NASA videos',
  ),
  OnBoardingContentModel(
    image: 'assets/images/earth.png',
    header: 'Explore all the',
    title: 'FEATURED\nCONTENTS',
    description:
        'Learn about the universe\nwith Augmented Reality\nand 3D models',
  ),
];
