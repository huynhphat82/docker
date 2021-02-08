### Ref: https://github.com/minchao/smsender

# 1. Create config files with same content
    - config.default.yml
    - config.yml

# 2. Change database information:
      - database type:
        (mysql | pgsql,...)
      - dsn string:
        {DB_USER}:{DB_PASS}@tcp({DB_HOST}:{3306})/{DB_NAME}?parseTime=true&loc=Local

# 3. Change provider
    - Default: dummy
    - We can change it to some providers bellow:
        + AWS SNS (SMS)
        + Nexmo
        + Twilio

## Dummy (for test)
curl -X POST http://localhost:8080/api/routes -H "Content-Type: application/json" -d '{"name": "Dummy", "pattern": "\\+12345678900", "provider": "dummy", "is_active": true}'

curl -X POST http://192.168.99.100:8080/api/routes -H "Content-Type: application/json" -d '{"name": "Dummy", "pattern": "\\+12345678900", "provider": "dummy", "is_active": true}'

## AWS
curl -X POST http://localhost:8080/api/routes -H "Content-Type: application/json" -d '{"name": "User1", "pattern": "\\+886987654321", "provider": "aws", "is_active": true}'

curl -X POST http://192.168.99.100:8080/api/routes -H "Content-Type: application/json" -d '{"name": "User1", "pattern": "\\+886987654321", "provider": "aws", "is_active": true}'

## Nexmo
curl -X POST http://localhost:8080/api/routes -H "Content-Type: application/json" -d '{"name": "Taiwan", "pattern": "\\+886", "provider": "nexmo", "is_active": true}'

curl -X POST http://192.168.99.100:8080/api/routes -H "Content-Type: application/json" -d '{"name": "Taiwan", "pattern": "\\+886", "provider": "nexmo", "is_active": true}'

## Twilio
curl -X POST http://localhost:8080/api/routes -H "Content-Type: application/json" -d '{"name": "USA", "pattern": "\\+1", "provider": "twilio", "is_active": true}'

curl -X POST http://192.168.99.100:8080/api/routes -H "Content-Type: application/json" -d '{"name": "USA", "pattern": "\\+1", "provider": "twilio", "is_active": true}'

## Send Message
curl -X POST http://localhost:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+12345678900"],"from": "Gopher","body": "Hello, sms dummy", "provider": "dummmy"}'
curl -X POST http://192.168.99.100:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+12345678900"],"from": "Gopher","body": "Hello, sms dummy", "provider": "dummy"}'

curl -X POST http://localhost:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+886987654321"],"from": "Gopher","body": "Hello, sms aws", "provider": "aws"}'
curl -X POST http://192.168.99.100:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+886987654321"],"from": "Gopher","body": "Hello, sms aws", "provider": "aws"}'

curl -X POST http://localhost:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+886"],"from": "Gopher","body": "Hello, sms nexmo", "provider": "nexmo"}'
curl -X POST http://192.168.99.100:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+886"],"from": "Gopher","body": "Hello, sms nexmo", "provider": "nexmo"}'

curl -X POST http://localhost:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+1"],"from": "Gopher","body": "Hello, sms twilio", "provider": "twilio"}'
curl -X POST http://192.168.99.100:8080/api/messages -H "Content-Type: application/json" -d '{"to": ["+1"],"from": "Gopher","body": "Hello, sms twilio", "provider": "twilio"}'
