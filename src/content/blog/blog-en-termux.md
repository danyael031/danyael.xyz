---
title: Administrando blog desde tu dispositivo Android con Termux y GitHub Pages
description: "Mostrando cómo publicar un sitio web completo desde tu celular, gratis y usando Termux"
pubDate: 'Nov 21 2019'
---

En el primer post de mi blog te mostraré cómo administrar tu propio blog desde tu teléfono móvil, utilizando algunas utilidades de Termux y GitHub Pages.

### Creando la página para nuestro blog

Github es una plataforma de desarrollo de software con control de versiones. Pero, por ahora, lo único que nos interesa es su servicio de *Github Pages*.

Github Pages nos permite tener una pequeña página web estática para poner cualquier cosa que queramos. Será necesaria una cuenta en Github para poder utilizar el servicio (si aún no la tienes, ve a [Github](https://github.com) y crea una!).

Dado que no queremos crear todo nuestro blog desde cero (y lidiar con todo el trabajo que eso conlleva), haremos una bifurcación (fork) del proyecto [Jekyll Now](https://github.com/barryclark/jekyll-now), en el repositorio de barryclark. Recomiendo ampliamente leer la descripción del proyecto.

Para realizar el fork, ve a la página del proyecto y presiona el botón de fork:
![Ve a la página del proyecto y presiona el botón de fork](/images/blog-en-termux/forkjekyllnow.jpg)

Toma algunos segundos para realizar el fork:
![it will take some seconds to fork the project](/images/blog-en-termux/forkinproxess.jpg)

Ahora, ve a la configuración (settigns) de tu nuevo repositorio y cambia su nombre a `usuario.github.io`, donde `usuario` es tu nombre de usuario en Github.

Ve a tu `usuario.github.io` desde tu navegador y listo, ya tienes la estructura básica para tu blog.

### Administrando nuestro blog desde Termux

Como podría esperarse, utilizaremos Termux para manejar nuestro blog. Si no sabes lo que es Termux, la descripción de su sitio web lo describe bastante bien:

> Termux es una emulador de terminal para Adnroid y un entorno de Linux que funciona directamente sin rootear y sin ninguna preparación necesaria.

Y eso es todo. El poder de un terminal de Linux, en tus manos.
Puedes instalar Termux desde Google Play Store o desde F-droid.

Necesita instalar el cliente para el control de versiones, git. Para ello será necesario ejecutar el siguiente comando en Termux:

```shell
pkg install -y git 
```

Una vez instalado el control de versiones, procederemos a clonar el repositorio de nuestro blog:

```shell
git clone https://github.com/usuario/usuario.github.io.git
```

Podremos acceder a la carpeta de \_posts y comenzar a agregar las entradas de nuestro blog. Para movernos a la carpeta de \_posts se utiliza el siguiente comando:

```shell
cd usuario.github.io/_pages
```

De acuerdo a la documentación de Jekyll Now, los nombres de las entradas del blog llevan el formato de `año-mes-dia-Nombre-del-blog`. Creamos nuestro archivo de la siguiente manera:

```shell
touch 2019-11-21-Blog-en-termux.md
```

Es importante mantener el formato de nuestros archivos como .md (MarkDown).

Ya podemos proceder a editar nuestra entrada de blog. Es necesario abrirlo con un editor de texto, puede ser un editor dentro de la consola de Termux (nano, vim, emacs, etc) o abriendo el archivo con un editor externo (Markor o cualquier otra aplicación para editar markdown). Para el segundo caso, sería necesario clonar nuestro repositorio en una carpeta del almacenamiento de nuestro dispositivo, pero dado que eso implica instalar termux-api y configurarlo, será un tema que retomaremos para otra ocación.

Abrimos el archivo de nuestro blog desde un editor de texto en la consola:

```shell
nano 2019-11-21-Blog-en-termux.md
```

Agregamos la información de formato para nuestro blog:

```markdown
---
layout: post
title: Administrando blog desde tu dispositivo Android con Termux y GitHub Pages
---
```

Y listo, podemos comenzar a escribir nuestro blog desde la terminal. Si no estás familiarizado con MarkDown, te recomiendo leer [ésta guía](https://guides.github.com/features/mastering-markdown/)

#### Subiendo los cambios

Una vez termines de realizar los cambios a tu entrada de blog, tienes que realizar una confirmación de cambios y un git push:

```shell
git add .
git commit -m "Creando nueva entrada del blog"
git push
```

Se te solicitarán tus credenciales de Git y listo! ya tendrás actualizado tu blog!

