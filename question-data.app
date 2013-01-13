module question-data

  entity Question{
    user -> User
    title :: String
    content :: WikiText
    answers -> Set<Answer>
    comments -> Set<Comment>
    voters -> Set<User>
    votes :: Int := voters.length
  }

  entity Answer {
    user -> User
    content :: WikiText
    comments -> Set<Comment>
    voters -> Set<User>
    votes :: Int := voters.length
  }

  entity Comment{
    user -> User
    content :: WikiText
    voters -> Set<User>
    votes :: Int := voters.length
  }
