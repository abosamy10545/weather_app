class Astro {
  final String sunrise;
  final String sunset;
  final String moonPhase;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonPhase,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonPhase: json['moon_phase'],
    );
  }
}
