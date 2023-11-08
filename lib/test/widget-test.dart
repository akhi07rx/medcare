import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icons Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Icons Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: initList().length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
            ),
            itemBuilder: (context, index) => displayIcon(initList()[index]),
          ),
        ));
  }

  List<IconData> initList() => <IconData>[
        AntDesign.home,
        Ionicons.ios_home,
        FontAwesome.home,
        MaterialIcons.home,
        FontAwesome5.address_book,
        FontAwesome5Solid.home,
        FontAwesome5Brands.hacker_news,
        FlutterIcons.home_ant,
        FlutterIcons.$500px_faw5d,
        WeatherIcons.wi_alien,
        WeatherIcons.wi_cloud,
        WeatherIcons.wi_day_rain,
        Brandico.facebook_1,
        MfgLabs.heart,
        Linecons.heart,
        RpgAwesome.ammo_bag,
        Maki.aboveground_rail
      ];

  Widget displayIcon(IconData icon) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute<void>(builder: (BuildContext context) {
            return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 100),
                      ]),
                ));
          }));
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Icon(icon)]));
  }
}
