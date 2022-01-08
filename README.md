PAV - P4: reconocimiento y verificación del locutor
===================================================

Obtenga su copia del repositorio de la práctica accediendo a [Práctica 4](https://github.com/albino-pav/P4)
y pulsando sobre el botón `Fork` situado en la esquina superior derecha. A continuación, siga las
instrucciones de la [Práctica 2](https://github.com/albino-pav/P2) para crear una rama con el apellido de
los integrantes del grupo de prácticas, dar de alta al resto de integrantes como colaboradores del proyecto
y crear la copias locales del repositorio.

También debe descomprimir, en el directorio `PAV/P4`, el fichero [db_8mu.tgz](https://atenea.upc.edu/pluginfile.php/3145524/mod_assign/introattachment/0/spk_8mu.tgz?forcedownload=1)
con la base de datos oral que se utilizará en la parte experimental de la práctica.

Como entrega deberá realizar un *pull request* con el contenido de su copia del repositorio. Recuerde
que los ficheros entregados deberán estar en condiciones de ser ejecutados con sólo ejecutar:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.sh
  make release
  run_spkid mfcc train test classerr verify verifyerr
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Recuerde que, además de los trabajos indicados en esta parte básica, también deberá realizar un proyecto
de ampliación, del cual deberá subir una memoria explicativa a Atenea y los ficheros correspondientes al
repositorio de la práctica.

A modo de memoria de la parte básica, complete, en este mismo documento y usando el formato *markdown*, los
ejercicios indicados.

## Ejercicios.

### SPTK, Sox y los scripts de extracción de características.

- Analice el script `wav2lp.sh` y explique la misión de los distintos comandos involucrados en el *pipeline*
  principal (`sox`, `$X2X`, `$FRAME`, `$WINDOW` y `$LPC`). Explique el significado de cada una de las 
  opciones empleadas y de sus valores.
  
  - `sox`: utilizado para convertir una señal en formato WAVE a una sin cabecera (raw) codificada con 16 bits. Sirve para mezclar ficheros de entrada, ajustar volumen, numero de canales, etc.
  - `$X2X`: programa de SPTK que nos permite convertir datos de una entrada estándar a short format, y enviar el resultado a una salida estándar.
  - `$FRAME`: convierte una secuencia de datos de entrada en un conjunto de frames con periodo y longitud determinados.
  - `$WINDOW`: enventana una secuencia de datos. En `wav2lp.sh`, la ventana por defecto es de Blackmann.
  - `$LPC`: calcula los coeficientes LPC usando el método Levinson-Durbin. Se puede fijar la longitud del frame y el orden del LPC.

- Explique el procedimiento seguido para obtener un fichero de formato *fmatrix* a partir de los ficheros de
  salida de SPTK (líneas 45 a 47 del script `wav2lp.sh`).
  
  1. Obtenemos el fichero con los coeficientes LPC.
  2. Fijamos cabecera para el archivo de salida con numero de filas y columnas (#columnas = LPC + 1) (#filas = #tramas conm LPC calculados). Extraemos del lp con `$X2X`.
  3. Utilizamos `X2X`para guardar la cabecera en el archivo y `cat`para copiar los coeficientes en el archivo.

  * ¿Por qué es conveniente usar este formato (u otro parecido)? Tenga en cuenta cuál es el formato de
    entrada y cuál es el de resultado.
    
    Porque así tenemos una relación entre la posición en la matrix y el orden del coeficiente y número de trama y nos permite acceder a ellos más rápido.

- Escriba el *pipeline* principal usado para calcular los coeficientes cepstrales de predicción lineal
  (LPCC) en su fichero <code>scripts/wav2lpcc.sh</code>:
  
  ![image](https://user-images.githubusercontent.com/92537816/148083644-df2b69cb-82ea-4064-b577-c5cac14eb70f.png)

- Escriba el *pipeline* principal usado para calcular los coeficientes cepstrales en escala Mel (MFCC) en su
  fichero <code>scripts/wav2mfcc.sh</code>:
  
  ![image](https://user-images.githubusercontent.com/92537816/148083727-17e8d79e-3c39-487d-88c9-e689c478ee44.png)

### Extracción de características.

- Inserte una imagen mostrando la dependencia entre los coeficientes 2 y 3 de las tres parametrizaciones
  para todas las señales de un locutor.
  
  LPC
  f2,3
  Extraemos los coeficientes 2 y 3 del locutor SES017 con la orden:  
  
  <img width="467" alt="image" src="https://user-images.githubusercontent.com/92022992/147825049-248cf2aa-d2f5-423c-bc21-980f5055e8f9.png">
  
  
  <img width="403" alt="image" src="https://user-images.githubusercontent.com/92022992/147825057-16bc283a-c48d-44d1-b0bf-e7c6ec28fcc2.png">


  <img width="283" alt="image" src="https://user-images.githubusercontent.com/92022992/147864336-cbf46d80-1d0e-4641-9102-9b01ec88e107.png">


  LPCC
  Extraemos los coeficientes 2 y 3 del locutor SES017 con la orden:
  
  <img width="381" alt="image" src="https://user-images.githubusercontent.com/92022992/147864351-b7122527-2946-457f-8b3f-c457fae76519.png">
  
  
  <img width="465" alt="image" src="https://user-images.githubusercontent.com/92022992/147864362-3382023d-9c5a-4d37-99ca-ea7bad9b0972.png">
  
  
  <img width="308" alt="image" src="https://user-images.githubusercontent.com/92022992/147864379-86575b6e-9332-411b-a7f3-4da006cb9618.png">



  MFCC
  Extraemos los coeficientes 2 y 3 del locutor SES017 con la orden:
  
  <img width="407" alt="image" src="https://user-images.githubusercontent.com/92022992/147829850-83e613ef-a23d-4654-ae4c-1189b1718105.png">
  
  
  <img width="471" alt="image" src="https://user-images.githubusercontent.com/92022992/147829878-9c07ae2b-574e-4b13-bea9-34b44cd938c9.png">
  
  
  <img width="321" alt="image" src="https://user-images.githubusercontent.com/92022992/147864408-920c86a9-7be2-4347-9b54-426769eb0a7f.png">


  + Indique **todas** las órdenes necesarias para obtener las gráficas a partir de las señales 
    parametrizadas.
  + ¿Cuál de ellas le parece que contiene más información?
    
    Como podemos comprobar en los gráficos, podríamos decir que la parametrización que más información nos aporta es la MFCC. Esto es así porque se puede determinar el valor de un coeficiente sabiendo el de otro que está muy correlado al primero. Cuanto más alta sea la correlación más rectas y estrechas seran las líneas en la gráfica. Como podemos ver en la gráfica de la parametrización LPC, se trata de una agrupación más estrecha que las otras, lo que nos da menos información. En cambio en la MFCC y en la LPCC tenemos mayor dispersión y más espacio sin líneas rectas ni agrupaciones, lo cual nos dice que los coeficientes estan menos correlados y por lo tanto, tenemos más información.

- Usando el programa <code>pearson</code>, obtenga los coeficientes de correlación normalizada entre los
  parámetros 2 y 3 para un locutor, y rellene la tabla siguiente con los valores obtenidos.
  
  <img width="608" alt="image" src="https://user-images.githubusercontent.com/92022992/147864591-257a40ae-ccc9-4ae4-94b1-919d4bf7d992.png">
  
  
  <img width="179" alt="image" src="https://user-images.githubusercontent.com/92022992/147864633-60ad1fcd-c2c7-46cb-98b0-277ad52ee73a.png">

  <img width="182" alt="image" src="https://user-images.githubusercontent.com/92022992/147864623-265ccc07-c505-4cc9-9a4b-82e0d28933a3.png">

  <img width="201" alt="image" src="https://user-images.githubusercontent.com/92022992/147864613-f0237253-768b-4729-9b4b-86f82ee9c452.png">


  |                        | LP   | LPCC | MFCC |
  |------------------------|:----:|:----:|:----:|
  | &rho;<sub>x</sub>[2,3] |-0.871|0.1774|-0.212|
  
  + Compare los resultados de <code>pearson</code> con los obtenidos gráficamente.
  
    Cuanto más alto sea el valor del módulo del coeficiente, más alta será la correlación entre ellos dos. Podemos ver que la parametrización LPC, en efecto, tiene un valor mayor y por lo tanto nos aporta menos información que la LPCC y MFCC, que tienen valores menores.
  
- Según la teoría, ¿qué parámetros considera adecuados para el cálculo de los coeficientes LPCC y MFCC?
  
  Podemos tener un buen resultado con 8-13 coeficientes de predicción y 12-18 coeficientes cepstrales en el caso de LPCC. Para MFCC se utilizan 14-18 coeficientes para locutor recognition y se suele usar un filter bank de 24-40 filtros pasa banda en escala Mel. La longitud del frame tendría que ser de 20-30ms.

### Entrenamiento y visualización de los GMM.

Complete el código necesario para entrenar modelos GMM.

- Inserte una gráfica que muestre la función de densidad de probabilidad modelada por el GMM de un locutor
  para sus dos primeros coeficientes de MFCC.
  
  <img width="456" alt="image" src="https://user-images.githubusercontent.com/92022992/147944422-0f84a9b0-8d33-4a9c-ae96-f4ed6cef25b1.png">

  <img width="424" alt="image" src="https://user-images.githubusercontent.com/92022992/147944505-e109d53b-90f9-43da-92fd-ad4e23138068.png">

  
- Inserte una gráfica que permita comparar los modelos y poblaciones de dos locutores distintos (la gŕafica
  de la página 20 del enunciado puede servirle de referencia del resultado deseado). Analice la capacidad
  del modelado GMM para diferenciar las señales de uno y otro.
  
  <img width="459" alt="image" src="https://user-images.githubusercontent.com/92022992/147945545-1dbc5abd-192d-4417-a051-db7e8bb4c095.png">


  <img width="433" alt="image" src="https://user-images.githubusercontent.com/92022992/147945470-a8936f4d-1a6a-4ed9-b6c8-0a6539f33ef3.png">

  <img width="468" alt="image" src="https://user-images.githubusercontent.com/92022992/147945602-c93bb54a-4472-4361-9ba7-6f6ba866b119.png">

  <img width="433" alt="image" src="https://user-images.githubusercontent.com/92022992/147945342-8938618f-2b03-40d4-a4bc-26481e936531.png">

  <img width="460" alt="image" src="https://user-images.githubusercontent.com/92022992/147945699-94c966b5-5234-4437-a267-ff2f97cb2908.png">


  <img width="440" alt="image" src="https://user-images.githubusercontent.com/92022992/147945682-ae1a29f9-ad9b-4901-90a2-61b6216a8f7e.png">

  El modelado GMM consigue ajustarse bien a las características del locutor. Podemos ver que en las zonas de población más densa nos muestra la diferencia entre un locutor y otro lo que nos dice que GMM es un buen modelado para reconocimiento del locutor.

### Reconocimiento del locutor.

Complete el código necesario para realizar reconociminto del locutor y optimice sus parámetros.

- Inserte una tabla con la tasa de error obtenida en el reconocimiento de los locutores de la base de datos
  SPEECON usando su mejor sistema de reconocimiento para los parámetros LP, LPCC y MFCC.
  
   LP
  
  <img width="369" alt="image" src="https://user-images.githubusercontent.com/92022992/147947350-c3d1b935-3445-420a-9ac3-5f59bc5a6909.png">


  LPCC
  
  <img width="381" alt="image" src="https://user-images.githubusercontent.com/92022992/147947305-6732144d-47da-44a7-8f99-f78ae2ddbfba.png">


  MFCC
  
  ![image](https://user-images.githubusercontent.com/92537816/148083513-11367d51-70bf-4539-84b3-0aa872f86b02.png)

  
  
  |               | LP   | LPCC | MFCC |
  |---------------|:----:|:----:|:----:|
  | TAXA D'ERROR  |12.48%|1.27% |1.27% |
  

### Verificación del locutor.

Complete el código necesario para realizar verificación del locutor y optimice sus parámetros.

- Inserte una tabla con el *score* obtenido con su mejor sistema de verificación del locutor en la tarea
  de verificación de SPEECON. La tabla debe incluir el umbral óptimo, el número de falsas alarmas y de
  pérdidas, y el score obtenido usando la parametrización que mejor resultado le hubiera dado en la tarea
  de reconocimiento.
  
  ![image](https://user-images.githubusercontent.com/92537816/148085245-65d6b0b2-df31-4a11-8c91-d350978f5ee9.png)
 
 amb MFCC 
 
### Test final

- Adjunte, en el repositorio de la práctica, los ficheros `class_test.log` y `verif_test.log` 
  correspondientes a la evaluación *ciega* final.

### Trabajo de ampliación.

- Recuerde enviar a Atenea un fichero en formato zip o tgz con la memoria (en formato PDF) con el trabajo 
  realizado como ampliación, así como los ficheros `class_ampl.log` y/o `verif_ampl.log`, obtenidos como 
  resultado del mismo.
