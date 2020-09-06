let $bk := doc(
  'db/books.xml'
)
return 
<biblio>{
for $a in $bk/biblio/author
for $b in $a/book
let $bt := $b/title
group by $bt
return <book year = "{
    $b[1]/@year
  }">
{
    <title>{
      distinct-values(
        $b/title
      )
    }</title>,
<category>{
      distinct-values(
        $b/category
      )
    }</category>,
<rating>{
      distinct-values(
        $b/rating
      )
    }</rating>,
<price>{
      distinct-values(
        $b/price
      )
    }</price>
  }
<author>{
    $a/name
  }</author>
</book>
}</biblio>