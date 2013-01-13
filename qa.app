application qa

  imports elib/lib
  imports template
  imports authentication
  imports ac
  imports demo-data
  imports user
  imports question-data
  imports question-ask
  imports question-answer
  imports question-view
  imports question-vote
  imports question-comment


  page root(){
    main{
      verticalSpace
      gridRow{
        gridSpan(2,5){
          navigate ask()[class="btn btn-large btn-block btn-primary"]{ "Ask a question" }
        }
      }
      spacer
      showQuestions
    }
  }
