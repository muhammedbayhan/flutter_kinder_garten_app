class ParentConversationsModel {
  String? channel;
  List<Users>? users;
  List<Messages>? messages;
  String? id;

  ParentConversationsModel({this.channel, this.users, this.messages, this.id});

  ParentConversationsModel.fromJson(Map<String, dynamic> json) {
    channel = json['channel'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channel'] = channel;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class Users {
  String? phone;
  String? name;
  String? role;
  String? id;

  Users({this.phone, this.name, this.role, this.id});

  Users.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}

class Messages {
  String? conversation;
  String? sender;
  String? receiver;
  String? sendAt;
  String? text;
  String? type;
  String? id;

  Messages(
      {this.conversation,
      this.sender,
      this.receiver,
      this.sendAt,
      this.text,
      this.type,
      this.id});

  Messages.fromJson(Map<String, dynamic> json) {
    conversation = json['conversation'];
    sender = json['sender'];
    receiver = json['receiver'];
    sendAt = json['send_at'];
    text = json['text'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conversation'] = conversation;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['send_at'] = sendAt;
    data['text'] = text;
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}