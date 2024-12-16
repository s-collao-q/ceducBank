import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final String recipient;
  final double amount;
  final double remainingAmount;

  const Screen4({
    super.key,
    required this.recipient,
    required this.amount,
    required this.remainingAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranferencia exitosa!'),
      ),
      body: Container(
        color: Colors.lightBlue, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Image.asset(
                'assets/logo.png', 
                height: 200, 
              ),
              const SizedBox(height: 20), 
              Text(
                'Se ha realizado con éxito la transferencia a $recipient',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Se ha transferido $amount. ',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'Su monto total restante son : ${remainingAmount.toStringAsFixed(2)}. ',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), 
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst); // Regresar a la primera pantalla 
                },
                child: const Text('Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}