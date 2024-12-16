import 'package:flutter/material.dart';
import 'screen2.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:ceducbank/firebase_options.dart';

/* void main() => runApp(const MyApp());
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), // Cambia a HomeScreen
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalAmount = 1000000; // Monto total inicial

  void updateTotalAmount(double amount) {
    setState(() {
      totalAmount -= amount; // Actualiza el monto total
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.lightBlue, // Color de fondo 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'), // el logo
              const SizedBox(height: 20), // Espacio entre el logo y el botón
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(
                        totalAmount: totalAmount,
                        onTransfer: updateTotalAmount,
                      ),
                    ),
                  ); // Navegar a Screen2
                },
                child: const Text('Siguiente'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}