h2. What the heck is that?

These examples are from Ruby BarCamp '09 in Kiev, Ukraine. I did not really prepare much, and
I had no slides at all, hence all the comments in this repository.

h2. Points of the talk

* Ruby object model is beautiful and rich. Learn it as good as you can.

* Using rich object model and all the features built into it is way better
  compared to inventing your own OOP (e.g. alias_method_chain) or just
  not following three main ideas of OOP (incapsulation, inheritance, polymorphism)

* Modules are _the_ cornerstone of Ruby's object model

* Module inclusion results in an anonymous class being created in hosting class' inheritance chain

* Because of previous point, yon can call super from Module methods.

* alias_method_chain was invented simply because some people did not know about this
  powerful feature of Ruby's object model back in 2005

* super works for methods of class objects (like Person.find or Person.all), too

* Module + super does not solve all the library incompatibilities issues, but it helps
  a lot compared to alias_method_chain and other "screw incapsulation, I can do whatever I want"
  kind of inventions

* class_eval replaces method implementation forcefully, and breaks superclass method calls

* Safe way to do class_eval is to use Module.new, then class_eval on the module, and include it

* And beware of local var vs. accessor with self issue when writing modules (and not just modules)

* Rails 3 codebase is almost alias_method_chain free now. You bet, this means something.
