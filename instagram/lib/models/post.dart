class Post {
  late String name;
  late String location;
  late String image;
  late String caption;
  int numberOfLikes = 0;

  Post(Map currentMap) {
    name = currentMap["name"];
    location = currentMap["location"];
    image = currentMap["image"];
    caption = currentMap["caption"];
  }
}
