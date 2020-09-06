let $b:=doc(
  "db/books.xml"
)/biblio
let $t := distinct-values(
  //book/title
)

let $dbk := (
  for $x in $t
return (
    $b//book[title = $x]
  )[1]
)

for $d in $dbk 
order by xs:decimal(
  $d/rating
) descending
return (
  $d/title,$d/rating
)