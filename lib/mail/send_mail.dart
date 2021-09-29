import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendMail{
  String username = 'denememaili338@gmail.com';
  String password = 'denememaili';


  main() async {
    final smtpServer = gmail(username, password);
    //Create our Message
    final message = Message()
      ..from = Address(username)
      ..recipients.add('denememaili338@gmail.com')
      ..subject = 'Flutter Mailer'
      ..text = 'This is the plain text.This is line 2 of the text part.'
      ..html="<h1>merhaba</h1>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n'+ e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }

  }
}


