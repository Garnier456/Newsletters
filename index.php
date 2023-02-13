<?php


// Inclusion des dépendances
require 'config.php';
require 'functions.php';

$errors = [];
$success = null;
$email = '';
$firstname = '';
$name = '';

// Si le formulaire a été soumis...
if (!empty($_POST)) {

    // On récupère les données
    $email = trim($_POST['email']);
    $firstname = trim($_POST['firstname']);
    $name = trim($_POST['name']);

    // On récupère l'origine
    $selectedOrigin = $_POST['origin'];
    $interests = $_POST['interest'];

    // Validation 
    if (!$email) {
        $errors['email'] = "Merci d'indiquer une adresse mail";
    }

    if (!$firstname) {
        $errors['firstname'] = "Merci d'indiquer un prénom";
    }

    if (!$name) {
        $errors['name'] = "Merci d'indiquer un nom";
    }

    // Si tout est OK (pas d'erreur)
    if (empty($errors) && mailAlreadyExist($email) == false) {

        $subscribers_id = addSubscriber($email, $firstname, $name, $selectedOrigin);
        // Ajout de l'email dans le fichier csv
        addUserInterest($subscribers_id, $interests);

        // Message de succès
        $success  = 'Merci de votre inscription';

        header('Location: index.php');
    }
}

//////////////////////////////////////////////////////
// AFFICHAGE DU FORMULAIRE ///////////////////////////
//////////////////////////////////////////////////////

// Sélection de la liste des origines
$origines = getAllOrigins();
$interestSelected = getAllInterest();

// Inclusion du template
include 'index.phtml';
