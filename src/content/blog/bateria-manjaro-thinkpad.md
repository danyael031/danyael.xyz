---
title: Configuración de optimización de la batería para Thinkpad con Manjaro.
description: "Mostrando cómo configuré la batería de mi thinkpad"
pubDate: 'Mar 30 2021'
heroImage: '../../assets/blog/bateria-manjaro-thinkpad/thinkpad.jpg'
---

Recientemente conseguí un equipo de la línea Thinkpad. Fuera de los aspectos técnicos, una de mis mayores preocupaciones fue que, por usar linux,
el tiempo de vida de la batería se viera afectado. Cualquiera podría pensar que es una exageración preocuparse por eso, sobre todo porque las
distribuciones de Linux tienen la fama de consumir pocos recursos, lo cual podría dar la falsa sensación de seguridad en lo que respecta a consumo 
de energía. La realidad es un poco diferente.

# Ciclos de carga

Las baterías de las laptops tienen un concepto llamado "charge cycles", el cual indica el número de veces que puedes cargar tu batería de 0% a
100%. De acuerdo con el 
[sitio de lenovo](https://support.lenovo.com/mx/en/solutions/ht069687-easy-ways-to-extend-your-battery-life-ideapadlenovothinkpad-laptops), se
puede optimizar el uso de la batería apagando el bluetooth, bajando el brillo y utilizando el administrador de energía preinstalado en los sistemas
con windows. OJO! En windows!!!. Mi preocupación creció exponencialmente.


# ¿Cómo evitar la muerte de la batería por desgaste de ciclos de carga?

Investigando un poco descubrí la existencia de TLP (Linux Advanced Power Management), un pequeño pedazo de software que hace de administrador de
energía de una manera eficiente.

La instalación no tiene mayor complicación, ya que tanto la herramienta principal como su interfaz gráfica se encuentran fácilmente entre los 
paquetes de Manjaro:

```shell
sudo pacman -S tlp tlpui
```

La herramienta permite controlar muchos aspectos sobre el consumo energética, entre los cuales destacan:

* Suspensión de puertos USB
* Control de PCI
* Suspensión de dispositivos de radio
* Control de niveles de carga de la batería

Como podemos notar, el juguetito está bastante completo.

# Thinkpad, acpi y smapi

Hurgando en la wiki de Arch me topé con un par de módulos bastante interesantes. acpi y tp_smapi son módulos del kernel cuya funcionalidad
principal radica en controlar los niveles de carga de la batería. Combinando dichos módulos con tlp, podremos tener un control completo en lo que
respecta al tiempo de vida de nuestra batería. 

Los módulos tienen que ser los específicos para tu kernel. Si actualizas el kernel los módulos también se actualizarán, así que no tienes de qué 
preocuparte.

Una de las principales ventajas de utilizarlos es que se le puede añadir un umbral de carga a la batería para ajustarlo a niveles óptimos y 
permitirán mantener conectado el equipo sin estar cargando la batería, con lo cual no gastamos los ciclos de carga de la misma. 

# Conclusiones

Estoy bastante contento de que el equipo cuente con la característica de desconectar la batería cuando el equipo se mantenga conectado al cargador y, mejor 
aún, poder aprovechar la funcionalidad en Manjaro Linux sin mayor complicación.




