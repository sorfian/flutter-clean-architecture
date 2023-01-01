import 'package:flutter/material.dart';

class SortScreenWidget extends StatefulWidget {
  const SortScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SortScreenWidget> createState() => _SortScreenWidgetState();
}

class _SortScreenWidgetState extends State<SortScreenWidget> {
  List<bool> onSelected = List.generate(4, (index) => false);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(20, 40, 20, 16),
                child: const Text(
                  "Urutkan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: 0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: onSelected.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        onSelected = List.generate(4, (index) => false);
                        onSelected[index] = !onSelected[index];

                        setState(() {});
                      },
                      selectedColor: const Color(0xFFEC2028),
                      selected: onSelected[index],
                      title: const Text("Paling Sesuai"),
                      trailing: onSelected[index]
                          ? const Icon(Icons.check)
                          : const SizedBox(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      shape: const Border(
                        bottom: BorderSide(
                          color: Color(0xFFF1F2F6),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          // SAVE BUTTON
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
                  "SIMPAN",
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
