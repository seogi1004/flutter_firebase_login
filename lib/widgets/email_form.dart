import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  EmailFormState createState() {
    return EmailFormState();
  }
}

class EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailCtrl,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-Mail',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _passwordCtrl,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  try {
                    var user = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailCtrl.text,
                            password: _passwordCtrl.text);

                    print('login success! $user');
                  } on FirebaseAuthException catch (e) {
                    print('an error occured $e');
                  }
                }
              },
              child: const Text('E-Mail Login'),
            ),
          ),
        ],
      ),
    );
  }
}
