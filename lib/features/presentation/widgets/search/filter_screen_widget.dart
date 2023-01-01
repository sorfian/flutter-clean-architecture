import 'package:flutter/material.dart';

class FilterScreenWidget extends StatefulWidget {
  const FilterScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
}

class _FilterScreenWidgetState extends State<FilterScreenWidget> {
  TextEditingController minimumField = TextEditingController();
  TextEditingController maximumField = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(0, 250000);
  int? priceRange;
  int? category;
  int? expired;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    minimumField.text = 0.toString();
    maximumField.text = 250000.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Filter",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: (() {}),
                          child: const Text(
                            "Hapus",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEC2028),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                  // KISARAN HARGA
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Kisaran Harga",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Minimal",
                                style: TextStyle(
                                  color: Color(0xFF747D8C),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                onSubmitted: (value) {
                                  if (double.parse(value) >
                                      double.parse(maximumField.text)) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            title: const Text('Oh no!'),
                                            content: const Text(
                                                'Minimal lebih besar dari Maksimal'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        }));
                                  } else {
                                    setState(() {
                                      if (value == "") {
                                        value = 0.toString();
                                      }

                                      _currentRangeValues = RangeValues(
                                          double.parse(value),
                                          double.parse(maximumField.text));
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: minimumField,
                                autofocus: true,
                                autocorrect: false,
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixText: "Rp",
                                  prefixStyle:
                                      const TextStyle(color: Colors.black),
                                  isDense: true,
                                  // filled: true,
                                  fillColor: const Color(0xFFF1F2F6),
                                  hintText: "0",
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFA4B0BE),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFCED6E0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Maksimal",
                                style: TextStyle(
                                  color: Color(0xFF747D8C),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                onSubmitted: (value) {
                                  if (double.parse(value) <
                                      double.parse(minimumField.text)) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            title: const Text('Oh no!'),
                                            content: const Text(
                                                'Maksimal lebih kecil dari Minimal'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        }));
                                  } else {
                                    setState(() {
                                      if (value == "") {
                                        value = 0.toString();
                                      }

                                      _currentRangeValues = RangeValues(
                                          double.parse(value),
                                          double.parse(maximumField.text));
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: maximumField,
                                autofocus: true,
                                autocorrect: false,
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixText: "Rp",
                                  prefixStyle:
                                      const TextStyle(color: Colors.black),
                                  isDense: true,
                                  // filled: true,
                                  fillColor: const Color(0xFFF1F2F6),
                                  hintText: "250.000",
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFA4B0BE),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFCED6E0),
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
                  const SizedBox(
                    height: 12,
                  ),
                  RangeSlider(
                      values: _currentRangeValues,
                      max: 500000,
                      min: 0,
                      divisions: 1000,
                      onChanged: ((value) {
                        setState(() {
                          _currentRangeValues = value;
                          minimumField.text = value.start.toStringAsFixed(0);
                          maximumField.text = value.end.toStringAsFixed(0);
                        });
                      })),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          children: List.generate(
                        8,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 2),
                          child: ActionChip(
                            onPressed: () {
                              setState(() {
                                priceRange = index;
                              });
                            },
                            pressElevation: 2,
                            label: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Text(
                                "${index + 10}rb - ${index + 20}rb",
                                style: TextStyle(
                                  color: (priceRange == index)
                                      ? const Color(0xFFEC2028)
                                      : Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            backgroundColor: (priceRange == index)
                                ? const Color.fromRGBO(236, 32, 40, 0.1)
                                : const Color(0xFFF1F2F6),
                          ),
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),

                  // KATEGORI
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
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
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          children: List.generate(
                        8,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 2),
                          child: ActionChip(
                            onPressed: () {
                              setState(() {
                                category = index;
                              });
                            },
                            pressElevation: 2,
                            label: Container(
                              margin: const EdgeInsets.all(12),
                              child: Text(
                                "Combo OMG!",
                                style: TextStyle(
                                  color: (category == index)
                                      ? const Color(0xFFEC2028)
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            backgroundColor: (category == index)
                                ? const Color.fromRGBO(236, 32, 40, 0.1)
                                : const Color(0xFFF1F2F6),
                          ),
                        ),
                      )),
                    ),
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  // MASA AKTIF
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Masa Aktif",
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
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          children: List.generate(
                        8,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 2),
                          child: ActionChip(
                            onPressed: () {
                              setState(() {
                                expired = index;
                              });
                            },
                            pressElevation: 2,
                            label: Container(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, right: 16),
                              child: Row(
                                children: [
                                  (expired == index)
                                      ? Image.asset(
                                          "assets/icons/timer-sand-active.png",
                                          scale: 2,
                                        )
                                      : Image.asset(
                                          "assets/icons/timer-sand.png",
                                          scale: 2,
                                        ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "30 HARI",
                                    style: TextStyle(
                                      color: (expired == index)
                                          ? const Color(0xFFEC2028)
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: (expired == index)
                                ? const Color.fromRGBO(236, 32, 40, 0.1)
                                : const Color(0xFFF1F2F6),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // NAVIGATION
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            height: 110,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC2028)),
                child: const Text(
                  "PASANG FILTER",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
