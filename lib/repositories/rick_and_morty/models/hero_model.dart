import 'location_model.dart';

class HeroResultDTO {
  const HeroResultDTO({
    required this.id,
    required this.name,
    required this.gender,
    required this.species,
    required this.image,
    required this.status,
    required this.location,
    required this.episodes,
  });

  final int id;
  final String name;
  final String gender;
  final String species;
  final String image;
  final String status;
  final LocationDTO location;
  final List<String> episodes;

  factory HeroResultDTO.fromJson(Map<String, dynamic> json) => HeroResultDTO(
      id: json["id"],
      name: json["name"],
      species: json["species"],
      gender: json["gender"],
      image: json["image"],
      status: json["status"],
      location: LocationDTO.fromJson(json["location"]),
      episodes: List<String>.from(json["episode"].map((e) => e)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "species": species,
        "image": image,
        "status": status,
        "location": location,
        "episode": episodes,
      };

  HeroResultDTO.empty()
      : id = 1,
        name = '',
        status = '',
        species = '',
        gender = '',
        location = LocationDTO.empty(),
        image = '',
        episodes = [];

}
