/// tags : [{"name":"Attention To Detail","color":"red"},{"name":"Better Upfront Planning","color":"red"},{"name":"Strong Hustle","color":"red"},{"name":"Hyper Organized","color":"red"},{"name":"Super Inspirational","color":"yellow"},{"name":"Stakeholder Communication","color":"yellow"},{"name":"Continuous Improvement","color":"green"},{"name":"Self Reflections","color":"green"},{"name":"Narrative Development","color":"blue"}]

class Tags {
  Tags({
    List<Tag>? tag,
  }) {
    _tag = tag;
  }

  Tags.fromJson(dynamic json) {
    if (json['tags'] != null) {
      _tag = [];
      json['tags'].forEach((v) {
        _tag?.add(Tag.fromJson(v));
      });
    }
  }

  List<Tag>? _tag;

  List<Tag>? get tag => _tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tag != null) {
      map['tags'] = _tag?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Attention To Detail"
/// color : "red"

class Tag {
  Tag({
    String? name,
    String? color,
  }) {
    _name = name;
    _color = color;
  }

  Tag.fromJson(dynamic json) {
    _name = json['name'];
    _color = json['color'];
  }

  String? _name;
  String? _color;

  String? get name => _name;

  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['color'] = _color;
    return map;
  }
}
