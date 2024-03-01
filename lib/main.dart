import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool _passwordVisible = false;
List<double> loginFormSize = [100.0, 200.0]; // Specify double type explicitly
@override
void initState() {
  _passwordVisible = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rcampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF270808)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rcampus'),
    );
  }
}

class ToggelablePasswordField extends StatefulWidget {
  const ToggelablePasswordField({super.key});

  @override
  State<ToggelablePasswordField> createState() =>
      _ToggelablePasswordFieldState();
}

class _ToggelablePasswordFieldState extends State<ToggelablePasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: loginFormSize[1],
      height: loginFormSize[0],
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible, //This will obscure text dynamically
        decoration: InputDecoration(
          labelText: 'Password',
          // Here is key idea
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          contentPadding: EdgeInsets.only(top: 0.0, bottom: 10.0),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login:",
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(
                  width: loginFormSize[1],
                  height: loginFormSize[0],
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Enter your username",
                        contentPadding:
                            EdgeInsets.only(top: 0.0, bottom: 10.0)),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const ToggelablePasswordField()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add record',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
