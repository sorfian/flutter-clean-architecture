import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../domain/entities/keyword.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/search/search_bloc.dart';
import '../../widgets/product_details/widgets.dart';
import '../../widgets/widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  static const String routeName = "/product-details";
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController searchBar = TextEditingController();
  List<Product> packages = products;
  List<Keyword> keywords = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductDetailsPage args =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsPage;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: TextField(
          onTap: () {
            setState(() {
              keywords = allKeywords;
              keywords.sort(((a, b) => b.id.compareTo(a.id)));
            });
          },
          onSubmitted: (value) {
            setState(() {
              if (value != "") {
                int id = keywords.length + 1;
                keywords.add(Keyword(id: id, keyword: value));
                keywords.sort(((a, b) => b.id.compareTo(a.id)));
                isLoading = !isLoading;
              }
            });
          },
          // autofocus: true,
          autocorrect: false,
          cursorColor: Colors.red,
          controller: searchBar,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: const Color(0xFFF1F2F6),
            suffixIcon: InkWell(
              onTap: () {
                searchBar.clear();
                setState(() {
                  keywords = [];
                });
              },
              child: const Icon(
                MdiIcons.closeCircle,
                color: Color(0xFF747D8C),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFFA4B0BE),
            ),
            hintText: "Cari paket favorit kamu ...",
            hintStyle: const TextStyle(
              color: Color(0xFFA4B0BE),
              fontSize: 14,
            ),
            prefixIconColor: const Color(0xFFA4B0BE),
            iconColor: const Color(0xFFA4B0BE),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.only(left: 12, right: 20),
              child: const Center(
                child: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: (keywords.isEmpty)
                  ? ProductDetailsWidget(product: args.product)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 16, 20, 12),
                          child: const Text(
                            "Terakhir dicari",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ListView.builder(
                            itemCount:
                                (keywords.length < 5) ? keywords.length : 5,
                            itemBuilder: ((context, index) {
                              keywords.sort(((a, b) => b.id.compareTo(a.id)));
                              final keyword = keywords[index];
                              return ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.only(
                                  left: 30,
                                  right: 20,
                                ),
                                horizontalTitleGap: 8,
                                minLeadingWidth: 0,
                                leading: const Icon(
                                  Icons.history,
                                  color: Color(0xFFCED6E0),
                                ),
                                title: Text(
                                  keyword.keyword,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF747D8C),
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.close,
                                  color: Color(0xFFCED6E0),
                                ),
                              );
                            }),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 16, 20, 12),
                                child: const Text(
                                  "Pencarian populer",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 4, 20, 12),
                                // PENCARIAN POPULER
                                child: Wrap(
                                  children: List.generate(
                                    7,
                                    (index) => Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: ActionChip(
                                        onPressed: () {},
                                        label: const Text(
                                          "ruangguru",
                                          style: TextStyle(
                                            color: Color(0xFFEC2028),
                                            fontSize: 12,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        side: const BorderSide(
                                            color: Color(0xFFEC2028)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
