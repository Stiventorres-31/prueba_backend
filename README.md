# prueba_backend
### Prueba de conocimiento de Python


Se realiza una Api Rest para una empresa de distribuciones de lácteas donde los vendedores van a registrar los productos, establecimientos y portafolios. Esta api cuenta con una base de datos diseñada en MSQL con Workbench y cuenta con 4 tablas que son: Usuarios, Portafolios, Establecimiento y Productos. 

Esta Api fue desarrollo en Python con el framework de Flask y en su inicio cuenta con una carpeta llamada "src" donde estan los archivos de la codificación y configuración de la conexión a la base de datos. También cuenta con JWT para el manejo de información de los usuarios logueado para mayor seguridad en su información.

### Explicación el funcionamiento:
* Usaremos la herramienta Postman para hacer las peticiones a la api.
* Para poder realizar el registro de producto, primero hay que tener portafolio y establecimiento creado!


1. El primero paso es iniciar sesión, se creo un usuario admin de base para realizar las pruebas. 
![image](https://user-images.githubusercontent.com/55259282/215242789-dd77a5c7-9600-466c-a8ef-400506e93ed0.png)

2. Registro de portafolio
![image](https://user-images.githubusercontent.com/55259282/215242805-38701810-b279-4966-bf01-ad32cae75e3f.png)

3. Registro de establecimiento
![image](https://user-images.githubusercontent.com/55259282/215242826-b7d14079-cf78-4266-ab91-cb9c554dee07.png)

4. Registro de producto
![image](https://user-images.githubusercontent.com/55259282/215242848-d010783b-a4a8-4768-80be-0caa333c4e55.png)

5. Mostramos todos los productos registrados
![image](https://user-images.githubusercontent.com/55259282/215242933-315bfb22-07be-4822-9ea4-11b39cf36f7b.png)

6. Descriminando un portafolio. En este caso estamos descriminando el portafolio que acabamos de registrar, por ese motivo no nos aparece
![image](https://user-images.githubusercontent.com/55259282/215243020-d3ac44fa-489f-4576-b7bb-4974d6aeb15f.png)

7. Mostrar productos por portafolio
![image](https://user-images.githubusercontent.com/55259282/215243066-3e19c626-3d76-42bd-83fd-17d0a6a7f5c9.png)

8. Registrar usuario
![image](https://user-images.githubusercontent.com/55259282/215243100-12acfd5e-ca99-4775-b36e-79f184f42987.png)

9. Si queremos enviarle peticiones a la api sin estar logueado, nos va a mostrar este error
![image](https://user-images.githubusercontent.com/55259282/215242946-a5d986ff-7093-4aa2-8687-6e02bbb67832.png)



### Gracias
