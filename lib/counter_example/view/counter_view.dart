import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterView extends StatelessWidget {
   CounterView({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text('Counter Provider Example'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(context.watch<CounterProvider>().number.toString(),style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                    onPressed: () => _key.currentState!.context.read<CounterProvider>().increaseNumber(),
                    child: const Icon(Icons.add,color: Colors.black)),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                    onPressed: () => context.read<CounterProvider>().resetNumber(),
                    child: const Icon(Icons.refresh,color: Colors.black)),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                    onPressed: () => context.read<CounterProvider>().decreaseNumber(),
                    child: const Icon(Icons.minimize,color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
