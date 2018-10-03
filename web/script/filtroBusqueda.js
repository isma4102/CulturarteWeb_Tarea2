/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$('#filtro-estado').click(function () {
    var tipo = "estado";
    var busqueda = $("#busqueda").val();
    $.ajax({
        url: "/CulturarteWeb/servletBuscador",
        // la información a enviar
        // (también es posible utilizar una cadena de datos)
        data: {"filtro": tipo,
            "busqueda": busqueda},
        // especifica si será una petición POST o GET
        type: 'GET'
    });
});
$('#filtro-fecha').click(function () {
    var tipo = "fecha";
    var busqueda = $('#busqueda').val();
    $.ajax({
        url: "/CulturarteWeb/servletBuscador",
        // la información a enviar
        // (también es posible utilizar una cadena de datos)
        data: {"filtro": tipo,
            "busqueda": busqueda},
        // especifica si será una petición POST o GET
        type: 'GET',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                console.log(document.querySelector("#elemento" + i + " .Titulo"));
                document.querySelector("#elemento" + i + " .Titulo").innerHTML = data[i].Titulo;
                document.querySelector("#elemento" + i + " .Lugar").innerHTML = data[i].Lugar;
                document.querySelector("#elemento" + i + " .Descripcion").innerHTML = data[i].Descripcion;
            }
        }
    });
});
$('#filtro-alfa').click(function () {
    var tipo = "alfa";
    var busqueda = $('#busqueda').val();
    var cantidad = $("#cantidad").val();
    $.ajax({
        url: "/CulturarteWeb/servletBuscador",
        // la información a enviar
        // (también es posible utilizar una cadena de datos)
        data: {
            "filtro": tipo,
            "busqueda": busqueda},
// especifica si será una petición POST o GET
        type: 'GET',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                console.log(document.querySelector("#elemento" + i + " .Titulo"));
                document.querySelector("#elemento" + i + " .Titulo").innerHTML = data[i].Titulo;
                document.querySelector("#elemento" + i + " .Lugar").innerHTML = data[i].Lugar;
                document.querySelector("#elemento" + i + " .Descripcion").innerHTML = data[i].Descripcion;
            }
        },
        error: function (error) {
            console.log(error);
        }

    });
});

function limpiar(cantidad) {
    for (i = 0; i <= cantidad; i++) {
        $("#elemento" + i).empty();
    }
}

