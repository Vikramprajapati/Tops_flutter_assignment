class Food {
  String name;
  String desc;

  num score;
  String imageUrl;
  String waitTime;
  String cal;
  num price;
  num quantity;
  List<Map<String, String>> ingredients;
  String about;
  bool hightLight;

  Food(
      {required this.name,
      required this.desc,
      required this.score,
      required this.imageUrl,
      required this.waitTime,
      required this.cal,
      required this.price,
      required this.quantity,
      required this.ingredients,
      required this.about,
      this.hightLight = false});

  static List<Food> generateRecommendFood() {
    return [
      Food(
          name: "Soba Soup",
          desc: "No.1 in Sales",
          score: 4.8,
          imageUrl: "assets/images/dish1.png",
          waitTime: "50 min",
          cal: "325 kcal",
          price: 12,
          quantity: 1,
          ingredients: [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"},
            {"Scallion": "assets/images/ingre4.png"}
          ],
          about:
              "About A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chet Pamass Savang of Atlanta's Talat Market",
          hightLight: true),
      Food(
          name: "Sei Ua Samun Phrai",
          desc: "No.1 in Sales",
          score: 4.8,
          imageUrl: "assets/images/dish2.png",
          waitTime: "50min",
          cal: "325kcal",
          price: 12,
          quantity: 1,
          ingredients: [
            {"Noodle": "assets/images/ingre1.png"},
            {"Srimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"},
            {"Scallion": "assets/images/ingre4.png"}
          ],
          about:
              "About A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chet Pamass Savang of Atlanta's Talat Market"),
      Food(
          name: "Ratatoullie Pasta",
          desc: "No.1 in Sales",
          score: 4.8,
          imageUrl: "assets/images/dish3.png",
          waitTime: "50 min",
          cal: "325 kcal",
          price: 12,
          quantity: 1,
          ingredients: [
            {"Noodle": "assets/images/ingre1.png"},
            {"Srimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"},
            {"Scallion": "assets/images/ingre4.png"}
          ],
          about:
              "About A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chet Pamass Savang of Atlanta's Talat Market")
    ];
  }
}
