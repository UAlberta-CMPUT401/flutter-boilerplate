import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/outfit_model.dart';

class ViewOutfitScreen extends StatelessWidget {
  final Outfit outfit;
  int currentIndex = 0;
  ViewOutfitScreen({Key key,this.outfit}):super(key:key);
  bool returnValue(BuildContext con, bool val){
    Navigator.pop(con,val);
    return val;
  }
  void onPressed(int index){
    if(index == 0){
      print("index 0");
      // to go to another page
      // Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => HomePage()),
      //                   );
      // Navigator.pop(context,false);(go back to home)
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(outfit.name)),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage(outfit.imageUrl),
              ),

              ),
              Padding(padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Title: ' + outfit.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text(
                  'Category: ' + outfit.category,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("Done"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){returnValue(context,false);}// return false
                  ),


                  new RaisedButton(
                    child: new Text("Delete"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){returnValue(context,true);}// return true

                  ),

                ],
              )
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
            icon: Icon(Icons.add),
            label:'',
          ),
        ],
      ),

    );

  }
}