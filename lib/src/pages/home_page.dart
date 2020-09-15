import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http_app/src/services/test_service.dart';
import 'package:http_app/src/models/heroe_model.dart';
import 'package:http_app/src/utils/json_icon_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Héroes'),
      ),
      body: Container(
        child: FutureBuilder(
          future: TestService().getHeroes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<HeroeModel>> snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Cargando..."),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var currentHeroe = snapshot.data[index];
                    return ListTile(
                      title:
                          Text(utf8.decode(currentHeroe.nombre.runes.toList())),
                      subtitle:
                          Text(utf8.decode(currentHeroe.poder.runes.toList())),
                      leading: getIcon(currentHeroe.icon, currentHeroe.color),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print("Soy ${currentHeroe.nombre}");
                      },
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
