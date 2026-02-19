# This turns any Stone block 2 blocks below you into a Diamond Block
execute at @a run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 diamond_block replace stone

# This gives you a diamond if you are standing on Dirt
execute at @a if block ~ ~-1 ~ dirt run give @s diamond