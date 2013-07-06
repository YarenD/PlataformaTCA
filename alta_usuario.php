<?php
require 'conexion.php';

$usuario = $_GET['usuario'];
$contraseña = $_GET['contraseña'];
$nombre = $_GET['nombre'];
$apellido = $_GET['apellidos'];
$empresa = $_GET['empresa'];
$direccion = $_GET['direccion'];
$telefono = $_GET['telefono'];
$email = $_GET['email'];

echo 'Registro recibido: '.$usuario;

echo '<a href="registro_usuario.html">Regresar</a>';

mysql_query('insert into tcadb2013.usuarios values("","'.$usuario.'","'.$contraseña.'","'.$nombre.'","'.$apellido.'","'.$empresa.'","'.$direccion.'","'.$telefono.'","'.$email.'")',$conexion)or die(mysql_error());
echo 'Registrado con exito';
?>