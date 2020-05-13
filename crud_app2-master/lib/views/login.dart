import 'package:crud_app2/models/api_response.dart';
import 'package:crud_app2/models/mahasiswa.dart';
import 'package:crud_app2/services/mahasiswas_service.dart';
import 'package:crud_app2/views/mahasiswa_list.dart';
import 'package:crud_app2/views/mahasiswa_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Login extends StatelessWidget {
  APIResponse<bool> _apiReponseLogin;
  MahasiswasService get service => GetIt.I<MahasiswasService>();

  bool access = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  // @override
  // void initState() {
  //   _fetchMahasiswa();
  //   super.initState();
  // }

  // _fetchMahasiswa() async {
  //   _apiResponseListMahasiswa = await service.getMahasiswaList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3.7,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0D47A1), Color(0xFFE1F5FE)],
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
                size: 90,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 32),
                child: Text(
                  '   LOGIN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 30.0),
      Container(
        padding: EdgeInsets.all(10),
        child: new Column(
          children: <Widget>[
            new TextField(
                controller: _emailController,
                decoration: new InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)),
                )),
            new Padding(padding: new EdgeInsets.only(top: 20)),
            new TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)),
                )),
            Container(height: 32),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: new RaisedButton(
                child: Text('Login', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  access = false;
                  _apiReponseLogin = null;

                  // Navigator.of(context).pop();
                  if (_emailController.text != "" &&
                      _passwordController.text != "") {
                    Mahasiswa mahasiswa = Mahasiswa(
                        email: _emailController.text,
                        password: _passwordController.text);
                    _apiReponseLogin = await service.loginMahasiswa(mahasiswa);

                    if (_apiReponseLogin != null &&
                        _apiReponseLogin.data == true) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => MahasiswaList()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Gagal Login'),
                                content: Text('Username / Password Salah'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Invalid Username / Password'),
                              content: Text('Masukkan Username / Password'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                  }
                },
              ),
            ),
            Container(height: 8),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: new RaisedButton(
                child: Text('Register', style: TextStyle(color: Colors.black)),
                color: Theme.of(context).hoverColor,
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => MahasiswaModify()));
                },
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}
