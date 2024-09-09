# Используем базовый образ с Go
FROM golang:1.22.0-alpine

# Устанавливаем необходимые зависимости
RUN apk add --no-cache git

# Создаем рабочую директорию
WORKDIR /app

# Копируем go.mod и go.sum и устанавливаем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем остальные файлы проекта
COPY . .

# Собираем приложение
RUN go build -o main .

# Определяем команду запуска контейнера
CMD ["./main"]
