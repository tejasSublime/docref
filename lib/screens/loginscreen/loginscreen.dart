import 'package:docref/data/userdata.dart';
import 'package:docref/screens/loginscreen/otpscreen.dart';
import 'package:docref/themes/def_light.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final StateProvider<bool> isValidProvider = StateProvider((ref) => true);

  Future onPress() async {
    ref.watch(userEmailProvider.notifier).state = _email.text;
    _email.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const OtpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final bool isValidRef = ref.watch(isValidProvider);
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
        leadingWidth: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(83, 155, 167, 1),
                  Color.fromRGBO(255, 255, 255, 1)
                ]),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: SvgPicture.asset("assets/images/login-logo.svg"),
              ),
            ),
            const Center(
              child: Text(
                "Enter your Email number to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            Center(
              child: Container(
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurStyle: BlurStyle.normal,
                      blurRadius: 0,
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: primarybgLight,
                ),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: InputBorder.none, fillColor: primarybgLight),
                  autofillHints: const ["email"],
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref.watch(isValidProvider.notifier).state = true;
                      return;
                    }
                    ref.watch(isValidProvider.notifier).state =
                        EmailValidator.validate(value);
                  },
                ),
              ),
            ),
            isValidRef
                ? const SizedBox.shrink()
                : const Text(
                    "Enter a vaild email id",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(width, 60),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primaryLight),
            onPressed: onPress,
            child: const Text(
              "Send Mail",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
