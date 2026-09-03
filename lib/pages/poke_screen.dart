import 'package:flutter/material.dart';
import 'package:poke_web/services/pokemon_service.dart';
import 'package:poke_web/models/pokemon_model.dart';

class PokeScreen extends StatefulWidget {
  const PokeScreen({super.key});

  @override
  State<PokeScreen> createState() => _PokeScreenState();
}

AppBar barraPoke() {
  return AppBar(
    title: const Text("PokeSearch"),
    centerTitle: true,
    backgroundColor: Colors.red,
  );
}

class _PokeScreenState extends State<PokeScreen> {
  final _formKey = GlobalKey<FormState>();

  PokemonModel? pokemon;

  final PokemonService _pokemonService = PokemonService();

  final TextEditingController _pokeSearch = TextEditingController();

  Future<void> obterPokemon(String nomePokemon) async {
    final PokemonModel? resultado = await _pokemonService.buscarPokemon(
      nomePokemon.trim().toLowerCase(),
    );

    if (!mounted) return;

    if (resultado != null) {
      setState(() {
        pokemon = resultado;
      });
    } else {
      setState(() {
        pokemon = null;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Pokémon não encontrado")));
    }
  }

  Widget _campoTexto(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Precisa ser preenchido";
        }

        return null;
      },
    );
  }

  @override
  void dispose() {
    _pokeSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraPoke(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _campoTexto(_pokeSearch, "Procurar Pokémon"),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    obterPokemon(_pokeSearch.text);
                  }
                },
                child: const Text("Pesquisar"),
              ),

              const SizedBox(height: 30),

              if (pokemon?.nome != null) ...[
                Text(
                  pokemon!.nome!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                if (pokemon?.sprite != null)
                  Image.network(
                    pokemon!.sprite!,
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("Erro ao carregar a imagem");
                    },
                  ),
                if (pokemon!.tipo != null)
                  Text(
                    "Tipo: ${pokemon!.tipo!.join(', ')}",
                    style: const TextStyle(fontSize: 18),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
