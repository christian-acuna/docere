/*

- this is in "vanilla" JavaScript
- we create a form that has all its attributes
- we then manipulate it via our "main", what we run
- everything out of

- i didn't use the word "form" as I believe that's a
- reserved word in JS

*/

// wait for page load
document.addEventListener('DOMContentLoaded', function() {
  tasker = new Tasker
  main = new Main(tasker)
});

// our "add task form"
function Tasker() {
  this.div = document.querySelector('.add-task')
  this.submitButton = document.querySelector('#submit-form')
  this.taskForm = document.querySelector('#task-form')
  this.list = document.querySelector('.task-list')
  var self = this

  // show the form
  this.show = function() {
    self.div.style.display = 'block'
  }

  // hides the form
  this.hide = function() {
    self.div.style.display = 'none'
  }

  this.submitter = function(e) {
    // stops page from refreshing
    e.preventDefault()
    e.stopPropagation()

    // get input value
    var taskName = document.querySelector('#name-value').value

    // send information to controller * only jQuery in here *
    $.ajax({
      type: 'POST',
      url: '/tasks/create',
      dataType: 'json',
      data: 'name=' + taskName
    })

    // make Nodes to append to list on page...
    var text = document.createTextNode(taskName)
    var liNode = document.createElement('li')
    liNode.appendChild(text)
    self.list.appendChild(liNode)
  }

}

// we run everything out of main
function Main(tasker) {
  this.tasker = tasker
  var self = this

  // listen for clicks
  this.click = document.addEventListener('click', function(e) {
    self.handleClick(e)
  })

  // this is our controller, that handles clicks
  this.handleClick = function(e) {
    if (e.target.id == 'show-form') {
      self.tasker.show()
    } else if (e.target.id == 'hide-form') {
      self.tasker.hide()
    } else if (e.target.id == 'submit-form') {
      self.tasker.submitter(e)
    }
  }
}







