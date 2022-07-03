part of 'widgets_imports.dart';

class HeroCarouselCard extends StatefulWidget {
  const HeroCarouselCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HeroCarouselCard> createState() => _HeroCarouselCardState();
}

var yourActiveIndex = 0;

class _HeroCarouselCardState extends State<HeroCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VxBox(
          child: Stack(
            children: [
              VxSwiper.builder(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                onPageChanged: (index) {
                  setState(() {
                    yourActiveIndex = index;
                  });
                },
                itemCount: Category.categories.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.network(
                        Category.categories[index].imageUrl!,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      Positioned(
                        top: 200,
                        left: 20,
                        child: "${Category.categories[index].name}"
                            .text
                            .xl3
                            .bold
                            .white
                            .make(),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ).make(),
        10.heightBox,
        AnimatedSmoothIndicator(
          activeIndex: yourActiveIndex,
          count: Category.categories.length,
          effect: const WormEffect(
            activeDotColor: Colors.purpleAccent,
          ),
        )
      ],
    );
  }
}
