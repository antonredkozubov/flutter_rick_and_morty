class HeroResultResponse {
  const HeroResultResponse({
    required this.name,
    required this.gender,
    required this.species,
    required this.image,
    // required this.episode,
  });

  final String name;
  final String gender;
  final String species;
  final String image;
  // final List<String> episode;

  factory HeroResultResponse.fromJson(Map<String, dynamic> json) =>
      HeroResultResponse(
        name: json["name"] == null ? null : json["name"],
        gender: json["gender"] == null ? null : json["gender"],
        species: json["species"] == null ? null : json["species"],
        image: json["image"] == null ? null : json["image"],
        // episode: json["episode"] == null ? null : json["episode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "species": species,
        "image": image,
        // "episode": episode,
      };
}