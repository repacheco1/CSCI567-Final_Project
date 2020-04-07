class ShoppingList{
  int _id;
  String _name;
  String _notes;

  ShoppingList(this._name, this._notes);

  ShoppingList.withId(this._id, this._name, this._notes);

  int get id => _id;
  String get name => _name;
  String get notes => _notes;

  set name(String newName){
    if(newName.length <= 100){
      this._name = newName;
    }
  }

  set notes(String newNotes){
    if(newNotes.length <= 255){
      this._name = newNotes;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['notes'] = _notes;

    return map;
  }

  ShoppingList.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._notes = map['notes'];
  }

}