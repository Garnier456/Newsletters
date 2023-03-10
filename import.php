<?php


require 'config.php';
require 'functions.php';

$filename = $argv[1];


if (!file_exists($filename)) {
    echo "Erreur : fichier '$filename' introuvable";
    exit; // On arrête l'exécution du script
}


$file = fopen($filename, "r");


$pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4', DB_USER, DB_PASS);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$pdoStatement = $pdo->prepare('INSERT INTO subscribers (firstname, name, email, date) VALUES (?,?,?,?)');

$emailCount = 0;

    while ($row = fgetcsv($file)) {

        $firstname = $row[0];
        $name = $row[1];
        $email = $row[2];
        $date = new DateTime();
        $newDate = $date->format("Y-m-d H:i:s");

        $firstname = strtolower($firstname);
        $firstname = ucwords($firstname, " -");
        $name = strtolower($firstname);
        $name = ucwords($firstname, " -");
        $email = strtolower($email);
        $email = str_replace(" ", "", $email);

        $pdoCheckMail = $pdo->prepare('SELECT * FROM subscribers WHERE email=?');
        $pdoCheckMail->execute([$email]);

        
        if ($pdoCheckMail->rowCount() == false) {
            $pdoStatement->execute([$firstname, $name, $email, $newDate]);
            $emailCount ++;
        } else {
            echo $email . " existe déjà ! \n";
        }
    }
    
    echo $emailCount . " on était ajouté \n";
    

echo 'Import terminé!';

