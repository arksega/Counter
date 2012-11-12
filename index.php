<?php
    include "pg.php";
    include "header.php";
    session_start();
    echo "Wellcome to IF2012B.com\n";
if(!isset($_SESSION['user'])){
    ?>
    <form id="login" action="login.php">
    <label>Usuario:</label> <input type="text" name="user" id="user" onChange="validate()"><br>
    <label>Password:</label> <input type="password" name="pass" id="pass" onChange="validate()">
    <input type="submit" value="Entrar" />
    </form>
    <div id="mess"></div>
    <script>
    var errores = false;
    var mensaje = '';
    var form, user, pass, url;
window.onload = (function(){
try{
    $("#login").submit(function(event){
        /* stop form from submitting normally */
        event.preventDefault();
        validate();
        console.log(errores);

        /* get some values from elements on the page: */
        url = $(this).attr( 'action' );

        if(!errores){
        /* Send the data using post and put the results in a div */
        $.post( url, { "user" : user, "pass" : pass},
          function( data ) {
              console.log(data.loged);
              if(data.loged)
                window.location.href = "./";
              else
                $("#mess").empty().append("Usuario o password invalido");
                $("#pass").val('');
            }, "json");
        }
    });

}catch(e){}});

    function validate(){
        console.log("Validando");
        form = $("#login"),
            user = form.find( '#user' ).val(),
            pass = form.find( '#pass' ).val(),
        mensaje = '';
        errores = false;
        if(user == ''){
            mensaje += "Usuario es un campo obligatorio<br/>";
            errores = true;
        }
        if(pass == ''){
            mensaje += "Password es un campo obligatorio<br/>";
            errores = true;
        }
        if(errores)
            $( "#mess" ).empty().append( mensaje );
    }
    </script>
<?php
}
    include "footer.php";
