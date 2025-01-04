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
  final TextEditingController profundidadcontrolador = TextEditingController();
  final TextEditingController densidadliquidocontrolador =
      TextEditingController();
  final TextEditingController presionexternacontrolador =
      TextEditingController();
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
      body: ListView(
        children: [
          Column(
            children: [
              Image.network(
                  "https://www.translatorscafe.com/static/ucvt/img/calc-hydrostatic-pressure-scheme.png"),
              TextField(
                decoration: InputDecoration(labelText: " profundidad (m)"),
                controller: profundidadcontrolador,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: " densidad de liquido (kg/m³)"),
                controller: densidadliquidocontrolador,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: " presion externa (pa)"),
                controller: presionexternacontrolador,
                keyboardType: TextInputType.number,
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
    );
  }

  void _calculo() {
    final double profundidad = double.parse(profundidadcontrolador.text);
    final double densidadliquido =
        double.parse(densidadliquidocontrolador.text);
    final double presionexterna = double.parse(presionexternacontrolador.text);
    setState(() {
      presionmanometrica = profundidad * densidadliquido * 9.80665;
      presionmanometrica2 = presionmanometrica * 0.102;
      presionmanometrica3 = presionmanometrica2 * 0.0001;
      presionabsoluta = presionmanometrica + presionexterna;
      presionabsoluta2 = (presionmanometrica2) + (presionexterna * 0.102);
      presionabsoluta3 =
          (presionmanometrica * 0.0000102) + (presionexterna * 0.0000102);
    });
  }
}
