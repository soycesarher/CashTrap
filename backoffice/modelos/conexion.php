<?php

class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=162.241.62.137;dbname=soycesa1_cashtrap",
						"soycesa1_admin",
						"Cesarv1h8v10@");

		$link->exec("set names utf8");

		return $link;

	}

}