import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavigator App',
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectIndex = 0;

  List<Widget> ownWidget = <Widget>[
    Newoption('Welcome to Home', Colors.blue),
    Newoption('Welcome to About', Colors.red),
    Newoption('Welcome to Setttings', Colors.green),
  ];

  _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 16, 179, 0.612),
        centerTitle: true,
        title: Text('Bottom Navigation App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homes'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTap,
      ),
      body: Center(
        child: ownWidget.elementAt(_selectIndex),
      ),
    );
  }
}

class Newoption extends StatelessWidget {
  final String title;
  final Color color;
  Newoption(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
