# References
### https://hub.docker.com/r/roribio16/alpine-sqs/
### https://docs.aws.amazon.com/cli/latest/reference/sqs/send-message.html

# Sending a message
## NON-FIFO
    aws --endpoint-url http://localhost:9324 sqs send-message --queue-url http://localhost:9324/queue/default --message-body "Hello, queue!"

## FIFO:
    aws --endpoint-url http://localhost:9324 sqs send-message --queue-url http://localhost:9324/queue/test-fifo --message-body "Hello, queue!" --message-group-id xxx1 --message-deduplication-id yyy1

    aws --endpoint-url http://localhost:9324 sqs send-message --queue-url http://localhost:9324/queue/test-fifo --message-body "Hello, queue!" --message-group-id xxx2 --message-deduplication-id yyy2

# Viewing messages
    aws --endpoint-url http://localhost:9324 sqs receive-message --queue-url http://localhost:9324/queue/default --wait-time-seconds 10

# Delete messages
    aws --endpoint-url http://localhost:9324 sqs delete-message --queue-url http://localhost:9324/queue/test-fifo --receipt-handle "4826ecf6-1ac9-4f2c-849b-d40d837442cd#bf0af3e0-a7e6-493d-93bf-a490f3653eed"

# Creating new queues
    aws --endpoint-url http://localhost:9324 sqs create-queue --queue-name newqueue

    aws --endpoint-url http://localhost:9324 sqs create-queue --queue-name test --attributes FifoQueue=true,ContentBasedDeduplication=true,ReceiveMessageWaitTimeSeconds=20,VisibilityTimeout=3600