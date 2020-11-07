class CreateTrip {
  String from;
  String to;
  double price;
  String comment;
  int seats;
  bool onlyTwo;
  String startingTime;
  String finishTime;

  CreateTrip(
      {this.from,
      this.to,
      this.price,
      this.comment,
      this.seats,
      this.onlyTwo,
      this.startingTime,
      this.finishTime});

  CreateTrip.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    price = json['price'];
    comment = json['comment'];
    seats = json['seats'];
    onlyTwo = json['onlyTwo'];
    startingTime = json['startingTime'];
    finishTime = json['finishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['price'] = this.price;
    data['comment'] = this.comment;
    data['seats'] = this.seats;
    data['onlyTwo'] = this.onlyTwo;
    data['startingTime'] = this.startingTime;
    data['finishTime'] = this.finishTime;
    return data;
  }
}
