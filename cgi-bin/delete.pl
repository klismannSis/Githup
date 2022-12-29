#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;
use DBI;

print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/style.css" />
    <title>Página Eliminada</title>
  </head>
  <body>
HTML

#CGI part
my $cgi = CGI->new;
my $name = $cgi->param('title');

#Database part
my $user= 'root';
my $password = '123456';
my $dsn = "DBI:mysql:database=pweb1;host=localhost";
my $dbh = DBI->connect($dsn, $user, $password) or die ("No se puede conectar");

#Eliminar datos
my $sth = $dbh->prepare("DELETE from Articles WHERE title=?");
$sth->execute($name);

$dbh->disconnect;

print <<HTML;
    <div class>
        <h1 class="title-delete">Página eliminada con éxito</h1>
        <form action="list.pl">
           <input class="boton" type="submit" value="VOLVER\n A LA LISTA" />
        </form>
    </div>
  </body>
</html>
HTML
