// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final String imgAddress;
  const FormPage({Key? key, required this.imgAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Column(
        children: [
          Image.asset(imgAddress),
          const SizedBox(
            height: 5.0,
          ),
          MyCustomForm(),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  DateTime _dateTime = DateTime(2022, 12, 24);
  final _formKey = GlobalKey<FormState>();
  List<String> items = <String>['Pick a Gender', 'Male', 'Female'];
  String dropdownValue = 'Pick a Gender';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Citizen ID Number'),
                validator: (value) {
                  if (value == null) {
                    return 'Citizen ID number required';
                  }
                  if (value.length < 13) {
                    return 'Invalid ID Number';
                  }
                },
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${_dateTime.year}/${_dateTime.month}/${_dateTime.day}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) {
                        return;
                      }
                      setState(() => _dateTime = newDate);
                    },
                    child: const Text('Pick a Date'))
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            DropdownButton<String>(
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              value: dropdownValue,
              items: items.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data Processed')),
                    );
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
