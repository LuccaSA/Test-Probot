# But

Afin de faciliter la génération de la description de ce qui passe en prod, il vous est désormais demandé de respecter un certain format pour décrire une PR vers `rc`.
Ce format est décrit ci-dessous et un bookmarklet vous est fourni pour vous aider.

# Modèle

Si vous voulez avoir une idée de ce à quoi ressemble le modèle, vous pouvez aller voir ce fichier : [Modèle PR rc](PULL_REQUEST_TEMPLATE/rc.md)

# Utilisation

Très bientôt, afin qu'une PR vers rc soit validée, il sera nécessaire d'utiliser ce modèle.
Les informations qu'il contient pourront figurer **soit dans le texte initial de la PR, soit en commentaire** (comme un :shipit: )

# Bookmarklet

Afin de faciliter l'utilisation du modèle, un bookmarklet vous est fourni qui permettra d'insérer d'un clic le bon template.

Pour cela, vous pouvez créer un nouveau favori dans votre barre de favoris, lui donner le titre que vous voulez (par exemple, "Modèle PR rc"), et, à la place d'une url, copier/coller le code ci-dessous.

Si vous ne savez pas comment créer un bookmarklet, c'est montré [plus bas !](#comment-créer-le-bookmarklet)

Si vous voulez voir comment l'utiliser, c'est encore [plus bas !](#comment-utiliser-le-bookmarklet)

````javascript
javascript:(function() {
    function executeCORSRequest(url, onloadFunc){
        let xhr = new XMLHttpRequest();
        xhr.open("get", url, true);
        xhr.setRequestHeader("Accept", "vnd.github.VERSION.raw");
        xhr.responseType = 'json';
        xhr.onload = onloadFunc;
        xhr.send();
    }

    function b64DecodeUnicode(str) {
        return decodeURIComponent(Array.prototype.map.call(atob(str), function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''))
    }

    executeCORSRequest("https://api.github.com/repos/LuccaSA/Test-Probot/contents/.github/PULL_REQUEST_TEMPLATE/rc.md", function() {
        let field = null;
        let textareas = document.getElementsByTagName('textarea');
        for(let textarea of textareas) {
            if(textarea.offsetParent !== null) {
                field = textarea;
                break;
            }
        }
        if (field !== null) {
            if(field.value) {
                field.value += "\n" + b64DecodeUnicode(this.response.content);
            } else {
                field.value = b64DecodeUnicode(this.response.content);
            }
        }
    });
})()
````

# Comment créer le bookmarklet

![Comment ajouter un bookmarklet](add-bookmarklet.gif?raw=true)

# Comment utiliser le bookmarklet

![Comment utiliser un bookmarklet](use-bookmarklet.gif?raw=true)
