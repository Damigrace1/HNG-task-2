class Price {
  final List? NGN;
  Price({required this.NGN});
  factory Price.fromJson(Map<String, dynamic> json){
    return Price(NGN: json["NGN"]);
  }
}
