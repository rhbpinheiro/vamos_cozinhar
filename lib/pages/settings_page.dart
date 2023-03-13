import 'package:flutter/material.dart';

import 'package:shop/widgets/main_drawer.dart';

import '../models/settings.dart';

class SetingsPage extends StatefulWidget {
  final Function(Settings)? onChangeSettings;
  final Settings? settings;
  const SetingsPage({
    Key? key,
    this.onChangeSettings,
    this.settings,
  }) : super(key: key);

  @override
  State<SetingsPage> createState() => _SetingsPageState();
}

class _SetingsPageState extends State<SetingsPage> {
  Settings? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings!;
  }

  SwitchListTile _createSwitch(
    String? title,
    String? subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title!),
      subtitle: Text(subtitle!),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onChangeSettings!(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glutém!',
                  settings!.isGlutenFree,
                  (value) => setState(
                    () {
                      settings!.isGlutenFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settings!.isLactoseFree,
                  (value) => setState(
                    () {
                      settings!.isLactoseFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settings!.isVegan,
                  (value) => setState(
                    () {
                      settings!.isVegan = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(
                    () {
                      settings!.isVegetarian = value;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
