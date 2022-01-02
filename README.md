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

- Explique el procedimiento seguido para obtener un fichero de formato *fmatrix* a partir de los ficheros de
  salida de SPTK (líneas 45 a 47 del script `wav2lp.sh`).

  * ¿Por qué es conveniente usar este formato (u otro parecido)? Tenga en cuenta cuál es el formato de
    entrada y cuál es el de resultado.

- Escriba el *pipeline* principal usado para calcular los coeficientes cepstrales de predicción lineal
  (LPCC) en su fichero <code>scripts/wav2lpcc.sh</code>:

- Escriba el *pipeline* principal usado para calcular los coeficientes cepstrales en escala Mel (MFCC) en su
  fichero <code>scripts/wav2mfcc.sh</code>:

### Extracción de características.

- Inserte una imagen mostrando la dependencia entre los coeficientes 2 y 3 de las tres parametrizaciones
  para todas las señales de un locutor.
  
  LPC
  f2,3
  <img width="465" alt="image" src="https://user-images.githubusercontent.com/92022992/147825028-a81072ac-c62f-4bb5-9ea0-378195af75f5.png">
  
  <img width="396" alt="image" src="https://user-images.githubusercontent.com/92022992/147825020-fbae075d-c50d-45b4-95fd-1a1dafe6b42e.png">
  
  f4,5
  
  <img width="467" alt="image" src="https://user-images.githubusercontent.com/92022992/147825049-248cf2aa-d2f5-423c-bc21-980f5055e8f9.png">
  
<img width="403" alt="image" src="https://user-images.githubusercontent.com/92022992/147825057-16bc283a-c48d-44d1-b0bf-e7c6ec28fcc2.png">

<img width="283" alt="image" src="https://user-images.githubusercontent.com/92022992/147864336-cbf46d80-1d0e-4641-9102-9b01ec88e107.png">


LPCC

<img width="381" alt="image" src="https://user-images.githubusercontent.com/92022992/147864351-b7122527-2946-457f-8b3f-c457fae76519.png">
<img width="465" alt="image" src="https://user-images.githubusercontent.com/92022992/147864362-3382023d-9c5a-4d37-99ca-ea7bad9b0972.png">
<img width="308" alt="image" src="https://user-images.githubusercontent.com/92022992/147864379-86575b6e-9332-411b-a7f3-4da006cb9618.png">



MFCC

<img width="407" alt="image" src="https://user-images.githubusercontent.com/92022992/147829850-83e613ef-a23d-4654-ae4c-1189b1718105.png">

<img width="471" alt="image" src="https://user-images.githubusercontent.com/92022992/147829878-9c07ae2b-574e-4b13-bea9-34b44cd938c9.png">
<img width="321" alt="image" src="https://user-images.githubusercontent.com/92022992/147864408-920c86a9-7be2-4347-9b54-426769eb0a7f.png">


  + Indique **todas** las órdenes necesarias para obtener las gráficas a partir de las señales 
    parametrizadas.
  + ¿Cuál de ellas le parece que contiene más información?

- Usando el programa <code>pearson</code>, obtenga los coeficientes de correlación normalizada entre los
  parámetros 2 y 3 para un locutor, y rellene la tabla siguiente con los valores obtenidos.
  
  <img width="608" alt="image" src="https://user-images.githubusercontent.com/92022992/147864591-257a40ae-ccc9-4ae4-94b1-919d4bf7d992.png">
  
  <img width="179" alt="image" src="https://user-images.githubusercontent.com/92022992/147864633-60ad1fcd-c2c7-46cb-98b0-277ad52ee73a.png">

<img width="182" alt="image" src="https://user-images.githubusercontent.com/92022992/147864623-265ccc07-c505-4cc9-9a4b-82e0d28933a3.png">


<img width="201" alt="image" src="https://user-images.githubusercontent.com/92022992/147864613-f0237253-768b-4729-9b4b-86f82ee9c452.png">


  |                        | LP   | LPCC | MFCC |
  |------------------------|:----:|:----:|:----:|
  | &rho;<sub>x</sub>[2,3] |      |      |      |
  
  + Compare los resultados de <code>pearson</code> con los obtenidos gráficamente.
  
- Según la teoría, ¿qué parámetros considera adecuados para el cálculo de los coeficientes LPCC y MFCC?

### Entrenamiento y visualización de los GMM.

Complete el código necesario para entrenar modelos GMM.

- Inserte una gráfica que muestre la función de densidad de probabilidad modelada por el GMM de un locutor
  para sus dos primeros coeficientes de MFCC.
  
- Inserte una gráfica que permita comparar los modelos y poblaciones de dos locutores distintos (la gŕafica
  de la página 20 del enunciado puede servirle de referencia del resultado deseado). Analice la capacidad
  del modelado GMM para diferenciar las señales de uno y otro.

### Reconocimiento del locutor.

Complete el código necesario para realizar reconociminto del locutor y optimice sus parámetros.

- Inserte una tabla con la tasa de error obtenida en el reconocimiento de los locutores de la base de datos
  SPEECON usando su mejor sistema de reconocimiento para los parámetros LP, LPCC y MFCC.

### Verificación del locutor.

Complete el código necesario para realizar verificación del locutor y optimice sus parámetros.

- Inserte una tabla con el *score* obtenido con su mejor sistema de verificación del locutor en la tarea
  de verificación de SPEECON. La tabla debe incluir el umbral óptimo, el número de falsas alarmas y de
  pérdidas, y el score obtenido usando la parametrización que mejor resultado le hubiera dado en la tarea
  de reconocimiento.
 
### Test final

- Adjunte, en el repositorio de la práctica, los ficheros `class_test.log` y `verif_test.log` 
  correspondientes a la evaluación *ciega* final.

### Trabajo de ampliación.

- Recuerde enviar a Atenea un fichero en formato zip o tgz con la memoria (en formato PDF) con el trabajo 
  realizado como ampliación, así como los ficheros `class_ampl.log` y/o `verif_ampl.log`, obtenidos como 
  resultado del mismo.
