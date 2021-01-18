FROM roribio16/alpine-sqs:latest

# Install curl & aws cli
RUN apk add --no-cache curl ca-certificates \ 
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \ 
    && unzip awscliv2.zip \ 
    && ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update \
    && aws --version && rm -rf awscliv2.zip && rm -rf ./aws