class MessageListModel {
  bool success;
  Data data;

  MessageListModel({this.success, this.data});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<MessageList> messageList;

  Data({this.messageList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['messageList'] != null) {
      messageList = new List<MessageList>();
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageList {
  int id;
  String module;
  String moduleName;
  String title;
  String msg;
  String optype;
  int srcid;
  Null url;
  bool handled;

  MessageList(
      {this.id,
      this.module,
      this.moduleName,
      this.title,
      this.msg,
      this.optype,
      this.srcid,
      this.url,
      this.handled});

  MessageList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    module = json['module'];
    moduleName = json['moduleName'];
    title = json['title'];
    msg = json['msg'];
    optype = json['optype'];
    srcid = json['srcid'];
    url = json['url'];
    handled = json['handled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['module'] = this.module;
    data['moduleName'] = this.moduleName;
    data['title'] = this.title;
    data['msg'] = this.msg;
    data['optype'] = this.optype;
    data['srcid'] = this.srcid;
    data['url'] = this.url;
    data['handled'] = this.handled;
    return data;
  }
}