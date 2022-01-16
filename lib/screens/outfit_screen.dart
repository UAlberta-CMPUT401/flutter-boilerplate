import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_travel_ui/models/clothing.dart';
import 'package:flutter_travel_ui/models/outfit.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OutfitScreen extends StatefulWidget {
  @override
  _OutfitScreenState createState() => _OutfitScreenState();
}

class _OutfitScreenState extends State<OutfitScreen> {
  final int sensitivity = 1;

  ValueNotifier<int> topperIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> topIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> bagIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> bottomIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> footwearIndexNotifier = ValueNotifier(0);

  List<clothing> topperList = [];
  List<clothing> topList = [];
  List<clothing> bagList = [];
  List<clothing> bottomList = [];
  List<clothing> footwearList = [];

  @override
  void initState() {
    preloadLists();
    super.initState();
  }

  List<OutfitUIData> convertToOutfitUIData(List<clothing> cloths, String filter) {
    List<OutfitUIData> dataList = [];

    for(int i = 0; i < cloths.length; ++i) {
      clothing cloth = cloths[i];

      if (cloth.category != filter) {
        continue;
      }

      dataList.add(OutfitUIData(cloth.category, '${cloth.category} $i'));
    }

    return dataList;
  }

  // todo(TurnipXenon): async
  void preloadLists() {
    // todo(TurnipXenon): preload lists here
    topperList = List<clothing>.from(clothings);
    topList = List<clothing>.from(clothings);
    bagList = List<clothing>.from(clothings);
    bottomList = List<clothing>.from(clothings);
    footwearList = List<clothing>.from(clothings);

    // todo(TurnipXenon): update the notifiters?
  }

  Widget _gridItem(
      ValueNotifier<int> valueNotifier, List<OutfitUIData> outfitList) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (BuildContext context, int index, Widget child) {
          OutfitUIData data = outfitList[index];

          return GestureDetector(
            // from https://stackoverflow.com/a/55050804/17836168
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity > sensitivity) {
                // left
                valueNotifier.value = (valueNotifier.value + 1) % outfitList.length;
              }

              if (details.primaryVelocity < -sensitivity) {
                // right
                valueNotifier.value = (valueNotifier.value - 1) % outfitList.length;
              }
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 210.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: 'assets/images/venice.jpg',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 240.0,
                        width: 240.0,
                        image: AssetImage('assets/images/venice.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              data.description,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const mockResults = <AppProfile>[
      AppProfile('John Doe', 'jdoe@flutter.io',
          'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
      AppProfile('Paul', 'paul@google.com',
          'https://mbtskoudsalg.com/images/person-stock-image-png.png'),
      AppProfile('Fred', 'fred@google.com',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Brian', 'brian@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('John', 'john@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Thomas', 'thomas@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Nelly', 'nelly@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Marie', 'marie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Charlie', 'charlie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Diana', 'diana@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Ernie', 'ernie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Gina', 'fred@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
    ];

    List<Widget> gridChildren = [];
    for (int i = 0; i < 9; ++i) {
      switch (i) {
        case 0:
          gridChildren.add(_gridItem(
              topperIndexNotifier,
              convertToOutfitUIData(topperList, TOPPER)
          ));
          break;
        case 1:
          gridChildren.add(_gridItem(
              topIndexNotifier,
              convertToOutfitUIData(topperList, TOP)
          ));
          break;
        case 2:
          gridChildren.add(_gridItem(
              bagIndexNotifier,
              convertToOutfitUIData(topperList, BAG)
          ));
          break;
        case 4:
          gridChildren.add(_gridItem(
              bottomIndexNotifier,
              convertToOutfitUIData(topperList, BOTTOM)
          ));
          break;
        case 7:
          gridChildren.add(_gridItem(
              footwearIndexNotifier,
              convertToOutfitUIData(topperList, FOOTWEAR)
          ));
          break;
        default:
          gridChildren.add(Container());
          break;
      }
    }

    outfit newOutfit;

    return MaterialApp(
        title: "Hello",
        home: Scaffold(
          appBar: AppBar(title: const Text("AppBarTitle")),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: ChipsInput(
                          // from https://stackoverflow.com/a/55944412/17836168
                          // todo(TurnipXenon): have initial value when users click from home page
                          initialValue: [],
                          decoration: InputDecoration(
                            labelText: "Select tag",
                          ),
                          // maxChips: 3,
                          findSuggestions: (String query) {
                            if (query.length != 0) {
                              var lowercaseQuery = query.toLowerCase();
                              return mockResults.where((profile) {
                                return profile.name
                                        .toLowerCase()
                                        .contains(query.toLowerCase()) ||
                                    profile.email
                                        .toLowerCase()
                                        .contains(query.toLowerCase());
                              }).toList(growable: false)
                                ..sort((a, b) => a.name
                                    .toLowerCase()
                                    .indexOf(lowercaseQuery)
                                    .compareTo(b.name
                                        .toLowerCase()
                                        .indexOf(lowercaseQuery)));
                            } else {
                              return const <AppProfile>[];
                            }
                          },
                          onChanged: (data) {
                            // todo(TurnipXenon): idk lol how does filtering work?
                          },
                          chipBuilder: (context, state, profile) {
                            return InputChip(
                              key: ObjectKey(profile),
                              label: Text(profile.name),
                              avatar: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              onDeleted: () => state.deleteChip(profile),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, state, profile) {
                            return ListTile(
                              key: ObjectKey(profile),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              title: Text(profile.name),
                              subtitle: Text(profile.email),
                              onTap: () => state.selectSuggestion(profile),
                            );
                          }),
                    ),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Filter")))
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: gridChildren,
                ),
              ),
              ElevatedButton(
                  onPressed: () => _save(),
                  child: Text("Save"))
            ],
          ),
        ));
  }

  void _save() {
    outfit newOutfit = outfit(
        [
          topperList[topperIndexNotifier.value],
          topperList[topIndexNotifier.value],
          topperList[bagIndexNotifier.value],
          topperList[bottomIndexNotifier.value],
          topperList[footwearIndexNotifier.value],
        ],
        "todo",
        []
    );
    // todo(TurnipXenon): save here
    // get the clothing via index
    // compile all into list
    // put in new outfit object
    // save to hive
  }
}

class OutfitUIData {
  // final image???;
  final String category;
  final String description;

  const OutfitUIData(this.category, this.description);
}

class AppProfile {
  final String name;
  final String email;
  final String imageUrl;

  const AppProfile(this.name, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}
