part of 'widgets_imports.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categories}) : super(key: key);

  final Category categories;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(CategoryScreenRoute(category: categories));
      },
      child: VxBox(
        child: Stack(
          children: [
            categories.name!.text.bold.make().pOnly(top: 10, left: 15),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                categories.imageUrl.toString(),
              ),
            ),
          ],
        ),
      )
          .make()
          .backgroundColor(categories.colorName!.withOpacity(0.1))
          .cornerRadius(20)
          .wh(170, 100),
    );
  }
}
