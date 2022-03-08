import 'package:flutter/material.dart';
import 'package:flutter_pokemon_practice/main.dart';
import 'ScreenLightState.dart';


class PokeDetail extends StatelessWidget {

  const PokeDetail({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            children: [
              Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                height: 100,
                width: 100,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'No.25',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              Chip(
                backgroundColor: Colors.yellow,
                label: Text(
                  'electric',
                  style: TextStyle(
                      color: Colors.yellow.computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
