module authentication

  principal is User with credentials name, password

  function principal() : User{
    return securityContext.principal;
  }

  page signin(){
    var stayLoggedIn := false
    var name := ""
    var pass := ""
    action signoffAction() { logout(); }
    action signinAction() {
      getSessionManager().stayLoggedIn := stayLoggedIn;
      validate(authenticate(name,pass), "The login credentials are not valid.");
      message("You are now logged in.");
      return root();
    }
    main{
      if(loggedIn()){
        "Logged in as: " output(securityContext.principal.name)
        horizontalForm("Logout"){
          formActions(){
            submit signoffAction() [class="btn btn-primary"]  {"Logout"}
          }
        }
      }
      else{
       horizontalForm("Login"){
          controlGroup("Username"){ input(name) }
          controlGroup("Password"){ input(pass) }
          controlGroup("Stay logged in"){input(stayLoggedIn) }
          formActions(){
            submit signinAction() [class="btn btn-primary"]  {"Login"}
          }
        }
      }
    }
  }

  define signInOut() {
    if(loggedIn()) {
      <li>
        output(principal())
      </li>
      <li>
        submitlink action { logout(); } { "Sign out" }
      </li>
    }
    else {
      <li>
        navigate signin() { "Sign in" }
      </li>
    }
  }
