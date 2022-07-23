part of 'widgets_imports.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categories}) : super(key: key);

  final Category categories;
  @override
  Widget build(BuildContext context) {
    int value = int.parse(categories.colorName.toString());
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
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                        color: Colors.orange, value: downloadProgress.progress),
                imageUrl: categories.imageUrl.toString(),
              ),
            ),
          ],
        ),
      )
          .make()
          .backgroundColor(Color(value).withOpacity(0.1))
          .cornerRadius(20)
          .wh(170, 100),
    );
  }
}
