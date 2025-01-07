import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Calculadordepresion());
  }
}

class Calculadordepresion extends StatefulWidget {
  const Calculadordepresion({super.key});

  @override
  State<Calculadordepresion> createState() => _CalculadordepresionState();
}

class _CalculadordepresionState extends State<Calculadordepresion> {
  GlobalKey<FormState> Q = GlobalKey<FormState>();
  String profundidad = "";
  String densidad = "";
  String presionexterna = "";
  double presionmanometrica = 0.0;
  double presionmanometrica2 = 0.0;
  double presionmanometrica3 = 0.0;
  double presionabsoluta = 0.0;
  double presionabsoluta2 = 0.0;
  double presionabsoluta3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Presión'),
        backgroundColor: Colors.blue[100],
      ),
      body: Form(
        key: Q,
        child: ListView(
          children: [
            Column(
              children: [
                Image.network(
                    "https://www.translatorscafe.com/static/ucvt/img/calc-hydrostatic-pressure-scheme.png"),
                TextFormField(
                  decoration: InputDecoration(labelText: " profundidad (m)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "pon algo";
                    }
                    if (double.tryParse(value) == null || value.isEmpty) {
                      return "debe ser un numero";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    profundidad = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: " densidad de liquido (kg/m³)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "pon algo";
                    }
                    if (double.tryParse(value) == null || value.isEmpty) {
                      return "debe ser un numero";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    densidad = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: " presion externa (pa)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "pon algo";
                    }
                    if (double.tryParse(value) == null || value.isEmpty) {
                      return "debe ser un numero";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    presionexterna = value!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: _calculo, child: Text("calcular presion")),
                SizedBox(
                  height: 15,
                ),
                Text("La presion manometrica es de:"),
                Text(" $presionmanometrica (Pa)"),
                Text("$presionmanometrica2 (kg/m2)"),
                Text("$presionmanometrica3 (kg/cm2)"),
                SizedBox(
                  height: 30,
                ),
                Text("La presion absoluta (osea la real) es de:"),
                Text("$presionabsoluta (Pa)"),
                Text("$presionabsoluta2 (kg/m2)"),
                Text("$presionabsoluta3 (kg/cm2)"),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                    "https://phantom-elmundo.unidadeditorial.es/07d9aa6f422a58af557bc82828d6488e/resize/828/f/jpg/assets/multimedia/imagenes/2019/01/02/15464320849700.jpg"),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _calculo() {
    if (Q.currentState!.validate()) {
      Q.currentState!.save();
    }

    double den = double.tryParse(densidad) ?? 0;
    double prof = double.tryParse(profundidad) ?? 0;
    double pext = double.tryParse(presionexterna) ?? 0;

    setState(() {
      presionmanometrica = prof * den * 9.80665;
      presionmanometrica2 = presionmanometrica * 0.102;
      presionmanometrica3 = presionmanometrica2 * 0.0001;
      presionabsoluta = presionmanometrica + pext;
      presionabsoluta2 = (presionmanometrica2) + (pext * 0.102);
      presionabsoluta3 = (presionmanometrica * 0.0000102) + (pext * 0.0000102);
    });
  }
}
