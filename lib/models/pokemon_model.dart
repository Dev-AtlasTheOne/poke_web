class PokemonModel {
  final String? nome;
  final List<String>? tipo;
  final String? sprite;

  PokemonModel({this.nome, this.tipo, this.sprite});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<String>? listaTipo = [];

    if (json['types'] != null) {
      json['types'].forEach((tipo) {
        listaTipo.add(tipo['type']['name']);
      });
    }

    String? spriteUrl;

    if (json['sprites'] != null) {
      spriteUrl = json['sprites']['front_default'];
    }

    return PokemonModel(nome: json['name'], tipo: listaTipo, sprite: spriteUrl);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> pokemon = new Map<String, dynamic>();

    pokemon['nome'] = nome;
    pokemon['sprite'] = sprite;
    pokemon['tipos'] = tipo;

    return pokemon;
  }
}
