import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title', // Can change this title.
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          /**
           * Here is bottom navigation tab.
           * You can change icon, label (hided) and append more <BottomNavigationBarItem>
           */
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

// This is custom app bar.
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

// This is ad banner
class AdBanner extends StatelessWidget {
  const AdBanner({Key? key}) : super(key: key);

  final String image = 'assets/images/ad.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

// This is tab container.
// You can change indicator color.
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
          Expanded(child: TabBarView(
              // Append more Tab
              children: <Widget>[TabOne(), TabOne(), TabOne()])),
        ],
      ),
    ));
  }
}

// Example of Tab
// Can change border bottom color as [#1]
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
            borderBottomColor: Colors.red, // [#1]
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
            borderBottomColor: Colors.green, // [#1]
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
            borderBottomColor: Colors.blue, // [#1]
          ),
        ],
      ),
    );
  }
}

// HairStyleRow is as the row that have many HairStyleItem

// @params {Color} borderBottomColor
// @params {List<Widget>} children
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

// HairStyleItem is a each of hair style.

// @params {String} image: path to image. But, if you use image from internet you must change code Image.asset() to Image.network() as [#2]
// @params {String} name
// @params {String} stylist
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
          // [#2]
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
