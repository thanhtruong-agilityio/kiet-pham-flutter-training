class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;

  Pizza(this.id, this.pizzaName, this.description, this.price, this.imageUrl);

  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pizzaName = json['pizzaName'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'pizzaName': pizzaName,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
      };
}
