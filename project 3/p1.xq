let $b:=doc(
  "db/books.xml"
)/biblio

let $jbk := $b//author[name = 'Jeff']/book/title

let $ca := $b//author[name != 'Jeff' and book/title = $jbk]

for $bk in $jbk
where (
  $bk = $ca/book/title
)
return <book>{
 (
    $bk, $b/author[book/title = $bk]/name
  )
}</book>