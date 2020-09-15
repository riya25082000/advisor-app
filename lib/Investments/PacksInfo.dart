class Packs {
  String name;
  String minAmt;
  String schemes;
  String returns;
  String type;

  Packs({this.name, this.minAmt, this.schemes, this.returns, this.type});
}

List<Packs> recommend = [
  Packs(
      name: "Money Taxsaver Investment Pack",
      minAmt: "₹ 2,000",
      schemes: "4",
      returns: "+6.08%",
      type: "Conservative"),
  Packs(
      name: "Money Mini Investment Pack",
      minAmt: "₹ 2,000",
      schemes: "4",
      returns: "+6.08%",
      type: "Conservative"),
];

List<Packs> all = [
  Packs(
      name: "Aditya Birla Sun Life Mutual Fund Investment Pack",
      minAmt: "₹ 2,000",
      schemes: "4",
      returns: "+6.08%",
      type: "Conservative"),
  Packs(
      name: "Money Taxsaver Investment Pack",
      minAmt: "₹ 2,000",
      schemes: "4",
      returns: "+6.08%",
      type: "Conservative"),
  Packs(
      name: "Money Taxsaver Investment Pack",
      minAmt: "₹ 2,000",
      schemes: "4",
      returns: "+6.08%",
      type: "Conservative"),
];

class Funds {
  String fundName;
  String minInvest;
  String allocate;
  String output;

  Funds({this.fundName, this.minInvest, this.allocate, this.output});
}

List<Funds> FundsInfo = [
  Funds(
      fundName: "Axis Long term Plan",
      minInvest: "₹ 2,000",
      allocate: "15",
      output: "+6.08%"),
  Funds(
      fundName: "Invesco India Tax Plan",
      minInvest: "₹ 5,000",
      allocate: "25",
      output: "+8.09%"),
];
