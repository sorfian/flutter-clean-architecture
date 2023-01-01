import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../domain/entities/keyword.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/search/search_bloc.dart';
import '../../widgets/widgets.dart';
import 'pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchBar = TextEditingController();
  List<Product> packages = products;
  List<Keyword> keywords = allKeywords;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          onTap: () {
            setState(() {
              keywords = allKeywords;
              keywords.sort(((a, b) => b.id.compareTo(a.id)));
            });
          },
          // onChanged: (value) {
          //   searchPackages(value);
          // },
          onSubmitted: (value) {
            setState(() {
              if (value != "") {
                int id = keywords.length + 1;
                keywords.add(Keyword(id: id, keyword: value));
                keywords.sort(((a, b) => b.id.compareTo(a.id)));
                isLoading = !isLoading;
                Navigator.pushNamed(context, ResultPage.routeName,
                    arguments: ResultPage(keyword: value));
              }
            });
          },
          autofocus: true,
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
                child: Text(
                  "Batal",
                  style: TextStyle(
                    color: Color(0xFFEC2028),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
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
                  ? Container(
                      color: Colors.amber,
                    )
                  : (isLoading)
                      ? BlocBuilder<SearchBloc, SearchState>(
                          bloc: SearchBloc(),
                          builder: (context, state) {
                            isLoading = !isLoading;
                            return ListView.builder(
                              itemCount: products.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductWidget(
                                  product: products[index],
                                );
                              },
                            );
                          },
                        )
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
                                  keywords
                                      .sort(((a, b) => b.id.compareTo(a.id)));
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
                                    margin: const EdgeInsets.fromLTRB(
                                        30, 16, 20, 12),
                                    child: const Text(
                                      "Pencarian populer",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        30, 4, 20, 12),
                                    // PENCARIAN POPULER
                                    child: Wrap(
                                      children: List.generate(
                                        7,
                                        (index) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
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
