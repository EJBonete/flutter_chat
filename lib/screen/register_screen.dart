import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Logo(
                    titulo: 'Register',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'Login',
                    title01: 'ya tienes???',
                    title02: 'Login',
                  ),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textController: nameCtrl,
            // keyBoardType: TextInputType.emailAddress
          ),
          CustomInput(
              icon: Icons.mail_outline,
              placeHolder: 'Email',
              textController: emailCtrl,
              keyBoardType: TextInputType.emailAddress),
          CustomInput(
            icon: Icons.lock_person_outlined,
            placeHolder: 'Password',
            textController: passCtrl,
            isPassWord: true,
            // keyBoardType: TextInputType.emailAddress
          ),
          ButtomBlue(
            text: 'Registrarse',
            onPressed: () {
              debugPrint(passCtrl.text);
            },
          ),
        ],
      ),
    );
  }
}
