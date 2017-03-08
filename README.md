# Roguescripts

Save both scripts into a folder named Roguescripts and place in your WOW folder.

Adds the following:

/skull  - Place SKULL on your target
/x      - Place X on your target
/luna   - Place MOON on your target
/square - Place SQUARE on your target
-------------------------------------
/acceptquest  -  Accepts/Completes all quests. Accepts Ress/Release Corpse. Clicks YES to most popup windows.
/greed        -  Rolls GREED on all active loot rolls. Be careful to to press if there's an open roll on an item you NEED.
-------------------------------------
/ss           -  Cast Sinister Strike until 5 points, then Eviscerate.
/run SnD()    -  Keep SND up at all time. Sinister Strike until 5 points. Cast Eviscerate @ 5 points if enough time left on SND to keep active.
/kickfiltered -  Automatically Kick all spells on the spell filter list and announce to group.(Only Heals and CC spells by default)
/kickall      -  Automatically Kick any spell cast and announce to group.
-------------------------------------
/reset              -  Reset all instances.
-------------------------------------


Copy paste this macro into game=

#showtooltip [mod:ctrl]Deadly Poison;[mod:alt]Wound Poison;[nomod]Instant Poison;
/dp
/use [button:1] 16;
/use [button:2] 17;
/run ReplaceEnchant() ClearCursor()

---------------------------------------
Left Mouse click Applies poison to Main Hand;
Right click to Off-hand.
Hold CTRL to apply Deadly Poison instead of Instant Poison.
Hold ALT to apply Wound Poison.

