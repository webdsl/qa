module question-comment

  template comments(comments : Set<Comment>){
    var comment := Comment{ user := securityContext.principal }
    if(loggedIn() || comments.length>0){
      for(c:Comment in comments order by c.created asc){
        gridRow{
          gridSpan(4,1){
            well{
              "commented by " navigate user(c.user) { output(c.user) }
              " " output(age(c.created)) " ago"
            }
          }
          gridSpan(5){
            output(c.content)
          }
        }
      }
      if(loggedIn()){
        gridRow{
          gridSpan(8,2){
            addComment(comments)
          }
        }
      }
    }
  }

  template addComment(comments : Set<Comment>){
    var templateid := getTemplate().getUniqueId()
    var comment := Comment{ user := principal() }
    toggleVisiblity("Add a comment"){
      horizontalForm("Enter comment"){
        input(comment.content)[onkeyup := action{ replace(templateid+"ph", showContent(comment.content)); }]
        block{ "Preview: " }
        placeholder templateid+"ph" {}
        formActions(){
          submit action{ comments.add(comment); } [class="btn btn-primary"] {"Submit"}
        }
      }
    }
  }

  template toggleVisiblity(link:String){
    var defaultstyle := "display:none;"
    var templateid := "toggle-"+getTemplate().getUniqueId()
    var templateidmarker := "marker-"+getTemplate().getUniqueId()
    var templateidlink := "link-"+getTemplate().getUniqueId()
    var req := getRequestParameter(templateidmarker)
    var clicked := req!= null && req != ""

    <script>
      function toggle_visibility(id,idmarker,idlink) {
         var e = document.getElementById(id);
         var emarker = document.getElementById(idmarker);
         var elink = document.getElementById(idlink);
         if(e.style.display == 'block'){
            e.style.display = 'none';
            elink.style.display = 'block';
            emarker.disabled=true;
         }
         else{
            e.style.display = 'block';
            elink.style.display = 'none';
            emarker.disabled=false;
         }
      }
    </script>

    <a id=templateidlink style="text-decoration:underline;" onclick="toggle_visibility('"+templateid+"','"+templateidmarker+"','"+templateidlink+"')" all attributes>output(link)</a>
    <div id=templateid style=defaultstyle>
      elements()
    </div>
    <input id=templateidmarker style="display:none;" name=templateidmarker value="1" disabled="disabled"/>
  }
