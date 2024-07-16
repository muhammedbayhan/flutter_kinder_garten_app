class ParentMessageModel {
  String? conversation;
  String? sender;
  String? receiver;
  String? sendAt;
  String? text;
  String? type;
  String? id;

  ParentMessageModel(
      {this.conversation,
      this.sender,
      this.receiver,
      this.sendAt,
      this.text,
      this.type,
      this.id});

  ParentMessageModel.fromJson(Map<String, dynamic> json) {
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