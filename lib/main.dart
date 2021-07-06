import 'package:flutter/material.dart';
// import 'package:flutter/src/material/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home_cut.png'),
                label: "Bottom Tab 1"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/account_cut.png'),
                label: "Bottom Tab 2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Bottom Tab 3"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Bottom Tab 4"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Bottom Tab 5"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey[400],
        ),
        body: Column(
          children: <Widget>[
            MyAppBar(),
            AdBanner(),
            Expanded(child: TabContainer())
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/icons/hara_logo.png'),
          IconButton(
            onPressed: null,
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class AdBanner extends StatelessWidget {
  const AdBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ad.png',
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class TabContainer extends StatelessWidget {
  const TabContainer({Key? key}) : super(key: key);

  static Color _indicatorColor = Color(0xffee8181);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
              indicatorColor: _indicatorColor,
              indicatorWeight: 4,
              tabs: <Tab>[
                Tab(
                    icon: Text(
                  'Tab 1',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    icon: Text(
                  'Tab 2',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    icon: Text(
                  'Tab 3',
                  style: TextStyle(color: Colors.black),
                )),
              ]),
          Expanded(
              child:
                  TabBarView(children: <Widget>[TabOne(), TabOne(), TabOne()])),
        ],
      ),
    ));
  }
}

class TabOne extends StatelessWidget {
  const TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          HairStyleRow(
            children: <Widget>[
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
            ],
            borderBottomColor: Colors.red,
          ),
          HairStyleRow(
            children: <Widget>[
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
            ],
            borderBottomColor: Colors.green,
          ),
          HairStyleRow(
            children: <Widget>[
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
              HairStyleItem(
                  image: 'assets/images/hair.png',
                  name: 'Kowloon',
                  stylist: 'Hair Stylist'),
            ],
            borderBottomColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class HairStyleRow extends StatelessWidget {
  const HairStyleRow(
      {Key? key, required this.borderBottomColor, required this.children})
      : super(key: key);

  final Color borderBottomColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: borderBottomColor))),
      margin: EdgeInsets.only(bottom: 16),
    );
  }
}

class HairStyleItem extends StatelessWidget {
  const HairStyleItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.stylist})
      : super(key: key);

  final String image;
  final String name;
  final String stylist;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Text(
                  stylist,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                )
              ],
            ),
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width / 3 - 5,
    );
  }
}
