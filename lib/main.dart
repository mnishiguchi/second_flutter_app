import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(title: 'My Second Flutter App'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title; // provided by the parent

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpg',
            height: 240.0,
            fit: BoxFit.cover,
          ),
          _TitleSection(counter: _counter),
          _DescriptionSection(),
          _ButtonSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({Key key, this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Lake Biwa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Shiga, Japan',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.star, color: Colors.red[500]),
        Text('$counter'),
      ]),
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Lake Biwa is a large freshwater lake in Shiga Prefecture, northeast of Kyoto. It’s known for its abundant fish population, migratory water birds and wetland regions. Its shoreline is home to resorts and beaches like Ōmi-Maiko. Around the lake are historic sites including the 17th-century Hikone castle and the 8th-century Buddhist temple complex Enryaku-ji. Lake Biwa Museum has cultural and natural history exhibits.',
        softWrap: true,
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _IconButton(iconData: Icons.call, label: 'Call'),
          _IconButton(iconData: Icons.near_me, label: 'Route'),
          _IconButton(iconData: Icons.share, label: 'Share'),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({Key key, this.iconData, this.label}) : super(key: key);

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
