let $b:=doc("db/books.xml")/biblio
let $books:=distinct-values($b//title)
let $authors:=distinct-values($b//name)

let $final:=(for $titles in $books,$a in $b/author
where $titles = $a/book/title
group by $titles return
if(count($a/name) >= 2)
then
<output>
<name>
{for $a2 in $a/name where (count($a/name) >= 2 ) return
(distinct-values($a2))
}
</name>
<book year="{distinct-values($a/book[title=$titles]/@year)}"> 
<title>{$titles}</title>
<category>{distinct-values($a/book[title=$titles]/category)}</category>
<rating>{distinct-values($a/book[title=$titles]/rating)}</rating>
<price>{distinct-values($a/book[title=$titles]/price)}</price>
</book>
</output>
else()
)

let $values:=$final//name
let $nonunique := for $value in (distinct-values($values)) return if (count(index-of($values, $value)) > 1) then $value else ()

let $result:=(
for $exists in (distinct-values(for $rer in $final where(fn:exists($rer/name) and $rer/name = $nonunique) return $rer/book/title)) 
return 
<output> 
{for $extitle in $b/author where ($extitle/book/title=$exists) return $extitle/name}
<book year="{distinct-values($b/author/book[title=$exists]/@year)}"> 
<title>{$exists}</title>
<category>{distinct-values($b/author/book[title=$exists]/category)}</category>
<rating>{distinct-values($b/author/book[title=$exists]/rating)}</rating>
<price>{distinct-values($b/author/book[title=$exists]/price)}</price>
</book>)

</output>)
return <coauthor>{$result}</coauthor>