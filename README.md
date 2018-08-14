# Сервис организации встреч - BBQ
Приложение для организации встреч. Социальная сеть для назначения мероприятий, общения и обмены фотографиями.

## Версия руби и рельс
Приложение написано на `rails 4.2.10`, `ruby 2.4.3 `.

## Особенности
* Технологии: HTML, CSS, JS, Ruby on rails

* Обработка и хранение фотография (AWS-S3, carrierwave, for, rmagick)

* Views - Bootstrap фреймворк 3 версии

* Авториязация пользователя - Device

* Локализация приложения

## Системные зависимости
* byebug
* carrierwave
* devise
* devise-i18n
* dotenv-rails
* factory_bot_rails
* fog-aws
* jquery-rails
* pg (~> 0.20)
* rails (= 4.2.10)
* rails-i18n
* rails_12factor
* rmagick
* rspec-rails (~> 3.4)
* russian
* shoulda-matchers
* sprockets (~> 3.7.2)
* sqlite3
* twitter-bootstrap-rails
* uglifier (>= 1.3.0)
* web-console

## Установка и запуск
Для запуска в `development` окружении, необходимо иметь установленные `homebrew`, `ruby 2.4.1`, `rvm` или `rbenv`, `rails 5.1.5`, `bundler`. Команды, указанные ниже, выполнять находясь в целевой директории (желаемой директории проекта).

Клонировать репозиторий

``` git clone git@github.com:Anikram/BBQ.git```

Установить набор гемов

``` bundle ```

Прогнать миграции базы данных
 
``` bundle exec rails db:migrate```

Запустить локальные сервер

``` bundle exec rails server ```

Перейти на страницу `localhost:3000` в браузере.


## Базы данных
В проекте используется база данных `SQLite 3` в `development` окружении и `PostgreSQL` в `production` окружении, для хранения инфомрации о событиях, пользователях, комментариев и ссылок на облочное хранилище с фотографиями.  

## Разработал
Александр Маркин, в рамках интенсив-курса Rails от [goodprogrammer.ru](http://goodprogrammer.ru/rails-winter-18/)

2018 год
