import 'package:flutter/material.dart';
import 'screen4.dart'; 

class Screen3 extends StatelessWidget {
  final double totalAmount; // Monto total disponible
  final Function(double) onTransfer; // Función para actualizar el monto total

  const Screen3({super.key, required this.totalAmount, required this.onTransfer});

  @override
  Widget build(BuildContext context) {
    //campos de texto
    final TextEditingController recipientController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir'),
      ),
      body: Container(
        color: Colors.lightBlue, 
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(
              'assets/logo.png', //logo
              height: 200,
            ),
            const SizedBox(height: 20), 
            Text(
              'Monto total: ${totalAmount.toStringAsFixed(2)}', // monto total
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), 
            TextField(
              controller: recipientController,
              decoration: const InputDecoration(
                labelText: '¿A quién vas a transferir?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), 
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: '¿Cuánto vas a transferir?',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, 
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(amountController.text) ?? 0; // Intenta convertir el texto a un número
                if (amount > 0 && amount <= totalAmount) {
                  onTransfer(amount); //monto total
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen4(
                        recipient: recipientController.text, // Nombre del destinatario
                        amount: amount, // Monto transferido
                        remainingAmount: totalAmount - amount, // Monto restante
                      ),
                    ),
                  );
                } else {
                  //error si el monto es inválido
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Monto inválido o excede el total')),
                  );
                }
              },
              child: const Text('Transferir'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}