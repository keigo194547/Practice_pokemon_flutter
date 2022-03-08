import 'package:flutter/material.dart';
import 'poke_detail.dart';
import 'ScreenLightState.dart';
import 'Setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}



class _TopPageState extends State<TopPage> {

  int currentbnb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: currentbnb == 0 ? const PokeList() : const Settings(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() => currentbnb = index,
          )
        },
        currentIndex: currentbnb,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

class PokeList extends StatelessWidget {
  const PokeList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: 898,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key key, this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
            ),
          ),
        ),
      ),
      title: const Text(
        'Pikachu',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        '⚡️electric',
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokeDetail(),
          ),
        ),
      },
    );
  }
}
