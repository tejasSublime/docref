import 'package:docref/data/userdata.dart';
import 'package:docref/themes/def_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final TextEditingController _otp = TextEditingController();

  Future onPress() async {}

  @override
  Widget build(BuildContext context) {
    final userEmailRef = ref.watch(userEmailProvider);
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Submit Otp",
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
        leading: const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: SvgPicture.asset("assets/images/login-logo.svg"),
            ),
          ),
          const Text(
            "Enter otp send on your Email Id:",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Text(
            userEmailRef,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: primaryLight),
          ),
          Pinput(
            // defaultPinTheme: const PinTheme(decoration: BoxDecoration()),
            controller: _otp,
            length: 6,
          )
        ]),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Edit the email",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primaryLight),
              )),
          Padding(
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
        ],
      ),
    );
  }
}
