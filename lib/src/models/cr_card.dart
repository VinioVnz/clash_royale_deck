class CrCard {
  final int id;
  final String name;
  final int elixirCost;
  final String rarity;
  final String iconUrl;
  String? evoIconUrl;

  CrCard({
    required this.id,
    required this.name,
    required this.elixirCost,
    required this.rarity,
    required this.iconUrl,
    this.evoIconUrl,
  });

  factory CrCard.fromJson(Map<String,dynamic> json){
    return CrCard(
      id: json['id'] ?? 0, 
      name: json['name'], 
      elixirCost: json['elixirCost'] ?? 0, 
      rarity: json['rarity'], 
      iconUrl: json['iconUrls']?['medium'],
      evoIconUrl: json['iconUrls']?['evolutionMedium']
      );
  }
}
