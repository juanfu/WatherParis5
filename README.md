# WatherParis5
A SwiftUI app that shows the forecast for Paris 

# Explicación de la implementación.

## Funcionamiento del patron repository.
- Para esta prueba tecnica he decido implementar un patron repository en el cual existen dos fuentes, la fuente de la base de datos y la fuente de la api.

## Modo Offline.
 - Para el modo offline se ha realizado la siguiente implementacióm, el repositorio devuelve siempre los datos de la base de datos (si los hubiera) y una vez ha devuelto estos datos que son pintados en la aplicación, realiza la petición para obtener nuevos datos, los cuales salva en la base de datos y devuelve a la aplicación los nuevos datos actualizados. (Funcionamiento parecido a twitter cuando se carga el feed).
 
 ## Vista Principal.
 - La vista principal se compone de un titulo y una lista de celdas, cada celda corresponde con la predicción del tiempo para un día y un espacio de tiempo definido por la api de 3 horas y haciendo tap sobre cada una de ella se navega al detalle de esas 3 horas donde se podran visualizar más datos. Se podría haber juntado los días y la vista detalle del día mostrar el desglose de la predicción por horas, pero decidi realizar la primera implementación ya que la logica necesaria para realizar la la segunda implementación no la considere necesaria dado el ambito de la prueba técnica.
 - Tampoco se dispone de pull to refresh para refrescar los datos en la pantalla principal, ya que los espacios de tiempo no caducan hasta cada 3 horas, por lo que no se vio necesaria su implementación.
 
## Librerias utilizadas.
- Alamofire: Para realizar la petición al servicio API.
- KingFisher: Para pintar la imagen descargada de internet correspondiente al tiempo.
- Realm: Base de datos para almacenar los datos recibidos por la api para que esta pueda mostrar los datos almacenados en modo offline.
- MockingBird: Libreria usada para testing https://mockingbirdswift.com aparte de XCTests   

