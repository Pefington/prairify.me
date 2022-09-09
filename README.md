## Local installation ⚙️
__Clone the repo first__
`git clone git@github.com:Pefington/prairify.me.git`

__To use this slack, there is a small installfest__

*First install Ruby 3.0.4*  
`rvm install 3.0.4`  
*Then install NVM: Node Version Manager. It's like RVM for Node.JS*  
`wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`  
*Then install Node.JS v16.17.0. LTS means "Long Term Support*  
`nvm install --lts`  
*If it goes "nVm: cOmMaNd NoT fOuNd" then reload your shell config*  
`source ~/.zshrc`  
*or*  
`source ~/.bashrc`  
*Check you're good*  
`node -v`  
*Install pnpm, it's a package manager for Node.JS, like bundle for gems*  
`sudo npm install -g pnpm`  
*Check you're good*  
`pnpm -v`  
*Use this nice script to install all the dependencies*  
`pnpm setmeup`  
*The server (port 3000) can be started with*  
`pnpm dev`  
*or*  
`bin/dev`  
*Before a commit, please run*  
`pnpm format`

__thank you__

## Use this command before start 
`$ bundle install`
`$ rails db:create`
`$ rails db:migrate`
`$ rails db:seed`

#  Presentation 🔊


Le besoin d'aider l'environnement dans une demarche collective et agréable, nous responsabiliser sur l'impact des pelouses sur la nature.

En un mot, aider un utilisateur a transformer son gazon uniquement décoratif en magnifique petit bout de prairie, avec sa faune de papillons, abeilles , etc.



## Users Stories 📜

* User va ouvrir la page web
* User verra un carousel de photos d'exemples de résultats        possibles
* Le site demandera à l'utilisateur de sélectionner une region (post THP)
* User verra une liste de plantes compatibles avec la region

* Jolies cards avec une ou deux images par plante
  * Le(s) nom(s) de la plante
  * Plus d'informations sur la plante (vertus médicinales, /preparations etc)
  * Un système d’icônes ludique qui montre la faune de la plante (e.g. abeille, papillon, coccinelle...)
  * Le prix des graines, potentiellement
  * Une liste basique de ressources DIY
* Invitation a la creation de compte pour acceder a :

  * La creation d'un projet utilisant les plantes sélectionnées
dashboard
  * photo initiale
  * checklist avec les différentes plantes
  * Une liste de plantes modifiable
  * Les ressources DIY customisables (filtrage, favoris, sauvegardées en BDD)


## WEB version 🌐

Le site est en prod ici  [Prairify](https://prairify.herokuapp.com/)





## Technos ⚙️
<a href="https://rubyonrails.org/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/rails/rails-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://tailwindcss.com/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-plain.svg" width="40" height="40"/></a>
<a href="https://www.w3.org/css/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://www.postgresql.org/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://www.ruby-lang.org/fr/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://www.heroku.com/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/heroku/heroku-plain.svg" width="40" height="40"/></a>
<a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original-wordmark.svg" width="40" height="40"/></a>
<a href="https://developer.mozilla.org/fr/docs/Web/JavaScript" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="40" height="40"/></a>
## Crédit 🔗
[Gregory Laigneau](https://github.com/GregoryLAIGNEAU)<br>
[Sam Linard](https://github.com/Samsou1)<br>
[Noellie Peuch](https://github.com/pandaka87)<br>
[Chris Pfeiffer](https://github.com/chrispfr)<br>
[Pierre-François Salmand](https://github.com/Pefington)<br>
[Pierre Andrieu](https://github.com/PierreAND)
