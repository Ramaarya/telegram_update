import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = '/Settings';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool statusNotifikasi = false;
  bool statusNada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Notifikasi Masuk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              statusNotifikasi ? 'Dinyalakan' : 'Dimatikan',
              style: const TextStyle(
                color: Colors.white54,
              ),
            ),
            trailing: Switch.adaptive(
              value: statusNotifikasi,
              onChanged: (value) {
                setState(() {
                  statusNotifikasi = !statusNotifikasi;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Nada Dering Notifikasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              statusNada ? 'Dinyalakan' : 'Dimatikan',
              style: const TextStyle(
                color: Colors.white54,
              ),
            ),
            trailing: Switch.adaptive(
              value: statusNada,
              onChanged: (value) {
                setState(() {
                  statusNada = !statusNada;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
