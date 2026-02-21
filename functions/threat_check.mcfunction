# Runs once per second via threat_tick
# Calculates each player's threat score based on ores in inventory
# Spawns mobs if threat >= 100 and spawn is off cooldown
#
# Binary cascade method: checks quantity at 1, 2, 4, 8, 16, 32, 64
# Each tier adds more value, approximating (quantity * value) per item type
#
# Ore Values (per unit):
#   Coal           = 1    (very common)
#   Raw Copper     = 2    (common)
#   Raw Iron       = 3    (common)
#   Redstone       = 3    (common, drops multiple)
#   Nether Quartz  = 2    (common in Nether)
#   Gold Nugget    = 1    (common in Nether)
#   Lapis Lazuli   = 4    (uncommon)
#   Raw Gold       = 8    (uncommon)
#   Diamond        = 20   (rare)
#   Emerald        = 15   (rare)
#   Netherite Scrap= 30   (very rare)
#   Ancient Debris = 50   (very rare)
#   Netherite Ingot= 60   (extremely rare)

# ===== Tick down spawn cooldown (1 per second) =====
scoreboard players remove @a[scores={spawn_cooldown=1..}] spawn_cooldown 1

# ===== Reset threat for all players =====
scoreboard players set @a threat 0

# ============================================================
# COAL  (value: 1 per unit)
# ============================================================
execute as @a[hasitem={item=coal,quantity=1..}]  run scoreboard players add @s threat 1
execute as @a[hasitem={item=coal,quantity=2..}]  run scoreboard players add @s threat 1
execute as @a[hasitem={item=coal,quantity=4..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=coal,quantity=8..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=coal,quantity=16..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=coal,quantity=32..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=coal,quantity=64..}] run scoreboard players add @s threat 32

# ============================================================
# RAW COPPER  (value: 2 per unit)
# ============================================================
execute as @a[hasitem={item=raw_copper,quantity=1..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=raw_copper,quantity=2..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=raw_copper,quantity=4..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=raw_copper,quantity=8..}]  run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_copper,quantity=16..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=raw_copper,quantity=32..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=raw_copper,quantity=64..}] run scoreboard players add @s threat 64

# ============================================================
# RAW IRON  (value: 3 per unit)
# ============================================================
execute as @a[hasitem={item=raw_iron,quantity=1..}]  run scoreboard players add @s threat 3
execute as @a[hasitem={item=raw_iron,quantity=2..}]  run scoreboard players add @s threat 3
execute as @a[hasitem={item=raw_iron,quantity=4..}]  run scoreboard players add @s threat 6
execute as @a[hasitem={item=raw_iron,quantity=8..}]  run scoreboard players add @s threat 12
execute as @a[hasitem={item=raw_iron,quantity=16..}] run scoreboard players add @s threat 24
execute as @a[hasitem={item=raw_iron,quantity=32..}] run scoreboard players add @s threat 48

# ============================================================
# REDSTONE  (value: 3 per unit)
# ============================================================
execute as @a[hasitem={item=redstone,quantity=1..}]  run scoreboard players add @s threat 3
execute as @a[hasitem={item=redstone,quantity=2..}]  run scoreboard players add @s threat 3
execute as @a[hasitem={item=redstone,quantity=4..}]  run scoreboard players add @s threat 6
execute as @a[hasitem={item=redstone,quantity=8..}]  run scoreboard players add @s threat 12
execute as @a[hasitem={item=redstone,quantity=16..}] run scoreboard players add @s threat 24
execute as @a[hasitem={item=redstone,quantity=32..}] run scoreboard players add @s threat 48

# ============================================================
# NETHER QUARTZ  (value: 2 per unit)
# ============================================================
execute as @a[hasitem={item=quartz,quantity=1..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=quartz,quantity=2..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=quartz,quantity=4..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=quartz,quantity=8..}]  run scoreboard players add @s threat 8
execute as @a[hasitem={item=quartz,quantity=16..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=quartz,quantity=32..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=quartz,quantity=64..}] run scoreboard players add @s threat 64

# ============================================================
# GOLD NUGGET  (value: 1 per unit — 9 nuggets = 1 gold ingot)
# ============================================================
execute as @a[hasitem={item=gold_nugget,quantity=1..}]  run scoreboard players add @s threat 1
execute as @a[hasitem={item=gold_nugget,quantity=2..}]  run scoreboard players add @s threat 1
execute as @a[hasitem={item=gold_nugget,quantity=4..}]  run scoreboard players add @s threat 2
execute as @a[hasitem={item=gold_nugget,quantity=8..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=gold_nugget,quantity=16..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=gold_nugget,quantity=32..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=gold_nugget,quantity=64..}] run scoreboard players add @s threat 32

# ============================================================
# LAPIS LAZULI  (value: 4 per unit)
# ============================================================
execute as @a[hasitem={item=lapis_lazuli,quantity=1..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=lapis_lazuli,quantity=2..}]  run scoreboard players add @s threat 4
execute as @a[hasitem={item=lapis_lazuli,quantity=4..}]  run scoreboard players add @s threat 8
execute as @a[hasitem={item=lapis_lazuli,quantity=8..}]  run scoreboard players add @s threat 16
execute as @a[hasitem={item=lapis_lazuli,quantity=16..}] run scoreboard players add @s threat 32

# ============================================================
# RAW GOLD  (value: 8 per unit)
# ============================================================
execute as @a[hasitem={item=raw_gold,quantity=1..}]  run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_gold,quantity=2..}]  run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_gold,quantity=4..}]  run scoreboard players add @s threat 16
execute as @a[hasitem={item=raw_gold,quantity=8..}]  run scoreboard players add @s threat 32
execute as @a[hasitem={item=raw_gold,quantity=16..}] run scoreboard players add @s threat 64

# ============================================================
# DIAMOND  (value: 20 per unit — 5 diamonds alone = 100)
# Using individual checks since threshold is hit quickly
# ============================================================
execute as @a[hasitem={item=diamond,quantity=1..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=2..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=3..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=4..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=5..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=6..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=7..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=8..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=9..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=10..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=11..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=12..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=13..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=14..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=15..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=16..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=17..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=18..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=19..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=20..}] run scoreboard players add @s threat 20

# ============================================================
# EMERALD  (value: 15 per unit — 7 emeralds = 105)
# ============================================================
execute as @a[hasitem={item=emerald,quantity=1..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=2..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=3..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=4..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=5..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=6..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=7..}] run scoreboard players add @s threat 15

# ============================================================
# NETHERITE SCRAP  (value: 30 per unit)
# ============================================================
execute as @a[hasitem={item=netherite_scrap,quantity=1..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=2..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=3..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=4..}] run scoreboard players add @s threat 10

# ============================================================
# ANCIENT DEBRIS  (value: 50 per unit — 2 = instant trigger)
# ============================================================
execute as @a[hasitem={item=ancient_debris,quantity=1..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=2..}] run scoreboard players add @s threat 50

# ============================================================
# NETHERITE INGOT  (value: 60 per unit — 1 alone = 60, 2 = 100)
# ============================================================
execute as @a[hasitem={item=netherite_ingot,quantity=1..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=2..}] run scoreboard players add @s threat 40

# ============================================================
# TRIGGER — threshold 500, 3-second warning before mobs spawn
# ============================================================

# Step 1: Threshold hit, no cooldown, no spawn pending — start countdown and warn player
execute as @a[scores={threat=500..,spawn_cooldown=..0,spawn_timer=0}] run scoreboard players set @s spawn_timer 3
execute as @a[scores={spawn_timer=3}] run tellraw @s {"rawtext":[{"text":"§c§lYour ore haul has attracted dangerous creatures..."}]}

# Step 2: Countdown reaches 1 — spawn mobs
execute as @a[scores={spawn_timer=1}] at @s run function threat_spawn

# Step 3: Tick down the spawn timer each second
scoreboard players remove @a[scores={spawn_timer=1..}] spawn_timer 1
