# Enumerable methods project

These are my own versions of various Ruby iterator methods in the [Enumerator module](https://ruby-doc.org/core-2.4.2/Enumerable.html).

Specifically, this project includes my versions of #each, #each_with_index, #select, #all?, #any?, #none?, #count, #map (#collect) and #inject (#reduce).

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks).

## Installation

Open your terminal/command line. Navigate to the directory where you want this project to live. Type:
```
$ git clone https://github.com/JonoSenior/enumerable_methods.git
$ irb
$ require './enumerable_methods.rb'
``` 
You will now be able to use these methods in your irb session.

## Pre-project thoughts and motivations

The aim of this project is to better understand how to use blocks and procs, and also to deepen my understanding of what it is that iterator methods are doing behind the scenes - to show they're not magic black boxes.

## Post-project thoughts

1. I developed a better understanding of procs and blocks, and why they're used.
2. One of my biggest difficulties was making the methods flexible enough that they could work on Arrays, Hashes and Ranges. Working through this difficulty was very helpful to my understanding.
3. I concentrated on refactoring my code to make it more concise and readable, for example by using one-line if statements, relying on truthy values to return true rather than spelling it out explicitly, etc.
