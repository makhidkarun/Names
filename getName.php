<?php

try { 
    $dbh = new PDO("sqlite:names.db");
} catch(PDOException $e) {
    echo $e->getMessage();
    exit;
}

function getName($dbh, $table){
    $sql = ("SELECT count(*) as count from $table");
    $stmt = $dbh->query($sql);
    $countResult = $stmt->fetch();
    $count = $countResult['count'] - 1;

    $roll = mt_rand(0, $count);

    $sql = ("SELECT * from $table WHERE rowid = $roll");
    $stmt = $dbh->query($sql);
    $result = $stmt->fetch();
    
    return $result['name'];
}

$lastName = getName($dbh, 'humaniti_last');
$herFirstName = getName($dbh, 'humaniti_female_first');
$hisFirstName = getName($dbh, 'humaniti_male_first');
echo "$hisFirstName and $herFirstName $lastName.\n";

$dbh = null;
?>

