import 'package:flutter/material.dart';

import '../../widgets/category_details/widgets.dart';
import '../../widgets/home/widgets.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({super.key});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  TextEditingController searchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Paket Internet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: TextField(
                onTap: () => Navigator.of(context).pushNamed("/search"),
                // autocorrect: false,
                autofocus: false,
                cursorColor: Colors.red,
                controller: searchBar,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF1F2F6),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    // TERBARU DARI TELKOMSEL
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          ImageCard(
                            image: "assets/images/images-1.png",
                            height: 100,
                            width: 248,
                          ),
                          ImageCard(
                            image: "assets/images/images-2.png",
                            height: 100,
                            width: 248,
                          ),
                          ImageCard(
                            image: "assets/images/images-1.png",
                            height: 100,
                            width: 248,
                          ),
                          ImageCard(
                            image: "assets/images/images-2.png",
                            height: 100,
                            width: 248,
                          ),
                          ImageCard(
                            image: "assets/images/images-1.png",
                            height: 100,
                            width: 248,
                          ),
                          ImageCard(
                            image: "assets/images/images-2.png",
                            height: 100,
                            width: 248,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // LANGGANAN KAMU
                    const Text(
                      "Langganan Kamu",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CustomCardCategoryDetails(
                            package: 14,
                            expired: 30,
                            packageName: "Internet OMG!",
                            price: 96000,
                            discount: 99000,
                          ),
                          CustomCardCategoryDetails(
                            package: 27,
                            expired: 30,
                            packageName: "Internet OMG!",
                            price: 133000,
                            discount: 145000,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // KATEGORI
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Kategori",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Lihat Semua",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CategoryWidget(title: "MyTelkomsel Reward"),
                          CategoryWidget(title: "Paket Conference"),
                          CategoryWidget(title: "Internet Mingguan"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CategoryWidget(title: "Combo SAKTI"),
                          CategoryWidget(title: "Internet Mingguan"),
                          CategoryWidget(title: "iPhone Plan"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // POPULAR
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CustomCardCategoryDetails(
                            package: 14,
                            expired: 30,
                            packageName: "Internet OMG!",
                            price: 96000,
                            discount: 99000,
                          ),
                          CustomCardCategoryDetails(
                            package: 20,
                            expired: 30,
                            packageName: "Internet OMG!",
                            price: 150000,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // BELAJAR DIRUMAH AJA
                    const Text(
                      "Belajar #dirumahaja",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CustomCardCategoryDetails(
                            package: 30,
                            expired: 30,
                            packageName: "RuangGuru",
                          ),
                          CustomCardCategoryDetails(
                            package: 30,
                            expired: 30,
                            packageName: "Udemy",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
