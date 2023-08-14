I tried as much as I could and as much as time allowed to abstract most of the
classes I use, especially the ones providing logic and local models.

Although this takes slightly more time to implement, it provides a big advantage
when the need for refactor or library changes comes.
As a concrete example, I had to migrate from Isar to Hive, but there where no 
changes in the views and managers, since they work with abstract classes (interfaces).
for the local models.

I prefix all abstract classes with the letter 'i', as I got used to it from too 
much C#, but also I kind of like it this way, my eyes got used to seeing the 'I'
in front of class names.