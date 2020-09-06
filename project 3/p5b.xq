let $b:=doc(
  "db/books.xml"
)/biblio
let $t := distinct-values(
  //book/title
)
let $catlist :=  distinct-values(
  //book/category
)

let $finalres := (
  for $c in $catlist
return
(
let $dbk := (
      for $x in $t
return (
        $b//book[title = $x and category = $c]
      )[1]
    )
let $sublist := (
for $d in $dbk 
order by xs:decimal(
        $d/rating
      ) descending
return $d
    )
return <c>{
      $sublist[1]/title,$sublist[1]/rating,$sublist[1]/category
    }</c>
  )
)

for $f in $finalres
order by $f/category
return (
  $f/title,$f/rating,$f/category
)
