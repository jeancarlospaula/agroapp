import 'package:agroapp/screens/login.dart';
import 'package:flutter/material.dart';

import 'listagem_despesas.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void navigatelistagem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DespesasList(),
      ),
    );
  }

  void navigateTempo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(), //Tempo(),
      ),
    );
  }

  void navigateIndices() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login() //Indices(),
          ),
    );
  }

  void navigateMedidores() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login() //Medidor(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                navigatelistagem();
              },
              splashColor: Colors.green.withAlpha(30),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Cotação", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                navigateTempo();
              },
              splashColor: Colors.green.withAlpha(30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.sunny,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Tempo", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                navigateIndices();
              },
              splashColor: Colors.green.withAlpha(30),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.graphic_eq_outlined,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Índices", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                navigateMedidores();
              },
              splashColor: Colors.green.withAlpha(30),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.device_thermostat_outlined,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Medidores", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
