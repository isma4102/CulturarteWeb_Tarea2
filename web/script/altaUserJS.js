/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function habilitar(document) {
    document.getElementsByName("otros").style.display = "";
}

function desabilitar(document) {
    document.getElementsByName("otros").style.display = "none";
}

function verificarNombre() {

    var nombre = $("#nick").val().toString().trim();
    if (nombre === "") {
        document.getElementById("checkout").style.display = "none";
        document.getElementById("check").style.display = "none";
        return;
    }
    $.ajax({
        url: "/CulturarteWeb/ServletConsultarUsuario",
        type: 'POST',
        data: {
            accion: "verificar",
            nombre: nombre
        },
        success: function (msg) {
            if (msg === "esta") {
                document.getElementById("checkout").style.display = "block";
                document.getElementById("check").style.display = "none";
            } else {
                document.getElementById("check").style.display = "block";
                document.getElementById("checkout").style.display = "none";
            }
        }
    });
}


function verificarCorreo() {
    var correo = $("#correo").val().toString().trim();
    if (correo === "") {
        document.getElementById("checkoutE").style.display = "none";
        document.getElementById("checkE").style.display = "none";
        return;
    }
    $.ajax({
        url: "/CulturarteWeb/ServletConsultarUsuario",
        type: 'POST',
        data: {
            accion: "verificar",
            correo: correo
        },
        success: function (msg) {
            if (msg === "esta") {
                document.getElementById("checkoutE").style.display = "block";
                document.getElementById("checkE").style.display = "none";
            } else {
                document.getElementById("checkE").style.display = "block";
                document.getElementById("checkoutE").style.display = "none";
            }
        }
    });
}
function calcularEdad(fecha) {
    var hoy = new Date();
    var cumpleanos = new Date(fecha);
    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    var m = hoy.getMonth() - cumpleanos.getMonth();

    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }

    return edad;
}
function validarEdad() {
    var fecha = document.getElementById("fecha").value;
    var edad = calcularEdad(fecha);

    if (edad >= 18) {
        document.getElementById('crear').disabled = false;
        document.getElementById("mensajeEdad").style.display = "none";
    } else {
        document.getElementById('crear').disabled = true;
        document.getElementById("mensajeEdad").style.display = "block";
    }

}