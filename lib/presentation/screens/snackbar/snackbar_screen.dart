import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      children: [const Text('Culpa sdfsdfsdfsdfdsfsd fdsfs')]);
                },
                child: Text('Licencias Usadas'),
                ),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                 child: Text('Mostrar dialogos'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas Seguro?'),
        content: const Text(
            'fdsfsdf fsdf f dsfdsfds fsdfsdf dsf sdf sdfsd fsdf sdf dsf'),
        actions: [
          TextButton(onPressed: () => context.pop(), 
          child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), 
          child: const Text('Aceptar'))

        ],
      ),
    );
  }
}
