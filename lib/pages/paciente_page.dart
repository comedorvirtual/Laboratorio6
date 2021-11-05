import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trabajo6/model/paciente.dart';
import 'package:trabajo6/pages/paciente_new_screen.dart';
import 'package:trabajo6/widgets/side_bar_widget.dart';

class PacientePage extends StatefulWidget {
  static String id = 'products_page';

  @override
  _PacientePageState createState() => _PacientePageState();
}

final pacienteReference = FirebaseDatabase.instance.reference().child('pacientes');

class _PacientePageState extends State<PacientePage> {

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
        title: Text('Pacientes'),
        elevation: 20.0,
      ),
      drawer: SideBarWidget(),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewPaciente(context),
        
      ),
    );
  }

  void _createNewPaciente(BuildContext context) async{
    await Navigator.push(context,
    MaterialPageRoute(builder:
      (context) => PacienteNewScreen(Paciente(null, "", "","","")),
    ),
    );
  }

}
