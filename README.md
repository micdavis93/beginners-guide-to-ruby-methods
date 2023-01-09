#### _*This repo is related to an [article on DEV](https://dev.to/micdavis93/beginners-guide-to-ruby-methods-6h7/edit)_

<hr>

If you're like me, you've only recently begun your journey into working with back-end coding languages. For you, it might be Python, C#, PHP, or even JavaScript. But for me, it has been Ruby. 

As a current Flatiron School student, I just finished up Phase 3 of the full-stack software engineering curriculum, which was built around a comprehensive introduction to Ruby. We learned how to:

- Create migrations for back-end data structures
- Migrate those data structures to create a data table
- Seed the table's data using class models
- Create custom methods within those class models, in order to manipulate the data
- And use Sinatra to handle **CRUD** actions

_Remember that **CRUD** stands for (with corresponding Ruby commands):
**C**reate - **post**
**R**ead - **get**
**U**pdate - **patch**
**D**elete - **delete**_

All of these skills are very helpful, both functionally and conceptually, in furthering one's understanding of programming and how to practice it with confidence! I, for one, am pretty excited to now have experience with handling tasks that require these things, **_BUT..._**

## Ruby has a lot of built-in methods 😐
#### And it can sometimes take a lot of searching to find the right ones to use...

If your first exposure to data manipulation was in JavaScript, the transition to doing similar things in Ruby can be a bit overwhelming without a guide to the most essential methods that you might use in the process. Therefore, I decided to create one!

# So...

Custom Ruby methods can target one of two scopes:

- **Class Methods**, which affect all instances built from a particular class model
- **Instance Methods**, which affect only one particular instance of a class model

The difference between an instance method and a class method involves the simple addition of a "_self._" to the front of the method name. For example:

```
def self.class_method_name
   logic_applied_to_array_of_class_instances
end
```
VS.
```
def instance_method_name
   logic_applied_to_instance
end
```

Now that we've distinguished the difference between **Class Methods** and **Instance Methods**, let's take a look at Ruby's...

# Built-In Methods

By definition, Ruby's **Built-In Methods** are methods that are already built into the Ruby code, thus allowing the programmer to use them immediately, as elementary tools to build out more complex/specific _custom_ methods.

**Built-in methods** allow us to do simple tasks like filtering lists, sorting items, finding a particular item, and checking/comparing the values of multiple different items. When we are dealing with data sets that have many items (or _instances_) containing a variety of key-value pairs, it is important to have these built-in shorthand methods to quickly accomplish the aforementioned simple tasks.

### But what _ARE_ these methods? Let's break it down.

To get started, it might help to have some sample data. To accomplish this, I used Active Record to make a table of randomized movie rating data with many movies and many critics. There are three models: **Movie**, **Critic**, and **Review**. Feel free to clone [my example repo](url) and try these methods out for yourself!

_Don't forget to:_
1. _**bundle install**_
2. _**rake db:migrate db:seed**_
3. _use a table explorer like SQLite to verify your database was populated_
4. _**rake console** when you want to test out your methods_

Once you've done steps 1-3 above, you should be looking at three simple tables similar to this:

**Movies**
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/r19oqno6uz1zrvfu3bqe.png)

**Critics**
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2a61xin29v3srygqpx48.png)

**Reviews**
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qr5ucxo9ui7dsfgu75of.png)

Alright, that's enough setup. Now that we have data to manipulate, we can try out our methods!

### array.map
Let's say we want to take our critics and add a last name to all of them, using the ever-useful [Faker gem](https://github.com/faker-ruby/faker). The method definition is going to look like this:
```
  def self.add_last_name
    full_names = self.all.map{|critic|
      critic.update(name: "#{critic.name} #{Faker::Name.last_name}")
    }
  end
```
Here, we are using _self._ at the beginning of this method name, because this is a **Class Method**, intended to affect all instances of a particular class. You can certainly use _.map_ on smaller arrays of instances, too but our goal here was to use all the instances in this class. So, this map is stepping (iterating) through the array of instances and applying the change to each and every one. We can test out this method in our console by typing _rake console_ in our terminal (step 4 from above), and then entering this code:
```
Critic.add_last_name
```
This should return a bunch of lines and successfully update our database so that all the critics have last names now. Refresh your database viewer to make sure the updates went through!

### array.filter
Let's switch over to the reviews table now. If we want to know all the ratings of only a particular movie, we can _.filter_ all our reviews by the _movie_id_ key. Here's what that method definition might look like:
```
  def self.filter_by_movie(movie_id)
    self.all.filter{|review| review.movie_id == movie_id}
  end
```
Again, we are using _self._ upfront because we are filtering down from all instances of this **Review** class. This filter is stepping through and checking each review instance's value for _movie_id_ and checking it against the one passed in as an argument when the method is called, removing if this returns false. We test by entering _rake console_ again and typing:
```
Review.filter_by_movie(1)
```
...and this should return a new array of review instances that have a _movie_id_ of 1!

### .order
What if we wanted to sort all the reviews by rating? For that, we use _.order_, and with it we have a couple options. If we're using  integers, it will order numerically from lowest to highest (ascending) by default. In the method, we must specify the key we wish to order the instances by, which will of course by our _rating_. Let's check it out:
```
  def self.order_by_rating
    self.all.order(:rating)
  end
```
Yet again, we are appending _self._ to the front of the method name to specify that we are looking to sort all instances of this **Review** class. And we passed in _:rating_ in symbol format to follow the syntax rules for the _.order_. Open up your _rake console_ again and test with this code:
```
Review.order_by_rating
```
This should return a new array with the same number of reviews, but they will be ordered from lowest rated to highest rated! If you wish to order the reviews descending instead, simply replace the content inside the parentheses with _rating: :desc_!

### I have run out of time to finish this article now, but I will be returning to talk about these methods as well:

#### .max_by / .min_by

#### .sum

#### .count

#### .create

#### .find / .find_by

#### .istrue? / .isfalse?

#### .destroy

# Thanks for reading, and happy coding!