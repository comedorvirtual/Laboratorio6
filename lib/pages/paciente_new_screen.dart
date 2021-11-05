import 'package:flutter/material.dart';
import 'package:trabajo6/model/paciente.dart';
import 'package:trabajo6/widgets/side_bar_widget.dart';

import 'paciente_page.dart';

class PacienteNewScreen extends StatefulWidget {
  final Paciente paciente;
  PacienteNewScreen(this.paciente);

  @override
  _PacienteNewScreenState createState() => _PacienteNewScreenState();
}

class _PacienteNewScreenState extends State<PacienteNewScreen> {
  late List<Paciente> items;
  late TextEditingController _nombre;
  late TextEditingController _fechaNacimiento;
  late TextEditingController _estatura;
  late TextEditingController _ubicacion;

  @override
  void initState() {
    _nombre = TextEditingController(text: widget.paciente.nombre);
    _fechaNacimiento = TextEditingController(text: widget.paciente.fechaNacimiento);
    _estatura = TextEditingController(text: widget.paciente.estatura);
    _ubicacion = TextEditingController(text: widget.paciente.ubicacion);
    super.initState();
  }

  @override
  void dispose() {
    _nombre.dispose();
    _fechaNacimiento.dispose();
    _estatura.dispose();
    _ubicacion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Historial"),
        ),
        drawer: SideBarWidget(),
        body: Center(
          child:Container(
          height: 600.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 20.0,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                  child: (widget.paciente.id != null)
                  ? _TextLabel("Nuevo Historial")
                  : _TextLabel("Editar Paciente"),
                ),
                _namePaciente(),
                _fechaNacimientoPaciente(),
                _estaturaPaciente(),
                _buttonPaciente(),
              ],
          ),
        ),),
      ),
      ),);
  }

  Widget _buttonPaciente() {
    return FlatButton(

      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 15.0,
        ),
        child: (widget.paciente.id != null)
          ? _TextLabel('Actualizar')
          : _TextLabel('Agregar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.orange,
      onPressed: () {
        setState(() {
          _addPaciente();
        });
      },
    );
  }

  Widget _namePaciente(){
    return TextField(
      controller: _nombre,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Nombre del paciente",
      ),
    );
  }

  Widget _fechaNacimientoPaciente(){
    return TextField(
      controller: _fechaNacimiento,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Peso",
      ),
    );
  }

  Widget _estaturaPaciente(){
    return TextField(
      controller: _estatura,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Talla",

      ),
    );
  }

  void _addPaciente(){
    try{
      if (widget.paciente.id == null){
        pacienteReference.child((widget.paciente.id).toString()).set({
          'nombre':_nombre.text,
          'fechaNacimiento':_fechaNacimiento.text,
          'estatura':_estatura.text,
          'ubicacion':_ubicacion.text,
        }).then(
            (_) => Navigator.pop(context),
        );
      } else {
        pacienteReference.push().set({
          'nombre':_nombre.text,
          'fechaNacimiento':_fechaNacimiento.text,
          'estatura':_estatura.text,
          'ubicacion':_ubicacion.text,
        }).then(
              (_) => Navigator.pop(context),
        );
      }
    } catch (e) {
    }
  }
}



class _TextLabel extends StatelessWidget {

  final String label;
  _TextLabel(this.label);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "Crear",
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      )
    );
  }
}