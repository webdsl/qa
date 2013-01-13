module question-ask

  page ask(){
    var q := Question{ user := principal() };
    main{
      gridRow{
        gridSpan(8,2){
          pageHeader(){
            "Ask a question"
          }
          horizontalForm{
            controlGroup("title"){ input(q.title) }
            controlGroup("question"){
              input(q.content)[onkeyup := action{ replace(questionPreview, showContent(q.content)); }]
              block{ "Preview: " }
              placeholder questionPreview {}
            }
            formActions{
              submit action{ q.save(); return question(q); } [class="btn btn-primary"] {"submit"}
            }
          }
        }
      }
    }
  }

  ajaxtemplate showContent(t:WikiText){
    output(t)
  }

