<p align="center"><a href="https://voyager.devdojo.com" target="_blank"><img width="400" src="https://s3.amazonaws.com/thecontrolgroup/voyager.png"></a></p>

# **V**oyager - The Missing Laravel Admin
Made by [The Control Group](https://www.thecontrolgroup.com)

![Voyager Screenshot](https://s3.amazonaws.com/thecontrolgroup/voyager-screenshot.png)

Website & Documentation: https://voyager.devdojo.com/

Video Tutorial Here: https://voyager.devdojo.com/academy/

Join our Slack chat: https://voyager-slack-invitation.herokuapp.com/

View the Voyager Cheat Sheet: https://voyager-cheatsheet.ulties.com/

<hr>

## Instalação

### 1. Cria um Projeto do Laravel

Roda o comando para criar o projeto em Laravel:

```bash
composer create-project laravel/laravel igor_bueno_franco_atividade_pratica_m2

```

### 2. Requerer Voyager
Para requerer o Voyager, rode o seguinte comando:

```bash
composer require tcg/voyager
```

### 3. Configurar Banco de Dados

Cria um Banco de Dados a partir do Dump localizado no projeto. Altera as credenciais no arquivo .env:

```
APP_URL=http://localhost:8000

DB_HOST=localhost
DB_DATABASE=banco_loja
DB_USERNAME=usuario
DB_PASSWORD=secret
```

### 3. Instalar o Voyager

Comando para efetuar a Instalação:

```bash
php artisan voyager:install
```

Roda o seguinte comando para iniciar o servidor: `php artisan serve` e acessa o link: [http://localhost:8000/admin](http://localhost:8000/admin).

## Usuários de Teste

>**email:** `admin@admin.com`   
>**password:** `admin`

>**email:** `vendedor@vendas.com`   
>**password:** `vendedor`

Caso queria criar um usuáio novo, rodar o seguinte comando:

```bash
php artisan voyager:admin your@email.com --create
```
