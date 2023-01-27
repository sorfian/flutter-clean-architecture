import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../domain/entities/keyword.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/search/search_bloc.dart';
import '../../widgets/search/widgets.dart';
import '../../widgets/widgets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, this.keyword});
  static const String routeName = "/result-page";
  final String? keyword;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TextEditingController searchBar = TextEditingController();
  List<Product> packages = products;
  List<Keyword> keywords = allKeywords;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    ResultPage args = ModalRoute.of(context)!.settings.arguments as ResultPage;
    searchBar.text = args.keyword ?? "";
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        // leadingWidth: 46,
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextField(
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

                // Navigator.pushNamed(context, ResultPage.routeName,
                //     arguments: const ResultPage());
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
                  setState(() {
                    searchBar.clear();
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
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: (keywords.isEmpty)
                  ? const SizedBox()
                  : (isLoading)
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 12, top: 12, bottom: 8),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32),
                                          ),
                                        ),
                                        context: context,
                                        builder: ((context) =>
                                            const FilterScreenWidget()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFF1F2F6),
                                        elevation: 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 16,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/icons/filter_active.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text(
                                          "Filter",
                                          style: TextStyle(
                                            color: Color(0xFFEC2028),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 12, bottom: 8),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32),
                                          ),
                                        ),
                                        context: context,
                                        builder: ((context) =>
                                            const SortScreenWidget()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFF1F2F6),
                                        elevation: 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 16,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/icons/sort.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text(
                                          "Urutkan",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: BlocBuilder<SearchBloc, SearchState>(
                                bloc: SearchBloc(),
                                builder: (context, state) {
                                  isLoading = !isLoading;
                                  return ListView.builder(
                                    itemCount: products.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductWidget(
                                        product: products[index],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
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
                                        children: [
                                          Container(
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "ketengan",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "Conference",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "omg",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "ilmupedia",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "internet malam",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "harian",
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
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: ActionChip(
                                              onPressed: () {},
                                              label: const Text(
                                                "mingguan",
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
                                        ],
                                      )),
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
