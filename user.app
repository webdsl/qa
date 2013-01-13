module user

  entity User{
    name :: String (id, length=20)
    password :: Secret
  }

  page user(u:User){
    main{
      header3{
        output(u.name)
      }
    }
  }
