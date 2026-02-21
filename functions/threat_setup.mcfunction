# Run this ONCE as an operator to initialize the threat system
# Usage: /function threat_setup

scoreboard objectives add threat dummy "Threat Level"
scoreboard objectives add spawn_cooldown dummy "Spawn Cooldown"
scoreboard objectives add sys_tick dummy "System Tick"

scoreboard players set SYSTEM sys_tick 0
scoreboard players set @a threat 0
scoreboard players set @a spawn_cooldown 0

tellraw @a {"rawtext":[{"text":"§a[Threat System] Initialized successfully."}]}
