class Pantry{
  int _id;
  String _name;
  String _qtyType;
  String _expDate;

  Pantry(this._name, this._qtyType, this._expDate);

  Pantry.withId(this._id, this._name, this._qtyType, this._expDate);

  Pantry.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._qtyType = obj['qtyType'];
    this._expDate = obj['expDate'];
  }

  int get id => _id;
  String get name => _name;
  String get qtyType => _qtyType;
  String get expDate => _expDate;

  set name(String newName){
    if(newName.length <= 100){
      this._name = newName;
    }
  }

  set qtyType(String newType){
    if(newType.length <= 100){
      this._qtyType = newType;
    }
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['qtyType'] = _qtyType;
    map['expDate'] = _expDate;

    return map;
  }
  
  void setPantryId(int id){
    this._id = id;
  }

}