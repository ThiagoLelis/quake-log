# Use uma imagem base do Ruby
FROM ruby:3.3.1

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o código fonte do seu projeto para o diretório de trabalho
COPY . .

RUN gem install bundle
RUN bundle install

# Comando para executar o script quando o contêiner for iniciado
ENTRYPOINT ["bundle", "exec"]
