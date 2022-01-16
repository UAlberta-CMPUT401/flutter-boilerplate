import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/outfit_model.dart';
import 'package:flutter_travel_ui/widgets/outfit_carousel.dart';
import 'package:flutter_travel_ui/widgets/categoryicon_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  int currentIndex = 0;
  final pages = [
    // HomePage() put the class names here
  ];
  List<IconData> _icons = [
    FontAwesomeIcons.car,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  void onPressed(int index){
    if(index == 0){
      print("index 0");
      // to go to another page
      // Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => HomePage()),
      //                   );
    }
    else if (index == 1){
      print("index 1");
    }
    else if (index == 2){
      print("index 2");
    }
    else {
      print("index 3");
    }
  }
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Digital Closet',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            CategoryIconCarousel(),
            SizedBox(height: 20.0),
            OutfitCarousel(),
            SizedBox(height: 20.0),

/*            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
*/
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,

        onTap: (index) => onPressed(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home',

          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite),
            label:'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.car),
            label:'',
          ),
        ],
      ),

    );
  }
}
