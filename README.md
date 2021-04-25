# Benkyo - Laravel, NuxtJS & MariaDB Dockerizado

Todo projeto de aprendizado meu se chama benkyo onde lê-se *Benkyō* por ser uma palavra japonesa para "Aprender".

Este é meu mais novo foco. NuxtJS e como eu aprendo muito mais rapido com a mão na massa, iniciei um projeto simples de backend Laravel 8 com frontend em NuxtJS e banco de dados MariaDB tudo rodando no mesmo host docker.

## Vamos as versões

Backend

> PHP-fpm 7.4.16 (Dockerfile TAG: `7.4-fpm`)
>
> Composer 2.0.12
>
> Laravel 8.38.0

Frontend

> NodeJS 15.14.0 (Dockerfile TAG: `latest`)
>
> Npm 7.7.6
>
> Vue/CLI 4.5.12

Database

> MariaDB 10.5.9 (Dockerfile TAG: `latest`)

Transport

> Nginx 1.20.0 (Dockerfile TAG: `latest`)

## Pré-build

Meu ambiente é um Windows 10 com WSL2 e Docker v20.10.5, Calma lá, adoro Linux e mesmo com mais de 20 anos como especialista em suporte a serviços Linux eu uso sim Windows 10 como ambiente de desenvolvimento, rs...

Para saber como montar seu ambiente Windows com WSL2 acesse [WSL 2 - Developer Ambient with Debian.md](https://github.com/andreabreu76/tutor/blob/master/WSL%202%20-%20Developer%20Ambient%20with%20Debian.md)

Faça o clone do repositorio

```bash
git clone https://github.com/andreabreu76/php7-vuejs.git
```

Inicie o container

```bash
cd php7-vuejs && docker-composer up --build -d
```

Rode o composer na pasta php

```bash
cd php && docker exec -it backend composer install 
```

Ainda na pasta PHP verifique se as configurações de seu banco estão corretas no arquivo .env, caso não exista copie com o comando.

```bash
cp .env.exemple .env
```

Edite-o e altere a sessão DB_ para:

```bash
DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```

Agora apliqua a alteração.

```bash
docker exec -it backend php artisan config:clear
```

Rode o migrate

```bash
docker exec -it backend php artisan migrate
```

Por fim rode as permissões em storage

```bash
docker exec -it backend chmod -R ugo+rwx storage/
```

Agora vamos ao frontend (considerando que está na pasta ./php/).

```bash
cd ../frontend
```

Execute:

```bash
npm install
```

Pronto agora sua aplicação e ambiente deve rodar como deseja em:

Frontend
> http://localhost

Backend
> http://localhost/srv/

Banco de dados
>mariadb://homestead:secret@localhost/homestead

Quaquer problema pode ser visto com logs do docker dentro do diretorio raiz do projeto com o comando.

```bash
docker logs <nome_do_container>
```

Para saber se todos os conteiners estão rodando corretamente digite

```bash
docker ps
```

Caso deseje fazer um debug utilize o comando

```bash
docker logs --folow <id_do_conteiner>
```

O id do conteiner pode ser obtido com o comando `docker ps`

Aproveite.
