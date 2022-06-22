import 'package:equatable/equatable.dart';

class Complaint extends Equatable {
  Complaint({
    int? id,
    List<Attachments>? attachments,
    List<Assignments>? assignments,
    List<Activities>? activities,
    List<Vendors>? vendors,
    String? created,
    String? modified,
    String? title,
    String? description,
    String? unit,
    String? latitude,
    String? longitute,
    String? state,
    String? category,
    String? date,
    String? followupBy,
    int? complainant,
    int? priority,
  }) {
    _id = id;
    _attachments = attachments;
    _assignments = assignments;
    _activities = activities;
    _vendors = vendors;
    _created = created;
    _modified = modified;
    _title = title;
    _description = description;
    _unit = unit;
    _latitude = latitude;
    _longitute = longitute;
    _state = state;
    _category = category;
    _date = date;
    _followupBy = followupBy;
    _complainant = complainant;
    _priority = priority;
  }

  Complaint.fromJson(dynamic json) {
    _id = json['id'];
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    if (json['assignments'] != null) {
      _assignments = [];
      json['assignments'].forEach((v) {
        _assignments?.add(Assignments.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      _activities = [];
      json['activities'].forEach((v) {
        _activities?.add(Activities.fromJson(v));
      });
    }
    if (json['vendors'] != null) {
      _vendors = [];
      json['vendors'].forEach((v) {
        _vendors?.add(Vendors.fromJson(v));
      });
    }
    _created = json['created'];
    _modified = json['modified'];
    _title = json['title'];
    _description = json['description'];
    _unit = json['unit'];
    _latitude = json['latitude'];
    _longitute = json['longitute'];
    _state = json['state'];
    _category = json['category'];
    _date = json['date'];
    _followupBy = json['followup_by'];
    _complainant = json['complainant'];
    _priority = json['priority'];
  }

  int? _id;
  List<Attachments>? _attachments;
  List<Assignments>? _assignments;
  List<Activities>? _activities;
  List<Vendors>? _vendors;
  String? _created;
  String? _modified;
  String? _title;
  String? _description;
  String? _unit;
  String? _latitude;
  String? _longitute;
  String? _state;
  String? _category;
  String? _date;
  String? _followupBy;
  int? _complainant;
  int? _priority;

  int? get id => _id;

  List<Attachments>? get attachments => _attachments;

  List<Assignments>? get assignments => _assignments;

  List<Activities>? get activities => _activities;

  List<Vendors>? get vendors => _vendors;

  String? get created => _created;

  String? get modified => _modified;

  String? get title => _title;

  String? get description => _description;

  String? get unit => _unit;

  String? get latitude => _latitude;

  String? get longitute => _longitute;

  String? get state => _state;

  String? get category => _category;

  String? get date => _date;

  String? get followupBy => _followupBy;

  int? get complainant => _complainant;

  int? get priority => _priority;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    if (_assignments != null) {
      map['assignments'] = _assignments?.map((v) => v.toJson()).toList();
    }
    if (_activities != null) {
      map['activities'] = _activities?.map((v) => v.toJson()).toList();
    }
    if (_vendors != null) {
      map['vendors'] = _vendors?.map((v) => v.toJson()).toList();
    }
    map['created'] = _created;
    map['modified'] = _modified;
    map['title'] = _title;
    map['description'] = _description;
    map['unit'] = _unit;
    map['latitude'] = _latitude;
    map['longitute'] = _longitute;
    map['state'] = _state;
    map['category'] = _category;
    map['date'] = _date;
    map['followup_by'] = _followupBy;
    map['complainant'] = _complainant;
    map['priority'] = _priority;
    return map;
  }

  @override
    List<Object?> get props => [id];
}

class Vendors extends Equatable {
  Vendors({
    String? external,
    int? card,
    String? created,
  }) {
    _external = external;
    _card = card;
    _created = created;
  }

  Vendors.fromJson(dynamic json) {
    _external = json['external'];
    _card = json['card'];
    _created = json['created'];
  }

  String? _external;
  int? _card;
  String? _created;

  String? get external => _external;

  int? get card => _card;

  String? get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['external'] = _external;
    map['card'] = _card;
    map['created'] = _created;
    return map;
  }

  @override
  List<Object?> get props => [
        external,
        card,
        created,
      ];
}

class Activities extends Equatable {
  Activities({
    int? id,
    List<ActivityAssignment>? assignments,
    List<ActivityAttachment>? attachments,
    String? created,
    String? modified,
    String? type,
    String? comment,
    String? date,
    String? stateChange,
    String? logTagsChange,
    String? externalChange,
    int? user,
    int? card,
    int? priorityChange,
  }) {
    _id = id;
    _assignments = assignments;
    _attachments = attachments;
    _created = created;
    _modified = modified;
    _type = type;
    _comment = comment;
    _date = date;
    _stateChange = stateChange;
    _logTagsChange = logTagsChange;
    _externalChange = externalChange;
    _user = user;
    _card = card;
    _priorityChange = priorityChange;
  }

  Activities.fromJson(dynamic json) {
    _id = json['id'];
    if (json['assignments'] != null) {
      _assignments = [];
      json['assignments'].forEach((v) {
        _assignments?.add(ActivityAssignment.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(ActivityAttachment.fromJson(v));
      });
    }
    _created = json['created'];
    _modified = json['modified'];
    _type = json['type'];
    _comment = json['comment'];
    _date = json['date'];
    _stateChange = json['state_change'];
    _logTagsChange = json['log_tags_change'];
    _externalChange = json['external_change'];
    _user = json['user'];
    _card = json['card'];
    _priorityChange = json['priority_change'];
  }

  int? _id;
  List<ActivityAssignment>? _assignments;
  List<ActivityAttachment>? _attachments;
  String? _created;
  String? _modified;
  String? _type;
  String? _comment;
  String? _date;
  String? _stateChange;
  String? _logTagsChange;
  String? _externalChange;
  int? _user;
  int? _card;
  int? _priorityChange;

  int? get id => _id;

  List<ActivityAssignment>? get assignments => _assignments;

  List<ActivityAttachment>? get attachments => _attachments;

  String? get created => _created;

  String? get modified => _modified;

  String? get type => _type;

  String? get comment => _comment;

  String? get date => _date;

  String? get stateChange => _stateChange;

  String? get logTagsChange => _logTagsChange;

  String? get externalChange => _externalChange;

  int? get user => _user;

  int? get card => _card;

  int? get priorityChange => _priorityChange;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_assignments != null) {
      map['assignments'] = _assignments?.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    map['created'] = _created;
    map['modified'] = _modified;
    map['type'] = _type;
    map['comment'] = _comment;
    map['date'] = _date;
    map['state_change'] = _stateChange;
    map['log_tags_change'] = _logTagsChange;
    map['external_change'] = _externalChange;
    map['user'] = _user;
    map['card'] = _card;
    map['priority_change'] = _priorityChange;
    return map;
  }

  @override
  List<Object?> get props => [id];
}

class Attachments extends Equatable {
  Attachments({
    int? id,
    String? created,
    String? modified,
    String? photo,
    int? cardActivity,
    int? card,
  }) {
    _id = id;
    _created = created;
    _modified = modified;
    _photo = photo;
    _cardActivity = cardActivity;
    _card = card;
  }

  Attachments.fromJson(dynamic json) {
    _id = json['id'];
    _created = json['created'];
    _modified = json['modified'];
    _photo = json['photo'];
    _cardActivity = json['card_activity'];
    _card = json['card'];
  }

  int? _id;
  String? _created;
  String? _modified;
  String? _photo;
  int? _cardActivity;
  int? _card;

  int? get id => _id;

  String? get created => _created;

  String? get modified => _modified;

  String? get photo => _photo;

  int? get cardActivity => _cardActivity;

  int? get card => _card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created'] = _created;
    map['modified'] = _modified;
    map['photo'] = _photo;
    map['card_activity'] = _cardActivity;
    map['card'] = _card;
    return map;
  }

  @override
  List<Object?> get props => [id];
}

class Assignments extends Equatable {
  Assignments({
    int? id,
    String? created,
    String? modified,
    int? card,
    int? user,
  }) {
    _id = id;
    _created = created;
    _modified = modified;
    _card = card;
    _user = user;
  }

  Assignments.fromJson(dynamic json) {
    _id = json['id'];
    _created = json['created'];
    _modified = json['modified'];
    _card = json['card'];
    _user = json['user'];
  }

  int? _id;
  String? _created;
  String? _modified;
  int? _card;
  int? _user;

  int? get id => _id;

  String? get created => _created;

  String? get modified => _modified;

  int? get card => _card;

  int? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created'] = _created;
    map['modified'] = _modified;
    map['card'] = _card;
    map['user'] = _user;
    return map;
  }

  @override
  List<Object?> get props => [id];
}

class ActivityAssignment extends Equatable {
  ActivityAssignment({
    int? id,
    String? created,
    String? modified,
    int? user,
    int? cardActivity,
  }) {
    _id = id;
    _created = created;
    _modified = modified;
    _user = user;
    _cardActivity = cardActivity;
  }

  ActivityAssignment.fromJson(dynamic json) {
    _id = json['id'];
    _created = json['created'];
    _modified = json['modified'];
    _cardActivity = json['card_activity'];
    _user = json['user'];
  }

  int? _id;
  String? _created;
  String? _modified;
  int? _user;
  int? _cardActivity;

  int? get id => _id;

  String? get created => _created;

  String? get modified => _modified;

  int? get user => _user;

  int? get cardActivity => _cardActivity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created'] = _created;
    map['modified'] = _modified;
    map['card_activity'] = _cardActivity;
    map['user'] = _user;
    return map;
  }

  @override
  List<Object?> get props => [id,];
}

class ActivityAttachment extends Equatable {
  ActivityAttachment({
    int? id,
    String? created,
    String? modified,
    String? photo,
    int? cardActivity,
    int? card,
  }) {
    _id = id;
    _created = created;
    _modified = modified;
    _photo = photo;
    _cardActivity = cardActivity;
    _card = card;
  }

  ActivityAttachment.fromJson(dynamic json) {
    _id = json['id'];
    _created = json['created'];
    _modified = json['modified'];
    _photo = json['photo'];
    _cardActivity = json['card_activity'];
    _card = json['card'];
  }

  int? _id;
  String? _created;
  String? _modified;
  String? _photo;
  int? _cardActivity;
  int? _card;

  int? get id => _id;

  String? get created => _created;

  String? get modified => _modified;

  String? get photo => _photo;

  int? get cardActivity => _cardActivity;

  int? get card => _card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created'] = _created;
    map['modified'] = _modified;
    map['photo'] = _photo;
    map['card_activity'] = _cardActivity;
    map['card'] = _card;
    return map;
  }

  @override
  List<Object?> get props => [id];
}
