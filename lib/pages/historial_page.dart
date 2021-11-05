import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trabajo6/model/historial.dart';
import 'package:trabajo6/widgets/side_bar_widget.dart';

import 'historia_new_screen.dart';

class HistorialPage extends StatefulWidget {
  static String id = 'historial_page';

  @override
  _HistorialPageState createState() => _HistorialPageState();
}

final historialReference = FirebaseDatabase.instance.reference().child('historial');

class _HistorialPageState extends State<HistorialPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Historial'),
        elevation: 20.0,
      ),
      drawer: SideBarWidget(),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewHistorial(context),

      ),
    );
  }

  void _createNewHistorial(BuildContext context) async{
    await Navigator.push(context,
      MaterialPageRoute(builder:
          (context) => HistorialNewScreen(Historial(null, "", "")),
      ),
    );
  }

}
