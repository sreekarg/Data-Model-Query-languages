let $bk:=doc(
  "db/books.xml"
)/biblio


let $catlist:=distinct-values(
  $bk//category
)

let $avg:= avg(
  (
    for $ss in $catlist return distinct-values(
      $bk/author/book[category=$ss]/price
    )
  )
)

let $abvavg:= (
  for $p in distinct-values(
    $bk/author/book//category
  )
  let $a := avg(
    distinct-values(
      $bk/author/book[category=$p]/price
    )
  )
  where $a ge $avg
  return $p
)

let $result:=(
  for $b in (
    for $each in $abvavg let $aa := max(
      $bk/author/book[category=$each]/price
    )
    return distinct-values(
      $bk/author/book[category=$each and price=$aa]/title
    )
  )
return 
<categories><output><category>{
    distinct-values(
      $bk/author/book[title=$b]/category
    )
  }</category><title>
{
    $b
  }</title><price>
{
    distinct-values(
      $bk/author/book[title=$b]/price
    )
  }
</price>
{
    for $ii in $bk/author where $ii/book[title=$b] return
$ii/name
  }

</output>
</categories>
)
return <result>{
  $result
}</result>