![https://cdn.apkmody.io/uploads/2020/09/Pokemon-Ruby-GBA-Rom-Download-720x360.jpg](https://cdn.apkmody.io/uploads/2020/09/Pokemon-Ruby-GBA-Rom-Download-720x360.jpg)

This project consists to build a very close recreation of the classic Pokemon
game. You will be able to select one pokemon at the beginning of the game. Then
you can train your pokemon in a battle with other random trainers. You will be
able to see your pokemon stats to check your progress. When you feel ready, you
will be able to challenge Gym Leader Brock. If you defeat Brock you won the game
💪🏼.

## HAPPY PATH

When you start the game, the program displays a welcome message and then asks
for your name.

```bash
$ ruby game.rb
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#

Hello there! Welcome to the world of POKEMON! My name is OAK!
People call me the POKEMON PROF!

This world is inhabited by creatures called POKEMON! For some
people, POKEMON are pets. Others use them for fights. Myself...
I study POKEMON as a profession.
First, what is your name?
>
```

When you put your name, the program will print some text where it uses the name
you give it. Then the program prompts you to choose a pokemon between Bulbasaur,
Charmander, and Squirtle:

```bash
> Great Master
Right! So your name is GREAT MASTER!
Your very own POKEMON legend is about to unfold! A world of
dreams and adventures with POKEMON awaits! Let's go!
Here, GREAT MASTER! There are 3 POKEMON here! Haha!
When I was young, I was a serious POKEMON trainer.
In my old age, I have only 3 left, but you can have one! Choose!

1. Bulbasaur    2. Charmander   3. Squirtle     
>
```

When you select Charmander (for example), the program confirms your selection
displaying a message. Then it prompts you to give your pokemon a name
(optional). If you don't give any name, the name of the pokemon will be the
pokemon species (Charmander for example)

```bash
> Charmander

You selected CHARMANDER. Great choice!
Give your pokemon a name?
>
```

After you input a name (or nothing at all), the program will print a final
message using your name and your pokemon name. Finally, it will display the game
menu:

```bash
> Great Char
GREAT MASTER, raise your young GREAT CHAR by making it fight!
When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you input "Stats", the main statistics of your pokemon will be shown:

```bash
> Stats

Great Char:
Kind: Charmander
Level: 1
Type: fire
Stats:
HP: 12
Attack: 6
Defense: 6
Special Attack: 6
Special Defense: 6
Speed: 6
Experience Points: 0
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you type Train, the program will challenge a Random Person with a random
pokemon to a battle. The program displays the pokemon kind and level and asks
you to choose between Fight and Leave.

```bash
> Train

Great master challenge Random Person for training
Random Person has a Onix level 4
What do you want to do now?

1. Fight        2. Leave        
>
```

If you select Fight, the program will start a battle between you and Random
Person. It will display the hp of each pokemon and then prompt you to select a
move printing the available move for your pokemon.

```bash
> Fight

Random Person sent out ONIX!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 1
HP: 12
Random Person's Onix - Level 4
HP: 17

Great master, select your move:

1. scratch      2. ember        
>
```

If you select a valid move, the program will select a random move for the
opponent as well and process the result. The result includes the calculation of:

- Who attacks first?
- The attack move of the attacker hit the opponent?
- The attack inflicted a Critical Hit?
- The attack is effective? (could be super effective, not very effective, not
  effective at all or regular)
- How much damage will be inflicted?

After doing all the calculations, the program will print the result including
the new status for each pokemon.

```bash
> scratch

--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 1 damage
--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 6 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 6
Random Person's Onix - Level 4
HP: 16

Great master, select your move:

1. scratch      2. ember        
>
```

If both of the pokemons are still alive the program prompt for a new move. The
battle continues until one of the pokemon faints (hp ≤ 0). If one pokemon faints
before making his move, the move won't be made at all. The program will print
who was the winner and print the menu again.

```bash
> scratch

--------------------------------------------------
Onix used ROCK THROW!
It was a CRITICAL hit!
It's super effective!
And it hit Great Char with 9 damage
--------------------------------------------------
Great Char FAINTED!
--------------------------------------------------
Onix WINS!
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you won a battle, the program will show the amount of experience points your
pokemon gained. Here is an example of a battle vs a Bulbasaur level 2:

```bash
> train

Great master challenge Random Person for training
Random Person has a Bulbasaur level 2
What do you want to do now?

1. Fight        2. Leave        
> fight

Random Person sent out BULBASAUR!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 1
HP: 12
Random Person's Bulbasaur - Level 2
HP: 13

Great master, select your move:

1. scratch      2. ember        
> ember  

--------------------------------------------------
Great Char used EMBER!
It's super effective!
And it hit Bulbasaur with 6 damage
--------------------------------------------------
Bulbasaur used VINE WHIP!
It's not very effective...
And it hit Great Char with 1 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 11
Random Person's Bulbasaur - Level 2
HP: 7

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Bulbasaur used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great Char used EMBER!
It's super effective!
And it hit Bulbasaur with 6 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 8
Random Person's Bulbasaur - Level 2
HP: 1

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Bulbasaur used VINE WHIP!
It's not very effective...
And it hit Great Char with 1 damage
--------------------------------------------------
Great Char used SCRATCH!
And it hit Bulbasaur with 3 damage
--------------------------------------------------
Bulbasaur FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 18 experience points
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you check your stats you can confirm the experience points added:

```bash
> stats

Great Char:
Kind: Charmander
Level: 1
Type: fire
Stats:
HP: 12
Attack: 6
Defense: 6
Special Attack: 6
Special Defense: 6
Speed: 6
Experience Points: 18
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you gain enough experience points, you will level up and the program will
show you a message and recalculate your stats based on your new level.

```bash
> scratch

--------------------------------------------------
Charmander used SCRATCH!
And it hit Great Char with 4 damage
--------------------------------------------------
Great Char used SCRATCH!
And it hit Charmander with 4 damage
--------------------------------------------------
Charmander FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 35 experience points
Great Char reached level 5!
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you feel ready, you can challenge de Leader for a fight. If you win the
battle the game show you a congratulation message. In this example Great Char
has reached level 20 and can defeat Brock's Onix:

```bash
> Leader

Great master challenge the Gym Leader Brock for a fight!
Brock has a Onix level 10
What do you want to do now?

1. Fight        2. Leave        
> Fight

Brock sent out ONIX!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 20
HP: 51
Brock's Onix - Level 10
HP: 29

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 48
Brock's Onix - Level 10
HP: 24

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 45
Brock's Onix - Level 10
HP: 19

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 8 damage
--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 6 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 37
Brock's Onix - Level 10
HP: 13

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 34
Brock's Onix - Level 10
HP: 8

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 8 damage
--------------------------------------------------
Great Char used EMBER!
It was a CRITICAL hit!
It's not very effective...
And it hit Onix with 7 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 26
Brock's Onix - Level 10
HP: 1

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 6 damage
--------------------------------------------------
Onix FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 110 experience points
-------------------Battle Ended!-------------------
Congratulation! You have won the game!
You can continue training your Pokemon if you want
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you write Exit, the program print a goodbye message:

```bash
> Exit

Thanks for playing Pokemon Ruby
This game was created with love by: [your names]
```
