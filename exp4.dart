import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Exp 4';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  bool _value = false;
  int value1 = 1;
  int value2 = 2;
  int value3 = 3;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    var _ratingController;
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'Dob',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Date of Birth';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                icon: Icon(Icons.book),
              ),
              value: _ratingController,
              onSaved: (value) {
                setState(() {
                  _ratingController = value;
                });
              },
              items: [
                'Computer Science',
                'Information Technology',
                'Mechanical',
                'EXTC',
                'PPT'
              ]
                  .map((label) => DropdownMenuItem(
                        child: Text(label.toString()),
                        value: label,
                      ))
                  .toList(),
              hint: Text('Select Your Branch'),
              onChanged: (value) {
                setState(() {
                  _ratingController = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please choose your branch';
                }
                return null;
              },
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: const <Widget>[
                  Text(
                    'Select',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            )),
            Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value1;
                        });
                      },
                      activeColor: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value2;
                        });
                      },
                      activeColor: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.blueAccent,
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Are all the fields filled?',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                )),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (val < 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Enter your Gender')),
                        );
                      } else if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Sucessfully Submitted')),
                        );
                      }
                    }
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ],
        ));
  }
}



