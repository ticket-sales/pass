# Используем официальный образ Ruby как базовый
FROM ruby:3.2.2

# Создаем рабочую директорию для нашего приложения
WORKDIR /myapp

# Копируем Gemfile и Gemfile.lock в /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Устанавливаем зависимости для Ruby
RUN bundle install

# Копируем наш исходный код в /myapp
COPY . /myapp

#
EXPOSE 3001
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3001"]
