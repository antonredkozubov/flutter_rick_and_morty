class LocationDTO {
  const LocationDTO({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      LocationDTO(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}