import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}): super(key: key);

  Drawer getDrawer(BuildContext context) {
    var header = DrawerHeader(child: Text('Ajustes'));
    var info = AboutListTile(
      child: Text("Información app"),
      applicationIcon: Icon(Icons.favorite),
      applicationVersion: 'v1.0.0',
      icon: Icon(Icons.info)
    );
    ListTile getItem(Icon icon, String descripcion, String route) {
      return ListTile(
        leading: icon,
        title: Text(descripcion),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
    }

    ListView getList() {
      return ListView(children: <Widget>[
        header,
        getItem(Icon(Icons.settings), "Configuracion", '/settings'),
        getItem(Icon(Icons.home), "Home", '/'),
        getItem(Icon(Icons.battery_charging_full), "Bateria", '/battery'),
        info
      ],
      );
    }
    return Drawer(child: getList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página principal"),
      ),
      drawer: getDrawer(context),
    );
  }
}
