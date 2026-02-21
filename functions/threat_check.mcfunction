# ============================================================
# threat_check.mcfunction
# AUTO-GENERATED — do not edit manually.
# Run generate_threat_check.sh to regenerate.
# ============================================================
# Runs once per second via threat_tick.
# Calculates each player's threat score from their inventory.
# Triggers mob spawn when score hits the threshold.

# ===== Debug confirmation (remove this line when done testing) =====
tellraw @a {"rawtext":[{"text":"§e[Threat Check] Running..."}]}

# ===== Tick down spawn cooldown (1 per second) =====
scoreboard players remove @a[scores={spawn_cooldown=1..}] spawn_cooldown 1

# ===== Reset threat for all players =====
scoreboard players set @a threat 0

# ============================================================
# Coal  (value: 1 per unit — 500 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=coal,quantity=1..}] run scoreboard players add @s threat 1
execute as @a[hasitem={item=coal,quantity=2..}] run scoreboard players add @s threat 1
execute as @a[hasitem={item=coal,quantity=4..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=coal,quantity=8..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=coal,quantity=16..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=coal,quantity=32..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=coal,quantity=64..}] run scoreboard players add @s threat 32

# ============================================================
# Raw Copper  (value: 2 per unit — 250 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=raw_copper,quantity=1..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=raw_copper,quantity=2..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=raw_copper,quantity=4..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=raw_copper,quantity=8..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_copper,quantity=16..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=raw_copper,quantity=32..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=raw_copper,quantity=64..}] run scoreboard players add @s threat 64

# ============================================================
# Raw Iron  (value: 3 per unit — 167 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=raw_iron,quantity=1..}] run scoreboard players add @s threat 3
execute as @a[hasitem={item=raw_iron,quantity=2..}] run scoreboard players add @s threat 3
execute as @a[hasitem={item=raw_iron,quantity=4..}] run scoreboard players add @s threat 6
execute as @a[hasitem={item=raw_iron,quantity=8..}] run scoreboard players add @s threat 12
execute as @a[hasitem={item=raw_iron,quantity=16..}] run scoreboard players add @s threat 24
execute as @a[hasitem={item=raw_iron,quantity=32..}] run scoreboard players add @s threat 48
execute as @a[hasitem={item=raw_iron,quantity=64..}] run scoreboard players add @s threat 96

# ============================================================
# Redstone  (value: 3 per unit — 167 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=redstone,quantity=1..}] run scoreboard players add @s threat 3
execute as @a[hasitem={item=redstone,quantity=2..}] run scoreboard players add @s threat 3
execute as @a[hasitem={item=redstone,quantity=4..}] run scoreboard players add @s threat 6
execute as @a[hasitem={item=redstone,quantity=8..}] run scoreboard players add @s threat 12
execute as @a[hasitem={item=redstone,quantity=16..}] run scoreboard players add @s threat 24
execute as @a[hasitem={item=redstone,quantity=32..}] run scoreboard players add @s threat 48
execute as @a[hasitem={item=redstone,quantity=64..}] run scoreboard players add @s threat 96

# ============================================================
# Nether Quartz  (value: 2 per unit — 250 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=quartz,quantity=1..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=quartz,quantity=2..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=quartz,quantity=4..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=quartz,quantity=8..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=quartz,quantity=16..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=quartz,quantity=32..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=quartz,quantity=64..}] run scoreboard players add @s threat 64

# ============================================================
# Gold Nugget  (value: 1 per unit — 500 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=gold_nugget,quantity=1..}] run scoreboard players add @s threat 1
execute as @a[hasitem={item=gold_nugget,quantity=2..}] run scoreboard players add @s threat 1
execute as @a[hasitem={item=gold_nugget,quantity=4..}] run scoreboard players add @s threat 2
execute as @a[hasitem={item=gold_nugget,quantity=8..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=gold_nugget,quantity=16..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=gold_nugget,quantity=32..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=gold_nugget,quantity=64..}] run scoreboard players add @s threat 32

# ============================================================
# Lapis Lazuli  (value: 4 per unit — 125 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=lapis_lazuli,quantity=1..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=lapis_lazuli,quantity=2..}] run scoreboard players add @s threat 4
execute as @a[hasitem={item=lapis_lazuli,quantity=4..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=lapis_lazuli,quantity=8..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=lapis_lazuli,quantity=16..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=lapis_lazuli,quantity=32..}] run scoreboard players add @s threat 64
execute as @a[hasitem={item=lapis_lazuli,quantity=64..}] run scoreboard players add @s threat 128

# ============================================================
# Raw Gold  (value: 8 per unit — 63 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=raw_gold,quantity=1..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_gold,quantity=2..}] run scoreboard players add @s threat 8
execute as @a[hasitem={item=raw_gold,quantity=4..}] run scoreboard players add @s threat 16
execute as @a[hasitem={item=raw_gold,quantity=8..}] run scoreboard players add @s threat 32
execute as @a[hasitem={item=raw_gold,quantity=16..}] run scoreboard players add @s threat 64
execute as @a[hasitem={item=raw_gold,quantity=32..}] run scoreboard players add @s threat 128
execute as @a[hasitem={item=raw_gold,quantity=64..}] run scoreboard players add @s threat 256

# ============================================================
# Diamond  (value: 20 per unit — 25 units alone hit threshold)
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
execute as @a[hasitem={item=diamond,quantity=21..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=22..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=23..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=24..}] run scoreboard players add @s threat 20
execute as @a[hasitem={item=diamond,quantity=25..}] run scoreboard players add @s threat 20

# ============================================================
# Emerald  (value: 15 per unit — 34 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=emerald,quantity=1..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=2..}] run scoreboard players add @s threat 15
execute as @a[hasitem={item=emerald,quantity=4..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=emerald,quantity=8..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=emerald,quantity=16..}] run scoreboard players add @s threat 120
execute as @a[hasitem={item=emerald,quantity=32..}] run scoreboard players add @s threat 240
execute as @a[hasitem={item=emerald,quantity=64..}] run scoreboard players add @s threat 480

# ============================================================
# Netherite Scrap  (value: 30 per unit — 17 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=netherite_scrap,quantity=1..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=2..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=3..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=4..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=5..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=6..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=7..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=8..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=9..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=10..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=11..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=12..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=13..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=14..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=15..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=16..}] run scoreboard players add @s threat 30
execute as @a[hasitem={item=netherite_scrap,quantity=17..}] run scoreboard players add @s threat 30

# ============================================================
# Ancient Debris  (value: 50 per unit — 10 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=ancient_debris,quantity=1..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=2..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=3..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=4..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=5..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=6..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=7..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=8..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=9..}] run scoreboard players add @s threat 50
execute as @a[hasitem={item=ancient_debris,quantity=10..}] run scoreboard players add @s threat 50

# ============================================================
# Netherite Ingot  (value: 60 per unit — 9 units alone hit threshold)
# ============================================================
execute as @a[hasitem={item=netherite_ingot,quantity=1..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=2..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=3..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=4..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=5..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=6..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=7..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=8..}] run scoreboard players add @s threat 60
execute as @a[hasitem={item=netherite_ingot,quantity=9..}] run scoreboard players add @s threat 60

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
