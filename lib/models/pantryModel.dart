class PantryList{
  int _id;
  String _name;
  int _qty;
  String _type;
  String _expDate;

  PantryList(this._id, this._name, this._qty, this._type, this._expDate);

  PantryList.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._qty = obj['qty'];
    this._type = obj['type'];
    this._expDate = obj['expDate'];
  }

  int get id => _id;
  String get name => _name;
  int get qty => _qty;
  String get type => _type;
  String get expDate => _expDate;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['qty'] = _qty;
    map['type'] = _type;
    map['expDate'] = _expDate;

    return map;
  }

  PantryList.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._qty = map['qty'];
    this._type = map['type'];
    this._expDate = map['expDate'];
  }
}