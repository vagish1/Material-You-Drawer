import 'package:example/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DrawerHeader(),
                const SizedBox(
                  height: 16.0,
                ),
                DrawerNavigationItem(
                  iconData: Icons.mail_outline_rounded,
                  title: "Messages",
                  onTap: () {},
                  selected: true,
                ),
                DrawerNavigationItem(
                  iconData: Icons.star_outline_rounded,
                  title: "Starred",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Starred");
                    }));
                  },
                  selected: false,
                ),
                DrawerNavigationItem(
                  iconData: Icons.archive_outlined,
                  title: "Archieved",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Archieved");
                    }));
                  },
                  selected: false,
                ),
                DrawerNavigationItem(
                  iconData: Icons.block,
                  title: "Spam and blocked",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Spam and blocked");
                    }));
                  },
                  selected: false,
                ),
                const Divider(
                  thickness: 1.0,
                ),
                DrawerNavigationItem(
                  iconData: Icons.device_hub_rounded,
                  title: "Device Pairing",
                  selected: false,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Device Pairing");
                    }));
                  },
                ),
                DrawerNavigationItem(
                  iconData: Icons.dark_mode_outlined,
                  title: "Choose theme",
                  selected: false,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Choose theme");
                    }));
                  },
                ),
                DrawerNavigationItem(
                  iconData: Icons.mark_chat_read_outlined,
                  title: "Mark all as read",
                  selected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Material You Drawer"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You can also open drawer using different button",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                child: Text("Open Drawer"),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerNavigationItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool selected;
  final Function() onTap;
  const DrawerNavigationItem({
    Key? key,
    required this.iconData,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      leading: Icon(iconData),
      onTap: onTap,
      title: Text(title),
      selectedTileColor: Colors.blueAccent.shade100,
      selected: selected,
      selectedColor: Colors.black87,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: NetworkImage(
            "https://www.gizmochina.com/wp-content/uploads/2020/09/Google-Messages-Logo-Featured.jpg",
          ),
        ),
        Text(
          "Messages",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
