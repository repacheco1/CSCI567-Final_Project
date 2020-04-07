class ShoppingList{
  int _id;
  String _name;
  String _notes;

  ShoppingList(this._name, this._notes);

  ShoppingList.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._notes = obj['notes'];
  }

  int get id => _id;
  String get name => _name;
  String get notes => _notes;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['notes'] = _notes;

    return map;
  }

  ShoppingList.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._notes = map['notes'];
  }
}