import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}): super(key: key);

  ListTile getItem(Icon icon, String descripcion){
    return ListTile(
      leading: icon,
      title: Text(descripcion),
    );
  }

  ListView getList(){
    return ListView(children: <Widget>[
      getItem(Icon(Icons.settings), "Configuracion"),
      getItem(Icon(Icons.home), "Home"),
      getItem(Icon(Icons.battery_charging_full), "Bateria"),
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página principal"),
      ),
      drawer: Drawer(child: getList(),),
    );
  }
}
