import 'package:flutter/material.dart';
import 'screen3.dart'; 

class Screen2 extends StatelessWidget {
  final double totalAmount;
  final Function(double) onTransfer;

  const Screen2({super.key, required this.totalAmount, required this.onTransfer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'), // Título del AppBar
      ),
      body: Container(
        color: Colors.lightBlue, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // logo
                height: 200, 
              ),
              const SizedBox(height: 10), // Espacio entre el logo y los botones
              const SizedBox(height: 10), // Espacio entre botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen3(
                            totalAmount: totalAmount,
                            onTransfer: onTransfer,
                          ),
                        ),
                      ); // PUSH A Screen3
                    },
                    child: const Text('Transferencias'), // Botón de Transferencias
                  ),
                  const SizedBox(width: 20), // Espacio entre botones
                  ElevatedButton(
                    onPressed: () {
                      // Acción para Créditos
                    },
                    child: const Text('Créditos'), 
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio entre filas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para Beneficios
                    },
                    child: const Text('Beneficios'), 
                  ),
                  const SizedBox(width: 20), // Espacio entre botones
                  ElevatedButton(
                    onPressed: () {
                      // Acción para Pagos
                    },
                    child: const Text('Pagos'), 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}