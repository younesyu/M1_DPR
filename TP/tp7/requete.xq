declare option saxon:output "indent=yes";


<jours>
{
    for $annee in doc("siecle.xml")//annee,
        $mois in $annee/mois,
        $jour in $mois/jour
    let $nom := $jour/nom
    let $an := $annee/numero
    where $mois/numero = (1, 2)
    order by $annee/numero, $mois/numero, $jour/numero
    return
    <jour>
        {attribute code {$jour/@id}}
        {$an}
        {$mois/numero}
        {$nom}
    </jour>
}
</jours>