<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" method="html"/>
<?xml-stylesheet type="text/css" href="../style.css" ?>

<xsl:key
    	name="UE"
    	match="//UE"
    	use="./ref-intervenant/@ref"
/>	

    <xsl:variable name="newline">
		<xsl:text>&#10;
		</xsl:text>
	</xsl:variable>

	<!-- Racine -->
	<xsl:template match="/">
		<!-- production de notre index -->
		<xsl:document href="www/index.html">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html>
				<head>
					<title>Master Informatique </title>
					<link rel="stylesheet" type="text/css" href="../style.css" media="all"/>
				</head>
			
				<body style="text-align:center;">
					<ul>
			 			<li><a href="#">Accueil</a></li>
			  			<li><a href="ues/ues.html">UEs</a></li>
			  			<li><a href="intervenants/intervenants.html">Intervenants</a></li>
			  			<li><a href="parcours/parcours.html">Parcours</a></li>
			  			<li><a href="#">About</a></li>
					</ul>

					<xsl:call-template name="ues"/>
					<xsl:call-template name="ues-id"/>
					<xsl:call-template name="liste-ues"/>
					<xsl:call-template name="intervenants"/>
					<xsl:call-template name="liste-intervenants"/>
					<xsl:call-template name="parcours"/>
					<xsl:call-template name="liste-parcours"/>
					
					<img src="../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
					<h1 style="text-align:center;">Bienvenue sur la page du Master Informatique</h1>
					<h1> d'Aix-Marseille Université 2018/2019</h1>
				
					<div style="display:table; margin:auto; margin-bottom:5%;">
						<p style="text-align:center; margin-bottom:5%;">Projet XML 2019 PINATEL / LAMBLIN</p>
						<ol>
							<li><a href="xq.html">Requête XQuery</a></li>
							<li><a href="ues/ues.html">Liste des UEs</a></li>
							<li><a href="intervenants/intervenants.html">Liste des intervenants</a></li>
							<li><a href="parcours/parcours.html">Liste des parcours</a></li>
							<li><a href="../documentation.html">Documentation du projet</a></li>
						</ol>
					</div>
				</body>
			</html>
		</xsl:document>
	</xsl:template>

	<!-- Master -->
	<xsl:template match="MASTER">
		<h2 style="text-decoration: underline;">Liste des Masters</h2> 
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="parcours">
		<div class="perso">

			<h3 style="text-decoration: underline;">Présentation du Master<div style="color:black;"><xsl:value-of select="nom"/></div></h3>
			<h3 style="text-decoration: underline;">Réponsable du MASTER : <xsl:value-of select="nom"/><p> </p> <div style="color:black;"><xsl:value-of select="responsable"/></div></h3>
			<div style="text-align:left;"><p><xsl:value-of select="description1"/><b> <xsl:value-of select="gras"/> </b><xsl:value-of select="description2"/></p></div>	
	  	</div>
	</xsl:template>

	<!-- production de notre page liste intervenants -->
	<xsl:template name="liste-intervenants">
    	<xsl:document href="intervenants/intervenants.html">
    		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    		<html>
    			<head>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    				<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
					<title>Liste professeur </title>
				</head>
    			<body style="text-align:center;">
    				<ul>
			 			<li><a href="../index.html">Accueil</a></li>
			  			<li><a href="../ues/ues.html">UEs</a></li>
			  			<li><a href="#">Intervenants</a></li>
			  			<li><a href="../parcours/parcours.html">Parcours</a></li>
			  			<li><a href="#">About</a></li>
					</ul>

					<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
					<div style="text-align:center;">
						<h1>Liste des intervenants</h1>
					</div>

					<p>Veuillez séléctionner un professeur.</p>
					<ul style="width:70%; margin:auto;">
						<xsl:for-each select="//personne">
							<li><a style="color:white;" href="{@id}.html"><xsl:value-of select="./nom"/></a></li>
						</xsl:for-each>
					</ul>
				</body>
    		</html>
    	</xsl:document>
    </xsl:template>

    <!-- production de nos pages intervenants-->
    <xsl:template name="intervenants">
    	<xsl:for-each select="//personne">
    		<xsl:document href="intervenants/{@id}.html">
    			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    			<head>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    				<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
					<title>Professeur</title>
				</head>
    			<html>
					<body style="text-align:center;">
						<ul>
				 			<li><a href="../index.html">Accueil</a></li>
				  			<li><a href="../ues/ues.html">UEs</a></li>
				  			<li><a href="intervenants.html">Intervenants</a></li>
				  			<li><a href="../parcours/parcours.html">Parcours</a></li>
				  			<li><a href="#">About</a></li>
						</ul>
						<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
    					<div>
							<div class="perso-inter">
								<h1><xsl:value-of select="nom"/></h1>
								<div id="{@id}">
									<p>ID de l'enseignant</p>
									<xsl:value-of select="id"/>
										
									<ul>
										<div style="text-align:left;">
											<li>
												<a style="text-align:left;" href="mailto:{adresse}">Adresse éléctronique : 
			           								<xsl:value-of select="adresse"/> 
			       								</a>
		          							</li>
		          							<li>
		          								<a style="text-align:left;" href="http://{web}">Site Internet :  <xsl:value-of select="web"/></a>			          							
		          							</li>
			          						<li>
			          							<h3>UEs enseignées</h3>
			          							<ul>
													<xsl:for-each select="key('UE', @id)">
				          								<li><a href="../ues/{./nom_ue}.html"><xsl:value-of select="./nom_ue"/></a></li>
				          									<xsl:text>
				       										</xsl:text>
				        							</xsl:for-each>
		          								</ul>
		          							</li>
			          					</div>
		          					</ul>
								</div>
							</div>
						</div>
					</body>
				</html>
    		</xsl:document>
    	</xsl:for-each>
    </xsl:template>

	<!-- production de notre page de liste d'UEs-->
    <xsl:template name="liste-ues">
    	<xsl:document href="ues/ues.html">
    		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    		<html>
    			<head>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    				<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
					<title>Liste des UEs </title>
    			</head>
    			<body style="text-align:center;">
    				<ul>
			 			<li><a href="../index.html">Accueil</a></li>
			  			<li><a href="#">UEs</a></li>
			  			<li><a href="../intervenants/intervenants.html">Intervenants</a></li>
			  			<li><a href="../parcours/parcours.html">Parcours</a></li>
			  			<li><a href="#">About</a></li>
					</ul>
					<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
						<div style="text-align:center;">
							<h1>Liste des ues</h1>
						</div>
						<h4>Cliquez sur une UE afin d'afficher sa page.</h4>

						<ul style="width:70%; margin:auto;">
							<xsl:for-each select="//UE">
								<li><a style="color:white;" href="../ues/{./nom_ue}.html"><xsl:value-of select="./nom_ue"/></a></li>
							</xsl:for-each>
						</ul>
				</body>
    		</html>
    	</xsl:document>
    </xsl:template>

	<!-- production de nos pages UEs-->
    <xsl:template name="ues">
    	<xsl:for-each select="//UE">
    			<xsl:document href="ues/{nom_ue}.html">
    			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    			<head>
    				<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
					<title>UE</title>
				</head>
    			<html>
					<body style="text-align:center;">
						<ul>
				 			<li><a href="../index.html">Accueil</a></li>
				  			<li><a href="ues.html">UEs</a></li>
				  			<li><a href="../intervenants/intervenants.html">Intervenants</a></li>
				  			<li><a href="../parcours/parcours.html">Parcours</a></li>
				  			<li><a href="#">About</a></li>
						</ul>
						<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
    					<div>
							<div class="perso-inter">
    							<div style="text-align:center;">
    								<div style="color:black;">
										<xsl:value-of select="./nom-ue"/>(<xsl:value-of select="./credit"/>crédits)
										<h2><xsl:value-of select="./nom_ue"/></h2>
										<h2>{<xsl:value-of select="./@id"/>}</h2>
									</div>

									<h3>Année et Semestre ou apparraît l'UE</h3>
									<xsl:for-each select="../../ref-semestre">
										<h4 style="color:black;"><a href="../parcours/{./@ref}.html"><xsl:value-of select="./@ref"/></a></h4>
									</xsl:for-each>

									<h3>Enseignant(s) référent(s)</h3>
									<xsl:for-each select="id(ref-intervenant/@ref)/nom">
										| <a style="color:black;" href="../intervenants/{../@id}.html"><xsl:value-of select="."/></a> |
										<xsl:text>
										</xsl:text>
										<xsl:value-of select="$newline"/>
									</xsl:for-each>

									<h3>Lieu(x) d'enseignement(s)</h3> 
									<h4 style="color:black;"><xsl:value-of select="./lieu"/></h4>
									<h3>Description de l'enseignement</h3>
									<xsl:for-each select="./resume">
										<h4 style="color:black;"><xsl:value-of select="."/></h4>
									</xsl:for-each>

									<h4>Nombre d'heures de l'UE</h4>

									<xsl:for-each select="./plan/heures">
										<xsl:value-of select="@unite"/> : 
										<xsl:value-of select="."/> heures |
									</xsl:for-each>

									<h4>Sujet(s) de l'UE</h4>

									<xsl:for-each select="./plan/cours">
										<ul style="text-align:center;">
											<li style="float: initial;"><xsl:value-of select="."/></li>
										</ul>
									</xsl:for-each>
								</div>
							</div>
						</div>
					</body>
					<br/>
				</html>
    		</xsl:document>
    	</xsl:for-each>
    </xsl:template>

	<!-- production de nos pages UEs avec l'id de celle-ci car petit problème lors de la récupération du nom seul-->
     <xsl:template name="ues-id">
    	<xsl:for-each select="//UE">
    			<xsl:document href="ues/{@id}.html"> 
    			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    			<head>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    				<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
					<title>UE</title>
				</head>
    			<html>
					<body style="text-align:center;">
						<ul>
				 			<li><a href="../index.html">Accueil</a></li>
				  			<li><a href="ues.html">UEs</a></li>
				  			<li><a href="../intervenants/intervenants.html">Intervenants</a></li>
				  			<li><a href="../parcours/parcours.html">Parcours</a></li>
				  			<li><a href="#">About</a></li>
						</ul>
						<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />
    					<div>
							<div class="perso-inter">
	    						<div style="text-align:center;">
	    							<div style="color:black;">
										<xsl:value-of select="./nom-ue"/>(<xsl:value-of select="./credit"/>crédits)
										<h2><xsl:value-of select="./nom_ue"/></h2>
										<h2>{<xsl:value-of select="./@id"/>}</h2>
									</div>

									<h3>Semestre</h3>
									<xsl:for-each select="../../ref-semestre">
										<h4 style="color:black;"><a href="../parcours/{./@ref}.html"><xsl:value-of select="./@ref"/></a></h4>
									</xsl:for-each>

									<h3>Enseignant(s) référent(s)</h3>

									<xsl:for-each select="id(ref-intervenant/@ref)/nom">
										| <a style="color:black;" href="../intervenants/{../@id}.html"><xsl:value-of select="."/></a> |
										<xsl:text>
										</xsl:text>
										<xsl:value-of select="$newline"/>
									</xsl:for-each>

									<h3>Lieu(x) d'enseignement</h3> 
									<h4 style="color:black;" ><xsl:value-of select="./lieu"/></h4>

									<h3>Description de l'UE</h3>
									<xsl:for-each select="./resume">
										<h4 style="color:black;"><xsl:value-of select="."/></h4>
									</xsl:for-each>

									<h4>Nombre d'heures UE</h4>
										<xsl:for-each select="./plan/heures">
											<xsl:value-of select="@unite"/> : 
											<xsl:value-of select="."/> heures |
										</xsl:for-each>

									<h4>Plan de l'enseignement</h4>
									<xsl:for-each select="./plan/cours">
										<ul style="text-align:center;">
											<li style="float: initial;"><xsl:value-of select="."/></li>
										</ul>
									</xsl:for-each>

									
								</div>
							</div>
						</div>
					</body>
				</html>
    		</xsl:document>
    	</xsl:for-each>
    </xsl:template>

    <!-- production de notre page liste des différents parcours-->
     <xsl:template name="liste-parcours">
    	<xsl:document href="parcours/parcours.html">
    		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    		<html>
    			<head>
    				<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  					<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
    				<title>Liste des parcours</title>
    			</head>
    			<body style="text-align:center;">
    				<ul>
				 		<li><a href="../index.html">Accueil</a></li>
				  		<li><a href="../ues/ues.html">UEs</a></li>
				  		<li><a href="../intervenants/intervenants.html">Intervenants</a></li>
				  		<li><a href="parcours.html">Parcours</a></li>
				  		<li><a href="#">About</a></li>
					</ul>
					<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;" />

    				<div class="perso">
						<div style="text-align:center;">
							<h1>Liste des parcours</h1>
						</div>

						<p>Cliquez sur un parcours afin d'afficher sa page</p>
						<ul>
							<xsl:for-each select="//parcours">
								<li><a href="{./nom}.html"><xsl:value-of select="./nom"/></a></li>
							</xsl:for-each>
						</ul>		
					</div>
				</body>
    		</html>
    	</xsl:document>
    </xsl:template>

	<!-- production de nos pages de parcours-->
     <xsl:template name="parcours">
    	<xsl:for-each select="//parcours">
    		<xsl:document href="parcours/{./nom}.html">
    			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    			<html>
    				<head>
    					<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    					<link rel="stylesheet" type="text/css" href="../../style.css" media="all"/>
		  				<title><xsl:value-of select="./nom"/></title>
					</head>
					<body style="text-align:center;">
						<ul>
					 		<li><a href="../index.html">Accueil</a></li>
					  		<li><a href="../ues/ues.html">UEs</a></li>
					  		<li><a href="../intervenants/intervenants.html">Intervenants</a></li>
					  		<li><a href="parcours.html">Parcours</a></li>
					  		<li><a href="#">About</a></li>
						</ul>
						<img src="../../logo.jpg" alt="Logo Amu" style="height:200px; margin-bottom:4%; margin-top:3%;"/>
						<div class="perso">
							<div style="text-align:center;">
								<h1><xsl:value-of select="./nom"/></h1>
							</div>
							
							<h2>Responsable : <a href="../intervenants/{./ref-intervenant/@ref}.html"><xsl:value-of select="./ref-intervenant/@ref"/></a></h2>
							<p> Description: <xsl:value-of select="./description"/></p>
									
							<h4>Plan d'enseignement</h4>
							<ul>
								<xsl:for-each select="./ref_ue">
									<li><a href="../ues/{@id}.html"><xsl:value-of select="."/></a></li>
								</xsl:for-each>
							</ul>
						</div>	
					</body>
				</html>
    		</xsl:document>
    	</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>