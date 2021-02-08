## Senmail via cli
    curl -X POST "http://192.168.99.100:9001" -H "accept: application/json" -H "Content-Type: application/json" -d '{"Action": "SendEmail", "Destination.BccAddresses.member.1": "phich82@gmail.com", "Destination.CcAddresses.member.1": "phich82@gmail.com", "Destination.ToAddresses.member.1": "phich82@gmail.com", "Message.Body.Text.Data": "This is test", "Message.Body.Html.Data": "<h1>Hello</h1>", "Message.Subject.Data":  "phich82@gmail.com", "Source": "phich82@gmail.com",  "ReplyToAddresses.member.1": "phich82@gmail.com"}'

## Sendmail
```
ses.sendEmail({
  Destination: { /* required */
    BccAddresses: [
      'STRING_VALUE'
    ],
    CcAddresses: [
      'STRING_VALUE'
    ],
    ToAddresses: [
      'STRING_VALUE'
    ]
  },
  Message: { /* required */
    Body: { /* required */
      Html: {
        Data: 'STRING_VALUE' /* required */
      },
      Text: {
        Data: 'STRING_VALUE' /* required */
      }
    },
    Subject: { /* required */
      Data: 'STRING_VALUE' /* required */
    }
  },
  Source: 'STRING_VALUE', /* required */
  ReplyToAddresses: [
    'STRING_VALUE'
  ]
});
```