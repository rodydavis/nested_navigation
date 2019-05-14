# Nested Navigation Demo Adjustment
This repository is an adjustment to bizz84s nested-navigation-demo.
You'll find it [here](https://github.com/bizz84/nested-navigation-demo-flutter)

## About bizz84s version
This architecture is very good to have a BottomNavigationBar where the states of each Tab are saved but there is a big problem if you want to add a TextInput to a Tab. You can't focus it properly and the keyboard will not open. This is because the navigators are on the same level and the focus is everytime at the last navigator even the offstage property is on true. More informations: [#17096](https://github.com/flutter/flutter/issues/17098)

## Solution
My Solution for this problem is to use the root navigator to navigate to the page within a TextInput.

At first you have to define routes on your MaterialApp:

main.dart
```dart
MaterialApp(
      //...
      routes: {
        "/": (BuildContext context) => App(),
        "/inputPage": (BuildContext context) => InputPage(),
      }
```

Then push the context of your Material App to the pages to give access to the navigator of the MaterialApp

app.dart
```dart
Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
        //...
        rootContext: context,
      ),
    );
  }
```
tab_navigator.dart
```dart
final BuildContext rootContext;
TabNavigator({this.navigatorKey, this.tabItem, this.rootContext});

//...

Map<String, WidgetBuilder> _routeBuilders(BuildContext context,{int materialIndex: 500}) {
    return {
      //...
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            //..
            rootContext: rootContext,
          ),
    };
}
```

color_detail_page.dart
```dart
final BuildContext rootContext;
ColorDetailPage({this.color, this.title, this.materialIndex: 500, this.rootContext});
```

Then you can call on your page this to navigate to the InputPage

color_detail_page.dart
```dart
Navigator.of(rootContext).pushNamed('/inputPage');
```

You also have to change this so if you pop from InputPage you go back to the navigator you used before

app.dart
```dart
static TabItem currentTab = TabItem.red;
  
static Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    //...
};
```

Important to know is you have no access to the BottomNavigation inside your InputPage

input_page.dart
```dart
class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputPage'),
      ),
      body: Center(
        child: Container(
          child: TextFormField(),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
```

## Credits
Andrea Bizzotto: for publishing the root code of this repository

Brian Egan: for suggesting to use Stack + Offstage & Navigator widgets.

## [License: MIT](https://github.com/bizz84/nested-navigation-demo-flutter/blob/master/LICENSE.md)
