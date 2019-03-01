declare option saxon:output "indent=yes";

<html>
<head>
	<meta charset="utf-8"/>
 	<title>Liste des enseignements</title>
</head>
<h1>Liste des intervenants</h1>
{
for $intervenant in doc("master.xml")//intervenant
     
    let $nom := $intervenant/nom cast as xs:string
	let $mail := $intervenant/mail
	let $site := $intervenant/site
    let $idI := $intervenant/@id
    order by $nom
    return
		<div>
		<h2>{data($nom)}</h2>
		<p>Mail : {data($mail)}</p>
		<p>Site : {data($site)}</p>
		<h4> UE enseignée(s) </h4>
		{
			for $unite in doc("master.xml")//unite
			let $nomUnite := $unite/nom
			let $refResponsable := $unite/ref-intervenant/@ref
			return if(data($idI) = data($refResponsable))
			then
			<p>{data($nomUnite)}</p>
			else ()
			
		}
		
		{
		if(exists( doc("master.xml")//parcours/responsable/@ref[. = $idI]) )
		then
		<h4> Responsable du ou des parcour(s) </h4>
		else ()
		}

		{
			for $parcours in doc("master.xml")//parcours
			let $nomParcours := $parcours/nom
			let $refResponsable := $parcours/responsable/@ref
			return if(data($idI) = data($refResponsable))
			then
			<p>{data($nomParcours)}</p>
			else ()
			
		}

		</div>
}
</html>
