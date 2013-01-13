module template

  define main() {
    includeCSS("bootstrap/css/bootstrap.css")
    includeCSS("bootstrap/css/bootstrap-adapt.css")
    includeCSS("bootstrap/css/bootstrap-responsive.css")
    includeJS("jquery.js")
    includeJS("bootstrap/js/bootstrap.js")
    includeCSS("qa.css")

    navigationbar
    gridContainer[id="maincontainer"]{
      gridRow{
        gridSpan(12){
          messages
        }
      }
      elements
    }
  }

  define navigationbar() {
    navbar{
      navigate root() [class="brand"]{ "Q&A" }
      navItems{
        listitem{ navigate root(){ "Home" } }
      }
      pullRight{
        navItems{
          signInOut
        }
      }
    }
  }

  override template templateSuccess(messages : List<String>){
    if(messages.length > 0){
      alert{
        for(ve: String in messages){
          block{
            text(ve)
          }
        }
      }
    }
  }

  template verticalSpace(){
    div[style="height: 20px;"]
  }
