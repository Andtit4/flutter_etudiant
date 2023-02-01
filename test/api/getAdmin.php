<?php

require('config/db.php');
header("Content-Type: application/json");

$email = $_GET['email'];
// $password = $_POST['password'];

$req = $bdd->query("SELECT * FROM admins WHERE email = '$email' ");

$admininfo = $req->fetch();
$return[] = $admininfo;
echo json_encode($return);


// $nb_row = $req->rowCount();
/* 
if ($nb_row == 0) {
    $return['error'] = true;
    $return['data'] = 'Adresse ou mot de passe incorrects';
    echo json_encode($return);
} else {
    $return['error'] = false;
    $return['data'] = $email;
    echo json_encode($return);
}
 */