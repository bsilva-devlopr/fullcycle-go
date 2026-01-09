# 🐹 Full Cycle Go + Docker Challenge

Este projeto faz parte do desafio Full Cycle, cujo objetivo é criar uma imagem Docker extremamente leve utilizando Go Lang.  
Ao executar o container, o resultado exibido deve ser:

```bash
Full Cycle Rocks!!
```

## 🎯 Objetivo

- Criar uma aplicação Go simples
- Gerar uma imagem Docker com menos de 2MB
- Utilizar multi-stage build
- Publicar a imagem no Docker Hub
- Versionar o projeto no GitHub

## 🛠️ Tecnologias utilizadas

- Go Lang 1.21
- Docker
- Multi-stage build
- Imagem base scratch

```
📁 Estrutura do projeto
.
├── Dockerfile
├── go.mod
├── main.go
└── README.md
```

## 📄 Código da aplicação

Arquivo `main.go`:

```go
package main

import "fmt"

func main() {
	fmt.Println("Full Cycle Rocks!!")
}
```

🐳 Dockerfile

```Dockerfile
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod .
RUN go mod download

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /

CMD ["/fullcycle"]
```

Esse Dockerfile utiliza multi-stage build, garantindo que apenas o binário final seja incluído na imagem final, reduzindo drasticamente o tamanho.

## 📏 Tamanho da imagem

A imagem final gerada possui menos de 2MB, atendendo totalmente ao requisito do desafio.

## 📥 Como baixar o projeto

Clone o repositório:

- git clone https://github.com/bsilva-devlopr/fullcycle-go

Entre na pasta:

> cd fullcycle-go

## 🔨 Como buildar a imagem localmente

```bash
docker build -t fullcycle .
```

## ▶️ Como executar a imagem localmente

```bash
docker run fullcycle
```

Resultado esperado:

```bash
Full Cycle Rocks!!
```

## 🌐 Executando a imagem do Docker Hub

Após publicar sua imagem no Docker Hub, execute:

```bash
docker run <seu-user-dockerhub>/fullcycle
```

## 📦 Publicação no Docker Hub

Para publicar a imagem:

```bash
docker tag fullcycle <seu-user-dockerhub>/fullcycle
docker push <seu-user-dockerhub>/fullcycle
```

## 🔗 Docker Hub

Link da imagem:

https://hub.docker.com/r/neomeca/fullcycle

Para executar diretamente:

```bash
docker run neomeca/fullcycle
```

## 🧠 Por que a imagem é tão pequena?

Porque:

- O Go gera binário estático
- A imagem final usa scratch
- Nenhum pacote desnecessário é incluído
- Isso resulta em uma imagem extremamente leve, rápida e segura.

🏁 Conclusão

Este projeto demonstra:

- Uso correto de multi-stage build
- Otimização extrema de imagens Docker
- Integração entre Go e Docker
- Boas práticas para containers em produção

## 🚀 Resultado final

```bash
docker run <seu-user-dockerhub>/fullcycle
```

> Full Cycle Rocks!!
