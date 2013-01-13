module question-vote

  template voting(voters : Set<User>){
    if(loggedIn()){
      if(principal() in voters){
        submitlink action{
          voters.remove(principal());
        } [class="btn ibtn"] {iRemove()}
      }
      else{
        submitlink action{
          voters.add(principal());
        } [class="btn ibtn"] {iArrowUp}
      }
    }
  }
