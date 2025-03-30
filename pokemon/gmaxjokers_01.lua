local GMAX_SCALE = 6 / 3

local gmax_pre_draw = function(self, card, drawStep)
   local center = card.children.center
   -- trigger on shadow or first draw
   if drawStep.order <= -999 then
   elseif drawStep.key == 'seal' then
      center.T.w = center.T.w / GMAX_SCALE
      center.T.h = center.T.h / GMAX_SCALE
      center.VT.x = center.VT.x - (GMAX_SCALE - 1) * 0.29
   elseif drawStep.key == 'soul' then
      center.VT.x = center.T.x
   elseif drawStep.key == 'floating_sprite' then
   elseif drawStep.key == 'debuff' then
      center.T.w = center.T.w * GMAX_SCALE
      center.T.h = center.T.h * GMAX_SCALE
   end
end

local gmax_set_sprites = function(self, card, front)
   card.T.w = card.T.w * GMAX_SCALE
   card.T.h = card.T.h * GMAX_SCALE
end

local gmax_list = {
   {
      name = "gmax_venusaur",
      pos = { x = 0, y = 0 },
      soul_pos = { x = 0, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Grass",
      blueprint_compat = true,
   },
   {
      name = "gmax_charizard",
      pos = { x = 1, y = 0 },
      soul_pos = { x = 1, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fire",
      blueprint_compat = true,
   },
   {
      name = "gmax_blastoise",
      pos = { x = 2, y = 0 },
      soul_pos = { x = 2, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
   {
      name = "gmax_butterfree",
      pos = { x = 3, y = 0 },
      soul_pos = { x = 3, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Grass",
      blueprint_compat = true,
   },
   {
      name = "gmax_pikachu",
      pos = { x = 4, y = 0 },
      soul_pos = { x = 4, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Lightning",
      blueprint_compat = true,
   },
   {
      name = "gmax_meowth",
      pos = { x = 5, y = 0 },
      soul_pos = { x = 5, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Colorless",
      blueprint_compat = true,
   },
   {
      name = "gmax_machamp",
      pos = { x = 6, y = 0 },
      soul_pos = { x = 6, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fighting",
      blueprint_compat = true,
   },
   {
      name = "gmax_gengar",
      pos = { x = 7, y = 0 },
      soul_pos = { x = 7, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Psychic",
      blueprint_compat = true,
   },
   {
      name = "gmax_kingler",
      pos = { x = 8, y = 0 },
      soul_pos = { x = 8, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
   {
      name = "gmax_lapras",
      pos = { x = 9, y = 0 },
      soul_pos = { x = 9, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
   {
      name = "gmax_eevee",
      pos = { x = 10, y = 0 },
      soul_pos = { x = 10, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Colorless",
      blueprint_compat = true,
   },
   {
      name = "gmax_snorlax",
      pos = { x = 11, y = 0 },
      soul_pos = { x = 11, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Colorless",
      blueprint_compat = true,
   },
   {
      name = "gmax_garbodor",
      pos = { x = 0, y = 1 },
      soul_pos = { x = 0, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dark",
      blueprint_compat = true,
   },
   {
      name = "gmax_melmetal",
      pos = { x = 1, y = 1 },
      soul_pos = { x = 1, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Metal",
      blueprint_compat = true,
   },
   {
      name = "gmax_rillaboom",
      pos = { x = 2, y = 1 },
      soul_pos = { x = 2, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Grass",
      blueprint_compat = true,
   },
   {
      name = "gmax_cinderace",
      pos = { x = 3, y = 1 },
      soul_pos = { x = 3, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fire",
      blueprint_compat = true,
   },
   {
      name = "gmax_inteleon",
      pos = { x = 4, y = 1 },
      soul_pos = { x = 4, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
   {
      name = "gmax_corviknight",
      pos = { x = 5, y = 1 },
      soul_pos = { x = 5, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Metal",
      blueprint_compat = true,
   },
   {
      name = "gmax_orbeetle",
      pos = { x = 6, y = 1 },
      soul_pos = { x = 6, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Psychic",
      blueprint_compat = true,
   },
   {
      name = "gmax_drednaw",
      pos = { x = 7, y = 1 },
      soul_pos = { x = 7, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
   {
      name = "gmax_coalossal",
      pos = { x = 8, y = 1 },
      soul_pos = { x = 8, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fire",
      blueprint_compat = true,
   },
   {
      name = "gmax_flapple",
      pos = { x = 9, y = 1 },
      soul_pos = { x = 9, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dragon",
      blueprint_compat = true,
   },
   {
      name = "gmax_appletun",
      pos = { x = 10, y = 1 },
      soul_pos = { x = 10, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dragon",
      blueprint_compat = true,
   },
   {
      name = "gmax_sandaconda",
      pos = { x = 11, y = 1 },
      soul_pos = { x = 11, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Earth",
      blueprint_compat = true,
   },
   {
      name = "gmax_toxtricity",
      pos = { x = 0, y = 2 },
      soul_pos = { x = 0, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Lightning",
      blueprint_compat = true,
   },
   {
      name = "gmax_centiskorch",
      pos = { x = 1, y = 2 },
      soul_pos = { x = 1, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fire",
      blueprint_compat = true,
   },
   {
      name = "gmax_hatterene",
      pos = { x = 2, y = 2 },
      soul_pos = { x = 2, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Psychic",
      blueprint_compat = true,
   },
   {
      name = "gmax_grimmsnarl",
      pos = { x = 3, y = 2 },
      soul_pos = { x = 3, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fairy",
      blueprint_compat = true,
   },
   {
      name = "gmax_alcremie",
      pos = { x = 4, y = 2 },
      soul_pos = { x = 4, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Fairy",
      blueprint_compat = true,
   },
   {
      name = "gmax_copperajah",
      pos = { x = 5, y = 2 },
      soul_pos = { x = 5, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Metal",
      blueprint_compat = true,
   },
   {
      name = "gmax_duraludon",
      pos = { x = 6, y = 2 },
      soul_pos = { x = 6, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dragon",
      blueprint_compat = true,
   },
   {
      name = "gmax_eternatus",
      pos = { x = 7, y = 2 },
      soul_pos = { x = 7, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dark",
      blueprint_compat = true,
   },
   {
      name = "gmax_urshifu_dark",
      pos = { x = 8, y = 2 },
      soul_pos = { x = 8, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Dark",
      blueprint_compat = true,
   },
   {
      name = "gmax_urshifu_water",
      pos = { x = 9, y = 2 },
      soul_pos = { x = 9, y = 5 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, center)
         type_tooltip(self, info_queue, center)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
}


for _, v in pairs(gmax_list) do
   v.rarity = "poke_giga"
   v.cost = 20
   v.stage = "Gigantamax"
   v.atlas = "Gmax"
   v.no_collection = true

   v.pre_evo_name = "j_poke_" .. v.name:sub(6, -1)

   v.config = v.config or {}
   v.config.extra = v.config.extra or {}
   v.config.extra.rounds = 1

   v.poke_calculation = v.calculate
   v.calculate = function(self, card, context)
      if self.poke_calculation then
         local ret = self:poke_calculation(card, context)
         if ret then return ret end
      end
      if can_evolve(self, card, context, self.pre_evo_name) then
         level_evo(self, card, context, self.pre_evo_name)
      end
   end
end

return {
   name = "Gigantamax Jokers",
   list = gmax_list,
}
