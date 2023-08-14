### emma_up_event_app
Event App for Emma Up
Fonts from -> https://www.fontshungry.com/download/tiempos/


# Most sub-folders have they own readme with my thoughts


# Total work time estimate
* Coding
  * ~ 2 hours design (as in code structure, patterns, best approach for different cases) 
  * ~ 12 hours coding
  * ~ 2 hours personal thoughts (in format of README files)
* Non-coding
  * ~ 3 hours documentation (ticket master api, some libraries docs)
  * ~ 1 hour error fixing 
  * ~ 1 hour code restructure (ISAR issue)
Total: half Saturday, most of a Sunday and around 1/3 of a Monday :)


# ISAR issue
Turns out isar (the db library) does not support x86 architecture, found out after I wrote most of
the DB implementation and started an emulator, so I had to use another DB (Hive) and write from
scratch. This was done thinking that the tester (guy/girl) who would check the repo may run the app
on an x86 emulator. This would not be an issue in a real case scenario, since the last x86 device,
as far as I know, was released around 2015.

# Thoughts on code documentation
There are hardly any comments / docs, except for some parts that may need explaining, this is due
to time constrains. Most classes/methods/variables should be self-explanatory.

# State management
I chose not to use any state library, not because I don't know how to use one, but because it would 
have added extra work that was not needed. Instead I implemented a quick way to manage state in my
own managers if they extend `lib\util\StateController`.
If I really had to chose a state library, I would have gone with `get` or `bloc` in this order.
My initial idea was to use Isar and the ability it provides to 'observe' data changes, but that 
failed as I had the issue described above.