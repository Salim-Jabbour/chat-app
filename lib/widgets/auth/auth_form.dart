import 'dart:io' as io;

import 'package:flutter/material.dart';

import '../pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {super.key});
  final bool isLoading;
  final void Function(
    String email,
    String name,
    String password,
    io.File? image,
    bool isLogin,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isShown = true;

  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  io.File? _pickedImageFile;

  void _imagePicker(io.File? image) {
    _pickedImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_pickedImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Please Pick an image',
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }
    if (isValid) {
      _formkey.currentState!.save();

      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _pickedImageFile,
        _isLogin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) UserImagePicker(imagePickerFn: _imagePicker),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'EmailAddress'),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  !_isLogin
                      ? TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter at least 4 characters';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          onSaved: (value) {
                            _userName = value!;
                          })
                      : const SizedBox.shrink(),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Please enter at least 8 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                              icon: Icon(_isShown
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded),
                              onPressed: () {
                                setState(() {
                                  _isShown = !_isShown;
                                });
                              },
                            ),
                          )),
                      obscureText: !_isShown,
                      onSaved: (value) {
                        _userPassword = value!;
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  !widget.isLoading
                      ? ElevatedButton(
                          onPressed: _trySubmit,
                          child: Text(_isLogin ? 'Login' : 'Signup'),
                          // style: ButtonStyle(),
                        )
                      : const CircularProgressIndicator(),
                  !widget.isLoading
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin
                              ? 'create new account'
                              : 'I already have an account'),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
