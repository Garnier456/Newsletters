<?php


function getPDOConnection() {
    $dsn = 'mysql:dbname=' . DB_NAME . ';host=' . DB_HOST;

    // Tableau d'options pour la connexion PDO
    $options = [
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ];

    // Création de la connexion PDO (création d'un objet PDO)
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
    $pdo->exec('SET NAMES UTF8');

    return $pdo;
}


/**
 * Récupère tous les enregistrements de la table origins
 */
function getAllOrigins()
{
    // Construction du Data Source Name
    $pdo = getPDOConnection();

    $sql = 'SELECT *
            FROM origines
            ORDER BY origine_label';

    $query = $pdo->prepare($sql);
    $query->execute();

    return $query->fetchAll();
}

function getAllInterest()
{
    // Construction du Data Source Name
    $pdo = getPDOConnection();

    $sql = 'SELECT *
            FROM interest
            ORDER BY label';

    $query = $pdo->prepare($sql);
    $query->execute();

    return $query->fetchAll();
}


/**
 * Ajoute un abonné à la liste des emails
 */
function addSubscriber(string $email, string $prenom, string $nom, int $originId)
{
    // Construction du Data Source Name
    $pdo = getPDOConnection();

    // Insertion de l'email dans la table subscribers
    $sql = 'INSERT INTO subscribers
            (email, firstname, name, origine_id, date) 
            VALUES (?,?,?,?, NOW())';

    $query = $pdo->prepare($sql);
    $query->execute([$email, $prenom, $nom, $originId]);

    $subscribers_id = $pdo->lastInsertId();
    return $subscribers_id;
}

function mailAlreadyExist($target) {

    $pdo = getPDOConnection();

    $checkMail = $pdo->prepare("SELECT * FROM subscribers WHERE email=?");
    $checkMail->execute([$target]);

    if ($checkMail->rowCount() > 0) {
        return true;
    } else {
        return false;
    }
}

function addUserInterest(int $subscribers_id, array $interests) {
    
    $pdo = getPDOConnection();
    
    foreach ($interests as  $interest_id) {
        $query = $pdo->prepare("INSERT INTO subscribers_interests (subscribers_id, interests_id) VALUE (?,?)");


        $query->execute([$subscribers_id, $interest_id]);
    }
}


