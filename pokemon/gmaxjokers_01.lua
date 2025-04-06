local gmax_list = {
   {
      name = "gmax_venusaur",
      pos = { x = 0, y = 0 },
      soul_pos = { x = 0, y = 3 },
      config = { extra = { blind_mult = 2, h_size = 5, } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.blind_mult, card.ability.extra.h_size } }
      end,
      ptype = "Grass",
      blueprint_compat = false,
      add_to_deck = function(self, card, from_debuff)
         G.hand:change_size(card.ability.extra.h_size)
         G.E_MANAGER:add_event(Event({
            func = function()
               G.FUNCS.draw_from_deck_to_hand()
               return true
            end
         }))
      end,
      remove_from_deck = function(self, card, from_debuff)
         G.hand:change_size(-card.ability.extra.h_size)
      end,
   },
   {
      name = "gmax_charizard",
      pos = { x = 1, y = 0 },
      soul_pos = { x = 1, y = 3 },
      config = { extra = { blind_mult = 2, d_size = 4, } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.blind_mult, card.ability.extra.d_size } }
      end,
      ptype = "Fire",
      blueprint_compat = false,
      add_to_deck = function(self, card, from_debuff)
         G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
         ease_discard(card.ability.extra.d_size)
      end,
      remove_from_deck = function(self, card, from_debuff)
         G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
         ease_discard(-card.ability.extra.d_size)
      end,
   },
   {
      name = "gmax_blastoise",
      pos = { x = 2, y = 0 },
      soul_pos = { x = 2, y = 3 },
      config = { extra = { blind_mult = 2, hands = 3, } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.blind_mult, card.ability.extra.hands } }
      end,
      ptype = "Water",
      blueprint_compat = false,
      add_to_deck = function(self, card, from_debuff)
         G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
         ease_hands_played(card.ability.extra.hands)
      end,
      remove_from_deck = function(self, card, from_debuff)
         G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
         local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
         if to_decrease > 0 then
            ease_hands_played(-to_decrease)
         end
      end,
   },
   {
      name = "gmax_butterfree",
      pos = { x = 3, y = 0 },
      soul_pos = { x = 3, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = {} }
      end,
      ptype = "Grass",
      blueprint_compat = false,
      -- no calculate needed
   },
   {
      name = "gmax_pikachu",
      pos = { x = 4, y = 0 },
      soul_pos = { x = 4, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = {} }
      end,
      ptype = "Lightning",
      blueprint_compat = true,
      calculate = function(self, card, context)
         if context.cardarea == G.jokers and context.full_hand and context.after then
            local basic_cards = {}
            local non_gold_enhanced = {}
            for k, v in pairs(G.hand.cards) do
               if v.ability.set ~= 'Enhanced' then
                  table.insert(basic_cards, v)
               elseif not SMODS.has_enhancement(v, 'm_gold') then
                  table.insert(non_gold_enhanced, v)
               end
            end
            local target = nil
            if #basic_cards > 0 then
               target = pseudorandom_element(basic_cards, pseudoseed('gmax_pikachu'))
            elseif #non_gold_enhanced > 0 then
               target = pseudorandom_element(non_gold_enhanced, pseudoseed('gmax_pikachu'))
            end
            if target then
               target:set_ability(G.P_CENTERS.m_gold, nil, true)
               G.E_MANAGER:add_event(Event({
                  func = function()
                     target:juice_up()
                     return true
                  end
               }))
               return { message = localize('k_gold') }
            end
         end
      end,
   },
   {
      name = "gmax_meowth",
      pos = { x = 5, y = 0 },
      soul_pos = { x = 5, y = 3 },
      config = { extra = { money = 10, triggers_left = 2, triggers_max = 2 } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.money, card.ability.extra.triggers_left, card.ability.extra.triggers_max } }
      end,
      ptype = "Colorless",
      blueprint_compat = false,
      calculate = function(self, card, context)
         if not context.blueprint and context.cardarea == G.jokers and context.scoring_hand and context.final_final_scoring_step_v2 and card.ability.extra.triggers_left > 0 then
            card.ability.extra.triggers_left = card.ability.extra.triggers_left - 1
            mult = 0
            hand_chips = 0
            G.E_MANAGER:add_event(Event({
               func = function()
                  update_hand_text({ immediate = true, nopulse = true, delay = 0 },
                     { mult = 0, chips = 0, level = '', handname = '' })
                  return true
               end
            }))
            ease_poke_dollars(card, "gmax_meowth", card.ability.extra.money or 10)
            return {
               message = localize('k_nope_ex')
            }
         end
         if context.end_of_round then
            card.ability.extra.triggers_left = card.ability.extra.triggers_max
         end
      end,
   },
   {
      name = "gmax_machamp",
      pos = { x = 6, y = 0 },
      soul_pos = { x = 6, y = 3 },
      config = { extra = { hands = 8, blind_mult = 10 } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.hands, card.ability.extra.blind_mult } }
      end,
      ptype = "Fighting",
      blueprint_compat = false,
      add_to_deck = function(self, card, from_debuff)
         G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
         ease_hands_played(card.ability.extra.hands)
      end,
      remove_from_deck = function(self, card, from_debuff)
         G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
         local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
         if to_decrease > 0 then
            ease_hands_played(-to_decrease)
         end
      end,
   },
   {
      name = "gmax_gengar",
      pos = { x = 7, y = 0 },
      soul_pos = { x = 7, y = 3 },
      config = { extra = { blind_mult = 2 } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.blind_mult } }
      end,
      ptype = "Psychic",
      blueprint_compat = false,
      calculate = function(self, card, context)
         if context.end_of_round and context.cardarea == G.jokers and not context.individual and not context.blueprint then
            local target = nil
            local my_pos = -1
            for k, v in ipairs(G.jokers.cards) do
               if v == card then
                  my_pos = k
                  break
               end
               if not v.getting_sliced then
                  target = v
               end
            end
            if target == nil or my_pos == -1 then return end

            target.getting_sliced = true
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({
               func = function()
                  G.GAME.joker_buffer = 0
                  card:juice_up(0.8, 0.8)
                  target:start_dissolve({ HEX("a237cc") }, nil, 1.6)
                  play_sound('magic_crumple3', 0.96 + math.random() * 0.08)
                  add_tag(Tag('tag_negative'))
                  return true
               end
            }))
            return {
               message = localize('k_eaten_ex'),
               colour = G.C.RED,
            }
         end
      end,
   },
   {
      name = "gmax_kingler",
      pos = { x = 8, y = 0 },
      soul_pos = { x = 8, y = 3 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = false,
      calculate = function(self, card, context)
         if context.after and context.cardarea == G.jokers and not context.blueprint then
            local to_convert = {}
            for _, v in ipairs(context.full_hand) do
               if v.base.id ~= 13 or v.config.center ~= G.P_CENTERS.m_bonus then
                  table.insert(to_convert, v)
               end
            end

            if #to_convert > 0 then
               local target = pseudorandom_element(to_convert, pseudoseed('gmax_kingler'))
               poke_conversion_event_helper(function() target:flip() end)
               if target.config.center ~= G.P_CENTERS.m_bonus then
                  poke_conversion_event_helper(function() target:set_ability(G.P_CENTERS.m_bonus) end)
               end
               if target.base.id ~= 13 then
                  poke_conversion_event_helper(function() SMODS.change_base(target, nil, 'King') end)
               end
               poke_conversion_event_helper(function() target:flip() end, 0.2)
               delay(0.8)
            end
         end
      end,
   },
   {
      name = "gmax_lapras",
      pos = { x = 9, y = 0 },
      soul_pos = { x = 9, y = 3 },
      config = { extra = { previous_round = -1 } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = false,
      calculate = function(self, card, context)
         if context.end_of_round and context.cardarea == G.jokers and not context.individual and not context.blueprint and card.ability.extra.previous_round ~= G.GAME.round then
            card.ability.extra.previous_round = G.GAME.round
            add_tag(Tag(get_next_tag_key('gmax_lapras')))
            SMODS.calculate_context({ skip_blind = true })
         end
      end,
   },
   {
      name = "gmax_eevee",
      pos = { x = 10, y = 0 },
      soul_pos = { x = 10, y = 3 },
      config = { extra = { count = 10 } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { card.ability.extra.count } }
      end,
      ptype = "Colorless",
      blueprint_compat = false,
      add_to_deck = function(self, card, from_debuff)
         if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local evo_items = {}
            local duplicate_checks = {}
            for k, v in pairs(G.P_CENTERS) do
               if v.evo_item and (type(v.in_pool) ~= "function" or v:in_pool()) then
                  table.insert(evo_items, k)
                  duplicate_checks[k] = 1
               end
            end

            for k, v in pairs(G.jokers.cards) do
               if v.config.center.item_req then
                  if type(v.config.center.item_req) == "table" then
                     for _, v2 in pairs(v.config.center.item_req) do
                        table.insert(evo_items, "c_poke_" .. v2)
                        duplicate_checks["c_poke_" .. v2] = 1
                     end
                  else
                     table.insert(evo_items, "c_poke_" .. v.config.center.item_req)
                     duplicate_checks["c_poke_" .. v.config.center.item_req] = 1
                  end
               end
            end
            local i = 1
            while i <= card.ability.extra.count and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) do
               local item_key = pseudorandom_element(evo_items, pseudoseed('gmax_eevee_' .. tostring(i)))
               local count = 0
               while (duplicate_checks[item_key] * duplicate_checks[item_key]) > i + count do
                  count = count + 0.1
                  item_key = pseudorandom_element(evo_items, pseudoseed('gmax_eevee_' .. tostring(i + count)))
               end
               duplicate_checks[item_key] = duplicate_checks[item_key] + 1

               G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

               poke_conversion_event_helper(function()
                  local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, item_key)
                  _card:add_to_deck()
                  G.consumeables:emplace(_card)
                  card_eval_status_text(_card, 'extra', nil, nil, nil,
                     { message = localize('poke_plus_pokeitem'), colour = G.C.FILTER, instant = true })
                  G.GAME.consumeable_buffer = 0
               end)
               delay(0.4)
               i = i + 1
            end
         end
      end,
   },
   {
      name = "gmax_snorlax",
      pos = { x = 11, y = 0 },
      soul_pos = { x = 11, y = 3 },
      config = { extra = { odds = 5, } },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, } }
      end,
      ptype = "Colorless",
      blueprint_compat = true,
      add_to_deck = function(self, card, from_debuff)
         if not from_debuff then
            local edition = nil
            if pseudorandom('gmax_snorlax') < G.GAME.probabilities.normal / card.ability.extra.odds then
               edition = { negative = true }
            end

            if edition and edition.negative or (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
               G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
               poke_conversion_event_helper(function()
                  local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_poke_leftovers')
                  if edition then _card:set_edition(edition, true) end
                  _card:add_to_deck()
                  G.consumeables:emplace(_card)
                  card_eval_status_text(_card, 'extra', nil, nil, 'down',
                     { message = localize('poke_plus_pokeitem'), colour = G.C.FILTER })
                  G.GAME.consumeable_buffer = 0
               end)
            else
               poke_conversion_event_helper(function()
                  card_eval_status_text(card, 'extra', nil, nil, nil,
                     { message = localize('k_no_room_ex'), colour = G.C.FILTER })
               end, 1.0)
            end
         end
      end,
   },
   {
      name = "gmax_garbodor",
      pos = { x = 0, y = 1 },
      soul_pos = { x = 0, y = 4 },
      config = { extra = {} },
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
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
      loc_vars = function(self, info_queue, card)
         type_tooltip(self, info_queue, card)
         return { vars = {} }
      end,
      ptype = "Water",
      blueprint_compat = true,
   },
}

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

   v.poke_add_to_deck = v.add_to_deck
   v.add_to_deck = function(self, card, from_debuff)
      if type(self.poke_add_to_deck) == "function" then
         self:poke_add_to_deck(card, from_debuff)
      end
      -- if added to deck after blind exists, then increment blind
      if card.ability.extra.blind_mult and G.GAME.blind and G.GAME.blind.in_blind then
         self:calculate(card, { setting_blind = true })
      end
   end

   v.poke_calculation = v.calculate
   v.calculate = function(self, card, context)
      if can_evolve(self, card, context, self.pre_evo_name) then
         -- have to delay level up till after the context is completed "calculating"
         G.E_MANAGER:add_event(Event({
            func = function()
               G.E_MANAGER:add_event(Event({
                  func = function()
                     G.E_MANAGER:add_event(Event({
                        func = function()
                           level_evo(self, card, context, self.pre_evo_name)
                           -- immediately after the context is completed, the game is saved, so we need to save again to prevent save problems
                           G.E_MANAGER:add_event(Event({
                              func = function()
                                 save_run()
                                 return true
                              end
                           }))
                           return true
                        end
                     }))
                     return true
                  end
               }))
               return true
            end
         }))
      end
      if card.ability.extra.blind_mult then
         if context.setting_blind and G.GAME.blind and G.GAME.blind.in_blind then
            G.E_MANAGER:add_event(Event({
               func = function()
                  G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_mult
                  G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                  return true
               end
            }))
         end
      end
      if type(self.poke_calculation) == "function" then
         return self:poke_calculation(card, context)
      end
   end
end

return {
   name = "Gigantamax Jokers",
   list = gmax_list,
}
