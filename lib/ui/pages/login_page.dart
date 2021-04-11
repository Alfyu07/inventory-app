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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kBackgroundColor,
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor0, mainColor1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        height: size.height * 0.3,
                        width: size.width,
                        alignment: Alignment.center,
                        child: Stack(children: [
                          SvgPicture.asset('assets/logo_inventory_app.svg')
                        ])),
                    Center(
                      child: Container(
                        width: size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2 * defaultMargin),
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
                                : buildLoginBtn(),
                            SizedBox(height: 100)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildLoginBtn() {
    return Container(
      width: double.infinity,
      height: 50,
      child: isLoading
          ? loadingIndicator
          : ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                await context
                    .read<UserCubit>()
                    .signIn(emailController.text, passwordController.text);

                UserState state = context.read<UserCubit>().state;

                if (state is UserLoaded) {
                  context.read<AssetCubit>().getAssets();
                  Get.off(MainPage());
                } else if (state is UserLoadingFailed) {
                  Get.snackbar(
                    "",
                    state.message,
                    backgroundColor: 'D9435E'.toColor(),
                    icon: Icon(Icons.close_outlined, color: Colors.white),
                    titleText: Text(
                      'Sign In Failed',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    messageText: Text(
                      state.message,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: mainColor1,
              ),
              child: Text('Sign In',
                  style: blackFontStyle0.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700)),
            ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 0.0),
        ),
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: mainColor1,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return TextField(
      style: blackFontStyle1,
      controller: emailController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: mainColor1, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: greyColor0, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: dangerColor, width: 2.0),
        ),
        hintStyle: greyFontStyle.copyWith(fontSize: 14),
        hintText: 'Enter email',
      ),
    );
  }

  Widget _buildPasswordTF() {
    return TextFormField(
      style: blackFontStyle1,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: mainColor1, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: greyColor0, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: dangerColor, width: 2.0),
        ),
        hintStyle: greyFontStyle.copyWith(fontSize: 14),
        hintText: 'Enter password',
      ),
    );
  }
}
