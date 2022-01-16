import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/clothing.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/generic_grid.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class GenericItemSelectorScreen extends StatefulWidget {
  @override
  _GenericItemSelectorScreenState createState() =>
      _GenericItemSelectorScreenState();
}

class _GenericItemSelectorScreenState extends State<GenericItemSelectorScreen> {
  ValueNotifier<List<clothing>> clothsNotifier = ValueNotifier([]);

  ScrollController _controller;
  List<dynamic> _tags = [];

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.

    // todo(TurnipXenon)
    clothsNotifier.value = new List<clothing>.from(clothings);

    super.initState();
  }

  // todo(TurnipXenon): run async
  // todo(TurnipXenon): remove hardcode
  void filterClothes(List<dynamic> data) {
    _tags = data;
    List<clothing> _cloths = [];

    if (_tags.isEmpty) {
      // todo(TurnipXenon): if no filter, get all
      _cloths = new List<clothing>.from(clothings);
    } else {
      // todo(TurnipXenon): if has filter, get some
      _cloths = [];
    }
    clothsNotifier.value = _cloths;
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
                          // todo(TurnipXenon): cancel previously running query then hit a query again?
                          filterClothes(data);
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
            ValueListenableBuilder(
                valueListenable: clothsNotifier,
                builder: (BuildContext context, List<clothing> value, Widget child) {
                  // print(value.length);
                  return GenericGrid(value);
                }
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    clothsNotifier.dispose();
    super.dispose();
  }
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
