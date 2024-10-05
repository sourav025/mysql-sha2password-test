<?php

// Replace with your database credentials
$host = 'my-mysql';
$port = 3306;
$username = 'sha2user';
$password = 'password';
$database = 'mydb';

// Load the server public key from a file
$publicKeyFile = '/etc/ssl/mysql/key.pem.pub';
$publicKey = file_get_contents($publicKeyFile);

// Create a PDO instance with the public key
$pdo = new PDO("mysql:host=$host;port=$port;dbname=$database;ssl=true;sslca=$publicKey", $username, $password);

// Set PDO error mode to exception
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

print_r("\n\nSuccessfully connected to MySQL server with ".$username."\n\n\n");

// Query the database
$query = "SELECT * FROM authors";
$stmt = $pdo->query($query);
print("Here are all the data from author table.\n");
// Fetch results
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print_r($row);
}

// Close the connection
$pdo = null;
