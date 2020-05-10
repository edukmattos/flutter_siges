import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import '../../../config/app_config.dart';
import '../../../models/material_unit_model.dart';
import 'material_new_controller.dart';

class MaterialNewPage extends StatefulWidget {
  final String title;
  const MaterialNewPage({Key key, this.title = appMaterialNewPageTag})
      : super(key: key);

  @override
  _MaterialNewPageState createState() => _MaterialNewPageState();
}

class _MaterialNewPageState
    extends ModularState<MaterialNewPage, MaterialNewController> {

  List<MaterialUnitModel> materialUnitsOptions = [];
  MaterialUnitModel materialUnitSelected;

  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  List<String> suggestions = [
    "m",
    "m2",
    "m3",
    "kg",
    "g",
    "l",
    "pc"
  ];

  @override
  void initState() {

    //print("Materiais: ${controller.materialUnits}");

    materialUnitsOptions.add(MaterialUnitModel(code:"m", id:"1"));
    materialUnitsOptions.add(MaterialUnitModel(code:"m2", id:"2"));
    materialUnitsOptions.add(MaterialUnitModel(code:"m3", id:"3"));
    
    super.initState();
  }

      
  Widget _submitButton() {
    return RaisedButton(
      child: new Text("Confirmar", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
              print("Material Saved !");
              //var result = await controller.save();
              ////print(result);
              //if (result) {
              //  Modular.to.pushReplacementNamed('/materials');
              //} else {
              //  _flushBar();
              //}
            }
          : null,
    );
  }

  Widget _flushBar() {
    return Flushbar(
      //title: controller.errorTitle,
      //message: controller.errorMsg,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      //showProgressIndicator: true,
      //progressIndicatorController: controller.errorMsg,
      //progressIndicatorBackgroundColor: Colors.grey[800],
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.error_outline,
        size: 30.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appBackgroundColor,
          centerTitle: true,
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                    name: 'codeObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: true,
                        onChanged: controller.changeCode,
                        obscureText: false,
                        maxLines: 1,
                        //keyboardType: TextInputType.number,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Codigo',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateCode(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'descriptionObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: false,
                        onChanged: controller.changeDescription,
                        obscureText: false,
                        maxLines: 1,
                        //keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descricao',
                          prefixIcon:
                              Icon(Icons.face, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateDescription(),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),

                Observer(
                    name: 'descriptionObserver',
                    builder: (_) {
                      return SimpleAutoCompleteTextField(
                        key: key,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descricao',
                          prefixIcon:
                              Icon(Icons.face, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateMaterialUnitId(),
                        ),
                        suggestions: suggestions,
                        textChanged: (text) => currentText = text,
                        clearOnSubmit: true,
                        textSubmitted: (text) => setState(() {
                              if (text != "") {
                                added.add(text);
                              }
                            }),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),

                Observer(
                    name: 'materialUnitObserver',
                    builder: (_) {
                      return TextFormField(
                        autofocus: false,
                        onChanged: controller.changeMaterialUnitId,
                        obscureText: false,
                        maxLines: 1,
                        //keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Unidade',
                          prefixIcon:
                              Icon(Icons.face, color: Colors.orange, size: 20),
                          helperText: ' ',
                          errorText: controller.validateMaterialUnitId(),
                        ),
                      );
                    }),          
                SizedBox(
                  height: 10,
                ),
                
                Observer(
                    name: 'materialUnitObserver1',
                    builder: (_) {
                      return SearchableDropdown<MaterialUnitModel>.single(
                        items: materialUnitsOptions.map((model) {
                          return DropdownMenuItem<MaterialUnitModel>(
                            child: Text(model.code),
                            value: model,
                          );
                        }).toList(),
                        value: materialUnitSelected,
                        hint: "Unidade",
                        searchHint: "Material: Unidade",
                        validator: null,
                        onChanged: controller.changeMaterialUnitId,
                        isExpanded: true,
                      );
                    }
                ),

                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'submitButtonObserver',
                    builder: (_) {
                      return _submitButton();
                    }
                ),
              ],
            ),
          ),
        ]));
  }
}
