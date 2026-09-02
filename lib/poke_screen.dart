import 'package:flutter/material.dart';
import '';





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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraPoke(),
      
    );
  }
}