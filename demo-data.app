module demo-data

  init{
    var u1 := User { name := "admin" password := ("admin" as Secret).digest() };
    u1.save();
    var u2 := User { name := "Alice" password := ("Alice" as Secret).digest() };
    u2.save();
    var u3 := User { name := "Bob" password := ("Bob" as Secret).digest() };
    u3.save();
    var q1 := Question{
      user := u1
      title := "What's the easiest way to build and run a WebDSL application?"
      content := "I'd like to quickly try out an application after checking it out from svn/git, what's the easiest way to do that?"
      comments := {
        Comment {
          user := u3
           content := "I'd also like to know how to do this in the Eclipse plugin."
        }
      }
      answers := {
        Answer {
          user := u2
          content := "You can compile and start a WebDSL application from the command-line without an application.ini configuration file using 'webdsl run filename'."
          voters := {u1}
          comments := {
            Comment {
              user := u3
              content := "How about in the Eclipse plugin?"
            },
            Comment {
              user := u2
              content := "Use the 'Convert to a WebDSL project' wizard, in the right-click menu of the project."
              voters := {u1}
            }
          }
        }
      }
      voters := {u2}
    };
    q1.save();
    var q2 := Question{
      user := u1
      title := "How to convert Int to Float in WebDSL?"
      content := "How do I convert an Int value to a Float value?"
      answers := {
        Answer {
          user := u2
          content := "500.floatValue()"
        }
      }
      voters := {u1,u2,u3}
    };
    q2.save();
  }
