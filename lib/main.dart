import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main() => runApp(FaceApiApp());

class FaceApiApp extends StatefulWidget {
  @override
  State<StatefulWidget>  createState() => new _MyAppState();
}

class _MyAppState extends State<FaceApiApp>
{
 File _imagen;

 Future obtenerImagen() async{ //Metodo tomsr foto

   var imagen = await ImagePicker.pickImage(source: ImageSource.camera);
   setState(() {
     _imagen = imagen;
   });
 }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(title: 'Titulo Cabecera', home: new Scaffold
      (appBar: new AppBar(title: new Text('Titulo Cabecera'),
       ), //Titulo
       body: new Center(child: _imagen == null? new Text('No hay una imagen seleccionada.'): new Image.file(_imagen)),
       floatingActionButton: new FloatingActionButton(onPressed: obtenerImagen,tooltip: 'Tomar Foto', child: new Icon(Icons.photo_camera),), //Boton Camara
    ),); //body
  }
}