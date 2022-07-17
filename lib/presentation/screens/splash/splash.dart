part of 'splash_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => AutoRouter.of(context).replaceAll([const MainScreenRoute()]));
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/pizza-icon.png",
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              "Food Crunch".text.xl4.white.make(),
              "Where The Taste Matters".text.white.make(),
            ],
          ),
        ),
      ),
    );
  }
}
