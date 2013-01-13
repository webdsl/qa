module question-view

  template showQuestions(){
    for(q:Question order by q.created desc){
      gridRow{
        gridSpan(2){
          questionInfo(q,false)
        }
        gridSpan(10){
          <h2>navigate question(q) {output(q.title)}</h2>
        }
      }
    } separated-by { <hr/> }
  }

  template questionInfo(q:Question, voting:Bool){
    well{
      block{ "asked by " navigate user(q.user) { output(q.user) } }
      block{ output(age(q.created)) " ago" }
      block{ output(q.voters.length) " votes" if(voting){ voting(q.voters) } }
      block{ output(q.answers.length) " answers" }
    }
  }

  page question(q:Question){
    main{
      gridRow{
        gridSpan(2){
          verticalSpace
          questionInfo(q, true)
        }
        gridSpan(8){
          pageHeader{
            output(q.title)
          }
          output(q.content)
        }
      }
      answers(q)
    }
  }
