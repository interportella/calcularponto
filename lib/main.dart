import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcular Ponto',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calcular horário de trabalho'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay h1 = new TimeOfDay(hour: 8, minute: 0);
  TimeOfDay h2 = new TimeOfDay(hour: 12, minute: 0);
  TimeOfDay h3 = new TimeOfDay(hour: 13, minute: 0);
  TimeOfDay h4 = new TimeOfDay(hour: 17, minute: 0);

  String tempo = '';

  void _calcularTotalHoras() {
    setState(() {
      var total =
          ((h2.hour + (h2.minute) / 60) - (h1.hour + (h1.minute) / 60)) +
              ((h4.hour + (h4.minute) / 60) - (h3.hour + (h3.minute) / 60));
      tempo = total.toStringAsFixed(2);
    });
  }

  TextEditingController timeCtlEntrada = TextEditingController();
  TextEditingController timeCtlSaidaAlmoco = TextEditingController();
  TextEditingController timeCtlRetornoAlmoco = TextEditingController();
  TextEditingController timeCtlSaida = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                  controller: timeCtlEntrada,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Horário entrada'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());

                    TimeOfDay picked =
                        await showTimePicker(context: context, initialTime: h1);
                    if (picked != null) {
                      timeCtlEntrada.text = picked.format(context);
                      setState(() {
                        h1 = picked;
                        _calcularTotalHoras();
                      });
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                  controller: timeCtlSaidaAlmoco,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Saída almoço'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());

                    TimeOfDay picked =
                        await showTimePicker(context: context, initialTime: h2);
                    if (picked != null) {
                      timeCtlSaidaAlmoco.text = picked.format(context);
                      setState(() {
                        h2 = picked;
                        _calcularTotalHoras();
                      });
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                  controller: timeCtlRetornoAlmoco,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Retorno almoço'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());

                    TimeOfDay picked =
                        await showTimePicker(context: context, initialTime: h3);
                    if (picked != null) {
                      timeCtlRetornoAlmoco.text = picked.format(context);
                      setState(() {
                        h3 = picked;
                        _calcularTotalHoras();
                      });
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                  controller: timeCtlSaida,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Horário saída'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());

                    TimeOfDay picked =
                        await showTimePicker(context: context, initialTime: h4);
                    if (picked != null) {
                      timeCtlSaida.text = picked.format(context);
                      setState(() {
                        h4 = picked;
                        _calcularTotalHoras();
                      });
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  tempo == '' ? '' : '$tempo' + 'h',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _calcularTotalHoras,
      //   tooltip: 'Calcular',
      //   child: Icon(Icons.calculate),
      // ),
    );
  }
}
