class Person(firstName: String) {
  println("Outer constructor")

  def this(firstName: String, lastName: String) {
    this(firstName)
    println("Inner constructor")
  }

  def talk() = println("Hi, I'm " + firstName)
}

val bob = new Person("Bob")
bob.talk

val tom = new Person("Tom", "Tate")
tom.talk
