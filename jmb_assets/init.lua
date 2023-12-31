jmb_assets = {}

local default_path = minetest.get_modpath("jmb_assets")

-- Ebony Assets
minetest.register_node("jmb_assets:ebony_leaves", {
	description = ("Ebony Leaves"),
	tiles = {"jmb_ebony_leaves.png"},
	tiles_special = {"jmb_ebony_leaves_solid.png"},
	waving = 1,
	drawtype = "allfaces_optional",
	use_texture_alpha = true,
	sunlight_propagates = true,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
        max_items = 1,
		items = {
        items = {
            {items = {"jmb_assets:ebony_sapling"}, rarity = 20},
        },
		items = {
            {items = {"jmb_assets:ebony_leaves"},},
        },
    },
}
})

minetest.register_node("jmb_assets:ebony_tree", {
    description = "Ebony Tree",
    tiles = {"jmb_ebony_tree_top.png", "jmb_ebony_tree_top.png", "jmb_ebony_tree.png"},
    paramtype2 = "facedir",
    is_ground_content = false,
  	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	on_place = minetest.rotate_node,
    --sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("jmb_assets:ebony_wood", {
	description = ("Ebony Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"jmb_ebony_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	--sounds = default.node_sound_wood_defaults(),
})

-- Blue Birch Assets
minetest.register_node("jmb_assets:blue_birch_leaves", {
	description = ("Blue Birch Leaves"),
	tiles = {"jmb_blue_birch_leaves.png"},
	tiles_special = {"jmb_blue_birch_leaves_solid.png"},
	waving = 1,
	drawtype = "allfaces_optional",
	use_texture_alpha = true,
	sunlight_propagates = true,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
        max_items = 1,
		items = {
        items = {
            {items = {"jmb_assets:blue_birch_sapling"}, rarity = 20},
        },
		items = {
            {items = {"jmb_assets:blue_birch_leaves"},},
        },
    },
}
})

minetest.register_node("jmb_assets:blue_birch_tree", {
    description = "Blue Birch Tree",
    tiles = {"jmb_blue_birch_tree_top.png", "jmb_blue_birch_tree_top.png", "jmb_blue_birch_tree.png"},
    paramtype2 = "facedir",
    is_ground_content = false,
  	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	on_place = minetest.rotate_node,
    --sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("jmb_assets:blue_birch_wood", {
	description = ("Blue Birch Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"jmb_blue_birch_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	--sounds = default.node_sound_wood_defaults(),
})

-- Ghostwood Assets
minetest.register_node("jmb_assets:ghostwood_leaves", {
	description = ("Ghostwood Leaves"),
	tiles = {"jmb_ghostwood_leaves.png"},
	tiles_special = {"jmb_ghostwood_leaves_solid.png"},
	waving = 1,
	drawtype = "allfaces_optional",
	use_texture_alpha = true,
	sunlight_propagates = true,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
        max_items = 1,
		items = {
        items = {
            {items = {"jmb_assets:ghostwood_sapling"}, rarity = 20},
        },
		items = {
            {items = {"jmb_assets:ghostwood_leaves"},},
        },
    },
}
})

minetest.register_node("jmb_assets:ghostwood_tree", {
    description = "Ghostwood Tree",
    tiles = {"jmb_ghostwood_tree_top.png", "jmb_ghostwood_tree_top.png", "jmb_ghostwood_tree.png"},
    paramtype2 = "facedir",
    is_ground_content = false,
  	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	on_place = minetest.rotate_node,
    --sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("jmb_assets:ghostwood_wood", {
	description = ("Ghostwood Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"jmb_ghostwood_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	--sounds = default.node_sound_wood_defaults(),
})

--[[
-- Define the function to register saplings
function jmb_assets.register_sapling(name, description, tiles, grow_function)
    minetest.register_node(name, {
        description = description,
        waving = 1,
        tiles = tiles,
        drawtype = "plantlike",
        wield_image = tiles[1],  -- Assuming first tile for wield image
        paramtype = "light",
        sunlight_propagates = true,
        walkable = false,
        on_timer = grow_function,
        inventory_image = tiles[1],  -- Assuming first tile for inventory image
        selection_box = {
            type = "fixed",
            fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
        },
        groups = {snappy = 2, dig_immediate = 3, flammable = 2,
            attached_node = 1, sapling = 1},
        sounds = default.node_sound_leaves_defaults(),

        on_construct = function(pos)
            minetest.get_node_timer(pos):start(math.random(300, 1500))
        end,

        on_place = function(itemstack, placer, pointed_thing)
            itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
                name,
                {x = -3, y = 1, z = -3},
                {x = 3, y = 6, z = 3},
                4)

            return itemstack
        end,
    })
end

-- Example usage
jmb_assets.register_sapling("jmb_assets:ebony_sapling", "Ebony Sapling", {"jmb_ebony_sapling.png"}, grow_sapling)
--]]
