import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/generic_grid.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class GenericItemSelectorScreen extends StatefulWidget {
  @override
  _GenericItemSelectorScreenState createState() => _GenericItemSelectorScreenState();
}

class _GenericItemSelectorScreenState extends State<GenericItemSelectorScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.car,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];


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
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            ChipsInput(
              // todo(TurnipXenon): have initial value when users click from home page
                initialValue: [],
                decoration: InputDecoration(
                  labelText: "Select tag",
                ),
                maxChips: 3,
                findSuggestions: (String query) {
                  if (query.length != 0) {
                    var lowercaseQuery = query.toLowerCase();
                    return mockResults.where((profile) {
                      return profile.name.toLowerCase().contains(query.toLowerCase()) || profile.email.toLowerCase().contains(query.toLowerCase());
                    }).toList(growable: false)
                      ..sort((a, b) => a.name
                          .toLowerCase()
                          .indexOf(lowercaseQuery)
                          .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
                  } else {
                    return const <AppProfile>[];
                  }
                },
                onChanged: (data) {
                  print(data);
                },
                chipBuilder: (context, state, profile) {
                  return InputChip(
                    key: ObjectKey(profile),
                    label: Text(profile.name),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(profile.imageUrl),
                    ),
                    onDeleted: () => state.deleteChip(profile),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                }
            ),
            GenericGrid(),
          ],
        )
      ),
    );
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