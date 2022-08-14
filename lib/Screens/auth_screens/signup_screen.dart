import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/resources/auth_methods.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';
import 'package:flutter_instagram/utils/responsiveLayout/responsive_layout_screen.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widgets/text_input_feild.dart';
import '../../utils/responsiveLayout/mobile_screen.dart';
import '../../utils/responsiveLayout/web_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? image;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
  }

  void selectImage() async {
    Uint8List img = await imagePicker(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });
    String signup = await AuthMethods().signupUser(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      bio: _bioController.text,
      file: image!,
    );

    if (signup == "sucess") {
      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreen: MobileScreen(),
                webScreen: WebScreen(),
              )));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "Invalid Email");
    }

    print(signup);
  }

  navigatetoscreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Screen Logo

              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),

              const SizedBox(height: 24),

              //  Circle Avatar to take user photo

              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: MemoryImage(image!),
                        )
                      : const CircleAvatar(
                          radius: 60,
                          backgroundColor: blueColor,
                          backgroundImage: NetworkImage(
                              "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADhCAMAAADmr0l2AAAAw1BMVEX///9UUE8+hKH///4wfp00gJ5VUU86gqAtfZw4gp89g6FVT009hqRSTk36+/w0f55OSUfu8vVWTUrk6/C8z9pGQT9UWl1nmbHJ1+HY4unR3eVHiaW1s7Tm7PFVj6rz9vhEPjyauMl9prvS0dKivcxNbXuPscOCqb3A0NtfW1vCwcGuxNKhvs3t7O2mpKXh4OGNiopQZW9Fe5JvnbSbmZl4dXVsaWnIxseGg4NKdIZSYGfk5ON8eXmtqqvX1tdnYmJdiJsltxb2AAATS0lEQVR4nNVdiXbauhYF49mAzRSmxAaSQFKaEZI0adq+//+qJxmCjmzZlmQ5cPda9662IeDNmY+ko1rte9COLnrjyeim3++PRpNxrxN90wdXjHZn3L9aLkJNt3fQ9a8/+dPhat6fXPxnmUa9/nwT+rZtGIbjamk4jmEgtojnetJpH/txxdAZIW6ImuMwiCV5WoimG67W4/8IyWg0DzXb5+EGgFj608W6d+ynL0JnvdB0X4wbkaWhW+F8fGwO2eisQ123WObGB9fFdqlry8mxmbDQ7g9tw5ImB2HY2vzUdLW31Gw17GJYvj3sn47Pad8MfV9eM9lw7OmJiLFzFeocwnMsFA/2sBz0t+Lf8K3V8a2xM9dy6bnYbdi6MQ2Hm81iFWOx2QzDqevjf8/l6Rr+cHRceksjx7FYhm1b4WbeH407UcKi2u2oN7lZr4aaj/KB7Pcw9CNSjOa+ka1fKDtZ9seJTLORfpeLydVmimSZRdKxh8dR1PaVzqbnohxzulknuDGoAVzcLEMrK/tBFI8Q/W+mOtNxGoY7nE8O5BpF1Ah6/cXUYBulZa86FfHIwHhjs57E0bXNugfMbUeu/fv338s/2+32cbu9P//78Psu422j0TI0mHrha+tvjIvtucN4CpQvD9cX+OdQZndv25fXYDYYBF8YDGat188/f9OFIP69aLKcsnIGS/8+PZ2EOkuLtGXqCe7OX+qDoNUy62Z9DzP+r4V43v76wRZKZz3UjbT+G8b8W4TYXupp7XTssJ+SyNtnMGjVM9EKBt72N35h2krHKz/9KZYffoM/nTTTfsDQN+lP/tFC7LxsfjtBDl4v2Z/TudIYFO2qhdie20ndcX1rEesmJYc3c5BL7kCyNXt5SH7K3jWtp+nKUg8rtcReaKekZ63SH3n3a5ajm0lVnf3JaDy112FKXSx7XR2/m2nSeTrGgvGNXpqBWUyMYPCaGTfWqY/U9FVVjbifSefp6LssKuEk/gRc2gn0NLhlWWIDv3E0d5MUjWEldVR7keTnT3dFaYMmeD8QEh8OIWYr+MH8UPzOvUXSLoxpBQl4J0x8kSh9YqlK+3EgJr4dWoPz7M++0RLfrasrN8SRm8guDHZMuvsX1IUEeMDgMTsCRKnYa6/U8usnqlrLjwNSKkJfmi1B+yMI/kXsxBz/4ySpQPpQpau5SqjIXnxpfnmZSxFMzDAT7WWiYjTCC2X85roGw7tjLNlPctcqwQ/L8CVTS9F3OcJCdCFDVc50ScvP0W7Yr7u7LccPMdzmPUeH9uOuMVXDMMHPz/zifgX1/OSzEGaeL0VIJIrOVEXeluBnL7IM5V4qPiQweMt8EGzxN7SzcxTIcEl/afY864XnfNl1AVpmVta2Q49O3cozpOXnuP2sFz6UdDAHhrf57j/aUE9klWQ4p/ll63x5B/OFfEcTF9wUw1LRYk29V16Suw0U8at7M3ZaSnDlU08Vykf8foJfduvubabCAHcoMkP0vdv0c8nym1CtQQPlRo2MHmdbtEDKgekFv3IfCz1Dn2a4kON30aT4hTndkG1gqmOIomFGn4aAlqGe6drz0KbSW2OYw+9BRQQEaN0WtpZo67EznXsOFj7FL8+SfynzMHsUJDQYtP+zxFMaqoDI5/dXNb+6l1dXYCA7XEMFs0LRtYuRT+XtnVrOIsqjcoLmoChU1BLRwtiI8etMQc6Hs4WcJaI7lQ5mj9Ynx0NSEd/+KURwA74d15/kLoH9UOxiYsyKYmH8lHAFwxYxQ8oL2zf5S3yfYk1QPgTFbqZRa09BILM0fn49uLYZB5k8DVXPDhPMD/Z7dGCFr3P3odoh+GIKrfdyINlGy8eMK8OcUErKGw3nwAFbhansVrZPmI/ibCYGNCZnyhcrJsDBWO64aJH9tVUFv8Kq6QswH+FLStshiBDFHeS7WRX0cLrGRzCCj2tktMMowCUWv/grqSRIIJgzzqVOqHDOtNhye3DDJ4dSq09j9gQ5AsUOsOugLwtfvgAeRudYxKmIX90LHjkJ1oCSukZRi2YCvJJf/HXUHioyQcyQl2APrHQ7RVENfBvOlMMKzquSIHIznL2WBlX52PlaB3sB6KXFu7CqI2gGPOloTLA2JHZlTfNe23aJh+ELKlUSTO2+yMQYijAvssG8wOJKC/5Up6KcuUyMJXCNOZYVodz1S4T6Fdc+wfuqCJp5yxQpdKaEoJEtQtDnKM5Bd9hWUSuJE+R79AiUVwZnZv6pqmOfRsbGi4xnBxVQZn4J2ji5XUIIZUsSDIK8qUwNG9MNcKQZLVyYZfu8G1ECsyIVRQTv+QkiDIEI2eoHeqkOd7t/Vhm/On+uFmN0eHw3Q4RQi3li/I5gZfxECcLnZ6Yzo68Y6AoIsCa2bUuMIGfJmyKArJBFAJQRXEnaDvXTcDJxzAY+hNFDvIBeiP8sgPJlCQKe7jbF8IaIkFEI/QQCFFirUbeym4BgoMeguoEpN0NyHa4y6QvV5aIiyTZGg0pnUkICha4u0uW/rMzLmC3h/ecdkoql3AxwMZbItgXVa5+QoSg/qqiw6WKoTYQrtuJdVdcQoSVOcEJo+LQegiymoOZPoF0ZwdarOME2yNdC6iebg2ydvM0GDFQWCAVT0R2Am6H6axHRXV9wx0JVfVHBOL/HBYkTuGI/YAQKJcHl/KoCoSccBmMs2H6UeJ+sWioTlQVCvvWzJPqHRr7rkmgAVkqNOX+aFqOyODETZ9egdZTE+jFZv/BFD7BVFSdMCYIYGyIrEu+ugA8VVYyoquUziTgfczkICyw1AdbC5y2iimxQtNz9Qo/hL0E3jWsFkUL7XzWBULTcPTwPKSkO3TXS+HZd8dPcFVWEwR85giAiHIyQtAuZpX4BKor0KM4LefMDSNl7SMoWh1Lf4FgRpNGoKtLLxXmEC9Ca2WVrQGvFEu0dKor0XHu5mCAeZV/1XoBejcQO9oeBV8VGmZkkvQYobY1dXk3abU7u4mEG7iqp6WWKpT1I6Wft1rNJu8mS2t39UsVOINkogTA+CMzadZdWRKRSB0cr8TIiq58JRGSVemdyw4MN2lKTFC6VHFqCMOueWWLiASA0igmT0C93SkZ5LuOV0dCUSvZI3JDxMbVKNiIMxHqiNEjiEsd14kRl8hgM9VtiWy8l+MGwgBmRPo14KbGH+nMTYssSCfR8SifnJZ0owqVigq1b6TQGIyK7few2NElduFaK0VDeO5StBfeAuWcHrm3rcvN2GnEoVBkqSgTBGKSAx+uEoNqVPi36MFOZjvJu9s0EUUocCMEmKPnZZSUmPKRRKghiELei92sRSLXlz4oqDYXB35IESSD017UOCYOiPV8Alc3D1r+S/GDkm4NERjbOx1AWCk2P4/BgAUjXAqUypLgo3A2ch7/KRNiSWBdMACRnC7B2bZUhWPtUJcLyAgSckNAIW9nDzDv8VlTYc5zfLcQYmh3Q13JThBTVvdLdNCZBJwQdjJIE70wV+VrAc/SzCKACDME++5IEa/flpwWY9UHZGJgmqEqCtbvyEvSCUoUgk6AyG1RhhV7pJCbGGBJU5UUxys90wnWS3JIEmyAq6ScwKJbE5axU1WQWzyHhAxXbx4oCfYySK00qQgQGaMosVOWie/wrwdAcbFXoZw0SRH7lAuhr+RwinuwkqabBq6rxtiAyLGE9WKJcOuBSOhiW7DRBgHLpqtZWUvAS3Ms28tVEiBg/D31D3CgkZ3Z9JePWH+VOMw1kl6wZWMGWBdirrisZgCyXk/KNduAE6KpN0N/otZjyuJTY3KXQAKkzSnYPbrvIOPIjDIloKHTSrAhg650dwX1chtRwqzTuhEXoKcmxv3BBphn5NXguWXRsEBuNhvix0MGlOg9DZWp4X/OY/qsKRILBEHkYhfygyHB63QHH0lTNBRa0Qqndy9kgje14fzZci1E1KF9QR8sutiSwSewEAnFCbv0sjXvBWffqkhgMckppJ7ElvaStAoK1PSqTFNrgBTgdEudmffVe5qg2OEqWD8SNupaigkVwxbf0ehmFeXLDaJTU2dKIBI8uy+7PZoPsA/ra8kv+xbjK/11OCF84EfxW8rkxIlIefe3cIjJV0JbBeBGtJ6T3LzMAEpevJesbxTWv+JSg0qvyAOCMxFeT6YJsz/PLG2HjyNUECeuH4gHkMobYEEsmHsQX0rxW0cRUbnQOwgL17TItVXnIjRQPfimKUDesXSPECOGRLTm83cr11YIXNTX9inVGAohVer/aDu3tzJPsqrUKJ6QXokFNAoQxDxhmqQWKH7dleveMS8KEGU7YRz0PO2dc3hGWLDy8CFwIxkIw2N6V7N4v2YeRe6SLYfRlPgH9yu/HQen1QTNo3Zdyp2DyEV0agX+XS2Z+b1tKxld5we15CX86Inth6cGM8/0PXFRRSOw5vHsMAlWnJ1qD2z/SFIEPNag3AavaulDCjdX5AdFTQ25PMTBjRW0IG0vHZR1wjUG8q+gi0+XnTPmu+1Ywe5QJi2CyX/IMyFpu1kP0A3lOT/XRHjx6HVEU79QMwaTRxI/IrkoBN3N3f1vmLrAchvh/wewl45rXLIBZHeku/QLM5ModbR8D//zvI/LqVdA7oDX4dy8S++FYqpSrBDOteDbMROevyHGqn+IP4aEqI2h98jVNG9R5CcZ+A2ouXlE287A1B9WM16aw09TBv3O+4L8CAmR0eMH4aZQE5OnoGxZe5ewIWkHwyKGpwI1YrM4EKCnw8NQshr+3g+8QXgLB7Pa8KG6AeUfssVRLMNEiY6UwOn+ZVTPavhCtYPB4medUOxZxk+yqFowQd1lHKNp/H+tFtz9XCRNZ4312fxHKJ2MJAhhpOow8nL+qz1hEgazx843tcXrEwJysdHoM78GhhNz+8dn6Vr+SCSTG220cOBK3eEHpZIa5Bf2ir3d42OJL5Y9ieSmYsRhv/yQ9zhjcWZDd+zxM7XDJUbTo/N8gUJ5tygPlqR72OL/onYkbMJ44p+sC8rVdA/Ht1+w0VDOFYBBsSXAEgyk1P6egBWWhZvfvtrfluxCVwcTZ+D44whnN+W0zeBlDM1B46V4FME2UjdfjogpeOZE/j+MCXEjUfO/WjxPURRAMXs9Br7BwGR5eiNL8OGkJfsEbPDeJ6yhaH4PT0jXthLxnNrrXhF/+XQUx4I0TSElPn6H3Afg5HNsoNtDPPHWP/fxF8OoaIMhzkJxK2LSzUzfD7jvkx7XRB/rc5nMFlwuqRPcJKijfwgo1zRmb4QlT9M40cEc97yiHMbxbqvkku+BXPUzPBBFC4HTZFbxfsXm6Zmh2IT9H41+YGlKOxjzJcGgmIqDQNq2OC8qr5vNJEkTygw5G8Dpl6rLp5vspmqHX/dCoq3RF+NEXGWnN61PLaHDZewbNyNEElzXbtBlen1pG4yF+REFdiWE/vSYwQ7d5agzpACF15GMEzfCUslJsLUl+UhsLqNuG3RNiiDNsip/46OUdlqcqQyQ/+GT4rm45bIwEw9iXHtehmin5SY5kxIiG8EZ07EvxrNRjRwzvjOZX5tBcJzRohidQWaD4TvMrtX2wR7Vojl8empgfBcF76NMMmzRDzezWj2SGJoruJsqvXYpf6TOPCRlq2sfR0jaUnnnvlHoKZthsjKcW9Z7Hq4DNbsK9KDqz2ksyfK8fJSKi8oh2Lwr084sh7Uubz2ffzxBV3dc0PSX6uWeYiBa7iPit8FLqKbgtMh+dYYLhdwvR615rSX6KDsXv0N7YWgLfKMTYu1DRQbO4bynlxU+aoRsL0aw+JKLU0POuNZqeZoTSs1Az0ddpZ4pUBmVu1fejPO8jaX2avlE1egZinHI1Ta3ymOh5Z+9JegrdJ43ORk9+VPP5oyJTjDXD65op56JZllL3AtGe20ljaGqYYhUcceJZT9ND5qfqtD8LN1pSTTHFswqkaDKlh7KXhaqDeGxEG9tJUcSKqjgsZtDztcrU84B1WoiY4pPZ9UrvRNz/voddC4Oeo2+qFd8OnYWeEmIcNM6Q2ZS6+zvutyDh1Z+eGfQ0Y1q9+HboT9NCjI0xFmM5GXa9M6SbDHqWvlIyVIsLnaXPECJ+rvenelc6+GPVvEbCc9Nv7eqh6twsH+PQZjzGnqPZxSQ5ZWl+keuaMTvWu2qGcVVF7pKLvpYK+weOz9dn9W53J8riPiNK+Lrds6f3LHaaZS/KHi2WQfvKYpnijiMm+XGGHhw7njxqyOjqZ9fvz02W3e3pDasM7XmI5llSJCyfPs4wDRYQ87OPayy4Jsvs9sqpD6Ub1wrQyaWIiyosmOf392vE9OPjbIePj6ena8TsWWP6S0jP2Hyvb2FQvJqmc5skTcwzjfzfwvTcxTGl94WoP7SNTBWThmNrc/VVrSTGKz1ZDpeEYYf970jLuBGtQzvLpwrDsu3VsRxnDsZLS3cKzLEYrqP7m/63R3U+3I3+FxqsTJxbdIbuLvrfl3LKYLweTm3fEmDpHshZ4XJ0UoaXgc7oCpG0DYfDtcYvcRzf9sNVv3eimslCZ9xfDTUbyTLXuzqGodt2uPk5+i+ROyAa9+eL0LVtWzd8w3L2iov+YMTEMLXlenTxX+QGEfUm/fXVfLXYDEOE4XCzWs7X69G48w3M/g9JhqI3Trq9eQAAAABJRU5ErkJggg=="),
                        ),
                  Positioned(
                    bottom: -5,
                    left: 80,
                    child: InkWell(
                      onTap: () {
                        selectImage();
                      },
                      child: const CircleAvatar(
                        backgroundColor: mobileBackgroundColor,
                        child: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              // Email Text inpyt feild

              TextInputFeild(
                textEditingController: _emailController,
                hintText: "Enter Your Email",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 12),

              // UserName Text inpyt feild
              TextInputFeild(
                textEditingController: _usernameController,
                hintText: "Enter Your Username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              // Password Text inpyt feild

              TextInputFeild(
                isPass: true,
                textEditingController: _passwordController,
                hintText: "Enter Your Password",
                textInputType: TextInputType.text,
              ),

              // UserName Text inpyt feild
              const SizedBox(height: 12),
              TextInputFeild(
                textEditingController: _bioController,
                hintText: "Enter Your Bio",
                textInputType: TextInputType.text,
              ),

              // login Button
              const SizedBox(height: 24),
              InkWell(
                onTap: signupUser,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: primaryColor,
                        ))
                      : const Text("SignUp"),
                ),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account?"),
                  GestureDetector(
                    onTap: navigatetoscreen,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
