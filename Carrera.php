
<?php

 /**
  * 
  */
  require 'Conexion.php';


 class Carrera extends Conexion
 {
 	
 	public function mostrarcarreras(){



 		 $stm = Conexion::conectar()->prepare("
                 SELECT id,nombre,semestres
                 FROM 
                 carrera


 		 	");

 		 $stm->execute();

 		 $carreras = $stm->fetchAll(PDO::FETCH_OBJ);

 		 //echo json_encode( $carreras);

 		 

 		 echo var_dump($carreras);
 	}



 	public function agregarCarrera($nombre,$semestres){
           $stm = Conexion::conectar()->prepare("
                  INSERT INTO carrera(nombre,semestres)
                  VALUES(:carreraI,:semestresI)

                  "

           );

           $stm->BindParam(":carreraI",filter_var($_POST['nombre'],FILTER_SANITIZE_STRING));
           $stm->BindParam(":semestresI",filter_var($_POST['semestres'],FILTER_SANITIZE_STRING));

           $stm->execute();

           $arr = array("Mensaje" => "Insertado Correctamente");

           echo json_encode($arr);



 	}

 	public function mostrarCarrera($id){
        $stm = Conexion::conectar()->prepare("
                SELECT id,nombre,carrera
                FROM carrera 
                WHERE id=:idS

        	");

        $stm->BindParam(":idS",filter_var($POST['id'],PDO::PARAM_INT));

        $stm->execute();

        $carrera = $stm->fetchAll(PDO::FETCH_OBJ);

        echo json_encode($carrera);
 	}

 	public function actualizarCarrera($id,$semestres,$nombre){
 		  $stm = Conexion::conectar()->prepare("
                 UPDATE carrera SET nombre=:nombreU,
                                    semestres=:semestresU

                                 WHERE id=:idU   
 		  	");

 		  $stm->BindParam(":nombreU",filter_var($nombre,FILTER_SANITIZE_STRING));
 		  $stm->BindParam(":semestresU",filter_var($semestres,FILTER_SANITIZE_STRING));
 		  $stm->BindParam("idU",filter_var($id,PDO::PARAM_INT));

 		  $stm->execute();
          
          $arr = array("Mensaje" => "Carrera actualizada");
 		  echo json_encode($arr);
 	}

 	public function eliminarCarrera($id){
 		$stm = Conexion::conectar()->prepare("
                DELETE FROM carrera WHERE id=:idE
 			");

 		$stm->BindParam(":idE",filter_var($id,PDO::PARAM_INT));

 		$stm->execute();

 		$arr = array("Mensaje" => "Carrera Eliminada :x");

 		echo json_encode($arr);
 	}


 





 }

 $objC = new Carrera();

 $objC->mostrarcarreras();


 	




?>