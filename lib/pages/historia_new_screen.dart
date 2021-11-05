import 'package:flutter/material.dart';
import 'package:trabajo6/model/historial.dart';
import 'package:trabajo6/widgets/side_bar_widget.dart';

import 'historial_page.dart';

class HistorialNewScreen extends StatefulWidget {
  final Historial historial;
  HistorialNewScreen(this.historial);

  @override
  _HistorialNewScreenState createState() => _HistorialNewScreenState();
}

class _HistorialNewScreenState extends State<HistorialNewScreen> {
  late List<Historial> items;
  late TextEditingController _talla;
  late TextEditingController _peso;

  @override
  void initState() {
    _talla = TextEditingController(text: widget.historial.talla);
    _peso = TextEditingController(text: widget.historial.peso);
    super.initState();
  }

  @override
  void dispose() {
    _talla.dispose();
    _peso.dispose();
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
                    child: (widget.historial.id != null)
                        ? _TextLabel("Nuevo Historial")
                        : _TextLabel("Editar Historial"),
                  ),
                  _nameHistorial(),
                  _tallaHistorial(),
                  _pesoHistorial(),
                  _buttonHistorial(),
                ],
              ),
            ),),
        ),
      ),);
  }

  Widget _buttonHistorial() {
    return FlatButton(

      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 15.0,
        ),
        child: (widget.historial.id != null)
            ? _TextLabel('Actualizar')
            : _TextLabel('Agregar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.orange,
      onPressed: () {
        setState(() {
          _addHistorial();
        });
      },
    );
  }

  Widget _nameHistorial(){
    return TextField(
      controller: _talla,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Nombre del paciente",
      ),
    );
  }

  Widget _tallaHistorial(){
    return TextField(
      controller: _talla,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Estatura",
      ),
    );
  }

  Widget _pesoHistorial(){
    return TextField(
      controller: _peso,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        labelText: "Ubicacion",
      ),
    );
  }
  void _addHistorial(){
    try{
      if (widget.historial.id == null){
        historialReference.child((widget.historial.id).toString()).set({
          'talla':_talla.text,
          'peso':_peso.text,
        }).then(
              (_) => Navigator.pop(context),
        );
      } else {
        historialReference.push().set({
          'talla':_talla.text,
          'peso':_peso.text,
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
    return Text(
        "Crear Usuario",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        )
    );
  }
}