import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buttonList(),
    );
  }

  Widget _buttonList() {
    final List<String> _entries = <String>["Programmes", "Exercises"];

    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: _entries.length,
      itemBuilder: (BuildContext context, int index) {
        return FractionallySizedBox(
          widthFactor: .66,
          child: RaisedButton(
            child: Center(child: Text("${_entries[index]}")),
            elevation: 6,
            focusElevation: 12,
            textColor: Colors.white,
            onPressed: () {},
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
