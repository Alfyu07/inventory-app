part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        reverse: true,
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child:
                // CONTENT HERE
                Stack(children: [
              Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [mainColor0, mainColor1],
                  ),
                ),
              ),
              Container(
                  height: size.height * 0.3,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Stack(children: [
                    SvgPicture.asset('assets/logo_inventory_app.svg')
                  ])),
              Positioned(
                  top: size.height * 0.3,
                  child: Center(
                    child: Container(
                        width: size.width,
                        height: size.height,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: size.width,
                              margin:
                                  EdgeInsets.fromLTRB(0, 50, 0, defaultMargin),
                              child: Text(
                                'SIGN IN',
                                style: titleFontStyle0.copyWith(
                                  fontSize: 28,
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ),
                            Text('Email', style: blackFontStyle0),
                            SizedBox(height: 10),
                            _buildEmailTF(),
                            SizedBox(height: 10),

                            Text('Password', style: blackFontStyle0),
                            SizedBox(height: 10),
                            _buildPasswordTF(),
                            _buildForgotPasswordBtn(),
                            SizedBox(height: 20),

                            //Button
                            isLoading
                                ? SpinKitFadingCircle(
                                    size: 45,
                                    color: mainColor0,
                                  )
                                : buildLoginBtn()
                          ],
                        )),
                  ))
            ])),
      ),
    );
  }

  Container buildLoginBtn() {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: () {
          Get.off(MainPage());
        },
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: mainColor0,
        child: Text(
          'Sign In',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerLeft,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(left: 0.0),
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: mainColor0,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Container _buildEmailTF() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: greyColor1),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        style: blackFontStyle1,
        controller: emailController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: greyFontStyle.copyWith(fontSize: 16),
            hintText: 'Enter your email',
            contentPadding: EdgeInsets.only(bottom: 10)),
      ),
    );
  }

  Container _buildPasswordTF() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: greyColor1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        style: blackFontStyle1,
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: greyFontStyle.copyWith(fontSize: 16),
            hintText: 'Enter your password',
            contentPadding: EdgeInsets.only(bottom: 10)),
      ),
    );
  }
}
