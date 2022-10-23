class AppBanner {
  final int id;
  final String title;
  final String ImageURL;
  final String explain;

  AppBanner(this.id,this.title,this.ImageURL, this.explain);
}

List<AppBanner> appBannerList = [
  AppBanner(1, 'Steak', 'assets/609ee8331b5cea0019c452e2.jpg','Try our Prime steaks today! All Steak brings only the finest-quality food to your table.'),
  AppBanner(2, 'Salad', 'assets/chopped-chef-salad.jpg','Stop paying for overpriced salads. Make your restaurant favorites at home! We have copycat salads from Panera, Applebee"s, Wendy"s and more.'),
  AppBanner(3, 'Soup', 'assets/Hearty-Vegetable-Soup_EXPS_HC17_15651_D01_20_6b.jpg','Get piping hot, comfort food delivered to your door step now!'),
  AppBanner(4, 'Dessert', 'assets/images.jpg','Finish strong with delicious brownie bites, ice cream sundaes, milkshakes, molten chocolate cake and more.')
];