<?php


/**
 * Clase para la coneion de la api
 */
class Conexion
{
	
	

	public function conectar(){

		   try{

             $conexion = new PDO("mysql:host=localhost;dbname=escuela","root","");

             return $conexion;

		   }
		   catch(Exception $e){
              echo 'No se pudo Conectar' .$e;
		   }




	   }

}


