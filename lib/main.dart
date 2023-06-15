import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: TabbedScreen(),
    );
  }
}


class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}


class _TabbedScreenState extends State<TabbedScreen> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    PageWidget(1, Colors.yellow),
    PageWidget(2, Colors.green),
    PageWidget(3, Colors.blue),
  ];


  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _onPageSelected(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _onPageSelected(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _onPageSelected(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onPageSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}


class PageWidget extends StatelessWidget {
  final int pageNumber;
  final Color color;


  PageWidget(this.pageNumber, this.color);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $pageNumber',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}



