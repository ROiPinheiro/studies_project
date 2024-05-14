import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:studies_project/app/ui/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController();
  final nameEC = TextEditingController();
  final ageEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Watch((context) => Text(userSignal.value?.name.value ?? '')),
              Watch(
                (_) => TextFormField(
                  controller: nameEC,
                  onChanged: controller.validateName,
                  decoration: InputDecoration(
                    label: const Text('Nome'),
                    errorText: nameSignalError.value,
                  ),
                ),
              ),
              Watch(
                (_) => TextFormField(
                  controller: ageEC,
                  onChanged: controller.validateAge,
                  decoration: InputDecoration(
                    label: const Text('Idade'),
                    errorText: ageSignalError.value,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.submit(
                  nameEC.text,
                  ageEC.text,
                ),
                child: const Text('Enviar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
