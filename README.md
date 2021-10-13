# Froggy
Froggy is a Java based CRUD application utilizing the model view controller (MVC) design pattern. 

### Features
With froggy, your team can efficiently manage issues impacting the functionality of your project. Members of your team will be able to: 

-View a comprehensive and elegant list of every issue currently needing resolution.

-Open new tickets for issues that need to be resolved.

-Update the status/nature of an existing bug, providing a more cohesive method for keeping everyone informed. 

-Resolve current issues to provide a clear understanding of how each issue was fixed

-View the update history for each bug, providing an easy way for team members to get oriented and assist with evaluating issues.

### Background
Froggy was created using JSPs and Servlets. I decided to use these technologies in hopes to gain
more foundational knowledge about back-end web development with Java. Before I move on to using Spring components I'd I wanted to use the least amount of black magic and abstraction to handle certain processes.

## Roadmap

It would be impossible for me to quantify just how much I have learned while creating this project. Many programming concepts and design patterns which used to be obscure, now make a ton of sense. Froggy is one of my first projects so If you are reviewing my code.. Please *don't*..

Among the many lessons I've learned, is how *not* to code. Although this project is 'finished' I
 am unhappy with it's current state. As it stands, there is no exception handling, every method
  throws an exception to it's calling method rather handling the exception in a graceful manner.
   This is the type of quick and dirty solution that I will be leaving after this project. 
   All of my classes are tightly coupled. I have since learned how powerful, and modular, using
    Interfaces can be. I didn't take any time to design my classes and objects, I really just 
    wanted to start banging out code. I have some plain old java objects, controller classes 
    that are doing ~~much~~ all of the heavy lifting, and my data accessor classes are riddled
     with duplicate code snippets. There is inconsistent variable naming across the entire 
      (not crazy inconsistent, but yea). There is no documentation, and all comments are written 
      for my own reference/notes, rather than to explain why I wrote what I wrote. It's all really
       just an unmaintainable mess. Also, the changelog page is a disaster. Please avoid it. If you are poring over this repo just know that I have learned
        from all of these ugly bits and have become a stronger coder.
        


-JUnit. I'd like to learn how to use automated testing.

-AJAX. By the time you are reading this I will have likely incorporated it into a project or two, but for this project
specifically, I found ran into lots of issues trying to create dynamic popups using java expression language and javascript. The two do not play nice with each other and AJAX would provide solutions that would allow me to accomplish some of the features I originally spent days trying to add ot this project, but could not due to language/knowledge limitations. 

-Third party APIs. Dunno how they would help a bug tracking app, but It'd be nice.  
