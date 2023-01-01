import 'package:flutter/material.dart';

import '../../widgets/home/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: const TextSpan(
            text: "Hai, ",
            style: TextStyle(
              fontSize: 20,
            ),
            children: [
              TextSpan(
                text: "Sorfian",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 20,
              height: 20,
              child: Image.asset(
                "assets/icons/qrcode.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFEC2028),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFEC2028),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: ClipInfoClass(),
                      child: Container(
                        // padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFE52D27),
                              Color(0xFFB31217),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 16, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "082310340134",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/logo/simpati.png",
                                    width: 84,
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Text(
                                "Sisa Pulsa Anda",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Rp34.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF7B731),
                                    ),
                                    child: const Text(
                                      "Isi Pulsa",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 13),
                            const Divider(
                              height: 0,
                              thickness: 0.1,
                              color: Color(0xFF1E272E),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                text: const TextSpan(
                                  text: "Berlaku sampai ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "19 Juni 2023",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Telkomsel POIN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF7B731),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      "172",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          QuotaCard(
                            title: "Internet",
                            data: "12.19",
                            satuan: "GB",
                          ),
                          QuotaCard(
                            title: "Telepon",
                            data: "0",
                            satuan: "Min",
                          ),
                          QuotaCard(
                            title: "SMS",
                            data: "23",
                            satuan: "SMS",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                Container(
                  height: 8,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: SizedBox(
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        // body
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            children: [
                              const SizedBox(height: 20),
                              // KATEGORI PAKET
                              const Text(
                                "Kategori Paket",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ItemCategory(
                                    title: "Internet",
                                    icon: "assets/icons/internet.png",
                                  ),
                                  ItemCategory(
                                    title: "Telpon",
                                    icon: "assets/icons/telpon.png",
                                  ),
                                  ItemCategory(
                                    title: "SMS",
                                    icon: "assets/icons/sms.png",
                                  ),
                                  ItemCategory(
                                    title: "Roaming",
                                    icon: "assets/icons/roaming.png",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ItemCategory(
                                    title: "Hiburan",
                                    icon: "assets/icons/hiburan.png",
                                  ),
                                  ItemCategory(
                                    title: "Unggulan",
                                    icon: "assets/icons/unggulan.png",
                                  ),
                                  ItemCategory(
                                    title: "Tersimpan",
                                    icon: "assets/icons/tersimpan.png",
                                  ),
                                  ItemCategory(
                                    title: "Riwayat",
                                    icon: "assets/icons/riwayat.png",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // TERBARU DARI TELKOMSEL
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Terbaru dari Telkomsel",
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
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
                              const SizedBox(height: 30),
                              // TANGGAP COVID-19
                              const Text(
                                "Tanggap COVID-19",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 18),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    CustomCard(
                                      title:
                                          "Diskon Spesial 25% Untuk Pelanggan Baru",
                                      image: "assets/images/tanggap-1.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                    CustomCard(
                                      title:
                                          "Bebas Kuota Akses Layanan Kesehatan",
                                      image: "assets/images/tanggap-2.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                    CustomCard(
                                      title:
                                          "Diskon Spesial 25% Untuk Pelanggan Baru",
                                      image: "assets/images/tanggap-1.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                    CustomCard(
                                      title:
                                          "Bebas Kuota Akses Layanan Kesehatan",
                                      image: "assets/images/tanggap-2.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              // PAKAI LINKAJA
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const Text(
                                  "AYO! Pake LinkAja!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: const Text(
                                  "Pakai LinkAja untuk beli pulsa, beli paket data dan bayar tagihan lebih mudah.",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    CustomCard(
                                      title: "Bayar Serba Cepat",
                                      image: "assets/images/linkaja-1.png",
                                      height: 96,
                                      width: 145,
                                    ),
                                    CustomCard(
                                      title: "Cukup Snap QR",
                                      image: "assets/images/linkaja-2.png",
                                      height: 96,
                                      width: 145,
                                    ),
                                    CustomCard(
                                      title: "NO! Credit Card",
                                      image: "assets/images/linkaja-3.png",
                                      height: 96,
                                      width: 145,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              // VOUCHER
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Cari Voucher, Yuk!",
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    CustomCard(
                                      title:
                                          "Double Benefits from DOUBLE UNTUNG",
                                      image: "assets/images/voucher-1.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                    CustomCard(
                                      title: "Join Undi-Undi Hepi 2020!",
                                      image: "assets/images/voucher-2.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              // PENAWARAN KHUSUS
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Penawaran Khusus",
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    CustomCard(
                                      title:
                                          "Terus Belajar dari Rumahmu dengan Ruangguru!",
                                      image: "assets/images/offers-1.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                    CustomCard(
                                      title:
                                          "Belajar Kini Makin Mudah dengan Paket ilmupedia!",
                                      image: "assets/images/offers-2.png",
                                      height: 112,
                                      width: 248,
                                      cardHeight: 172,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                        // Navigation
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 70,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              ItemNav(
                                icon: "beranda",
                                status: true,
                                title: "Beranda",
                              ),
                              ItemNav(
                                icon: "riwayat-menu",
                                status: false,
                                title: "Riwayat",
                              ),
                              ItemNav(
                                icon: "bantuan",
                                status: false,
                                title: "Bantuan",
                              ),
                              ItemNav(
                                icon: "inbox",
                                status: false,
                                title: "Inbox",
                              ),
                              ItemNav(
                                icon: "profile",
                                status: false,
                                title: "Akun Saya",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
