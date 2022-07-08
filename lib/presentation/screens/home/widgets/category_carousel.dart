part of 'widgets_imports.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({Key? key, required this.categories})
      : super(key: key);
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categories: categories[index],
          ).pOnly(right: 15);
        },
      ),
    );
  }
}
