class Keyword {
  Keyword({
    required this.id,
    required this.keyword,
  });

  int id;
  String keyword;
}

List<Keyword> allKeywords = [
  Keyword(id: 1, keyword: "omg"),
  Keyword(id: 2, keyword: "malam"),
  Keyword(id: 3, keyword: "flutter"),
  Keyword(id: 4, keyword: "abc"),
];
