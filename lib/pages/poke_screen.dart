import 'package:flutter/material.dart';
import 'package:poke_web/services/pokemon_service.dart';
import 'package:poke_web/models/pokemon_model.dart';





class PokeScreen extends StatefulWidget {
  const PokeScreen({ super.key });

  @override
  State<StatefulWidget> createState() => _PokeScreenState();
}


AppBar barraPoke(){
  return AppBar(
    title: Text("PokeWeb"),
    centerTitle: true,
    backgroundColor: Colors.red,
    


  );

}



class _PokeScreenState extends State<PokeScreen> {
  final _formKey = GlobalKey<FormState>();

  final PokemonService _pokemonService= PokemonService();

  final TextEditingController _pokeSearch = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraPoke(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
          ),
        ),
      ),
      
    );
  }
}