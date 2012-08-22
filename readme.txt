CRAZY HAPPY JOY TIME v0.1

                     ,~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~,
                    (        _____        _   _ __       )
                     )         /         //__ \/ /      (
                    (         /  /\__ __///_/ / /        )
                     )     __/__/   //__//__//_/_\      (
                    (                                    )
                     ~~~~~                          ~~~~~
                     ~~~~  1. Information            ~~~~
                     ~~~                              ~~~
                     ~~   2. Changes                   ~~
                     ~                                  ~
                    {    3. How to play                  }
                     )     a. Gameplay elements         (
                    (      b. Movement, jumping          )
                     )     c. Attacking                 (
                    (                                    )
                     )   4. Enemies                     (
                    {                                    }
                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

┌─┐
│1│
└─┴┐ INFORMATION ┌─────────────────────────────────────────────────────────────
   └─────────────┘
This game, for me, was an exercise in frustation. I wanted
to make a game in BATCH that was so impossible within the
limitations of the language, simply for the challenge. And
yeah, it does make me feel cool that I did it.

┌─┐
│2│
└─┴┐ CHANGES ┌─────────────────────────────────────────────────────────────────
   └─────────┘
0.1 Initial release
     * Map display and scrolling
     * Character movement, jumping, and falling
     * Enemy AI system (Really, covers any scriptable object)
     * Tile solidity (0:pass, 1:solid, 2:over, 3:fall-through)
     * Saving/Loading
     * Win the level/game
     * Screens: title, char select, and win/credits

┌─┐
│3│
└─┴┐ HOW TO PLAY ┌────────────────────────────────────────────────────────────┐
   └─────────────┘                                        ┐                   │
                                                          │ Gameplay elements │
                                                          └───────────────────┤
This is a basic platformer. Move, jump, interact.                             │
Evade or destory all the enemies and make your way to the exit on each level. │
                                                          ┐                   │
 ┌────────┐                                               │ Movement, jumping │
 │Controls│                                               └───────────────────┤
 ├───┬────┴─────────┐                                                         │
 │ a │ Move left    │                                                         │
 │ d │ Move right   │                                                         │
 │ w │ Jump         │                                                         │
 │ s │ Drop through │                                                         │
 │ q │ Quit         │                                                         │
 │ o │ Save         │                                                         │
 │ p │ Pause        │                                                         │
 │ n │ Do nothing   │                                                         │
 └───┴──────────────┘                                     ┐                   │
                                                          │     Attacking     │
                                                          └───────────────────┤
For weak enemies, jumping on their heads will suffice.                        │
Later, weapons may be required.                                               │
                                                                              │
                                                                            ──┘

┌─┐
│5│
└─┴┐ ENEMIES ┌────────────────────────────────────────────────────────────────┐
   └─────────┘                                            ┐                   │
                                                          │    Hover Bopin    │
                                                          └───────────────────┤
                    ┌────────┐    ┌────────┐    ┌────────┐                    │
                    │        │    │        │    │        │                    │
                    │   ‼    │    │   ‼    │    │   ‼    │                    │
                    │        │ -> │        │ .. │        │                    │
                    │     σ  │    │    σ   │    │ σ      │                    │
                    │▀▀   ▀▀▀│    │▀▀   ▀▀▀│    │▀▀   ▀▀▀│                    │
                    └────────┘    └────────┘    └────────┘                    │
                                                                              │
                                   + INFO +                                   │
The Hover Bopin, though it likes to stay close to the ground, can hover       │
effortlessly over gaps. However, it is extremely stupid and can only move to  │
the left, even if stopped by an object, it will unwaveringly push into it     │
until put out of its misery.                                                  │
                                                                              │
                                   + TECH +                                   │
Visage: σ                                                                     │
Speed: 1                                                                      │
Jump: No                                                                      │
Thoughts: The grass is always greener to the left, always.                    │
Threat level: Minimal                                                         │
                                                                              │
                                                          ┐                   │
                                                          │      Notical      │
                                                          └───────────────────┤
             ┌────────┐    ┌────────┐    ┌────────┐    ┌────────┐             │
             │        │    │        │    │        │    │        │             │
             │    ⌐   │ -> │   ⌐    │ -> │ ¬      │ .. │      ¬ │             │
             │        │    │        │    │        │    │        │             │
             └────────┘    └────────┘    └────────┘    └────────┘             │
                                                                              │
                                   + INFO +                                   │
The Notical is a bird that flies back and forth in the air, typically out of  │
reach. They make for nice scenery.                                            │
                                                                              │
                                   + TECH +                                   │
Visage: ⌐                                                                     │
Speed: 1                                                                      │
Jump: No                                                                      │
Thoughts: [I can't think of anything wittier than its name]                   │
Threat level: None                                                            │
                                                                              │
                                                                            ──┘