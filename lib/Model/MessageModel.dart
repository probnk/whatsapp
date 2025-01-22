class MessageModel{
  String message;
  String phone;
  String time;
  String status;

  Map<String?,dynamic> toJson() => {'message':message,'phone':phone,'time':time,'status':status};

  MessageModel.fromSnapshot(snapshot)
      : message = snapshot.data()['message'],
        phone = snapshot.data()['phone'],
        time = snapshot.data()['time'],
        status = snapshot.data()['status'];
}