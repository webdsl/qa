module question-answer

  template answers(q:Question){
    gridRow{
        gridSpan(12){
          comments(q.comments)
          <hr/>
            header3{
              if(q.answers.length == 1){ "1 Answer" }
              else {
                if(q.answers.length > 1){
                  output(q.answers.length) " Answers"
                }
              }
            }
            for(a:Answer in q.answers order by a.votes desc){
              gridContainer{
                gridRow{
                  gridSpan(2){
                    answerInfo(a)
                  }
                  gridSpan(8){
                    output(a.content)
                  }
                }
              }
              comments(a.comments)
               <hr/>
            }
            yourAnswer(q)
        }
      }
  }

  template yourAnswer(q:Question){
    var answer := Answer{ user := securityContext.principal }
    if(loggedIn()){
      horizontalForm("Your Answer"){
        input(answer.content)[onkeyup := action{ replace(answerPreview, showContent(answer.content)); }]
        block{ "Preview: " }
        placeholder answerPreview {}
        formActions{
          submit action{ q.answers.add(answer); }  [class="btn btn-primary"] {"Submit"}
        }
      }
    }
  }

  template answerInfo(a:Answer){
    well{
      block{ "answered by " navigate user(a.user) { output(a.user) } }
      block{ output(age(a.created)) " ago" }
      block{ output(a.voters.length) " votes" voting(a.voters) }
    }
  }
