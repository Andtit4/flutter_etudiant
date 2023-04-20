import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _receiveNotifications;
  late String _username;
  late int _age;

  @override
  void initState() {
    super.initState();
    // Initialisation des valeurs des paramètres
    _receiveNotifications = true;
    _username = 'Alice';
    _age = 25;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          SwitchListTile(
            title: Text('Recevoir des notifications'),
            value: _receiveNotifications,
            onChanged: (bool value) {
              setState(() {
                _receiveNotifications = value;
              });
            },
          ),
          TextFormField(
            initialValue: _username,
            decoration: InputDecoration(
              labelText: 'Nom d\'utilisateur',
            ),
            onChanged: (String value) {
              setState(() {
                _username = value;
              });
            },
          ),
          TextFormField(
            initialValue: _age.toString(),
            decoration: InputDecoration(
              labelText: 'Âge',
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _age = int.parse(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
