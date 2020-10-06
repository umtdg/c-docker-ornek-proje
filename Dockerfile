FROM alpine as build
RUN apk update && apk add build-base
COPY ornek-proje /ornek-proje
WORKDIR /ornek-proje
RUN gcc -o main main.c

FROM alpine
COPY --from=build /ornek-proje/main /main
CMD ["./main"]
