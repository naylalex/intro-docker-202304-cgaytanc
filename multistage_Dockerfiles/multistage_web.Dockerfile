FROM golang
COPY dispatcher.go .
COPY static .
RUN go build dispatcher.go
CMD ["./dispatcher"]
EXPOSE 80