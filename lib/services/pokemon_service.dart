import 'dart:async';
import 'dart:convert';

import 'package:poke_web/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  Future<PokemonModel?> buscarPokemon(String nomePokemon) async {
    final String url = 'https://pokeapi.co/api/v2/pokemon/$nomePokemon';
    final Uri uri = Uri.parse(url);

    try {
      final http.Response resposta = await http.get(uri);

      if (resposta.statusCode == 200) {
        final Map<String, dynamic> corpoJson = jsonDecode(resposta.body);

        return PokemonModel.fromJson(corpoJson);
      } else {
        return null;
      }
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
