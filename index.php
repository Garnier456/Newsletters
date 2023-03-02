<?php


// Inclusion des dépendances
require 'config.php';
require 'functions.php';

$errors = [];
$success = null;
$email = '';
$firstname = '';
$name = '';
$interests = '';

// Si le formulaire a été soumis...
if (!empty($_POST)) {

    // On récupère les données
    $email = trim($_POST['email']);
    $firstname = trim($_POST['firstname']);
    $name = trim($_POST['name']);

    // On récupère l'origine
    $selectedOrigin = $_POST['origin'];

    if (isset($_POST['interest'])) {
        $interests = $_POST['interest'];
    }

    // Validation 
    if (!$email || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Merci d'indiquer une adresse mail valide";
    }

    if (!$firstname) {
        $errors['firstname'] = "Merci d'indiquer un prénom";
    }

    if (!$name) {
        $errors['name'] = "Merci d'indiquer un nom";
    }

    if (!$interests) {
        $errors['interest'] = "Merci de cocher une case";
    }

    // Si tout est OK (pas d'erreur)
    if (empty($errors) && mailAlreadyExist($email) == false) {

        $subscribers_id = addSubscriber($email, $firstname, $name, $selectedOrigin);
        // Ajout de l'email dans le fichier csv
        addUserInterest($subscribers_id, $interests);

        // Message de succès
        $success  = 'Merci de votre inscription';

        header('Location: index.php');
        exit();
    }
}

//////////////////////////////////////////////////////
// AFFICHAGE DU FORMULAIRE ///////////////////////////
//////////////////////////////////////////////////////

// Sélection de la liste des origines
$origines = getAllOrigins();
$interests = getAllInterest();

// Inclusion du template
include 'index.phtml';
