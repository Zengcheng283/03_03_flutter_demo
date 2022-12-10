// ignore_for_file: file_names, library_private_types_in_public_api, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/methods/appBar.dart';
import 'package:flutter_demo/methods/logic.dart';
import 'package:flutter_demo/methods/showDialog.dart';
import 'package:flutter_demo/page/loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _email, _password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    const String title = "注册";
    return Scaffold(
        appBar: appBar(title),
        body: Form(
          key: _formKey, // 设置globalKey，用于后面获取FormStat
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const SizedBox(height: 20), // 距离顶部一个工具栏的高度
              // buildTitle(), // Login
              // buildTitleLine(), // Login下面的下划线
              // const SizedBox(height: 30),
              buildEmailTextField(), // 输入邮箱
              const SizedBox(height: 15),
              buildPasswordTextField(context), // 输入密码
              // buildForgetPasswordText(context), // 忘记密码
              const SizedBox(height: 30),
              buildLoginButton(context), // 登录按钮
              const SizedBox(height: 20),
              // buildRegisterText(context), // 注册
            ],
          ),
        ),
        backgroundColor: Colors.black); // 底色为黑色
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '没有账号?',
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: Colors.white)),
              onTap: () {
                Null;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: const Text('注册', style: TextStyle(color: Colors.white)),
          onPressed: () async {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              // Dio().post("http://127.0.0.1:60000/login", data: {
              //   "user": _emailController.text,
              //   "psw": _passwordController.text
              // });
              // ignore: unrelated_type_equality_checks
              var res = await register(
                  _emailController.text, _passwordController.text);

              if (res == "success") {
                showDialog(
                    context: context,
                    builder: (context) => nomalDialog("注册", "注册成功", context));
                loginState.setLoginState(true);
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              } else {
                showDialog(
                    context: context,
                    builder: (context) => nomalDialog("注册", "注册失败", context));
              }

              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const MyHomePage(
              //             loginState: true, title: '电子木鱼V1.0')),
              //     (route) => false);
            }
          },
        ),
      ),
    );
  }

  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Null;
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        controller: _passwordController,
        style: const TextStyle(color: Colors.black),
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Password",
            labelStyle: const TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure ? Colors.white : Colors.grey);
                });
              },
            )));
  }

  Widget buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
          labelText: '用户ID',
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black)),
      validator: (v) {
        if (v!.isEmpty) {
          return '请输入密码';
        }
        return null;
        // (v) {
        //   var emailReg = RegExp(
        //       r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        //   if (!emailReg.hasMatch(v!)) {
        //     return '请输入正确的邮箱地址';
        //   }
        // return null;
      },
      onSaved: (v) => _email = v!,
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.white,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ));
  }
}
