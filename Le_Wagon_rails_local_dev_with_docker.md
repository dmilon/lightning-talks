<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

# Le Wagon Rails Local Development with Docker
Source: https://slides.com/bibendi/dip#/
From Michael Merkushin
___

## How often do you hear

"How does this not work in production? Everything works on my machine!"
___

## What is the problem?
The main reasons are differences of:
- configurations
- libraries
- dependencies
- operating systems
___

## Backward compatibility
![h:600 center](https://i2.cdscdn.com/pdt2/4/1/8/1/700x700/moo6412976305418/rw/adaptateur-de-dongle-de-hub-usb-c-en-aluminium-sta.jpg)
___

## Solution: containers
![h:400 center](https://www.smile.eu/sites/default/files/styles/picture_news_technology/public/2017-08/dockerOfficielle.png?itok=wkBxr_fk)
___

## The idea
Bundle the app with its own dependencies, libraries and configuration files in a standardized format easily runnable by the operating-system kernel
___

##  Benefits
- Lightweight
- Fast
- Replicable environment
- Use of existing Linux Kernel tools
___

## `Dockerfile`

The building instructions for the image
```Dockerfile
FROM ruby

WORKDIR /app

COPY . /app

RUN gem install sinatra

EXPOSE 4567

CMD ruby app.rb
```
___

## `docker-compose.yml`

The running instructions for a multi-container application
```yaml
  rails:
    <<: *app
    command: bundle exec rails server -b 0.0.0.0
    ports:
      - "3000:3000"
    depends_on:
      - postgres
      - redis
  sidekiq:
    <<: *app
    command: bundle exec sidekiq -C config/sidekiq.yml
    depends_on:
      - postgres
      - redis
```
___

## Want to learn how to build a Docker app?
@dbo talks about Docker:
https://teamwagon.slack.com/archives/GGVLZ67UK/p1553850980001200
___

## Kicking off local dev env (the old way)
```bash
hub clone lewagon/rails-k8s-demo
gco -b my-feature
bundle
yarn install
rails db:migrate
rails s
```

```bash
sidekiq
```

```
webpack-dev-server
```
___
## What now?
```bash
hub clone lewagon/rails-k8s-demo
gco -b my-feature
docker-compose up -d postgres redis
docker-compose up -d --build app
docker-compose run app bundle install
docker-compose run app yarn install
docker-compose run app bundle exec rails db:migrate
docker-compose up -d rails sidekiq webpacker
```
___

## How to run?
### Bad
```bash
$ docker-compose run --rm app bash
8547c5:$ bundle exec rails c
```
___

## How to run?
### Good
```bash
$ docker-compose run --rm app bundle exec rails c
```
___

## Painful, right?
___

##  I just want to
```bash
rails c
```
___

## Say welcome to DIP
Docker Interaction Process
https://github.com/bibendi/dip
___

## `dip.yml`
```yaml
  bundle:
    description: Run Bundler commands
    service: app
    command: bundle

  yarn:
    description: Run Yarn commands
    service: app
    command: yarn

  rake:
    description: Run Rake commands
    service: app
    command: bundle exec rake
```
___

## Integration with shell
```bash
$ eval "$(dip console)"
```
___

## Everyday working commands
- `bundle install`
- `yarn install`
- `rails db:migrate`
- `rails routes | grep admin`
___

# Thanks!
