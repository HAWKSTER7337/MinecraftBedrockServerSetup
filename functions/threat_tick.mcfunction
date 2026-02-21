# Runs every game tick (called by tick.json)
# Calls threat_check once per second (every 20 ticks)

# Auto-create objectives if they don't exist (safe to run every tick — fails silently if already created)
scoreboard objectives add threat dummy
scoreboard objectives add spawn_cooldown dummy
scoreboard objectives add sys_tick dummy
scoreboard objectives add mob_name_idx dummy
scoreboard objectives add spawn_timer dummy

# Initialize name counter for SYSTEM if not set
scoreboard players add SYSTEM mob_name_idx 0

# Initialize scores for any new players who joined
scoreboard players add @a threat 0
scoreboard players add @a spawn_cooldown 0
scoreboard players add @a spawn_timer 0

# Increment tick counter
scoreboard players add SYSTEM sys_tick 1

# Every 20 ticks (1 second), run the threat check
execute if score SYSTEM sys_tick matches 20 run function threat_check
execute if score SYSTEM sys_tick matches 20 run scoreboard players set SYSTEM sys_tick 0
