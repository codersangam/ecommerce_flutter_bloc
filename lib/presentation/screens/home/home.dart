part of 'home_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeroCarouselCard(),
          ],
        ),
      ),
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
      itemCount: Category.categories.length,
      itemBuilder: (context, index) {
        return Image.network(
          Category.categories[index].imageUrl!,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
